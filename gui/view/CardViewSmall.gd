# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control


const h_base_size = 410 / 2.5
const v_base_size = 40 / 2.5


func _ready():
	pass


func set_size_factor(factor : float) -> float:
	factor = max(2.1, factor)
	rect_min_size = Vector2(h_base_size * factor, v_base_size * factor)
	#rect_size = rect_min_size
	return factor


func set_card(_card : Card) -> void:
	if !_card:
		return
	$CostRect/Label.text = str(_card.play_cost)
	var lv_text : String
	if _card.type == Card.Type.TAMER:
		lv_text = "TAM"
	elif _card.type == Card.Type.OPTION:
		lv_text = "OPT"
	elif _card.type == Card.Type.OPTION:
		lv_text = "EGG"
	else:
		lv_text = "Lv" + str(_card.level)
	$LvRect/Label.text = lv_text
	$LvRect.color = _card.get_rgb_color()
	$IdRect/Label.text = _card.get_base_id()
	$NameRect/Label.text = _card.name
	$NameRect.color = _card.get_rgb_color()
	if _card.color == Card.ColorGroup.YELLOW || _card.color == Card.ColorGroup.WHITE:
		$LvRect/Label.add_color_override("font_color", Color(0,0,0,1))
		$NameRect/Label.add_color_override("font_color", Color(0,0,0,1))
	else:
		$LvRect/Label.add_color_override("font_color", Color(1,1,1,1))
		$NameRect/Label.add_color_override("font_color", Color(1,1,1,1))


func set_count(_count : int):
	pass
