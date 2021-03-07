# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

var booster_menu : OptionButton
var color_menu : OptionButton
var rarity_menu : OptionButton
var type_menu : OptionButton
var level_menu : OptionButton
var sort_menu : OptionButton
var search_field : LineEdit

var search_timer : Timer

signal filter_changed
signal sort_changed(sort_type)


func _input(event) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("ui_search"):
			search_field.grab_focus()


func emit_filter_changed(_val):
	emit_signal("filter_changed")


func select_default(opt_button : OptionButton):
	if opt_button.selected != 0:
		opt_button.select(0)
		emit_signal("filter_changed")


func on_search_edited(_text : String) -> void:
	search_timer.start(0.4)


func set_sort_type(type : String) -> void:
	for i in sort_menu.get_item_count():
		if sort_menu.get_item_text(i) == type:
			sort_menu.select(i)
			sort_selected(i)
			break



func _ready():
	search_field = $VBoxContainer/HBoxContainer/Search
	search_field.connect("text_changed", self, "on_search_edited")
	
	search_timer = Timer.new()
	search_timer.one_shot = true
	add_child(search_timer)
	search_timer.connect("timeout", self, "emit_filter_changed", [null])
	
	var sort_icon = preload("res://images/Sort.svg")
	sort_menu = $VBoxContainer/HBoxContainer/SortMenu
	sort_menu.add_item(CardCollection.SortType.ID)
	sort_menu.add_item(CardCollection.SortType.DP)
	sort_menu.add_item(CardCollection.SortType.COST)
	sort_menu.add_item(CardCollection.SortType.LEVEL)
	for i in sort_menu.get_item_count():
		sort_menu.set_item_icon(i, sort_icon)
	sort_menu.connect("item_selected", self, "sort_selected")
	
	booster_menu = $VBoxContainer/MenuContainer/BoosterMenu as OptionButton
	booster_menu.add_item("Any Booster")
	for i in CardDB.get_booster_list():
		booster_menu.add_item(i.prefix + " " + i.name)
	booster_menu.connect("item_selected", self, "emit_filter_changed")
	
	color_menu = $VBoxContainer/HBoxContainer/ColorMenu as OptionButton
	color_menu.add_item("Any Color")
	color_menu.add_item(Card.ColorGroup.RED)
	color_menu.add_item(Card.ColorGroup.BLUE)
	color_menu.add_item(Card.ColorGroup.YELLOW)
	color_menu.add_item(Card.ColorGroup.GREEN)
	color_menu.add_item(Card.ColorGroup.BLACK)
	color_menu.add_item(Card.ColorGroup.PURPLE)
	color_menu.connect("item_selected", self, "emit_filter_changed")
	
	rarity_menu = $VBoxContainer/MenuContainer/RarityMenu as OptionButton
	rarity_menu.add_item("Any Rarity")
	rarity_menu.add_item(Card.Rarity.C)
	rarity_menu.add_item(Card.Rarity.U)
	rarity_menu.add_item(Card.Rarity.R)
	rarity_menu.add_item(Card.Rarity.SR)
	rarity_menu.add_item(Card.Rarity.SEC)
	rarity_menu.add_item(Card.Rarity.P)
	rarity_menu.connect("item_selected", self, "emit_filter_changed")
	
	type_menu = $VBoxContainer/MenuContainer/TypeMenu as OptionButton
	type_menu.add_item("Any Type")
	type_menu.add_item(Card.Type.DIGIMON)
	type_menu.add_item(Card.Type.TAMER)
	type_menu.add_item(Card.Type.DIGITAMA)
	type_menu.add_item(Card.Type.OPTION)
	type_menu.connect("item_selected", self, "emit_filter_changed")
	
	level_menu = $VBoxContainer/MenuContainer/LevelMenu as OptionButton
	level_menu.add_item("Any Lvl")
	level_menu.add_item("2")
	level_menu.add_item("3")
	level_menu.add_item("4")
	level_menu.add_item("5")
	level_menu.add_item("6")
	level_menu.add_item("7")
	level_menu.connect("item_selected", self, "emit_filter_changed")
	
	# Clear buttons
	var color_clear = $VBoxContainer/HBoxContainer/ColorButton
	var booster_clear = $VBoxContainer/MenuContainer/BoosterButton
	var rarity_clear = $VBoxContainer/MenuContainer/RarityButton
	var type_clear = $VBoxContainer/MenuContainer/TypeButton
	var level_clear = $VBoxContainer/MenuContainer/LevelButton
	
	booster_clear.connect("pressed", self, "select_default", [booster_menu])
	booster_clear.connect("pressed", self, "emit_filter_changed_0")
	color_clear.connect("pressed", self, "select_default", [color_menu])
	color_clear.connect("pressed", self, "emit_filter_changed_0")
	rarity_clear.connect("pressed", self, "select_default", [rarity_menu])
	rarity_clear.connect("pressed", self, "emit_filter_changed_0")
	type_clear.connect("pressed", self, "select_default", [type_menu])
	type_clear.connect("pressed", self, "emit_filter_changed_0")
	level_clear.connect("pressed", self, "select_default", [level_menu])
	level_clear.connect("pressed", self, "emit_filter_changed_0")
	


func sort_selected(item : int) -> void:
	emit_signal("sort_changed", sort_menu.get_item_text(item))



func filter_collection(collection : CardCollection) -> CardCollection:
	var res := CardCollection.new()
	
	for k in collection.data.keys():
		var card := CardDB.get_card_by_id(k)
		if _filter_card(card):
			res.data[k] = collection.data[k]
	
	return res


func _filter_card(card : Card) -> bool:
	if color_menu.selected != 0 && color_menu.get_item_text(color_menu.selected) != card.color:
		return false
	if booster_menu.selected != 0 && !CardDB.card_is_from_booster_id(card, booster_menu.selected -1):
		return false
	if rarity_menu.selected != 0 && rarity_menu.get_item_text(rarity_menu.selected) != card.rarity:
		return false
	if level_menu.selected != 0 && level_menu.get_item_text(level_menu.selected).to_int() != card.level:
		return false
	if type_menu.selected != 0 && type_menu.get_item_text(type_menu.selected) != card.type:
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
	return true
