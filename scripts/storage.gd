# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Reference

class_name Storage


const storage_dir = "storage"
const decks_dir = "decks"
const collection_dir = "collection"
const settings_file = "settings.cfg"


static func create_collection(name : String, path : String) -> CardCollection:
	var c := CardCollection.new()
	c.name = name
	c.path = path
	var file = File.new()
	file.open(c.get_file_path(), File.WRITE)
	file.close()
	return c


static func remove_collection(collection : CardCollection) -> void:
	var dir = Directory.new()
	dir.remove(collection.get_file_path())


static func copy_collection(collection : CardCollection) -> CardCollection:
	var res = collection.duplicate()
	res.name = get_next_valid_name(res.name, res.path)
	
	var dir := Directory.new()
	dir.copy(collection.get_file_path(), res.get_file_path())

	return res


static func rename_collection(collection : CardCollection, name : String) -> bool:
	if collection.name == name:
		return false
	var dir = Directory.new()
	var from := collection.get_file_path()
	if dir.file_exists(collection.path.plus_file(name)):
		return false
	return dir.rename(from, collection.path.plus_file(name)) == OK


static func save_collection(collection : CardCollection) -> void:
	var file = File.new()
	file.open(collection.get_file_path(), File.WRITE)
	var parser := CollectionParser.new()
	var content := parser.export_collection_to_text(collection)
	file.store_string(content)
	file.close()


static func _list_files_in_directory(path : String) -> Array:
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files


static func get_collections_from_path(path : String) -> Array:
	var res := []
	var filenames := _list_files_in_directory(path)
	for name in filenames:
		var c := load_collection(name, path)
		if c:
			res.append(c)
	return res


static func load_collection(collection : String, path : String) -> CardCollection:
	var file = File.new()
	var file_path := path.plus_file(collection)
	
	if !file.file_exists(file_path):
		return null

	file.open(file_path, File.READ)

	var parser := CollectionParser.new()
	var c := parser.import_collection(file.get_as_text())
	c.path = path
	c.name = collection

	file.close()
	return c


static func get_storage_dir() -> String:
	var base_dir : String
	if OS.has_feature("standalone"):
		base_dir = OS.get_user_data_dir() + "/"
	else:
		base_dir = ProjectSettings.globalize_path("res://")
	# TODO portable version
	#base_dir = OS.get_executable_path().get_base_dir()
	create_storage_dirs(base_dir)
	return base_dir


static func get_deck_storage_dir() -> String:
	return get_storage_dir() + storage_dir.plus_file(decks_dir)


static func get_settings_file_path() -> String:
	return get_storage_dir().plus_file(settings_file)


static func get_collection_storage_dir() -> String:
	return get_storage_dir().plus_file(storage_dir).plus_file(collection_dir)


static func create_storage_dirs(base_dir : String) -> void:
	var d := Directory.new()
	d.open(base_dir)
	d.make_dir_recursive(storage_dir.plus_file(decks_dir))
	d.make_dir_recursive(storage_dir.plus_file(collection_dir))


static func is_collection_in_disk(c : CardCollection) -> bool:
	return !is_name_available(c.name, c.path)


static func is_name_available(name : String, path : String) -> bool:
	var directory = Directory.new();
	return !directory.file_exists(path.plus_file(name))


static func get_next_valid_name(name : String, path : String) -> String:
	var directory = Directory.new();
	if !directory.file_exists(path.plus_file(name)):
		return name
	# Get num
	var nums : String
	var prefix : String
	for i in range(name.length() - 1, -1, -1):
		var n : String = name[i]
		if (n >= '0' && n <= '9'):
			nums = name[i] + nums;
		else:
			prefix = name.substr(0, i + 1)
			break
	
	if nums.length() == 0:
		prefix += " "
		nums = "1"
	# Increase num
	while directory.file_exists(path.plus_file(prefix + nums)):
		nums = increase_numeric_string(nums)
	return prefix + nums


static func increase_numeric_string(s :String) -> String:
	var res : String = s
	var carry : bool = res.length() > 0

	for i in range(res.length() - 1, -1, -1):
		if !carry:
			break
		
		if s[i] == '9': #keep carry as true: 9 + 1
			res[i] = '0'
		else:
			res[i] = str(s[i].to_int() + 1)
			carry = false
	
	if carry:
		res = "1" + res
	
	return res
