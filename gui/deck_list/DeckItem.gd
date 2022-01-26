# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control


signal item_clicked(item)

class_name DeckItem

var collection : CardCollection setget set_collection, get_collection

var _color_rect : Node
var name_edit : LineEdit
var card_preview : Node


signal name_changed
signal open_requested


func _ready() -> void:
	_color_rect = $MarginContainer/ColorRect
	name_edit = $DeckName
	card_preview = $CenterContainer/CardViewItem
	name_edit.connect("text_entered", self, "rename_collection")
	name_edit.connect("focus_exited", self, "enable_name_edit", [false])


func set_count_num(c : int) -> void:
	var count_edit = $CountLineEdit
	count_edit.visible = c != 0
	count_edit.text = str(c)


func reload_texture() -> void:
	card_preview.reload_texture()


func is_editing_name() -> bool:
	return name_edit.editable


func _draw():
	_color_rect.visible = has_focus()


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			emit_signal("item_clicked", self)
			set_selected(true)
			if event.doubleclick:
				if name_edit.get_global_rect().has_point(get_global_mouse_position()):
					enable_name_edit(true)
				else:
					emit_signal("open_requested")


func enable_name_edit(enable : bool) -> void:
	if enable:
		name_edit.editable = true
		name_edit.mouse_filter = Control.MOUSE_FILTER_STOP
		name_edit.grab_focus()
		name_edit.select_all()
	else:
		name_edit.mouse_filter = Control.MOUSE_FILTER_IGNORE
		name_edit.release_focus()
		name_edit.editable = false
		name_edit.deselect()


func set_selected(selected : bool) -> void:
	_color_rect.visible = selected
	if selected:
		grab_focus()
	else:
		enable_name_edit(false)


func rename_collection(new_name : String) -> void:
	new_name = new_name.strip_edges()
	if new_name == collection.name:
		pass # Nothing to do
	elif !CardCollection.is_valid_name(new_name):
		name_edit.text = collection.name
		Global.show_alert_message(CardCollection.get_name_error_msg(), self)
	elif Storage.rename_collection(collection, new_name):
		collection.name = new_name
		name = new_name
		emit_signal("name_changed")
	else:
		name_edit.text = collection.name
		Global.show_alert_message("The name is not available.", self)
	enable_name_edit(false)
	grab_focus()


func set_collection(c : CardCollection, show_lead : bool = true):
	collection = c
	name_edit.text = c.name
	var lead_card : Card 
	if show_lead:
		lead_card = c.get_lead_card()
	else:
		set_count_num(c.size())
	
	if lead_card:
		_color_rect.color = lead_card.get_rgb_color()
	else:
		_color_rect.color = Color(1.0, 1.0, 1.0)
	
	var config = CardViewItem.Config.BIG_MODE
	card_preview.set_card(lead_card, 1, 2.7, config)
	_color_rect.color.a = 0.4


func get_collection() -> CardCollection:
	return collection
