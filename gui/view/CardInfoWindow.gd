extends PopupDialog


var card_view : Node

var card_detail : Control
var card_texture : TextureRect
var rules_label : RichTextLabel
var prev_button : Button
var next_button : Button


func _notification(what):
	if what == NOTIFICATION_VISIBILITY_CHANGED && visible:
		next_button.grab_focus()


func _ready():
	set_pass_on_modal_close_click(false)
	card_detail = $HBoxContainer/ScrollContainer/CardDetail
	card_texture = $HBoxContainer/VBoxContainer/TextureRect
	rules_label = $HBoxContainer/RulingContainer/RichTextLabel
	
	prev_button = $HBoxContainer/VBoxContainer/HBoxContainer/PrevButton
	next_button = $HBoxContainer/VBoxContainer/HBoxContainer/NextButton
	
	prev_button.connect("pressed", self, "change_to_sibling", [-1])
	next_button.connect("pressed", self, "change_to_sibling", [+1])
	


func change_to_sibling(val : int) -> void:
	if !card_view || card_view.get_parent() == null:
		return
	
	var c = card_view.get_parent().get_child_count()
	var i = (card_view.get_index() + val)
	var cv = card_view.get_parent().get_child(posmod(i, c))
	set_card_view_item(cv)


func set_card_view_item(cv : Node) -> void:
	if !cv:
		return
	
	card_view = cv
	
	card_texture.texture = CardDB.get_card_texture(cv.card.id)
	card_detail.set_card(cv.card)
	set_rules(cv.card)

func set_rules(card : Card) -> void:
	rules_label.bbcode_text = ""
	if card.ruling.empty():
		return
	
	var i = 0
	while i < card.ruling.size():
		var question = card.ruling[i]
		var answer = card.ruling[i + 1]
		
		rules_label.push_align(RichTextLabel.ALIGN_CENTER)
		rules_label.add_text("_________\/ " + str(i >> 1) + " \\_________")
		rules_label.pop()
		rules_label.newline()
		
		rules_label.push_color(Color.green)
		rules_label.add_text("Q: ")
		rules_label.pop()
		rules_label.add_text(question)
		rules_label.newline()
		rules_label.newline()
		rules_label.push_color(Color.green)
		rules_label.add_text("A: ")
		rules_label.pop()
		rules_label.add_text(answer)
		rules_label.newline()
		rules_label.newline()
		i += 2
	
