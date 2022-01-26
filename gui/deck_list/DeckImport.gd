# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

var name_line_edit : LineEdit
var content_text : TextEdit
var import_button : Button

signal collection_generated(c)


func _ready():
	set_pass_on_modal_close_click(false)
	name_line_edit = $VBoxContainer/LineEdit
	content_text = $VBoxContainer/TextEdit
	import_button = $VBoxContainer/Button
	import_button.connect("pressed", self, "_on_import_pressed")
	
	connect("visibility_changed", self, "_on_visibility_changed")


func clear() -> void:
	name_line_edit.text = ""
	content_text.text = ""


func _on_visibility_changed() -> void:
	if visible:
		name_line_edit.call_deferred("grab_focus")


func _on_import_pressed() -> void:
	var title_name = name_line_edit.text.strip_edges()
	if title_name.empty():
		Global.show_alert_message("The name can't be empty.", self)
		return
	if !CardCollection.is_valid_name(title_name):
		Global.show_alert_message(CardCollection.get_name_error_msg(), self)
		return
	
	var parser := CollectionParser.new()
	var collection := parser.import_collection(content_text.text)
	collection.name = title_name
	emit_signal("collection_generated", collection)
	hide()
