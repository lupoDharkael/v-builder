# Content autogenerated. Data from digimoncardgame.fandom.com

static func register_cards():

	CardDB.register_booster("ST-2", "ST-2: Cocytus Blue")
	CardDB.add_card(ST2_01.new())
	CardDB.add_card(ST2_02.new())
	CardDB.add_card(ST2_02_B.new())
	CardDB.add_card(ST2_03.new())
	CardDB.add_card(ST2_04.new())
	CardDB.add_card(ST2_05.new())
	CardDB.add_card(ST2_06.new())
	CardDB.add_card(ST2_06_B.new())
	CardDB.add_card(ST2_07.new())
	CardDB.add_card(ST2_07_B.new())
	CardDB.add_card(ST2_08.new())
	CardDB.add_card(ST2_08_B.new())
	CardDB.add_card(ST2_08_C.new())
	CardDB.add_card(ST2_09.new())
	CardDB.add_card(ST2_09_B.new())
	CardDB.add_card(ST2_10.new())
	CardDB.add_card(ST2_11.new())
	CardDB.add_card(ST2_12.new())
	CardDB.add_card(ST2_13.new())
	CardDB.add_card(ST2_13_B.new())
	CardDB.add_card(ST2_13_C.new())
	CardDB.add_card(ST2_14.new())
	CardDB.add_card(ST2_15.new())
	CardDB.add_card(ST2_16.new())
	CardDB.add_card(ST2_16_B.new())

class ST2_01 extends Card:
	func _init():
		name = "Tsunomon"
		type = Type.DIGITAMA
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-01"
		level = 2
		stage_level = Stage.IN_TRAINING
		digimon_type = "Lesser"
		inherited_effect_text = "[Your Turn] This Digimon gets +1000 DP when battling an opponent's Digimon that has no digivolution cards."
		ruling = [
					"Q: How long does the DP effect [ST2-01 Tsunomon] last?",
					"A: It only exists when comparing the DP between two Digimon for a battle. It is not applied during the resolution \"End of battle\" or \"On Deletion\" effects that activated from that same battle.",
					"Q: I attack with [BT5-111 Omnimon X-Anti-body] that has this card as a digivolution card against a 16000 DP Digimon with no sources. Can I use its effect to delete that Digimon?",
					"A: No, you cannot. The 1000 DP only exists when comparing the DP between Digimon for a battle. It is not applied during \"when X attacks\" effects.",
]

class ST2_02 extends Card:
	func _init():
		name = "Gomamon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-02"
		play_cost = 2
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Sea Beast"
		power = 3000

class ST2_02_B extends Card:
	func _init():
		name = "Gomamon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-02 (B)"
		play_cost = 2
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Sea Beast"
		power = 3000
		is_parallel = true
		notes = "parallel promo"

class ST2_03 extends Card:
	func _init():
		name = "Gabumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-03"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.DATA
		digimon_type = "Reptile"
		power = 2000
		inherited_effect_text = "[When Attacking] Trash the digivolution card at the bottom of 1 of your opponent's Digimon with a level of 5 or less."
		ruling = [
					"Q: Can this card's inherited effect be used to delete an opponent's Digimon with no digivolution cards?",
					"A: No. This inherited effect does nothing to your opponent's Digimon if they have no digivolution cards.",
]

class ST2_04 extends Card:
	func _init():
		name = "Bearmon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-04"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Beast"
		power = 4000

class ST2_05 extends Card:
	func _init():
		name = "Ikkakumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-05"
		play_cost = 4
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digimon_type = "Sea Beast"
		power = 5000

class ST2_06 extends Card:
	func _init():
		name = "Garurumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-06"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digimon_type = "Beast"
		power = 4000
		inherited_effect_text = "[When Attacking] Trash the digivolution card at the bottom of 1 of your opponent's Digimon."
		ruling = [
					"Q: Can this card's inherited effect be used to delete an opponent's Digimon with no digivolution cards?",
					"A: No. This inherited effect does nothing to your opponent's Digimon if they have no digivolution cards.",
]

class ST2_06_B extends Card:
	func _init():
		name = "Garurumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-06 (B)"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digimon_type = "Beast"
		power = 4000
		inherited_effect_text = "[When Attacking] Trash the digivolution card at the bottom of 1 of your opponent's Digimon."
		ruling = [
					"Q: Can this card's inherited effect be used to delete an opponent's Digimon with no digivolution cards?",
					"A: No. This inherited effect does nothing to your opponent's Digimon if they have no digivolution cards.",
]
		is_parallel = true
		notes = "parallel promo"

class ST2_07 extends Card:
	func _init():
		name = "Grizzlymon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-07"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digimon_type = "Beast"
		power = 6000
		effect_text = "<Blocker> (When an opponent's Digimon attacks, you may suspend this Digimon to force the opponent to attack it instead).\n[When Attacking] Lose 2 memory."
		ruling = [
					"Q: Can this Digimon attack when I have less than 2 memory?",
					"A: Yes, it can. Even if this Digimon's attack effect causes your memory to move to 1 or greater on your opponent's side, it doesn't become your opponent's turn until the end of the attack.",
]
		notes = "Grizzmon"

class ST2_07_B extends Card:
	func _init():
		name = "Grizzlymon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-07 (B)"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digimon_type = "Beast"
		power = 6000
		effect_text = "<Blocker> (When an opponent's Digimon attacks, you may suspend this Digimon to force the opponent to attack it instead).\n[When Attacking] Lose 2 memory."
		ruling = [
					"Q: Can this Digimon attack when I have less than 2 memory?",
					"A: Yes, it can. Even if this Digimon's attack effect causes your memory to move to 1 or greater on your opponent's side, it doesn't become your opponent's turn until the end of the attack.",
]
		is_parallel = true
		notes = "parallel promo Grizzmon"

class ST2_08 extends Card:
	func _init():
		name = "WereGarurumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.R
		id = "ST2-08"
		play_cost = 7
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Beastkin"
		power = 7000
		inherited_effect_text = "[Your Turn] While your opponent has a Digimon with no digivolution cards, this Digimon gains <Security Attack +1> (This Digimon checks 1 additional security card)."
		ruling = [
					"Q: Does this card's inherited effect apply even if my opponent only has 1 Digimon with no digivolution cards?",
					"A: Yes, it does.",
					"Q: One of my Digimon has this card as a digivolution card and attacks one of my opponent's Digimon that has 1 digivolution card. If this Digimon has another [When Attacking] effect that activates and trashes that digivolution card, does this card's inherited effect activate?",
					"A: Yes. Once that Digimon has no digivolution cards left, this card's inherited effect activates.",
					"Q: Does this card's inherited effect apply if my opponent has a Digimon with no digivolution cards in their breeding area?",
					"A: No, it doesn't check Digimon in the breeding area.",
					"Q: Does this card's inherited effect apply when my opponent doesn't have any Digimon in their battle area?",
					"A: No, it doesn't. Your opponent has to have a Digimon in their battle area for it to activate.",
]

class ST2_08_B extends Card:
	func _init():
		name = "WereGarurumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.R
		id = "ST2-08 (B)"
		play_cost = 7
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Beastkin"
		power = 7000
		inherited_effect_text = "[Your Turn] While your opponent has a Digimon with no digivolution cards, this Digimon gains <Security Attack +1> (This Digimon checks 1 additional security card)."
		ruling = [
					"Q: Does this card's inherited effect apply even if my opponent only has 1 Digimon with no digivolution cards?",
					"A: Yes, it does.",
					"Q: One of my Digimon has this card as a digivolution card and attacks one of my opponent's Digimon that has 1 digivolution card. If this Digimon has another [When Attacking] effect that activates and trashes that digivolution card, does this card's inherited effect activate?",
					"A: Yes. Once that Digimon has no digivolution cards left, this card's inherited effect activates.",
					"Q: Does this card's inherited effect apply if my opponent has a Digimon with no digivolution cards in their breeding area?",
					"A: No, it doesn't check Digimon in the breeding area.",
					"Q: Does this card's inherited effect apply when my opponent doesn't have any Digimon in their battle area?",
					"A: No, it doesn't. Your opponent has to have a Digimon in their battle area for it to activate.",
]
		is_parallel = true
		notes = "parallel promo"

class ST2_08_C extends Card:
	func _init():
		name = "WereGarurumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.R
		id = "ST2-08 (C)"
		play_cost = 7
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Beastkin"
		power = 7000
		inherited_effect_text = "[Your Turn] While your opponent has a Digimon with no digivolution cards, this Digimon gains <Security Attack +1> (This Digimon checks 1 additional security card)."
		ruling = [
					"Q: Does this card's inherited effect apply even if my opponent only has 1 Digimon with no digivolution cards?",
					"A: Yes, it does.",
					"Q: One of my Digimon has this card as a digivolution card and attacks one of my opponent's Digimon that has 1 digivolution card. If this Digimon has another [When Attacking] effect that activates and trashes that digivolution card, does this card's inherited effect activate?",
					"A: Yes. Once that Digimon has no digivolution cards left, this card's inherited effect activates.",
					"Q: Does this card's inherited effect apply if my opponent has a Digimon with no digivolution cards in their breeding area?",
					"A: No, it doesn't check Digimon in the breeding area.",
					"Q: Does this card's inherited effect apply when my opponent doesn't have any Digimon in their battle area?",
					"A: No, it doesn't. Your opponent has to have a Digimon in their battle area for it to activate.",
]
		is_parallel = true
		notes = "parallel promo"

class ST2_09 extends Card:
	func _init():
		name = "Zudomon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-09"
		play_cost = 6
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Sea Beast"
		power = 7000
		effect_text = "[When Digivolving] Trash 2 digivolution cards at the bottom of 1 of your opponent's Digimon."
		ruling = [
					"Q: Can this card's [When Digivolving] effect be used to delete an opponent's Digimon with no digivolution cards?",
					"A: No. This inherited effect does nothing to your opponent's Digimon if they have no digivolution cards.",
					"Q: Can this card's [When Digivolving] effect be used on an opponent's Digimon that has only 1 digivolution card?",
					"A: Yes, it can. In that case, it would only trash that 1 digivolution card.",
]

class ST2_09_B extends Card:
	func _init():
		name = "Zudomon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-09 (B)"
		play_cost = 6
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Sea Beast"
		power = 7000
		effect_text = "[When Digivolving] Trash 2 digivolution cards at the bottom of 1 of your opponent's Digimon."
		ruling = [
					"Q: Can this card's [When Digivolving] effect be used to delete an opponent's Digimon with no digivolution cards?",
					"A: No. This inherited effect does nothing to your opponent's Digimon if they have no digivolution cards.",
					"Q: Can this card's [When Digivolving] effect be used on an opponent's Digimon that has only 1 digivolution card?",
					"A: Yes, it can. In that case, it would only trash that 1 digivolution card.",
]
		is_parallel = true
		notes = "parallel promo"

class ST2_10 extends Card:
	func _init():
		name = "Plesiomon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.R
		id = "ST2-10"
		play_cost = 10
		level = 6
		stage_level = Stage.MEGA
		attribute = Attribute.DATA
		digimon_type = "Plesiosaur"
		power = 12000

class ST2_11 extends Card:
	func _init():
		name = "MetalGarurumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.SR
		id = "ST2-11"
		play_cost = 11
		level = 6
		stage_level = Stage.MEGA
		attribute = Attribute.DATA
		digimon_type = "Cyborg"
		power = 11000
		effect_text = "[When Attacking] (Once Per Turn) Unsuspend this Digimon"
		ruling = [
					"Q: Does this Digimon unsuspend itself each time it attacks?",
					"A: No, it only unsuspends itself once per turn. In other words, it only unsuspends the first time it attacks each turn.",
					"Q: Does this Digimon's effect only activate once per game?",
					"A: No. You can use the effect again during your next turn.",
					"Q: At what timing does this Digimon unsuspend itself?",
					"A: After you declare your attack, suspend the Digimon, then declare your attack target. When performing your security check or resolving a battle with your opponent's Digimon, this Digimon will already be unsuspended.",
]

class ST2_12 extends Card:
	func _init():
		name = "Matt Ishida"
		type = Type.TAMER
		color = ColorGroup.BLUE
		rarity = Rarity.R
		id = "ST2-12"
		play_cost = 2
		effect_text = "[Start of Your Turn] If your opponent has a Digimon with no Digivolution cards, gain 1 memory."
		sec_effect_text = "[Security] Play this card without paying its memory cost."
		ruling = [
					"Q: Do I gain 1 memory for each Digimon my opponent has without digivolution cards?",
					"A: No. You only gain 1 memory no matter how many Digimon your opponent has without digivolution cards.",
					"Q: Does this Tamer's effect apply if my opponent has a Digimon with no digivolution cards in their breeding area?",
					"A: No, it doesn't check Digimon in the breeding area.",
					"Q: Does this Tamer's effect apply when my opponent has no Digimon in their battle area?",
					"A: No, it doesn't. Your opponent has to have a Digimon in their battle area for it to activate.",
					"Q: If I have two of this Tamer in play and my opponent has a Digimon with no digivolution cards, do I gain 2 memory from this Tamer's effect?",
					"A: Yes. The effect of each copy activates, causing you to gain 2 memory.",
]
		notes = "Ishida Yamato"

class ST2_13 extends Card:
	func _init():
		name = "Hammer Spark"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-13"
		play_cost = 0
		effect_text = "[Main] Gain 1 memory."
		sec_effect_text = "[Security] Gain 2 memory."
		ruling = [
					"Q: If the security effect of this card causes the memory counter to move to 1 or higher on my side, does my opponent's turn end?",
					"A: Yes, it does. However, this only happens after any attacks resolve. If there are any  effects or attacks that have not resolved, those must resolve before it becomes your turn.",
]

class ST2_13_B extends Card:
	func _init():
		name = "Hammer Spark"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-13 (B)"
		play_cost = 0
		effect_text = "[Main] Gain 1 memory."
		sec_effect_text = "[Security] Gain 2 memory."
		ruling = [
					"Q: If the security effect of this card causes the memory counter to move to 1 or higher on my side, does my opponent's turn end?",
					"A: Yes, it does. However, this only happens after any attacks resolve. If there are any  effects or attacks that have not resolved, those must resolve before it becomes your turn.",
]
		is_parallel = true
		notes = "parallel promo"

class ST2_13_C extends Card:
	func _init():
		name = "Hammer Spark"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-13 (C)"
		play_cost = 0
		effect_text = "[Main] Gain 1 memory."
		sec_effect_text = "[Security] Gain 2 memory."
		ruling = [
					"Q: If the security effect of this card causes the memory counter to move to 1 or higher on my side, does my opponent's turn end?",
					"A: Yes, it does. However, this only happens after any attacks resolve. If there are any  effects or attacks that have not resolved, those must resolve before it becomes your turn.",
]
		is_parallel = true
		notes = "parallel promo"

class ST2_14 extends Card:
	func _init():
		name = "Sorrow Blue"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-14"
		play_cost = 2
		effect_text = "[Main] Choose 1 of your opponent's Digimon with no digivolution cards. That Digimon can't attack or block until the end of your opponent's next turn."
		sec_effect_text = "[Security] Choose 1 of your opponent's Digimon with no digivolution cards. That Digimon can't attack or block until the end of your next turn."
		ruling = [
					"Q: If one of my opponent's Digimon has this card's effect used on it and is suspended, can I attack that Digimon?",
					"A: Yes, you can.",
					"Q: If one of my opponent's Digimon has this card's effect used on it and it digivolves and now has 1 or more digivolution cards, how does this card's effect resolve?",
					"A: This card can only be used to target cards that meet its requirements upon activation. So the effect would still apply, and even though the target Digimon has gained digivolution cards, it still can't attack or block.",
]

class ST2_15 extends Card:
	func _init():
		name = "Kaiser Nail"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-15"
		play_cost = 4
		effect_text = "[Main] Choose a Digimon digivolution card placed under 1 of your Digimon and play it as another Digimon without paying its memory cost."
		sec_effect_text = "[Security] Activate this card's [Main] effect."
		ruling = [
					"Q: Can I use the effect of this Option card to play a level 2 Digimon that is currently a digivolution card of one of my Digimon?",
					"A: No. Level 2 Digimon can't be in the battle area.",
					"Q: If I use this Option card's effect to play a digivolution card of one of my suspended Digimon, does it come into play suspended?",
					"A: No. Since it is played as another Digimon, it is played unsuspended.",
					"Q: If one of my Digimon has an effect applied to it that lasts a turn, then I use the effect of this Option card to play one of its digivolution cards as a Digimon, does that Digimon come into play with the same effect applied to it?",
					"A: No. Since it is played as another Digimon, it is not affected by any effects of the original Digimon it was under.",
					"Q: Can Digimon played by this card's effect attack the turn they were played?",
					"A: No, since it would count as the turn they were played.",
]

class ST2_16 extends Card:
	func _init():
		name = "Cocytus Breath"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-16"
		play_cost = 7
		effect_text = "[Main] Return one of your opponent's Digimon to its owner's hand. (Trash all of the digivolution cards of that Digimon.)"
		sec_effect_text = "[Security] Activate this card's [Main] effect."

class ST2_16_B extends Card:
	func _init():
		name = "Cocytus Breath"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-16 (B)"
		play_cost = 7
		effect_text = "[Main] Return one of your opponent's Digimon to its owner's hand. (Trash all of the digivolution cards of that Digimon.)"
		sec_effect_text = "[Security] Activate this card's [Main] effect."
		is_parallel = true
		notes = "parallel promo"

