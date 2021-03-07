# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

var card_arr := []
var collection : CardCollection
var roll_button : Button


func _input(event) -> void:
	if !visible:
		return
	
	if event is InputEventKey:
		if event.is_action_pressed("ui_cancel"):
			hide()
			get_tree().set_input_as_handled()
			


func _ready():
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer/HBoxContainer/CardViewItem)
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer/HBoxContainer/CardViewItem2)
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer/HBoxContainer/CardViewItem3)
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer/HBoxContainer/CardViewItem4)
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer/HBoxContainer/CardViewItem5)
	
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer2/HBoxContainer/CardViewItem)
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer2/HBoxContainer/CardViewItem2)
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer2/HBoxContainer/CardViewItem3)
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer2/HBoxContainer/CardViewItem4)
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer2/HBoxContainer/CardViewItem5)
	card_arr.push_back($MarginContainer/VBoxContainer/CenterContainer2/HBoxContainer/CardViewItem6)
	
	roll_button = $MarginContainer/VBoxContainer/Button
	roll_button.connect("pressed", self, "roll")
	connect("visibility_changed", self, "_on_visibility_changed")


func _on_visibility_changed() -> void:
	if visible:
		roll_button.call_deferred("grab_focus")


func set_collection(c : CardCollection) -> void:
	collection = c
	roll()


func roll() -> void:
	if !collection:
		return
	
	var cards = collection.get_random_cards(card_arr.size())
	if cards.empty():
		# TODO alert
		return
	var config = CardViewItem.Config.BIG_MODE
	for i in card_arr.size():
		card_arr[i].set_card(cards[i], 1, 2.5, config)
