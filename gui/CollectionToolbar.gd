# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

var name_edit : LineEdit
var save_button : Button
var big_mode_button : Button
var stats_button : Button
var test_button : Button
var clear_button : Button
var full_button : Button
var mid_button : Button
var side_button : Button
var exit_button : Button
var plus_one_button : Button

var collection_owner : Node

var name_exists_dialog : ConfirmationDialog
var delete_dialog : ConfirmationDialog
var exit_dialog : ConfirmationDialog


func _ready():
	name_edit = $HBoxContainer/VBoxContainer/HBoxContainer2/DeckName
	save_button = $HBoxContainer/VBoxContainer/HBoxContainer2/SaveButton
	big_mode_button = $HBoxContainer/VBoxContainer/HBoxContainer/SizeButton
	stats_button = $HBoxContainer/VBoxContainer/HBoxContainer/StatsButton
	test_button = $HBoxContainer/VBoxContainer/HBoxContainer/TestButton
	clear_button = $HBoxContainer/VBoxContainer/HBoxContainer/DelButton
	full_button = $HBoxContainer/VBoxContainer/HBoxContainer/FullButton
	mid_button = $HBoxContainer/VBoxContainer/HBoxContainer/MidButton
	side_button = $HBoxContainer/VBoxContainer/HBoxContainer/SideButton
	exit_button = $HBoxContainer/ExitButton
	plus_one_button = $HBoxContainer/VBoxContainer/HBoxContainer/PlusOneButton
	
	name_edit.connect("text_changed", self, "_on_name_edited")
	
	clear_button.connect("pressed", self, "_show_confirm_delete")
	
	delete_dialog = ConfirmationDialog.new()
	delete_dialog.window_title = "Confirm Delete"
	delete_dialog.dialog_text = "Are you sure you want to delete all?"
	delete_dialog.get_label().align = Label.ALIGN_CENTER
	delete_dialog.get_ok().text = "DELETE"
	delete_dialog.get_cancel().text = "CANCEL"
	delete_dialog.connect("confirmed", self, "_on_clear_confirmed")
	add_child(delete_dialog)
	
	name_exists_dialog = ConfirmationDialog.new()
	name_exists_dialog.window_title = "Deck Overwrite"
	name_exists_dialog.dialog_text = "There is other deck with that name. Do you want to save anyway?"
	name_exists_dialog.get_label().align = Label.ALIGN_CENTER
	name_exists_dialog.get_ok().text = "OK"
	name_exists_dialog.get_cancel().text = "CANCEL"
	name_exists_dialog.connect("confirmed", self, "_replace_collection")
	add_child(name_exists_dialog)
	
	exit_dialog = ConfirmationDialog.new()
	exit_dialog.window_title = "Unsaved Changes"
	exit_dialog.dialog_text = "This deck has unsaved changes. Do you want to save them?"
	exit_dialog.get_label().align = Label.ALIGN_CENTER
	exit_dialog.get_ok().text = "SAVE"
	exit_dialog.get_cancel().text = "EXIT"
	add_child(exit_dialog)


func show_deck_tools(show : bool) -> void:
	stats_button.visible = show
	test_button.visible = show
	clear_button.visible = show
	full_button.visible = show
	mid_button.visible = show
	side_button.visible = show
	plus_one_button.visible = !show
	
	$HBoxContainer/VBoxContainer/HBoxContainer/VSeparator.visible = show


func save_collection() -> void:
	var c = collection_owner.get_collection() as CardCollection
	var name = name_edit.text.strip_edges()
	if name != c.name:
		if !Storage.is_name_available(name, c.path):
			name_exists_dialog.popup_centered(Vector2(250, 80))
		else:
			_replace_collection()
			save_button.disabled = true
	else:
		Storage.save_collection(c)
		save_button.disabled = true


func set_collection_owner(n : Node) -> void:
	collection_owner = n


func _on_name_edited(text : String) -> void:
	var valid = CardCollection.is_valid_name(text.strip_edges())
	save_button.disabled = text.empty() || !valid
	if !valid:
		Global.show_alert_message(CardCollection.get_name_error_msg(), self)


func _show_confirm_delete() -> void:
	delete_dialog.popup_centered(Vector2(250, 80))


func _replace_collection() -> void:
	var c = collection_owner.get_collection() as CardCollection
	Storage.remove_collection(c)
	c.name = name_edit.text.strip_edges()
	Storage.save_collection(c)
