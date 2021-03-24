# MIT License
# Copyright (c) 2020 Lupo Dharkael

extends Control

class_name CardViewItem


const small_view = preload("res://gui/view/CardViewSmall.tscn")
const big_view = preload("res://gui/view/CardViewBig.tscn")

const hover_factor := 0.15

var fav_button : TextureButton
var count_label : Label


var card : Card
var count := 0
var limit_register : CardCollection
var delete_on_zero := false
var editable := false
var card_view : Node
var card_holder : Node
# Animate only the resize of the inner card element
var _hover_size_factor : float setget set_hover_size_factor, get_hover_size_factor
# Resize the whole node
var size_factor := 1.5 setget set_size_factor, get_size_factor
# Animated resize
var anim_size_factor : float setget set_anim_size_factor, get_anim_size_factor


enum Config {
	SMALL_MODE = 0,
	BIG_MODE = 1,
	SHOW_CARD_COUNT = 2,
	SHOW_FAV_BUTTON = 4,
}


signal fav_pressed(_card, _enabled)
signal card_clicked(_card_view_item, button_index)
signal count_change_requested(_card, count)
signal content_changed()


func _ready():
	card_holder = $CenterContainer
	fav_button = $FavButton
	count_label = $FavButton/CountLabel
	$FavButton.connect("toggled", self, "fav_toggled")
	connect("mouse_entered", self, "on_mouse_entered")
	connect("mouse_exited", self, "on_mouse_exited")
	$Tween.connect("tween_completed", self, "_on_tween_completed")


func _on_tween_completed(_object : Object, key : NodePath) -> void:
	if key == ":size_factor":
		mouse_filter = MOUSE_FILTER_PASS
		set_size_factor(anim_size_factor)


func on_mouse_exited():
	$Tween.interpolate_property(self, "_hover_size_factor",
		_hover_size_factor, size_factor, 0.2,
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.start()

func on_mouse_entered():
	$Tween.interpolate_property(self, "_hover_size_factor",
		size_factor, size_factor + hover_factor, 0.2,
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.start()


func fav_toggled(toggled) -> void:
	emit_signal("fav_pressed", card, toggled)


func _input(event):
	if get_viewport().gui_has_modal_stack():
		return
	if !get_global_rect().has_point(get_global_mouse_position()):
		return
	if event is InputEventKey:
		var just_pressed = event.is_pressed() and not event.is_echo()
		if !just_pressed:
			return
		
		if Global.text_editor_has_focus():
			return
		
		var _count := 0
		if event.scancode == KEY_1 || event.scancode == KEY_KP_1:
			_count = -1 if event.shift else 1
		elif event.scancode == KEY_2 || event.scancode == KEY_KP_2:
			_count = -2 if event.shift else 2
		elif event.scancode == KEY_3 || event.scancode == KEY_KP_3:
			_count = -3 if event.shift else 3
		elif event.scancode == KEY_4 || event.scancode == KEY_KP_4:
			_count = -4 if event.shift else 4
		elif event.scancode == KEY_5 || event.scancode == KEY_KP_5:
			_count = -5 if event.shift else 5
		elif event.scancode == KEY_6 || event.scancode == KEY_KP_6:
			_count = -6 if event.shift else 6
		elif event.scancode == KEY_7 || event.scancode == KEY_KP_7:
			_count = -7 if event.shift else 7
		elif event.scancode == KEY_8 || event.scancode == KEY_KP_8:
			_count = -8 if event.shift else 8
		elif event.scancode == KEY_9 || event.scancode == KEY_KP_9:
			_count = -9 if event.shift else 9
		
		if _count == 0:
			return
		
		if editable:
			increase_count(_count)
		emit_signal("count_change_requested", card, _count)


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if editable:
				increase_count(1)
			emit_signal("count_change_requested", card, 1)

		elif event.button_index == BUTTON_RIGHT and event.pressed:
			if editable:
				increase_count(-1)
			emit_signal("count_change_requested", card, -1)

		emit_signal("card_clicked", self, event)

func set_delete_on_zero(enable : bool) -> void:
	delete_on_zero = enable


func set_faved(faved : bool) -> void:
	fav_button.pressed = faved


func is_faved() -> bool:
	return fav_button.pressed


func set_hover_size_factor(factor : float) -> void:
	_hover_size_factor = factor
	if card_view:
		card_view.set_size_factor(_hover_size_factor)


func get_hover_size_factor() -> float:
	return _hover_size_factor


func set_size_factor(factor : float) -> void:
	if card_view:
		card_view.set_size_factor(factor)
	
	size_factor = factor
	card_holder.rect_min_size = Vector2(card_view.h_base_size * (size_factor + hover_factor), card_view.v_base_size * (size_factor + hover_factor))
	#card_holder.rect_size = card_holder.rect_size
	rect_min_size = Vector2()
	#rect_size = rect_min_size
	set_deferred("rect_size", rect_min_size)


func get_size_factor() -> float:
	return size_factor


func set_anim_size_factor(factor : float) -> void:
	anim_size_factor = factor
	mouse_filter = MOUSE_FILTER_IGNORE
	var tween = $Tween
	tween.remove_all()
	tween.interpolate_property(self, "size_factor",
		size_factor, factor, 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()


func get_anim_size_factor() -> float:
	return anim_size_factor


func reload_texture() -> void:
	if card_view:
		card_view.set_card(card)


func set_big_mode(enabled) -> void:
	if card_view:
		card_holder.remove_child(card_view)
		card_view.queue_free()
	
	if enabled:
		card_view = big_view.instance()
	else:
		card_view = small_view.instance()
	card_holder.add_child(card_view)
	card_view.set_card(card)
	
	card_view.set_count(count)
	set_size_factor(size_factor)


func is_big_mode_enabled() -> bool:
	return card_view.get_filename() == big_view.get_path()


func set_config(config : int) -> void:
	# fav button
	fav_button.disabled = !(config & Config.SHOW_FAV_BUTTON)
	
	# count
	count_label.visible = bool(config & Config.SHOW_CARD_COUNT)
	
	# visibility
	fav_button.visible = config & (Config.SHOW_CARD_COUNT | Config.SHOW_FAV_BUTTON)
	
	set_big_mode(config & Config.BIG_MODE)


func bind_limit_register(limiter : CardCollection) -> void:
	limit_register = limiter


func set_card(_card : Card, _count : int, factor : float, config : int, limiter : CardCollection = null) -> void:
	card = _card
	size_factor = factor
	bind_limit_register(limiter)
	# TODO check for ill formed data from import
	increase_count(_count)
	set_config(config)


func increase_count(by : int) -> void:
	# prevent removing more than we have
	by = int(max(-count, by))
	
	if limit_register:
		by = limit_register.can_add_card(card, by)
		if by == 0:
			return
	
	count += by
	if limit_register:
		limit_register.add_card(card.get_base_id(), by)
	# This must go after we update the limiter
	
	if count == 0 && delete_on_zero:
		get_parent().remove_child(self)
		queue_free()
		emit_signal("mouse_exited")
	
	count_label.text = "x" + str(count)
	if card_view:
		card_view.set_count(count)
	
	if by != 0:
		emit_signal("content_changed")
	return

static func get_deck_config() -> int:
	return Config.SHOW_CARD_COUNT | Config.SHOW_FAV_BUTTON

static func get_collection_config() -> int:
	return Config.SHOW_CARD_COUNT

static func get_card_search_config() -> int:
	return 0

