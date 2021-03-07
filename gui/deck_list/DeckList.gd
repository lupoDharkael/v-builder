# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

var deck_item = preload("res://gui/deck_list/DeckItem.tscn")
var import_dialog : WindowDialog
var export_dialog : WindowDialog

var container : Node
var toggle_mode_button : Button
var search_field : LineEdit

var collection_comparator : Control
var info_dialog : AcceptDialog

var delete_dialog : ConfirmationDialog


func _input(event) -> void:
	if get_viewport().gui_has_modal_stack():
		return
	
	if event is InputEventKey:
		if event.is_action_pressed("ui_delete"):
			popup_confirm_delete()
		elif event.is_action_pressed("ui_accept") && focus_is_deck_item():
			edit_deck()
		elif event.is_action_pressed("ui_rename") && focus_is_deck_item():
			get_focus_owner().enable_name_edit(true)
		elif event.is_action_pressed("ui_search"):
			search_field.grab_focus()
		elif event.is_action_pressed("alternate"):
			set_deck_mode(!is_deck_mode())


func _on_collection_imported(c : CardCollection) -> void:
	c.path = get_working_path()
	print(c.get_file_path())
	if !Storage.is_collection_in_disk(c):
		Storage.save_collection(c)
		add_deck_item(c)
	else:
		# TODO
		pass
	


func _ready():
	container = $BackgroundPanel/VBoxContainer/ScrollContainer/DeckContainer
	
	import_dialog = preload("res://gui/deck_list/DeckImport.tscn").instance()
	add_child(import_dialog)
	import_dialog.connect("collection_generated", self, "_on_collection_imported")
	export_dialog = preload("res://gui/deck_list/DeckExport.tscn").instance()
	add_child(export_dialog)
	
	info_dialog = preload("res://gui/main/InfoDialog.tscn").instance()
	add_child(info_dialog)
	
	var info_button = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/InfoButton
	info_button.connect("pressed", self, "_on_info_button_pressed")
	
	var add_button = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/AddButton
	add_button.connect("pressed", self, "create_deck")
	var export_button = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/ExportButton
	export_button.connect("pressed", self, "open_export")
	var import_button = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/ImportButton
	import_button.connect("pressed", self, "open_import")
	var delete_button = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/DeleteButton
	delete_button.connect("pressed", self, "popup_confirm_delete")
	var edit_button = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/EditButton
	edit_button.connect("pressed", self, "edit_deck")
	var clone_button = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/CloneButton
	clone_button.connect("pressed", self, "clone_deck")
	
	var compare_button = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/CompareButton
	collection_comparator = $CollectionComparator
	compare_button.connect("toggled", self, "_on_compare_toggled")
	
	toggle_mode_button = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/ModeButton
	toggle_mode_button.pressed = !Global.default_deck_mode
	toggle_mode_button.connect("toggled", self, "_on_toggle_pressed")
	
	search_field = $BackgroundPanel/VBoxContainer/Toolbar/HBoxContainer/Search
	search_field.connect("text_changed", self, "filter_decks")
	# sync with filesystem
	_on_toggle_pressed(toggle_mode_button.pressed)
	
	delete_dialog = ConfirmationDialog.new()
	delete_dialog.window_title = "Confirm Delete"
	delete_dialog.get_label().align = Label.ALIGN_CENTER
	delete_dialog.get_ok().text = "DELETE"
	delete_dialog.get_cancel().text = "CANCEL"
	delete_dialog.connect("confirmed", self, "delete_deck")
	add_child(delete_dialog)
	
	CardDB.connect("textures_loaded", self, "reload")
	
	# Debug dirs
	#Global.show_alert_message("Storage: " + Storage.get_storage_dir() + "\nDebug: " + ProjectSettings.globalize_path("res://") + "\nRelease: " + OS.get_user_data_dir() + "/", self)


func reload() -> void:
	for n in container.get_children():
		n.reload_texture()


func _on_info_button_pressed() -> void:
	info_dialog.popup_centered()


func _on_compare_toggled(enabled : bool) -> void:
	if enabled:
		collection_comparator.clear()
	
	collection_comparator.visible = enabled


func focus_is_deck_item() -> bool:
	return get_focus_owner() && get_focus_owner() is DeckItem


func is_deck_mode() -> bool:
	return !toggle_mode_button.pressed


func popup_confirm_delete() -> void:
	if !focus_is_deck_item():
		return
	var collection_name = get_focus_owner().collection.name
	delete_dialog.dialog_text = "Are you sure you want to delete \"" + collection_name + "\"?"
	delete_dialog.popup_centered(Vector2(250, 80))


func sync_with_filesystem() -> void:
	for n in container.get_children():
		container.remove_child(n)
		n.queue_free()
	
	var c_arr := Storage.get_collections_from_path(get_working_path())
	
	for c in c_arr:
		add_deck_item(c, false)
	
	sort_collections()
	if (container.get_child_count()):
		container.get_child(0).grab_focus()


func sort_collections() -> void:
	var names = []
	var nodes_dict := {}
	for n in container.get_children():
		names.push_back(n.collection.name)
		nodes_dict[n.collection.name] = n
	
	names.sort_custom(self, "natural_comp")
	for i in names.size():
		container.move_child(nodes_dict[names[i]], i)


func natural_comp(a : String, b : String) -> bool:
	return a.naturalnocasecmp_to(b) < 0


func add_deck_item(c : CardCollection, sort : bool = true) -> void:
	var di = deck_item.instance()
	di.connect("name_changed", self, "_on_name_changed")
	di.connect("open_requested", self, "edit_deck")
	container.add_child(di)
	di.set_collection(c, is_deck_mode())
	
	if sort:
		sort_collections()


func _on_name_changed() -> void:
	sort_collections()


func set_deck_mode(enable : bool) -> void:
	toggle_mode_button.pressed = !enable
	_on_toggle_pressed(toggle_mode_button.pressed)


func _on_toggle_pressed(_enabled : bool) -> void:
	if is_deck_mode():
		search_field.placeholder_text = "Search Deck"
	else:
		search_field.placeholder_text = "Search Collection"
	sync_with_filesystem()


func filter_decks(filter : String) -> void:
	var no_filter = filter.empty()
	for n in container.get_children():
		n.visible = no_filter || n.name.findn(filter) != -1 || n.collection.has_card(filter)

func create_deck() -> void:
	var c := CardCollection.new()
	c.path = get_working_path()
	if is_deck_mode():
		c.name = Storage.get_next_valid_name("New Deck", get_working_path())
		Global.open_deck_editor(c)
	else:
		c.name = Storage.get_next_valid_name("New Collection", get_working_path())
		Global.open_collection_editor(c)


func get_working_path() -> String:
	return Storage.get_deck_storage_dir() if is_deck_mode() else Storage.get_collection_storage_dir()


func delete_deck() -> void:
	var selected_item = get_focus_owner()
	if !focus_is_deck_item():
		return
	
	Storage.remove_collection(selected_item.collection)
	selected_item.queue_free()
	selected_item = null


func clone_deck() -> void:
	var selected_item = get_focus_owner()
	if !focus_is_deck_item():
		return
	var c := Storage.copy_collection(selected_item.collection)
	add_deck_item(c)
	


func open_import() -> void:
	import_dialog.clear()
	import_dialog.popup_centered(rect_size * 0.6)


func open_export() -> void:
	var selected_item = get_focus_owner()
	if !focus_is_deck_item():
		return
	
	export_dialog.collection = selected_item.collection
	export_dialog.popup_centered(rect_size * 0.6)


func edit_deck() -> void:
	var selected_item = get_focus_owner()
	if !focus_is_deck_item():
		return
	
	if collection_comparator.visible:
		var must_switch = !collection_comparator.can_compare()
		
		if is_deck_mode():
			collection_comparator.set_deck(selected_item.collection)
		else:
			collection_comparator.set_collection(selected_item.collection)
		
		if must_switch:
			set_deck_mode(!is_deck_mode())
			if collection_comparator.can_compare():
				collection_comparator.show_comparison()
	else:
		if is_deck_mode():
			Global.open_deck_editor(selected_item.collection)
		else:
			Global.open_collection_editor(selected_item.collection)
	
