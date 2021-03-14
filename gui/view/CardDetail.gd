extends CanvasLayer

var container : Control
var background : Control

var timer : Timer

const _margin = Vector2(5, 5)
const panel_offset = Vector2(40, 40)

func _ready():
	container = $VBoxContainer
	background = $ForegroundPanel
	timer = $Timer
	timer.one_shot = true
	timer.connect("timeout", self, "_on_timeout")
	hide()


func show() -> void:
	timer.stop()
	if !container.visible:
		timer.start(1.5)


func hide() -> void:
	timer.stop()
	if container.visible:
		container.hide()
		background.hide()


func _on_timeout() -> void:
	if container.visible:
		container.hide()
		background.hide()
	else:
		update_position()
		container.show()
		background.show()


func bind_card_view(n : Control) -> void:
	n.connect("mouse_entered", self, "_show_requested", [n.card])
	n.connect("mouse_exited", self, "hide")


func _show_requested(card : Card) -> void:
	set_card(card)
	show()


func set_card(card : Card) -> void:
	$VBoxContainer/Label.text = card.name
	#$VBoxContainer/GridContainer/NameLineEdit.text = card.name
	$VBoxContainer/GridContainer/CardTypeLineEdit.text = card.type
	$VBoxContainer/GridContainer/ColorLineEdit.text = card.color
	$VBoxContainer/GridContainer/RarityLineEdit.text = card.rarity
	$VBoxContainer/GridContainer/IdLineEdit.text = card.get_base_id()
	$VBoxContainer/GridContainer/PlayCostEdit.text = str(card.play_cost)
	
	# Make digimon specific data visible or invisible
	var first_digi_data = $VBoxContainer/GridContainer/PlayCostLabel
	var index = first_digi_data.get_index()
	var p = first_digi_data.get_parent()
	var is_digimon = (card.type == Card.Type.DIGIMON)
	while index < p.get_child_count():
		p.get_child(index).visible = is_digimon
		index += 1
	
	if is_digimon:
		$VBoxContainer/GridContainer/PlayCostEdit.text = str(card.play_cost)
		$VBoxContainer/GridContainer/PowerLineEdit.text = str(card.power)
		$VBoxContainer/GridContainer/LevelLineEdit.text = str(card.level)
		$VBoxContainer/GridContainer/StageLineEdit.text = card.stage_level
		$VBoxContainer/GridContainer/TypeLineEdit.text = card.digimon_type
		$VBoxContainer/GridContainer/AttributeLineEdit.text = card.attribute
		if card.digivolve_color.empty():
			$VBoxContainer/GridContainer/EvolveContainer.visible = false
			$VBoxContainer/GridContainer/EvolveLabel.visible = false
		else:
			$VBoxContainer/GridContainer/EvolveContainer.visible = true
			$VBoxContainer/GridContainer/EvolveLabel.visible = true
			$VBoxContainer/GridContainer/EvolveContainer/ColorRect/ColorRect.color = Card.get_rgb_from_color(card.digivolve_color)
			$VBoxContainer/GridContainer/EvolveContainer/LvLineEdit.text = "Lv" + str(card.digivolve_level)
			$VBoxContainer/GridContainer/EvolveContainer/CostLineEdit.text = "Cost " + str(card.digivolve_cost)
	
		if card.digivolve_color_2.empty():
			$VBoxContainer/GridContainer/EvolveContainer2.visible = false
			$VBoxContainer/GridContainer/EvolveLabel2.visible = false
		else:
			$VBoxContainer/GridContainer/EvolveContainer2.visible = true
			$VBoxContainer/GridContainer/EvolveLabel2.visible = true
			$VBoxContainer/GridContainer/EvolveContainer2/ColorRect/ColorRect.color = Card.get_rgb_from_color(card.digivolve_color_2)
			$VBoxContainer/GridContainer/EvolveContainer2/LvLineEdit.text = "Lv" + str(card.digivolve_level_2)
			$VBoxContainer/GridContainer/EvolveContainer2/CostLineEdit.text = "Cost " + str(card.digivolve_cost_2)
	
	set_text_edit_content($VBoxContainer/Effect, card.effect_text)
	set_text_edit_content($VBoxContainer/InEffect, card.inherited_effect_text)
	set_text_edit_content($VBoxContainer/SecEffect, card.sec_effect_text)
	
	update_size()


func update_size():
	background.rect_size = container.get_combined_minimum_size() + _margin * 2


func update_position():
	var mouse_is_right_side = container.get_global_mouse_position().x >= get_viewport().size.x / 2
	var r = Rect2(panel_offset, get_viewport().size - panel_offset * 2 - background.rect_size)
	
	var pos := container.get_global_mouse_position()
	if mouse_is_right_side:
		pos -= panel_offset
		pos.x -= background.rect_size.x
	else:
		pos += panel_offset
	
	pos.x = clamp(pos.x, r.position.x, r.position.x + r.size.x)
	pos.y = clamp(pos.y, r.position.y, r.position.y + r.size.y)
	container.rect_global_position = pos
	background.rect_global_position = pos - _margin

func set_text_edit_content(text_edit : TextEdit, text : String) -> void:
	text_edit.visible = !text.empty()
	text_edit.get_parent().get_child(text_edit.get_index() - 1).visible = !text.empty()
	text_edit.text = text
	var size := text_edit.get_font("font").get_wordwrap_string_size(text, container.rect_size.x - 20)
	size.y *= 2
	text_edit.rect_min_size = size
