# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control


var collection_container : Control
var filter_container : Control
var toolbar_container : Control

var collection : CardCollection

var collection_needs_sync = true


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		if toolbar_container.save_button.disabled:
			get_tree().quit()
		else:
			toolbar_container.exit_dialog.connect("confirmed", get_tree(), "quit")
			toolbar_container.exit_dialog.get_cancel().connect("pressed", get_tree(), "quit")
			toolbar_container.exit_dialog.popup_centered(Vector2(250, 80))


func _input(event) -> void:
	if get_viewport().gui_has_modal_stack():
		return
	
	if event is InputEventKey:
		if event.is_action_pressed("ui_cancel"):
			if Global.text_editor_has_focus():
				get_focus_owner().release_focus()
			else:
				call_deferred("checked_exit_to_deck_list")
		elif event.is_action_pressed("ui_save"):
			toolbar_container.save_collection()
		elif event.is_action_pressed("ui_rename"):
			toolbar_container.name_edit.grab_focus()
			toolbar_container.name_edit.select_all()


func _ready():
	toolbar_container = $BackgroundPanel/VBoxContainer/ForegroundPanel/HBoxContainer/Toolbar
	collection_container = $BackgroundPanel/VBoxContainer/CollectionView
	collection_container.set_delete_on_zero(false)
	collection_container.set_size_factor(Config.get_value("collection_builder", "size_factor", 1.6))
	collection_container.connect("size_factor_changed", self, "_save_size_factor")
	collection_container.set_config(CardViewItem.get_collection_config())
	set_big_mode(Config.get_value("collection_builder", "big_mode", true))
	
	var sort_type = Config.get_value("collection_builder", "sort_type", CardCollection.SortType.ID)
	
	
	collection = Global.editing_collection
	Global.editing_collection = null
	for id in CardDB.get_card_list():
		if !collection.data.has(id):
			collection.data[id] = 0
	
	collection_container.set_collection(collection)
	collection_container.connect("content_changed", self, "on_content_changed")
	collection_container.set_sort_type(sort_type)
	
	filter_container = $BackgroundPanel/VBoxContainer/ForegroundPanel/HBoxContainer/Filter
	filter_container.connect("filter_changed", self, "filter_content")
	filter_container.set_sort_type(CardCollection.SortType.ID)
	# We connect later to prevent double sorting
	filter_container.connect("sort_changed", collection_container, "set_sort_type")
	filter_container.connect("sort_changed", self, "save_sort_type")
	
	toolbar_container.show_deck_tools(false)
	toolbar_container.set_collection_owner(self)
	toolbar_container.name_edit.text = collection.name
	toolbar_container.big_mode_button.connect("toggled", self, "set_big_mode")
	
	toolbar_container.save_button.connect("pressed", toolbar_container, "save_collection")
	toolbar_container.save_button.disabled = Storage.is_collection_in_disk(collection)
	
	toolbar_container.exit_dialog.connect("confirmed", self, "save_and_exit")
	toolbar_container.exit_dialog.get_cancel().connect("pressed", self, "exit_to_deck_list")
	
	toolbar_container.exit_button.connect("pressed", self, "checked_exit_to_deck_list")
	toolbar_container.exit_dialog.connect("confirmed", toolbar_container, "save_and_exit")
	
	toolbar_container.plus_one_button.connect("toggled", self, "plus_one_toggled")


func plus_one_toggled(pressed : bool) -> void:
	collection_container.show_plus_one = pressed


func set_big_mode(enable : bool) -> void:
	collection_container.set_big_mode(enable)
	Config.set_value("collection_builder", "big_mode", enable)
	toolbar_container.big_mode_button.pressed = enable


func sync_collection() -> void:
	if collection_needs_sync:
		var c := collection_container.get_collection() as CardCollection
		for id in c.data.keys():
			collection.data[id] = c.data[id]
		collection_needs_sync = false


func on_content_changed() -> void:
	toolbar_container.save_button.disabled = false
	collection_needs_sync = true


func filter_content() -> void:
	sync_collection()
	var c = filter_container.filter_collection(collection)
	collection_container.set_collection(c)


func get_collection() -> CardCollection:
	sync_collection()
	var c := CardCollection.new()
	c.name = collection.name
	c.path = collection.path
	for id in collection.data.keys():
		var n = collection.data[id]
		if n > 0:
			c.data[id] = n
	return c


func save_sort_type(type : String) -> void:
	Config.set_value("collection_builder", "sort_type", type)


func save_and_exit() -> void:
	toolbar_container.save_collection()
	Global.open_collection_list()


func checked_exit_to_deck_list() -> void:
	if toolbar_container.save_button.disabled:
		exit_to_deck_list()
	else:
		toolbar_container.exit_dialog.popup_centered(Vector2(250, 80))


func exit_to_deck_list() -> void:
	Global.open_collection_list()


func _save_size_factor(factor : float) -> void:
	Config.set_value("collection_builder", "size_factor", factor)

