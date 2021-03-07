# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Reference

class_name Card

class ColorGroup:
	const RED = "Red"
	const BLUE = "Blue"
	const YELLOW = "Yellow"
	const GREEN = "Green"
	const BLACK = "Black"
	const PURPLE = "Purple"
	const WHITE = "White"

class Rarity:
	const C = "Common"
	const U = "Uncommon"
	const R = "Rare"
	const SR = "Super Rare"
	const P = "Promo"
	const SEC = "Secret"

class Type:
	const DIGIMON = "Digimon"
	const DIGITAMA = "Digitama"
	const TAMER = "Tamer"
	const OPTION = "Option"

class Attribute:
	const VIRUS = "Virus"
	const DATA = "Data"
	const VACCINE = "Vaccine"
	const UNKNOWN = "Unknown"
	const FREE = "Free"

class Stage:
	const IN_TRAINING = "In-Training"
	const ROOKIE = "Rookie"
	const CHAMPION = "Champion"
	const ULTIMATE = "Ultimate"
	const MEGA = "Mega"
	const HYBRID = "Hybrid"


var name : String
var type : String
var color : String
var play_cost : int
var rarity : String
var id : String
var is_parallel : bool = false
var inherited_effect_text : String
var effect_text : String
var sec_effect_text : String
var notes : String

# Digimon specific
var digivolve_color : String
var digivolve_color_2 : String
var digivolve_cost : int
var digivolve_cost_2 : int
var digivolve_level : int
var digivolve_level_2 : int
var level : int
var power : int
var digimon_type : String
var attribute : String
var stage_level : String


func is_foil() -> bool:
	return is_parallel || rarity == Rarity.SEC || rarity == Rarity.SR || rarity == Rarity.P


func get_base_id() -> String:
	return id.substr(0, id.length() - 4) if id.ends_with(")") else id


static func get_rgb_from_color(c : String) -> Color:
	var res : Color
	match c:
		ColorGroup.BLACK:
			res = Color(0.25, 0.25, 0.25)
		ColorGroup.YELLOW:
			res = Color(0.96, 0.88, 0.1)
		ColorGroup.RED:
			res = Color(0.90, 0.01, 0.18)
		ColorGroup.BLUE:
			res = Color(0.16, 0.58, 0.82)
		ColorGroup.GREEN:
			res = Color(0.07, 0.59, 0.36)
		ColorGroup.PURPLE:
			res = Color(0.39, 0.33, 0.63)
		ColorGroup.WHITE:
			res = Color(1.0, 1.0, 1.0)
	return res

func get_rgb_color() -> Color:
	return get_rgb_from_color(color)
