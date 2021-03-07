# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

var editing_collection : CardCollection
var default_deck_mode := true


func _ready():
	var screen_size = OS.get_screen_size()
	OS.set_window_size(screen_size)
	open_deck_list()


func text_editor_has_focus() -> bool:
	var owner = get_focus_owner()
	if !owner:
		return false
	return (owner is LineEdit || owner is TextEdit || owner is RichTextLabel)


func show_alert_message(msg : String, n : Node) -> void:
	var alert_dialog = AcceptDialog.new()
	alert_dialog.dialog_text = msg
	n.add_child(alert_dialog)
	alert_dialog.popup_centered()


func open_deck_editor(collection: CardCollection) -> void:
	get_tree().set_auto_accept_quit(false)
	get_tree().change_scene("res://gui/deck_builder/DeckBuilder.tscn")
	editing_collection = collection


func open_collection_editor(collection: CardCollection) -> void:
	get_tree().set_auto_accept_quit(false)
	get_tree().change_scene("res://gui/collection_builder/CollectionBuilder.tscn")
	editing_collection = collection


func open_deck_list() -> void:
	default_deck_mode = true
	get_tree().set_auto_accept_quit(true)
	get_tree().change_scene("res://gui/deck_list/DeckList.tscn")


func open_collection_list() -> void:
	default_deck_mode = false
	get_tree().set_auto_accept_quit(true)
	get_tree().change_scene("res://gui/deck_list/DeckList.tscn")
