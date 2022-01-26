# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

var collection : CardCollection setget set_collection, get_collection

var limiter : CardCollection
var config : int = 0
var size_factor : float = 1.5 setget set_size_factor, get_size_factor
var sort_type : String
var delete_on_zero := false
var editable := true setget set_editable, get_editable
# used to not re-update when not needed
var _is_dirty = false
var show_plus_one := false setget set_show_plus_one, get_show_plus_one

var _container : Node
var scroll_container : ScrollContainer

const card_view_item = preload("res://gui/view/CardViewItem.tscn")

var card_detail : Popup

var emit_content_changed_enabled = true


#signal card_clicked(_card)
signal count_change_requested(_card, _count)
signal size_factor_changed(size_factor)
# unconditional emit
signal content_changed()


func set_show_plus_one(enable : bool) -> void:
	show_plus_one = enable
	
	for n in _container.get_children():
		n.visible = !show_plus_one || (n.count > 0)


func get_show_plus_one() -> bool:
	return show_plus_one


func _ready():
	_container = $ScrollContainer/HFlowContainer
	scroll_container = $ScrollContainer
	collection = CardCollection.new()
	
	CardDB.connect("textures_loaded", self, "reload")
	
	card_detail = preload("res://gui/view/CardInfoWindow.tscn").instance()
	add_child(card_detail)


func _input(event):
	if get_viewport().gui_has_modal_stack():
		return
	if !get_global_rect().has_point(get_global_mouse_position()):
		return
	if event is InputEventMouseButton:
		if event.pressed && Input.is_key_pressed(KEY_CONTROL):
			match event.button_index:
				BUTTON_WHEEL_UP:
					set_size_factor(min(size_factor + 0.2, 100))
					get_tree().set_input_as_handled()
					emit_signal("size_factor_changed", size_factor)
				BUTTON_WHEEL_DOWN:
					set_size_factor(max(size_factor - 0.2, 1.0))
					get_tree().set_input_as_handled()
					emit_signal("size_factor_changed", size_factor)
	elif event is InputEventKey:
		var just_pressed = event.is_pressed() and not event.is_echo()
		if !just_pressed:
			return
		
		if Input.is_key_pressed(KEY_END):
			$Tween.interpolate_property(scroll_container, "scroll_vertical",
				scroll_container.scroll_vertical,
				scroll_container.get_v_scrollbar().max_value, 0.25,
				Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
			$Tween.start()
		elif Input.is_key_pressed(KEY_HOME):
			$Tween.interpolate_property(scroll_container, "scroll_vertical",
				scroll_container.scroll_vertical, 0, 0.25,
				Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
			$Tween.start()
		elif Input.is_key_pressed(KEY_PAGEDOWN):
			$Tween.interpolate_property(scroll_container, "scroll_vertical",
				scroll_container.scroll_vertical,
				scroll_container.scroll_vertical + scroll_container.rect_size.y, 0.2,
				Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
			$Tween.start()
		elif Input.is_key_pressed(KEY_PAGEUP):
			$Tween.interpolate_property(scroll_container, "scroll_vertical",
				scroll_container.scroll_vertical,
				scroll_container.scroll_vertical - scroll_container.rect_size.y, 0.2,
				Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
			$Tween.start()


func is_empty() -> bool:
	return _container.get_child_count() == 0


func get_card_count(enable_digitama : bool = true, enable_deck : bool = true) -> int:
	var i := 0
	for n in _container.get_children():
		if n.card.type == Card.Type.DIGITAMA && enable_digitama:
			i += n.count
		elif n.card.type != Card.Type.DIGITAMA && enable_deck:
			i += n.count
	return i


func get_stats() -> CollectionStats:
	if limiter:
		return limiter.get_stats()
	else:
		return get_collection().get_stats()


func set_editable(enable : bool) -> void:
	editable = enable
	for n in _container.get_children():
		n.editable = editable


func get_editable() -> bool:
	return editable


func set_delete_on_zero(enable : bool) -> void:
	delete_on_zero = enable


func set_sort_type(type : String) -> void:
	sort_type = type
	
	if sort_type.empty():
		return
	
	update_collection()
	if !collection:
		return
	var sorted_ids = collection.get_sorted_ids_by(sort_type)
	for i in len(sorted_ids):
		# TODO check for errors
		var node := _container.get_node_or_null(sorted_ids[i])
		_container.move_child(node, i)


func update_collection() -> void:
	if (!_is_dirty):
		return
	collection.data.clear()
	collection.lead_card = ""
	for n in _container.get_children():
		collection.data[n.card.id] = n.count
		if n.is_faved():
			collection.lead_card = n.card.id
	_is_dirty = false


func set_big_mode(enabled : bool) -> void:
	for n in _container.get_children():
		n.set_big_mode(enabled)
	
	if enabled:
		config |= CardViewItem.Config.BIG_MODE
	else:
		config &= ~CardViewItem.Config.BIG_MODE


func set_size_factor(factor : float) -> void:
	size_factor = factor
	for n in _container.get_children():
		n.set_anim_size_factor(factor)


func get_size_factor() -> float:
	return size_factor


func set_config(c : int) -> void:
	config = c
	for n in _container.get_children():
		n.set_config(config)


func clear_cards() -> void:
	if collection:
		collection.data.clear()
	if limiter:
		limiter.data.clear()
	
	# Clear children
	for n in _container.get_children():
		_container.remove_child(n)
		n.queue_free()

func set_collection(cc : CardCollection) -> void:
	if !cc:
		return
	
	collection = cc
	if limiter:
		limiter.data.clear()
	
	# Clear children
	for n in _container.get_children():
		_container.remove_child(n)
		n.queue_free()
	
	# Add the cards
	var show_fav := bool(config & CardViewItem.Config.SHOW_FAV_BUTTON)
	for k in collection.data.keys():
		add_card(CardDB.get_card_by_id(k), collection.data[k], show_fav && k == cc.lead_card)
	
	# Sort
	set_sort_type(sort_type)
	
	set_show_plus_one(show_plus_one)


func get_collection() -> CardCollection:
	update_collection()
	return collection


func reload() -> void:
	for child in _container.get_children():
		child.reload_texture()


func add_card(card : Card, amount : int, faved : bool = false) -> Node:
	if _container.get_node_or_null(card.id):
		return null
	var view_item = card_view_item.instance()
	view_item.set_delete_on_zero(delete_on_zero)
	_container.add_child(view_item)
	view_item.name = card.id # We can get_node by the card id
	view_item.connect("content_changed", self, "_on_content_changed")
	view_item.connect("fav_pressed", self, "_on_card_faved")
	view_item.set_card(card, amount, size_factor, config, limiter)
	view_item.set_faved(faved)
	# connect
	view_item.connect("count_change_requested", self, "_on_count_change_requested")
	view_item.connect("card_clicked", self, "_on_card_clicked")
	view_item.editable = editable
	return view_item


func _on_card_clicked(cv : Control, e : InputEventMouse) -> void:
	#if get_viewport().gui_has_modal_stack():
		#return
	
	if e.button_index == BUTTON_MIDDLE and e.pressed:
		card_detail.set_card_view_item(cv)
		card_detail.popup_centered(get_viewport().size * 0.85)


# Bind with other CollectionView to receive the input from this one
func bind_pasive_view(view : Node) -> void:
	view.limiter = CardCollection.new()
	connect("count_change_requested", view, "increase_card_count")

# Slots
func _on_card_faved(_card : Card, _enabled : bool) -> void:
	if _enabled:
		for n in _container.get_children():
			if n.card != _card:
				n.set_faved(false)
	emit_signal("content_changed")
	_is_dirty = true


func increase_card_count(card : Card, _count : int):
	if !card || !editable:
		return
	var n = _container.get_node_or_null(card.id)
	if (n):
		n.increase_count(_count)
	else:
		if _count < 1 || limiter.can_add_card(card, _count) == 0:
			return
		var new_node = add_card(card, _count)
		if !new_node:
			return
		# Sort new node
		if !sort_type.empty():
			var last_index := 0
			for child in _container.get_children():
				if CardCollection.compare_deck_card(new_node.card, child.card):
					_container.move_child(new_node, last_index)
					break
				last_index += 1


func _on_count_change_requested(_card : Card, _count : int) -> void:
	emit_signal("count_change_requested", _card, _count)


func _on_content_changed() -> void:
	if !emit_content_changed_enabled:
		return
	# TODO handle individual changes
	# Update visibility
	set_show_plus_one(show_plus_one)
	
	emit_signal("content_changed")
	_is_dirty = true

