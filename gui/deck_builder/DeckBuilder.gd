# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control


var deck_container : Control
var collection_container : Control
var filter_container : Control
var stats_container : Control
var split_container : SplitContainer
var toolbar_container : Control

var split_offset := 0.0

var all_cards : CardCollection

var roll_dialog : WindowDialog


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		if toolbar_container.save_button.disabled:
			get_tree().quit()
		else:
			toolbar_container.exit_dialog.connect("confirmed", get_tree(), "quit")
			toolbar_container.exit_dialog.get_cancel().connect("pressed", get_tree(), "quit")
			toolbar_container.exit_dialog.popup_centered(Vector2(250, 80))


func _input(event) -> void:
	if roll_dialog.visible || toolbar_container.exit_dialog.visible || toolbar_container.delete_dialog.visible:
		return
	
	if event is InputEventKey:
		if event.is_action_pressed("ui_cancel"):
			if Global.text_editor_has_focus():
				get_focus_owner().release_focus()
		elif event.is_action_pressed("ui_exit"):
			call_deferred("checked_exit_to_deck_list")
		elif event.is_action_pressed("ui_save"):
			toolbar_container.save_collection()
		elif event.is_action_pressed("ui_rename"):
			toolbar_container.name_edit.grab_focus()
			toolbar_container.name_edit.select_all()


func _ready():
	var editing_collection = Global.editing_collection
	Global.editing_collection = null
	
	toolbar_container = $BackgroundPanel/VBoxContainer/ForegroundPanel/HBoxContainer/CollectionToolbar
	deck_container = $BackgroundPanel/VBoxContainer/SplitContainer/DeckContainer
	collection_container = $BackgroundPanel/VBoxContainer/SplitContainer/FilteredContainer
	
	toolbar_container.set_collection_owner(deck_container)
	
	toolbar_container.name_edit.text = editing_collection.name
	
	collection_container.bind_pasive_view(deck_container)
	deck_container.set_sort_type(CardCollection.SortType.LEVEL)
	
	toolbar_container.big_mode_button.connect("toggled", self, "set_big_mode")
	
	deck_container.set_delete_on_zero(true)
	deck_container.set_size_factor(Config.get_value("deck_builder", "deck_size_factor", 1.6))
	deck_container.set_config(CardViewItem.get_deck_config())
	set_big_mode(Config.get_value("deck_builder", "big_mode", true))
	deck_container.set_collection(editing_collection)
	deck_container.connect("size_factor_changed", self, "_save_size_factor", ["deck_size_factor"])
	
	var sort_type = Config.get_value("deck_builder", "sort_type", CardCollection.SortType.ID)
	collection_container.set_sort_type(sort_type)
	collection_container.set_size_factor(Config.get_value("deck_builder", "filter_size_factor", 2.0))
	collection_container.set_config(CardViewItem.get_card_search_config())
	collection_container.set_big_mode(true)
	collection_container.editable = false
	_init_all_cards()
	collection_container.set_collection(all_cards)
	collection_container.connect("size_factor_changed", self, "_save_size_factor", ["filter_size_factor"])
	
	filter_container = $BackgroundPanel/VBoxContainer/ForegroundPanel/HBoxContainer/CollectionFilter
	filter_container.connect("filter_changed", self, "filter_content")
	filter_container.set_sort_type(sort_type)
	# We connect later to prevent double sorting
	filter_container.connect("sort_changed", collection_container, "set_sort_type")
	filter_container.connect("sort_changed", self, "save_sort_type")
	filter_container.set_count_value(all_cards.data.size())
	
	
	toolbar_container.mid_button.connect("pressed", self, "change_split_offset", [0.0])
	toolbar_container.full_button.connect("pressed", self, "change_split_offset", [-1.0])
	toolbar_container.side_button.connect("pressed", self, "change_split_offset", [0.5])
	
	toolbar_container.clear_button.disabled = deck_container.is_empty()
	toolbar_container.delete_dialog.connect("confirmed", self, "clear_deck")
	
	toolbar_container.save_button.connect("pressed", toolbar_container, "save_collection")
	toolbar_container.save_button.disabled = true # Storage.is_collection_in_disk(editing_collection)
	
	toolbar_container.test_button.disabled =  deck_container.get_card_count(false) < 11
	
	toolbar_container.exit_dialog.connect("confirmed", self, "save_and_exit")
	toolbar_container.exit_dialog.get_cancel().connect("pressed", self, "exit_to_deck_list")
	
	toolbar_container.stats_button.connect("toggled", self, "show_stats")
	
	deck_container.connect("content_changed", self, "on_content_changed")
	
	stats_container = $BackgroundPanel/VBoxContainer/ForegroundPanel/HBoxContainer/StatsViewer
	
	split_container = $BackgroundPanel/VBoxContainer/SplitContainer
	split_container.connect("dragged", self, "on_split_dragged")
	split_container.connect("resized", self, "on_viewport_resized")
	change_split_offset(Config.get_value("deck_builder", "split_offset", 0.0))
	
	toolbar_container.exit_button.connect("pressed", self, "checked_exit_to_deck_list")
	toolbar_container.exit_dialog.connect("confirmed", toolbar_container, "save_and_exit")
	
	
	toolbar_container.test_button.connect("pressed", self, "show_roll_dialog")
	roll_dialog = preload("res://gui/deck_builder/DeckRoll.tscn").instance()
	add_child(roll_dialog)
	
	update_stats()


func show_roll_dialog() -> void:
	roll_dialog.set_collection(deck_container.get_collection())
	roll_dialog.popup_centered(Vector2(1200, 700))


func save_sort_type(type : String) -> void:
	Config.set_value("deck_builder", "sort_type", type)


func save_and_exit() -> void:
	toolbar_container.save_collection()
	Global.open_deck_list()

func checked_exit_to_deck_list() -> void:
	if toolbar_container.save_button.disabled:
		exit_to_deck_list()
	else:
		toolbar_container.exit_dialog.popup_centered(Vector2(250, 80))


func exit_to_deck_list() -> void:
	Global.open_deck_list()


func clear_deck() -> void:
	deck_container.clear_cards()
	on_content_changed()


func on_viewport_resized():
	change_split_offset(split_offset)


func on_split_dragged(pos : int) -> void:
	var limit_pos = split_container.rect_size.x / 2
	split_offset = pos / limit_pos
	if pos < (-limit_pos) + 5:
		show_stats(true)
		toolbar_container.stats_button.disabled = true
	elif toolbar_container.stats_button.disabled:
		toolbar_container.stats_button.disabled = false
		if toolbar_container.stats_button.pressed == false:
			show_stats(false)
	Config.set_value("deck_builder", "split_offset", split_offset)


func show_stats(enable : bool) -> void:
	stats_container.visible = enable
	filter_container.visible = !enable
	update_stats()


func on_content_changed() -> void:
	toolbar_container.save_button.disabled = false
	toolbar_container.clear_button.disabled = deck_container.is_empty()
	toolbar_container.test_button.disabled =  deck_container.get_card_count(false) < 11
	update_stats()


func update_stats() -> void:
	var stats := deck_container.get_stats() as CollectionStats
	if stats_container && stats_container.visible:
		stats_container.set_stats(stats)
	var deck_count_label = $BackgroundPanel/VBoxContainer/ForegroundPanel/HBoxContainer/VBoxContainer/DeckCount
	var deck_count = stats.get_deck_count()
	deck_count_label.text = str(deck_count) + "/50"
	if deck_count == 50:
		deck_count_label.add_color_override("font_color", Color.green)
	else:
		deck_count_label.add_color_override("font_color", Color.red)
	var tama_count_label = $BackgroundPanel/VBoxContainer/ForegroundPanel/HBoxContainer/VBoxContainer/TamaCount
	tama_count_label.text = str(stats.digitama_count) + "/5"


func _save_size_factor(factor : float, name : String) -> void:
	Config.set_value("deck_builder", name, factor)


func _init_all_cards():
	all_cards = CardCollection.new()
	for id in CardDB.get_card_list():
		all_cards.data[id] = 1


func filter_content() -> void:
	var c = filter_container.filter_collection(all_cards)
	collection_container.set_collection(c)


func set_big_mode(enable : bool) -> void:
	deck_container.set_big_mode(enable)
	Config.set_value("deck_builder", "big_mode", enable)
	toolbar_container.big_mode_button.pressed = enable
	


func change_split_offset(ratio : float) -> void:
	split_offset = ratio
	split_container.split_offset = int(ratio * float(split_container.rect_size.x / 2))
	on_split_dragged(split_container.split_offset)
