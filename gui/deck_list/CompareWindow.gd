# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends WindowDialog

var available_view : Control
var missing_view : Control

func _ready():
	available_view = $BackgroundPanel/VBoxContainer/HBoxContainer2/AvailableView
	missing_view = $BackgroundPanel/VBoxContainer/HBoxContainer2/MissingView
	
	available_view.set_delete_on_zero(false)
	available_view.set_size_factor(1.9)
	available_view.set_config(CardViewItem.get_collection_config())
	available_view.set_big_mode(true)
	available_view.editable = false
	
	missing_view.set_delete_on_zero(false)
	missing_view.set_size_factor(1.9)
	missing_view.set_config(CardViewItem.get_collection_config())
	missing_view.set_big_mode(true)
	missing_view.editable = false


func set_missing_collection(c : CardCollection) -> void:
	missing_view.set_collection(c)
	var label = $BackgroundPanel/VBoxContainer/HBoxContainer/MissingCountLabel
	label.text = str(c.size()) + " Missing Cards"


func set_available_collection(c : CardCollection) -> void:
	available_view.set_collection(c)
	var label = $BackgroundPanel/VBoxContainer/HBoxContainer/AvailableCountLabel
	label.text = str(c.size()) + " Available Cards"
