extends WindowDialog

var boosterview_tscn = preload("res://gui/BoosterViewItem.tscn")
var container : Control
var search_field : LineEdit

signal selection_changed


func _notification(what):
	if what == NOTIFICATION_VISIBILITY_CHANGED && visible:
		search_field.text = ""
		_on_search_changed("")


func _ready():
	container = $VBoxContainer/ScrollContainer/HFlowContainer
	search_field = $VBoxContainer/HBoxContainer/SearchField
	search_field.connect("text_changed", self, "_on_search_changed")
	var booster_list = CardDB.get_booster_list()
	for i in booster_list.size():
		var booster = booster_list[i]
		var booster_view = boosterview_tscn.instance()
		booster_view.set_data(booster, i)
		booster_view.connect("selection_changed", self, "_emit_selection_changed")
		container.add_child(booster_view)


func _on_search_changed(_t) -> void:
	print("sss")
	var text = search_field.text
	for c in container.get_children():
		c.apply_search_filter(text)

func is_empty() -> bool:
	for c in container.get_children():
		if c.is_set():
			return false
	return true


func clear():
	for c in container.get_children():
		c.clear()


func _emit_selection_changed() -> void:
	emit_signal("selection_changed")


func card_is_valid(card : Card) -> bool:
	var is_valid := true
	for c in container.get_children():
		if c.is_set():
			# There are checks in this MenuButton, not valid until we have a match
			if is_valid:
				is_valid = false
			
			if CardDB.card_is_from_booster(card, c.booster_number):
				is_valid = true
				break
	return is_valid
