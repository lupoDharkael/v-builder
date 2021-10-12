# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Node

var _cards : Dictionary
var _textures : Dictionary


var _booster_list : Array

class BoosterData:
	var name : String
	var short_name : String
	var is_st := false
	
	var texture : Texture
	var cards : Dictionary
	
	func has_card(c : Card) -> bool:
		return cards.has(c.id)
	
	func add_card(id : String) -> void:
		cards[id] = true

func register_booster(short_name : String, name : String) -> BoosterData:
	var booster := BoosterData.new()
	booster.name = name
	booster.short_name = short_name
	booster.is_st = short_name.begins_with("ST")
	booster.texture = load("res://booster_images/" + short_name + ".png")

	_booster_list.append(booster)
	return booster


func card_is_from_booster(card : Card, booster : int) -> bool:
	if booster < _booster_list.size() && _booster_list[booster].has_card(card):
		return true
	return false


func get_booster_list() -> Array:
	return _booster_list


func get_booster_from_shortname(short_name : String) -> Array:
	var res = null
	for b in _booster_list:
		if b.short_name == short_name:
			res = b
			break
	return res


var thread : Thread
var mutex : Mutex

signal textures_loaded


func _ready():
	var _ST1 = preload("res://scripts/boosters/ST-1.gd")
	var _ST2 = preload("res://scripts/boosters/ST-2.gd")
	var _ST3 = preload("res://scripts/boosters/ST-3.gd")
	var _ST4 = preload("res://scripts/boosters/ST-4.gd")
	var _ST5 = preload("res://scripts/boosters/ST-5.gd")
	var _ST6 = preload("res://scripts/boosters/ST-6.gd")
	var _ST7 = preload("res://scripts/boosters/ST-7.gd")
	var _ST8 = preload("res://scripts/boosters/ST-8.gd")
	var _BT1 = preload("res://scripts/boosters/BT-01.gd")
	var _BT2 = preload("res://scripts/boosters/BT-02.gd")
	var _BT3 = preload("res://scripts/boosters/BT-03.gd")
	var _BT4 = preload("res://scripts/boosters/BT-04.gd")
	var _BT5 = preload("res://scripts/boosters/BT-05.gd")
	var _BT6 = preload("res://scripts/boosters/BT-06.gd")
	var _EX1 = preload("res://scripts/boosters/EX-01.gd")
	var _BT7 = preload("res://scripts/boosters/BT-07.gd")
	var _P = preload("res://scripts/boosters/Promo.gd")
	var _Extra = preload("res://scripts/boosters/register_extras.gd")
	
	_ST1.register_cards()
	_ST2.register_cards()
	_ST3.register_cards()
	_ST4.register_cards()
	_ST5.register_cards()
	_ST6.register_cards()
	_ST7.register_cards()
	_ST8.register_cards()
	_BT1.register_cards()
	_BT2.register_cards()
	_BT3.register_cards()
	_BT4.register_cards()
	_BT5.register_cards()
	_BT6.register_cards()
	_EX1.register_cards()
	_BT7.register_cards()
	_P.register_cards()
	_Extra.register_boosters()
	
	_textures["cardback"] = load("res://card_images/cardback.png")
	mutex = Mutex.new()
	thread = Thread.new()
	thread.start(self, "_load_card_textures")


var keep_processing = true

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		keep_processing = false
		thread.wait_to_finish()


func _load_card_textures(_userdata) -> void:
	for id in get_card_list():
		if !keep_processing:
			return
		var t = load("res://card_images/" + id + ".png")
		if t:
			_textures[id] = t
		else:
			_textures[id] = _textures["cardback"]
			print("The card " + id + " is missing texture.")
		if _textures.size() % 100 == 0:
			call_deferred("emit_signal", "textures_loaded")
	call_deferred("emit_signal", "textures_loaded")


func get_card_texture(id : String) -> StreamTexture:
	var texture
	if (_textures.has(id)):
		texture = _textures[id]
	else:
		texture = _textures["cardback"]
	return texture


func add_card(card : Card) -> void:
	_cards[card.id] = card
	_booster_list.back().add_card(card.id)


func get_card_by_id(id : String) -> Card:
	var res = null
	if _cards.has(id):
		res = _cards[id] as Card
	return res


func get_card_list() -> Array:
	return _cards.keys()
