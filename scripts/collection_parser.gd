# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Reference

class_name CollectionParser

var text_collection_matcher : RegEx

class ExportType:
	const TEXT = "TEXT"
	const TTS = "TTS"
	const CHRONOBATTLE = "CHRONOBATTLE"
	const UNTAP = "UNTAP.IN"



func _init() -> void:
	text_collection_matcher = RegEx.new()
	var err := text_collection_matcher.compile("([0-9]+)\\s+.+\\s+(\\w+-[0-9]+( \\(\\w\\))?)( // Lead)?")
	if err:
		printerr("Bad regex :(")


func import_collection(text : String) -> CardCollection:
	text = text.strip_edges()
	var c : CardCollection 
	if text.begins_with("["):
		c = _import_tts(text)
	else:
		c = _import_standard(text)
		
	return c


func _import_tts(text : String) -> CardCollection:
	var c := CardCollection.new()
	text = text.replace(" ","")
	var l = text.substr(1, text.length() -2).split(",")
	# remove "imported from"
	l.remove(0)
	for e in l:
		var _id = e.replace("\"","").replace("“", "").replace("″", "").replace("”", "") 
		var has_card = CardDB.get_card_by_id(_id)
		if has_card:
			if _id in c.data:
				c.data[_id] = c.data[_id] + 1
			else:
				c.data[_id] = 1
	return c


func _import_standard(text : String) -> CardCollection:
	var c := CardCollection.new()
	for matched in text_collection_matcher.search_all(text):
		var _id = matched.get_string(2)
		var has_card = CardDB.get_card_by_id(_id)
		if has_card:
			c.data[_id] = matched.get_string(1).to_int()
			if matched.get_string(4).length():
				c.lead_card = _id
		else:
			# TODO alert
			pass
	return c


func export_collection(c : CardCollection, format : String) -> String:
	var res := ""
	match format:
		ExportType.TEXT:
			res = export_collection_to_text(c)
		ExportType.TTS:
			res = export_collection_to_tts(c)
		ExportType.CHRONOBATTLE:
			res = export_collection_to_chronobattle(c)
		ExportType.UNTAP:
			res = export_collection_to_untap(c)
	return res


func export_collection_to_text(c : CardCollection, enable_alt_art : bool = false) -> String:
	var res := ""
	if not enable_alt_art:
		c = c.no_alt_art_duplicate()
	for id in c.data.keys():
		var card : Card = CardDB.get_card_by_id(id)
		if card:
			res += String(c.data[id]) + " " + card.name + " " + id
			if id == c.lead_card:
				res += " // Lead\n"
			else:
				res += "\n"
	return res


func export_collection_to_tts(c : CardCollection) -> String:
	c = c.no_alt_art_duplicate()
	var project_name := ProjectSettings.get_setting("application/config/name") as String
	var res := "[\"Exported from " + project_name + "\""
	for id in c.data.keys():
		for i in c.data[id]:
			res += ",\"" + id + "\""
	res += "]"
	return res


func export_collection_to_chronobattle(c : CardCollection) -> String:
	return export_collection_to_text(c)


func export_collection_to_untap(c : CardCollection) -> String:
	c = c.no_alt_art_duplicate()
	var res := ""
	for id in c.data.keys():
		var card : Card = CardDB.get_card_by_id(id)
		if card:
			res += String(c.data[id]) + " " + card.name + " (DCG) (" + id + ")\n"
	return res
