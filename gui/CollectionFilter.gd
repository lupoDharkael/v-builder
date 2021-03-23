# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

var booster_menu : Button
var color_menu : MenuButton
var rarity_menu : MenuButton
var type_menu : MenuButton
var level_menu : MenuButton
var sort_menu : OptionButton
var search_field : LineEdit
var count_label : LineEdit

var search_timer : Timer

var booster_selector : WindowDialog

signal filter_changed
signal sort_changed(sort_type)


func _input(event) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("ui_search"):
			search_field.grab_focus()


func _on_booster_item_selected() -> void:
	booster_menu.text = _get_button_text(booster_menu.text, !booster_selector.is_empty())
	emit_filter_changed()


func _on_menu_item_selected(item : int, button : MenuButton) -> void:
	var is_checked := button.get_popup().is_item_checked(item)
	button.get_popup().set_item_checked(item, !is_checked)
	update_menu_button_text(button)
	emit_filter_changed()

func emit_filter_changed():
	emit_signal("filter_changed")


func reset_booster_selection():
	if !booster_selector.is_empty():
		booster_selector.clear()
		booster_menu.text = _get_button_text(booster_menu.text, false)
		emit_filter_changed()

func select_default(menu_button : MenuButton):
	var content_changed := false
	for i in menu_button.get_popup().get_item_count():
		if menu_button.get_popup().is_item_checked(i):
			menu_button.get_popup().set_item_checked(i, false)
			content_changed = true
	update_menu_button_text(menu_button)
	if content_changed:
		emit_filter_changed()


func on_search_edited(_text : String) -> void:
	search_timer.start(0.4)


func set_sort_type(type : String) -> void:
	for i in sort_menu.get_item_count():
		if sort_menu.get_item_text(i) == type:
			sort_menu.select(i)
			sort_selected(i)
			break


func show_booster_selector() -> void:
	booster_selector.popup_centered(get_viewport().size * 0.85)


func _ready():
	booster_selector = preload("res://gui/BoosterSelector.tscn").instance()
	booster_selector.connect("selection_changed", self, "_on_booster_item_selected")
	add_child(booster_selector)
	
	search_field = $VBoxContainer/HBoxContainer/Search
	search_field.connect("text_changed", self, "on_search_edited")
	
	count_label = $VBoxContainer/HBoxContainer/Count
	
	search_timer = Timer.new()
	search_timer.one_shot = true
	add_child(search_timer)
	search_timer.connect("timeout", self, "emit_filter_changed")
	
	var sort_icon = preload("res://images/Sort.svg")
	sort_menu = $VBoxContainer/HBoxContainer/SortMenu
	sort_menu.add_item(CardCollection.SortType.ID)
	sort_menu.add_item(CardCollection.SortType.DP)
	sort_menu.add_item(CardCollection.SortType.COST)
	sort_menu.add_item(CardCollection.SortType.LEVEL)
	for i in sort_menu.get_item_count():
		sort_menu.set_item_icon(i, sort_icon)
	sort_menu.connect("item_selected", self, "sort_selected")
	
	booster_menu = $VBoxContainer/MenuContainer/BoosterMenu as Button
	booster_menu.connect("pressed", self, "show_booster_selector")
	
	color_menu = $VBoxContainer/HBoxContainer/ColorMenu as MenuButton
	color_menu.get_popup().hide_on_checkable_item_selection = false
	color_menu.get_popup().add_item(Card.ColorGroup.RED)
	color_menu.get_popup().set_item_as_checkable(0, true)
	color_menu.get_popup().add_item(Card.ColorGroup.BLUE)
	color_menu.get_popup().set_item_as_checkable(1, true)
	color_menu.get_popup().add_item(Card.ColorGroup.YELLOW)
	color_menu.get_popup().set_item_as_checkable(2, true)
	color_menu.get_popup().add_item(Card.ColorGroup.GREEN)
	color_menu.get_popup().set_item_as_checkable(3, true)
	color_menu.get_popup().add_item(Card.ColorGroup.BLACK)
	color_menu.get_popup().set_item_as_checkable(4, true)
	color_menu.get_popup().add_item(Card.ColorGroup.PURPLE)
	color_menu.get_popup().set_item_as_checkable(5, true)
	color_menu.get_popup().connect("id_pressed", self, "_on_menu_item_selected", [color_menu])
	
	rarity_menu = $VBoxContainer/MenuContainer/RarityMenu as MenuButton
	rarity_menu.get_popup().hide_on_checkable_item_selection = false
	rarity_menu.get_popup().add_item(Card.Rarity.C)
	rarity_menu.get_popup().set_item_as_checkable(0, true)
	rarity_menu.get_popup().add_item(Card.Rarity.U)
	rarity_menu.get_popup().set_item_as_checkable(1, true)
	rarity_menu.get_popup().add_item(Card.Rarity.R)
	rarity_menu.get_popup().set_item_as_checkable(2, true)
	rarity_menu.get_popup().add_item(Card.Rarity.SR)
	rarity_menu.get_popup().set_item_as_checkable(3, true)
	rarity_menu.get_popup().add_item(Card.Rarity.SEC)
	rarity_menu.get_popup().set_item_as_checkable(4, true)
	rarity_menu.get_popup().add_item(Card.Rarity.P)
	rarity_menu.get_popup().set_item_as_checkable(5, true)
	rarity_menu.get_popup().connect("id_pressed", self, "_on_menu_item_selected", [rarity_menu])
	
	type_menu = $VBoxContainer/MenuContainer/TypeMenu as MenuButton
	type_menu.get_popup().hide_on_checkable_item_selection = false
	type_menu.get_popup().add_item(Card.Type.DIGIMON)
	type_menu.get_popup().set_item_as_checkable(0, true)
	type_menu.get_popup().add_item(Card.Type.TAMER)
	type_menu.get_popup().set_item_as_checkable(1, true)
	type_menu.get_popup().add_item(Card.Type.DIGITAMA)
	type_menu.get_popup().set_item_as_checkable(2, true)
	type_menu.get_popup().add_item(Card.Type.OPTION)
	type_menu.get_popup().set_item_as_checkable(3, true)
	type_menu.get_popup().connect("id_pressed", self, "_on_menu_item_selected", [type_menu])
	
	level_menu = $VBoxContainer/MenuContainer/LevelMenu as MenuButton
	level_menu.get_popup().hide_on_checkable_item_selection = false
	level_menu.get_popup().add_item("2")
	level_menu.get_popup().set_item_as_checkable(0, true)
	level_menu.get_popup().add_item("3")
	level_menu.get_popup().set_item_as_checkable(1, true)
	level_menu.get_popup().add_item("4")
	level_menu.get_popup().set_item_as_checkable(2, true)
	level_menu.get_popup().add_item("5")
	level_menu.get_popup().set_item_as_checkable(3, true)
	level_menu.get_popup().add_item("6")
	level_menu.get_popup().set_item_as_checkable(4, true)
	level_menu.get_popup().add_item("7")
	level_menu.get_popup().set_item_as_checkable(5, true)
	level_menu.get_popup().connect("id_pressed", self, "_on_menu_item_selected", [level_menu])
	
	# Clear buttons
	var color_clear = $VBoxContainer/HBoxContainer/ColorButton
	var booster_clear = $VBoxContainer/MenuContainer/BoosterButton
	var rarity_clear = $VBoxContainer/MenuContainer/RarityButton
	var type_clear = $VBoxContainer/MenuContainer/TypeButton
	var level_clear = $VBoxContainer/MenuContainer/LevelButton
	
	booster_clear.connect("pressed", self, "reset_booster_selection")
	color_clear.connect("pressed", self, "select_default", [color_menu])
	rarity_clear.connect("pressed", self, "select_default", [rarity_menu])
	type_clear.connect("pressed", self, "select_default", [type_menu])
	level_clear.connect("pressed", self, "select_default", [level_menu])


func set_count_value(val : int) -> void:
	count_label.text = "Showing " + str(val) + " Card(s)"


func sort_selected(item : int) -> void:
	emit_signal("sort_changed", sort_menu.get_item_text(item))


func update_menu_button_text(menu_button : MenuButton) -> void:
	var has_checked := false
	for i in menu_button.get_popup().get_item_count():
		if menu_button.get_popup().is_item_checked(i):
			has_checked = true
			break
	menu_button.text = _get_button_text(menu_button.text, has_checked)


func _get_button_text(text : String, has_filter) -> String:
	var edited_sufix := " [!]"
	var res := text
	if text.ends_with(edited_sufix):
		if !has_filter:
			res = text.substr(0, text.length() - edited_sufix.length())
	else:
		if has_filter:
			res = text + edited_sufix
	return res


func filter_collection(collection : CardCollection) -> CardCollection:
	var res := CardCollection.new()
	
	for k in collection.data.keys():
		var card := CardDB.get_card_by_id(k)
		if _filter_card(card):
			res.data[k] = collection.data[k]
	
	set_count_value(res.data.size())
	return res



func _filter_card(card : Card) -> bool:
	var is_valid := true
	# Color
	for i in color_menu.get_popup().get_item_count():
		if color_menu.get_popup().is_item_checked(i):
			# There are checks in this MenuButton, not valid until we have a match
			if is_valid:
				is_valid = false
			
			if color_menu.get_popup().get_item_text(i) == card.color:
				is_valid = true
				break
	if !is_valid:
		return false
	
	# Booster
	is_valid = booster_selector.card_is_valid(card)
	if !is_valid:
		return false
	
	# Rarity
	for i in rarity_menu.get_popup().get_item_count():
		if rarity_menu.get_popup().is_item_checked(i):
			# There are checks in this MenuButton, not valid until we have a match
			if is_valid:
				is_valid = false
			
			if rarity_menu.get_popup().get_item_text(i) == card.rarity:
				is_valid = true
				break
	if !is_valid:
		return false
	
	# Level
	for i in level_menu.get_popup().get_item_count():
		if level_menu.get_popup().is_item_checked(i):
			# There are checks in this MenuButton, not valid until we have a match
			if is_valid:
				is_valid = false
			
			if level_menu.get_popup().get_item_text(i).to_int() == card.level:
				is_valid = true
				break
	if !is_valid:
		return false
	
	# Type
	for i in type_menu.get_popup().get_item_count():
		if type_menu.get_popup().is_item_checked(i):
			# There are checks in this MenuButton, not valid until we have a match
			if is_valid:
				is_valid = false
			
			if type_menu.get_popup().get_item_text(i) == card.type:
				is_valid = true
				break
	if !is_valid:
		return false
	
	if search_field.text.length():
		return (card.name.findn(search_field.text) != -1
			|| card.type.findn(search_field.text) != -1
			|| card.id.findn(search_field.text) != -1
			|| card.inherited_effect_text.findn(search_field.text) != -1
			|| card.effect_text.findn(search_field.text) != -1
			|| card.sec_effect_text.findn(search_field.text) != -1
			|| card.digimon_type.findn(search_field.text) != -1
			|| card.attribute.findn(search_field.text) != -1
			|| card.notes.findn(search_field.text) != -1)
	return is_valid
