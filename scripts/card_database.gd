# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Node

var _cards : Dictionary
var _textures : Dictionary
var _booster_list : Array

class BoosterData:
	var name : String
	var short_name : String
	var prefix : String


var thread : Thread
var mutex : Mutex

signal textures_loaded


func _ready():
	var _ST1 = preload("res://scripts/boosters/ST1.gd")
	var _ST2 = preload("res://scripts/boosters/ST2.gd")
	var _ST3 = preload("res://scripts/boosters/ST3.gd")
	var _ST4 = preload("res://scripts/boosters/ST4.gd")
	var _ST5 = preload("res://scripts/boosters/ST5.gd")
	var _ST6 = preload("res://scripts/boosters/ST6.gd")
	var _BT1 = preload("res://scripts/boosters/BT1.gd")
	var _BT2 = preload("res://scripts/boosters/BT2.gd")
	var _BT3 = preload("res://scripts/boosters/BT3.gd")
	var _BT4 = preload("res://scripts/boosters/BT4.gd")
	var _BT5 = preload("res://scripts/boosters/BT5.gd")
	var _P = preload("res://scripts/boosters/P.gd")
	
	_ST1.register_cards()
	_ST2.register_cards()
	_ST3.register_cards()
	_ST4.register_cards()
	_ST5.register_cards()
	_ST6.register_cards()
	_BT1.register_cards()
	_BT2.register_cards()
	_BT3.register_cards()
	_BT4.register_cards()
	_BT5.register_cards()
	_P.register_cards()
	
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
		_textures[id] = load("res://card_images/" + id + ".png")
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

# TODO short_name : String
func register_booster(prefix : String, name : String) -> void:
	var booster := BoosterData.new()
	booster.name = name
	#booster.short_name = short_name
	booster.prefix = prefix
	_booster_list.append(booster)


func card_is_from_booster_id(card : Card, booster : int) -> bool:
	if booster <= _booster_list.size() && card.id.begins_with(_booster_list[booster].prefix):
		return true
	return false


func card_is_from_booster(card : Card, booster : String) -> bool:
	for i in _booster_list:
		if i.name == booster && card.id.begins_with(i.prefix):
			return true
	return false


func get_booster_list() -> Array:
	return _booster_list


func get_card_by_id(id : String) -> Card:
	var res = null
	if _cards.has(id):
		res = _cards[id] as Card
	return res


func get_card_list() -> Array:
	return _cards.keys()
