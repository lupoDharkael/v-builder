# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Reference

class_name CardCollection


var data : Dictionary = {}
var name : String
var path : String

var lead_card : String

var delete_on_zero := false

var count_exceptions := {
	"BT6-085": 50,
	"EX2-046": 50,
}

func _ready():
	pass


static func is_valid_name(_name : String) -> bool:
	return _name.is_valid_filename()


static func get_name_error_msg() -> String:
	return "Names can't contain invalid characters such as\n : \/ \\ ? * \" | % < >"


func empty() -> bool:
	return data.empty()


func get_file_path() -> String:
	return path + "/" + name


func duplicate() -> CardCollection:
	var res := get_script().new() as CardCollection
	res.name = name
	res.path = path
	res.data = data.duplicate()
	return res


func no_alt_art_duplicate() -> CardCollection:
	var res := get_script().new() as CardCollection
	res.name = name
	res.path = path
	res.data = {}
	for k in data.keys():
		var c := CardDB.get_card_by_id(k)
		var base_id := c.get_base_id()
		if res.data.has(base_id):
			res.data[base_id] += data[k]
		else:
			res.data[base_id] = data[k]
	return res


func merge_collection(cc : CardCollection) -> void:
	for k in cc.data.keys():
		if data.has(k):
			data[k] += cc.data[k]
		else:
			data[k] = cc.data[k]


func get_except_from(cc : CardCollection) -> CardCollection:
	var res := get_script().new() as CardCollection
	for k in data.keys():
		var card_amount := 0
		if cc.data.has(k):
			card_amount = data[k] - cc.data[k]
		else:
			card_amount = data[k]
		if card_amount > 0:
			res.data[k] = card_amount
	return res


func get_intersection_from(cc : CardCollection) -> CardCollection:
	var res := get_script().new() as CardCollection
	for k in data.keys():
		var card_amount := 0
		if cc.data.has(k):
			card_amount =  int(min(data[k], cc.data[k]))
		if card_amount > 0:
			res.data[k] = card_amount
	return res


func add_card(card_id : String, amount : int = 1) -> void:
	if !data.has(card_id) && amount >= 0:
		data[card_id] = amount
	else:
		var c : int = data[card_id] + amount
		if c <= 0 && delete_on_zero:
			data.erase(card_id)
		else:
			data[card_id] = max(c, 0)


func get_lead_card() -> Card:
	var res : Card
	
	if lead_card.length():
		var c : Card = CardDB.get_card_by_id(lead_card)
		if c:
			return c
	
	for k in data.keys():
		var c : Card = CardDB.get_card_by_id(k)
		if !res:
			res = c
		elif res.level < c.level || res.level == c.level && res.power < c.power:
			res = c
	return res


func can_add_card(card : Card, amount : int) -> int:
	# Check deck limits
	var digitama_size = 0
	var deck_size = 0
	for id in data.keys():
		if CardDB.get_card_by_id(id).type == Card.Type.DIGITAMA:
			digitama_size += data[id]
		else:
			deck_size += data[id]
	
	if card.type == Card.Type.DIGITAMA:
		amount = int(min(amount, 5 - digitama_size))
	else:
		amount = int(min(amount, 50 - deck_size))
	# Check card number limits
	var base_id = card.get_base_id()
	var id_limit = 4
	if count_exceptions.has(base_id):
		id_limit = count_exceptions[base_id]
	if data.has(base_id):
		id_limit -= data[base_id]
	return int(min(amount, id_limit))


func has_card(card_id : String) -> bool:
	return data.has(card_id.to_upper())


func size() -> int:
	var total_cards := 0
	for k in data.keys():
		total_cards += data[k]
	return total_cards


func get_random_cards(card_amount : int) -> Array:
	var cards = []
	
	var total_cards := 0
	var arr = []
	for k in data.keys():
		var c = CardDB.get_card_by_id(k)
		
		if c.type != Card.Type.DIGITAMA:
			total_cards += data[k]
			for i in data[k]:
				arr.append(c)
	
	if total_cards < card_amount:
		return cards
	
	arr.shuffle()
	
	for i in card_amount:
		cards.append(arr[i])
	
	return cards

# SORT
static func compare_by_id(a : String, b : String):
	return CardDB.get_card_by_id(a).id < CardDB.get_card_by_id(b).id


static func compare_by_cost(a : String, b : String):
	var card_a := CardDB.get_card_by_id(a)
	var card_b := CardDB.get_card_by_id(b)
	
	if card_a.play_cost ==  card_b.play_cost:
		if card_a.play_cost == 0:
			return get_cost_sort_priority(card_a.type) < get_cost_sort_priority(card_b.type)
		else:
			return card_a.id < card_b.id
	else:
		return card_a.play_cost < card_b.play_cost


static func get_cost_sort_priority(type : String) -> int:
	if type == Card.Type.DIGITAMA:
		return 0
	else:
		return 1


static func get_level_sort_priority(type : String) -> int:
	match type:
		Card.Type.DIGITAMA:
			return 0
		Card.Type.DIGIMON:
			return 1
		Card.Type.TAMER:
			return 2
		Card.Type.OPTION:
			return 3
	return 9999


static func get_dp_sort_priority(type : String) -> int:
	match type:
		Card.Type.DIGITAMA:
			return 0
		Card.Type.TAMER:
			return 1
		Card.Type.OPTION:
			return 2
		Card.Type.DIGIMON:
			return 3
	return 9999


static func compare_by_level(a : String, b : String):
	var card_a := CardDB.get_card_by_id(a)
	var card_b := CardDB.get_card_by_id(b)
	
	if card_a.type != card_b.type:
		return get_level_sort_priority(card_a.type) < get_level_sort_priority(card_b.type)
	else:
		if card_a.level == card_b.level:
			return card_a.id < card_b.id
		else:
			return card_a.level < card_b.level


static func compare_by_dp(a : String, b : String):
	var card_a := CardDB.get_card_by_id(a)
	var card_b := CardDB.get_card_by_id(b)
	
	if card_a.power && card_b.power:
		return card_a.power < card_b.power
	elif card_a.type != card_b.type:
		return get_dp_sort_priority(card_a.type) < get_dp_sort_priority(card_b.type)
	else:
		return card_a.id < card_b.id


class SortType:
	const ID = "Id"
	const COST = "Cost"
	const DP = "DP"
	const LEVEL = "Level"

func get_sorted_ids_by(sort_type : String) -> Array:
	var res = data.keys()
	match sort_type:
		SortType.ID:
			res.sort_custom(self, "compare_by_id")
		SortType.COST:
			res.sort_custom(self, "compare_by_cost")
		SortType.DP:
			res.sort_custom(self, "compare_by_dp")
		SortType.LEVEL:
			res.sort_custom(self, "compare_by_level")
	
	return res


static func compare_deck_card(a : Card, b : Card) -> bool:
	return compare_by_level(a.id, b.id)

# STATS
func get_stats() -> CollectionStats:
	var stats := CollectionStats.new()
	for k in data.keys():
		var c : Card = CardDB.get_card_by_id(k)
		match c.type:
			Card.Type.DIGITAMA:
				stats.digitama_count += data[k]
				stats.lvl_2_count += data[k]
			Card.Type.OPTION:
				stats.option_count += data[k]
			Card.Type.TAMER:
				stats.tamer_count += data[k]
			Card.Type.DIGIMON:
				stats.digimon_count += data[k]
				
				match c.level:
					3:
						stats.lvl_3_count += data[k]
					4:
						stats.lvl_4_count += data[k]
					5:
						stats.lvl_5_count += data[k]
					6:
						stats.lvl_6_count += data[k]
					7:
						stats.lvl_7_count += data[k]
		
		match c.color:
			Card.ColorGroup.BLUE:
				stats.blue_count += data[k]
			Card.ColorGroup.RED:
				stats.red_count += data[k]
			Card.ColorGroup.YELLOW:
				stats.yellow_count += data[k]
			Card.ColorGroup.BLACK:
				stats.black_count += data[k]
			Card.ColorGroup.PURPLE:
				stats.purple_count += data[k]
			Card.ColorGroup.GREEN:
				stats.green_count += data[k]
			Card.ColorGroup.WHITE:
				stats.white_count += data[k]
	return stats
