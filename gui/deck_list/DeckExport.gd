# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control


var export_option_button : OptionButton
var content_edit : TextEdit
var copy_button : Button

var collection : CardCollection setget set_collection, get_collection

func _ready():
	set_pass_on_modal_close_click(false)
	content_edit = $VBoxContainer/TextEdit
	copy_button = $VBoxContainer/HBoxContainer/CopyButton
	
	copy_button.connect("pressed", self, "_on_copy_pressed")
	
	export_option_button = $VBoxContainer/OptionButton
	export_option_button.add_item(CollectionParser.ExportType.TEXT)
	export_option_button.add_item(CollectionParser.ExportType.TTS)
	export_option_button.add_item(CollectionParser.ExportType.CHRONOBATTLE)
	export_option_button.add_item(CollectionParser.ExportType.UNTAP)
	export_option_button.connect("item_selected", self, "_on_export_changed")


func _on_copy_pressed() -> void:
	OS.clipboard = content_edit.text


func _on_export_changed(item : int) -> void:
	var format = export_option_button.get_item_text(item)
	var parser := CollectionParser.new()
	content_edit.text = parser.export_collection(collection, format)


func set_collection(c : CardCollection) -> void:
	collection = c
	_on_export_changed(export_option_button.selected)


func get_collection() -> CardCollection:
	return collection
