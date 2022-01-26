extends Control

func _ready():
	pass


func set_card(card : Card) -> void:
	$Label.text = card.name.to_upper()
	#$GridContainer/NameLineEdit.text = card.name
	$GridContainer/CardTypeLineEdit.text = card.type
	$GridContainer/ColorLineEdit.text = card.color
	$GridContainer/RarityLineEdit.text = card.rarity
	$GridContainer/IdLineEdit.text = card.get_base_id()
	$GridContainer/PlayCostEdit.text = str(card.play_cost)
	
	# Make digimon specific data visible or invisible
	var first_digi_data = $GridContainer/PowerLabel
	var index = first_digi_data.get_index()
	var p = first_digi_data.get_parent()
	var is_digimon = (card.type == Card.Type.DIGIMON)
	while index < p.get_child_count():
		p.get_child(index).visible = is_digimon
		index += 1
	
	if is_digimon:
		$GridContainer/PowerLineEdit.text = str(card.power)
		$GridContainer/LevelLineEdit.text = str(card.level)
		$GridContainer/StageLineEdit.text = card.stage_level
		$GridContainer/TypeLineEdit.text = card.digimon_type
		$GridContainer/AttributeLineEdit.text = card.attribute
		if card.digivolve_color.empty():
			$GridContainer/EvolveContainer.visible = false
			$GridContainer/EvolveLabel.visible = false
		else:
			$GridContainer/EvolveContainer.visible = true
			$GridContainer/EvolveLabel.visible = true
			$GridContainer/EvolveContainer/ColorRect/ColorRect.color = Card.get_rgb_from_color(card.digivolve_color)
			$GridContainer/EvolveContainer/LvLineEdit.text = "Lv" + str(card.digivolve_level)
			$GridContainer/EvolveContainer/CostLineEdit.text = "Cost " + str(card.digivolve_cost)
	
		if card.digivolve_color_2.empty():
			$GridContainer/EvolveContainer2.visible = false
			$GridContainer/EvolveLabel2.visible = false
		else:
			$GridContainer/EvolveContainer2.visible = true
			$GridContainer/EvolveLabel2.visible = true
			$GridContainer/EvolveContainer2/ColorRect/ColorRect.color = Card.get_rgb_from_color(card.digivolve_color_2)
			$GridContainer/EvolveContainer2/LvLineEdit.text = "Lv" + str(card.digivolve_level_2)
			$GridContainer/EvolveContainer2/CostLineEdit.text = "Cost " + str(card.digivolve_cost_2)
	
	set_text_edit_content($Effect, card.effect_text)
	set_text_edit_content($InEffect, card.inherited_effect_text)
	set_text_edit_content($SecEffect, card.sec_effect_text)


func set_text_edit_content(text_edit : TextEdit, text : String) -> void:
	text_edit.visible = !text.empty()
	text_edit.get_parent().get_child(text_edit.get_index() - 1).visible = !text.empty()
	text_edit.text = text
	var size := text_edit.get_font("font").get_wordwrap_string_size(text, self.rect_size.x - 25)
	size.y *= 2
	text_edit.rect_min_size = size
