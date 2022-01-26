extends VBoxContainer

var booster_number : int
var button : Button

signal selection_changed


func apply_search_filter(filter : String):
	if !filter:
		visible = true
	else:
		visible = $Label.text.findn(filter) != -1 || button.hint_tooltip.findn(filter) != -1


func set_data(booster_data, id) -> void:
	button = $Button
	booster_number = id
	$Label.text = booster_data.short_name
	button.icon = booster_data.texture
	button.hint_tooltip = booster_data.name
	button.connect("pressed", self, "_emit_selection_changed")


func _emit_selection_changed() -> void:
	emit_signal("selection_changed")


func clear() -> void:
	$Button.pressed = false


func is_set() -> bool:
	return $Button.pressed
