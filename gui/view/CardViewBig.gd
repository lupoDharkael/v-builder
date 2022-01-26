# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends TextureRect

const h_base_size = 63
const v_base_size = 88

const gray_mat := preload("res://materials/gray_shadermaterial.tres")
const foil_mat := preload("res://materials/foil_shadermaterial.tres")

var is_foil : bool

func _ready():
	pass

func set_size_factor(factor : float) -> void:
	rect_min_size = Vector2(h_base_size * factor, v_base_size * factor)
	#rect_size = rect_min_size

func set_card(_card : Card) -> void:
	if _card:
		texture = CardDB.get_card_texture(_card.id)
		is_foil = _card.is_foil()
	else:
		texture = CardDB.get_card_texture("")
		is_foil = false

func set_count(count : int):
	if count == 0:
		material = gray_mat
	elif is_foil:
		material = foil_mat
	else:
		material = null
