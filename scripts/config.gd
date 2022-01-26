# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Node

var config_file : ConfigFile
var timer : Timer

func _ready():
	config_file = ConfigFile.new()
	config_file.load(Storage.get_settings_file_path())
	timer = Timer.new()
	timer.one_shot = true
	add_child(timer)
	timer.connect("timeout", self, "save")
	

func get_value(section, key, default = null):
	return config_file.get_value(section, key, default)

func set_value(section, key, value):
	config_file.set_value(section, key, value)
	timer.start(1.0)

func save() -> void:
	config_file.save(Storage.get_settings_file_path())
