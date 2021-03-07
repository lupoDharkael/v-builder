# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control


func _ready():
	pass


func set_stats(stats : CollectionStats) -> void:
	# TYPE
	$HBoxContainer/Type/Tama/TextureProgress/Amount.text = str(stats.digitama_count)
	$HBoxContainer/Type/Digimon/TextureProgress/Amount.text = str(stats.digimon_count)
	$HBoxContainer/Type/Tamer/TextureProgress/Amount.text = str(stats.tamer_count)
	$HBoxContainer/Type/Option/TextureProgress/Amount.text = str(stats.option_count)
	
	var max_type := max(stats.get_main_type_amount(), 1.0)
	$HBoxContainer/Type/Tama/TextureProgress.value = max(stats.digitama_count / max_type, 0.05)
	$HBoxContainer/Type/Digimon/TextureProgress.value = max(stats.digimon_count / max_type, 0.05)
	$HBoxContainer/Type/Tamer/TextureProgress.value = max(stats.tamer_count / max_type, 0.05)
	$HBoxContainer/Type/Option/TextureProgress.value = max(stats.option_count / max_type, 0.05)
	
	# LEVELS
	$HBoxContainer/Levels/Lv2/TextureProgress/Amount.text = str(stats.lvl_2_count)
	$HBoxContainer/Levels/Lv3/TextureProgress/Amount.text = str(stats.lvl_3_count)
	$HBoxContainer/Levels/Lv4/TextureProgress/Amount.text = str(stats.lvl_4_count)
	$HBoxContainer/Levels/Lv5/TextureProgress/Amount.text = str(stats.lvl_5_count)
	$HBoxContainer/Levels/Lv6/TextureProgress/Amount.text = str(stats.lvl_6_count)
	$HBoxContainer/Levels/Lv7/TextureProgress/Amount.text = str(stats.lvl_7_count)
	
	var max_lvl := max(stats.get_main_lvl_amount(), 1.0)
	$HBoxContainer/Levels/Lv2/TextureProgress.value = max(stats.lvl_2_count / max_lvl, 0.05)
	$HBoxContainer/Levels/Lv3/TextureProgress.value = max(stats.lvl_3_count / max_lvl, 0.05)
	$HBoxContainer/Levels/Lv4/TextureProgress.value = max(stats.lvl_4_count / max_lvl, 0.05)
	$HBoxContainer/Levels/Lv5/TextureProgress.value = max(stats.lvl_5_count / max_lvl, 0.05)
	$HBoxContainer/Levels/Lv6/TextureProgress.value = max(stats.lvl_6_count / max_lvl, 0.05)
	$HBoxContainer/Levels/Lv7/TextureProgress.value = max(stats.lvl_7_count / max_lvl, 0.05)
	
	# COLOR
	var total_cards := float(stats.get_card_count())
	$HBoxContainer/MarginColors/Colors.visible = total_cards != 0
	total_cards = max(total_cards, 1.0)
	$HBoxContainer/MarginColors/Colors/Red.size_flags_stretch_ratio = stats.red_count / total_cards
	$HBoxContainer/MarginColors/Colors/Blue.size_flags_stretch_ratio = stats.blue_count / total_cards
	$HBoxContainer/MarginColors/Colors/Yellow.size_flags_stretch_ratio = stats.yellow_count / total_cards
	$HBoxContainer/MarginColors/Colors/Green.size_flags_stretch_ratio = stats.green_count / total_cards
	$HBoxContainer/MarginColors/Colors/Black.size_flags_stretch_ratio = stats.black_count / total_cards
	$HBoxContainer/MarginColors/Colors/Purple.size_flags_stretch_ratio = stats.purple_count / total_cards
	$HBoxContainer/MarginColors/Colors/White.size_flags_stretch_ratio = stats.white_count / total_cards
