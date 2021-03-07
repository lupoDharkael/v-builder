# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Reference


class_name CollectionStats


# color distirbution
var green_count := 0
var red_count := 0
var blue_count := 0
var yellow_count := 0
var purple_count := 0
var black_count := 0
var white_count := 0

# level distribution
var lvl_2_count := 0
var lvl_3_count := 0
var lvl_4_count := 0
var lvl_5_count := 0
var lvl_6_count := 0
var lvl_7_count := 0

# card type distribution
var digitama_count := 0
var digimon_count := 0
var option_count := 0
var tamer_count := 0


func get_card_count() -> int:
	return digimon_count + digitama_count + tamer_count + option_count


func get_deck_count() -> int:
	return digimon_count + tamer_count + option_count


func get_main_lvl_amount() -> int:
	return int(max(lvl_2_count, max(lvl_3_count, max(lvl_4_count, max(lvl_5_count, max(lvl_6_count, lvl_7_count))))))


func get_main_type_amount() -> int:
	return int(max(digitama_count, max(digimon_count, max(option_count, tamer_count))))
