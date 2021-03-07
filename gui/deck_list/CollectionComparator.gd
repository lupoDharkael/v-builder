# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

var deck : CardCollection
var collection : CardCollection

var compare_button : Button

var compare_window : WindowDialog

func _ready():
	compare_button = $HBoxContainer/Button
	compare_button.connect("pressed", self, "_on_button_pressed")
	update_button_status()
	
	compare_window = preload("res://gui/deck_list/CompareWindow.tscn").instance()
	add_child(compare_window)


func clear():
	set_deck(null)
	set_collection(null)


func can_compare() -> bool:
	return deck && collection


func show_comparison() -> void:
	if !can_compare():
		return
	
	compare_window.set_missing_collection(deck.get_except_from(collection))
	compare_window.set_available_collection(deck.get_intersection_from(collection))
	compare_window.popup_centered(get_viewport().size * 0.85)

func _on_button_pressed() -> void:
	show_comparison()


func update_button_status() -> void:
	compare_button.disabled = !can_compare()


func set_deck(d : CardCollection) -> void:
	deck = d
	if deck:
		$HBoxContainer/DeckLineEdit.text = deck.name
	else:
		$HBoxContainer/DeckLineEdit.text = ""
	update_button_status()

func set_collection(c : CardCollection) -> void:
	collection = c
	if collection:
		$HBoxContainer/CollectionLineEdit.text = collection.name
	else:
		$HBoxContainer/CollectionLineEdit.text = ""
	update_button_status()
