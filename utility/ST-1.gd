# Content autogenerated. Data from digimoncardgame.fandom.com

static func register_cards():

	CardDB.register_booster("ST-1", "ST-1: Gaia Red")
	CardDB.add_card(ST1_01.new())
	CardDB.add_card(ST1_02.new())
	CardDB.add_card(ST1_02_B.new())
	CardDB.add_card(ST1_02_C.new())
	CardDB.add_card(ST1_02_D.new())
	CardDB.add_card(ST1_03.new())
	CardDB.add_card(ST1_03_B.new())
	CardDB.add_card(ST1_03_C.new())
	CardDB.add_card(ST1_03_D.new())
	CardDB.add_card(ST1_04.new())
	CardDB.add_card(ST1_05.new())
	CardDB.add_card(ST1_06.new())
	CardDB.add_card(ST1_07.new())
	CardDB.add_card(ST1_07_B.new())
	CardDB.add_card(ST1_07_C.new())
	CardDB.add_card(ST1_08.new())
	CardDB.add_card(ST1_08_B.new())
	CardDB.add_card(ST1_09.new())
	CardDB.add_card(ST1_09_B.new())
	CardDB.add_card(ST1_09_C.new())
	CardDB.add_card(ST1_10.new())
	CardDB.add_card(ST1_10_B.new())
	CardDB.add_card(ST1_11.new())
	CardDB.add_card(ST1_11_B.new())
	CardDB.add_card(ST1_12.new())
	CardDB.add_card(ST1_12_B.new())
	CardDB.add_card(ST1_13.new())
	CardDB.add_card(ST1_13_B.new())
	CardDB.add_card(ST1_14.new())
	CardDB.add_card(ST1_15.new())
	CardDB.add_card(ST1_16.new())
	CardDB.add_card(ST1_16_B.new())
	CardDB.add_card(ST1_16_C.new())
	CardDB.add_card(ST1_16_D.new())

class ST1_01 extends Card:
	func _init():
		name = "Koromon"
		type = Type.DIGITAMA
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-01"
		level = 2
		stage_level = Stage.IN_TRAINING
		digimon_type = "Lesser"
		inherited_effect_text = "[Your Turn] While this Digimon has 4 or more digivolution cards, it gets +1000 DP."
		ruling = [
					"Q:  This card has the inherited effect, \"While this Digimon has 4 or more digivolution cards, it gets +1000 DP.\" Is this card counted as part of that total?",
					"A:  Yes, it does.",
]

class ST1_02 extends Card:
	func _init():
		name = "Biyomon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-02"
		play_cost = 2
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Bird"
		power = 3000
		notes = "Piyomon"

class ST1_02_B extends Card:
	func _init():
		name = "Biyomon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-02 (B)"
		play_cost = 2
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Bird"
		power = 3000
		is_parallel = true
		notes = "parallel promo Piyomon"

class ST1_02_C extends Card:
	func _init():
		name = "Biyomon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-02 (C)"
		play_cost = 2
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Bird"
		power = 3000
		is_parallel = true
		notes = "parallel promo Piyomon"

class ST1_02_D extends Card:
	func _init():
		name = "Biyomon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-02 (D)"
		play_cost = 2
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Bird"
		power = 3000
		is_parallel = true
		notes = "parallel promo Piyomon"

class ST1_03 extends Card:
	func _init():
		name = "Agumon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-03"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Reptile"
		power = 2000
		inherited_effect_text = "[Your Turn] This Digimon gets +1000 DP."

class ST1_03_B extends Card:
	func _init():
		name = "Agumon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-03 (B)"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Reptile"
		power = 2000
		inherited_effect_text = "[Your Turn] This Digimon gets +1000 DP."
		is_parallel = true
		notes = "parallel promo"

class ST1_03_C extends Card:
	func _init():
		name = "Agumon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-03 (C)"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Reptile"
		power = 2000
		inherited_effect_text = "[Your Turn] This Digimon gets +1000 DP."
		is_parallel = true
		notes = "parallel promo"

class ST1_03_D extends Card:
	func _init():
		name = "Agumon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-03 (D)"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Reptile"
		power = 2000
		inherited_effect_text = "[Your Turn] This Digimon gets +1000 DP."
		is_parallel = true
		notes = "parallel promo"

class ST1_04 extends Card:
	func _init():
		name = "Dracomon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-04"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.DATA
		digimon_type = "Dragon"
		power = 4000

class ST1_05 extends Card:
	func _init():
		name = "Birdramon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-05"
		play_cost = 4
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digimon_type = "Giant Bird"
		power = 5000

class ST1_06 extends Card:
	func _init():
		name = "Coredramon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-06"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VIRUS
		digimon_type = "Dragon"
		power = 6000
		effect_text = "<Blocker> (When an opponent's Digimon attacks, you may suspend this Digimon to force the opponent to attack it instead).\n[When Attacking] Lose 2 memory."
		ruling = [
					"Q: Can I attack with this Digimon if I don't have 2 or more memory?",
					"A:  You can attack with it. But when you do, even if the memory counter moves to 1 or higher on your opponent's side, you don't switch turns until the attack is finished.",
]

class ST1_07 extends Card:
	func _init():
		name = "Greymon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-07"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digimon_type = "Dinosaur"
		power = 4000
		inherited_effect_text = "<Security Attack +1> (This Digimon checks 1 additional security card)."

class ST1_07_B extends Card:
	func _init():
		name = "Greymon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-07 (B)"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digimon_type = "Dinosaur"
		power = 4000
		inherited_effect_text = "<Security Attack +1> (This Digimon checks 1 additional security card)."
		is_parallel = true
		notes = "parallel promo"

class ST1_07_C extends Card:
	func _init():
		name = "Greymon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-07 (C)"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digimon_type = "Dinosaur"
		power = 4000
		inherited_effect_text = "<Security Attack +1> (This Digimon checks 1 additional security card)."
		is_parallel = true
		notes = "parallel promo"

class ST1_08 extends Card:
	func _init():
		name = "Garudamon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-08"
		play_cost = 6
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Birdkin"
		power = 7000
		effect_text = "[When Digivolving] 1 of your Digimon gets +3000 DP for the turn."
		ruling = [
					"Q: Can this Digimon target itself for its own effect?",
					"A:  Yes, it can.",
]

class ST1_08_B extends Card:
	func _init():
		name = "Garudamon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-08 (B)"
		play_cost = 6
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Birdkin"
		power = 7000
		effect_text = "[When Digivolving] 1 of your Digimon gets +3000 DP for the turn."
		ruling = [
					"Q: Can this Digimon target itself for its own effect?",
					"A:  Yes, it can.",
]
		is_parallel = true
		notes = "parallel promo"

class ST1_09 extends Card:
	func _init():
		name = "MetalGreymon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.R
		id = "ST1-09"
		play_cost = 7
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Cyborg"
		power = 7000
		inherited_effect_text = "[Your Turn] When this Digimon is blocked, gain 3 memory."
		ruling = [
					"Q: Does this card's inherited effect activate when I attack my opponent's Digimon?",
					"A: No, it only activates if your opponent declares they're blocking the attack with <Blocker>.",
]

class ST1_09_B extends Card:
	func _init():
		name = "MetalGreymon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.R
		id = "ST1-09 (B)"
		play_cost = 7
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Cyborg"
		power = 7000
		inherited_effect_text = "[Your Turn] When this Digimon is blocked, gain 3 memory."
		ruling = [
					"Q: Does this card's inherited effect activate when I attack my opponent's Digimon?",
					"A: No, it only activates if your opponent declares they're blocking the attack with <Blocker>.",
]
		is_parallel = true
		notes = "parallel promo"

class ST1_09_C extends Card:
	func _init():
		name = "MetalGreymon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.R
		id = "ST1-09 (C)"
		play_cost = 7
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digimon_type = "Cyborg"
		power = 7000
		inherited_effect_text = "[Your Turn] When this Digimon is blocked, gain 3 memory."
		ruling = [
					"Q: Does this card's inherited effect activate when I attack my opponent's Digimon?",
					"A: No, it only activates if your opponent declares they're blocking the attack with <Blocker>.",
]
		is_parallel = true
		notes = "parallel promo"

class ST1_10 extends Card:
	func _init():
		name = "Phoenixmon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.R
		id = "ST1-10"
		play_cost = 10
		level = 6
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digimon_type = "Holy Beast"
		power = 12000

class ST1_10_B extends Card:
	func _init():
		name = "Phoenixmon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.R
		id = "ST1-10 (B)"
		play_cost = 10
		level = 6
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digimon_type = "Holy Beast"
		power = 12000
		is_parallel = true
		notes = "parallel promo"

class ST1_11 extends Card:
	func _init():
		name = "WarGreymon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.SR
		id = "ST1-11"
		play_cost = 12
		level = 6
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digimon_type = "Dragonkin"
		power = 12000
		effect_text = "[Your Turn] For every 2 digivolution cards this Digimon has, it gains <Security Attack +1> (This Digimon checks 1 additional security card)."
		ruling = [
					"Q: How does this Digimon's effect work when it has 3 digivolution cards?",
					"A: Only multiples of 2 count for this effect, so even if you have 3 digivolution cards, it only gains <Security Attack +1>.",
]

class ST1_11_B extends Card:
	func _init():
		name = "WarGreymon"
		type = Type.DIGIMON
		color = ColorGroup.RED
		rarity = Rarity.SR
		id = "ST1-11 (B)"
		play_cost = 12
		level = 6
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digimon_type = "Dragonkin"
		power = 12000
		effect_text = "[Your Turn] For every 2 digivolution cards this Digimon has, it gains <Security Attack +1> (This Digimon checks 1 additional security card)."
		ruling = [
					"Q: How does this Digimon's effect work when it has 3 digivolution cards?",
					"A: Only multiples of 2 count for this effect, so even if you have 3 digivolution cards, it only gains <Security Attack +1>.",
]
		is_parallel = true
		notes = "parallel promo"

class ST1_12 extends Card:
	func _init():
		name = "Tai Kamiya"
		type = Type.TAMER
		color = ColorGroup.RED
		rarity = Rarity.R
		id = "ST1-12"
		play_cost = 2
		effect_text = "[Your Turn] All of your Digimon get +1000 DP."
		sec_effect_text = "[Security] Play this card without paying its memory cost."
		ruling = [
					"Q: Does the effect of this Tamer stack if there are multiple copies in play in my battle area?",
					"A: Yes, it does..",
]
		notes = "Yagami Taichi"

class ST1_12_B extends Card:
	func _init():
		name = "Tai Kamiya"
		type = Type.TAMER
		color = ColorGroup.RED
		rarity = Rarity.R
		id = "ST1-12 (B)"
		play_cost = 2
		effect_text = "[Your Turn] All of your Digimon get +1000 DP."
		sec_effect_text = "[Security] Play this card without paying its memory cost."
		ruling = [
					"Q: Does the effect of this Tamer stack if there are multiple copies in play in my battle area?",
					"A: Yes, it does..",
]
		is_parallel = true
		notes = "parallel promo Yagami Taichi"

class ST1_13 extends Card:
	func _init():
		name = "Shadow Wing"
		type = Type.OPTION
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-13"
		play_cost = 1
		effect_text = "[Main] 1 of your Digimon gets +3000 DP for the turn."
		sec_effect_text = "[Security] All of your Digimon gain <Security Attack +1> (This Digimon checks 1 additional security card) until the end of your next turn."
		ruling = [
					"Q: During my next turn after this card's [Security] effect was activated, does it apply to newly played Digimon and Digimon moved from the breeding area to the battle area?",
					"A: Yes, it does.",
]

class ST1_13_B extends Card:
	func _init():
		name = "Shadow Wing"
		type = Type.OPTION
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-13 (B)"
		play_cost = 1
		effect_text = "[Main] 1 of your Digimon gets +3000 DP for the turn."
		sec_effect_text = "[Security] All of your Digimon gain <Security Attack +1> (This Digimon checks 1 additional security card) until the end of your next turn."
		ruling = [
					"Q: During my next turn after this card's [Security] effect was activated, does it apply to newly played Digimon and Digimon moved from the breeding area to the battle area?",
					"A: Yes, it does.",
]
		is_parallel = true
		notes = "parallel promo"

class ST1_14 extends Card:
	func _init():
		name = "Starlight Explosion"
		type = Type.OPTION
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-14"
		play_cost = 2
		effect_text = "[Main] All of your Security Digimon get +7000 DP until the end of your opponent's next turn."
		sec_effect_text = "[Security] All of your Security Digimon get +7000 DP for the turn."

class ST1_15 extends Card:
	func _init():
		name = "Giga Destroyer"
		type = Type.OPTION
		color = ColorGroup.RED
		rarity = Rarity.C
		id = "ST1-15"
		play_cost = 6
		effect_text = "[Main] Delete up to 2 of your opponent's Digimon with 4000 DP or less."
		sec_effect_text = "[Security] Activate this card's [Main] effect."
		ruling = [
					"Q: What happens to the digivolution cards of a Digimon deleted by this card's main effect?",
					"A: They are sent to their owner's trash.",
]

class ST1_16 extends Card:
	func _init():
		name = "Gaia Force"
		type = Type.OPTION
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-16"
		play_cost = 8
		effect_text = "[Main] Delete 1 of your opponent's Digimon."
		sec_effect_text = "[Security] Activate this card's [Main] effect."
		ruling = [
					"Q: What happens to the digivolution cards of a Digimon deleted by this card's main effect?",
					"A: They are sent to their owner's trash.",
]

class ST1_16_B extends Card:
	func _init():
		name = "Gaia Force"
		type = Type.OPTION
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-16 (B)"
		play_cost = 8
		effect_text = "[Main] Delete 1 of your opponent's Digimon."
		sec_effect_text = "[Security] Activate this card's [Main] effect."
		ruling = [
					"Q: What happens to the digivolution cards of a Digimon deleted by this card's main effect?",
					"A: They are sent to their owner's trash.",
]
		is_parallel = true
		notes = "parallel promo"

class ST1_16_C extends Card:
	func _init():
		name = "Gaia Force"
		type = Type.OPTION
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-16 (C)"
		play_cost = 8
		effect_text = "[Main] Delete 1 of your opponent's Digimon."
		sec_effect_text = "[Security] Activate this card's [Main] effect."
		ruling = [
					"Q: What happens to the digivolution cards of a Digimon deleted by this card's main effect?",
					"A: They are sent to their owner's trash.",
]
		is_parallel = true
		notes = "parallel promo"

class ST1_16_D extends Card:
	func _init():
		name = "Gaia Force"
		type = Type.OPTION
		color = ColorGroup.RED
		rarity = Rarity.U
		id = "ST1-16 (D)"
		play_cost = 8
		effect_text = "[Main] Delete 1 of your opponent's Digimon."
		sec_effect_text = "[Security] Activate this card's [Main] effect."
		ruling = [
					"Q: What happens to the digivolution cards of a Digimon deleted by this card's main effect?",
					"A: They are sent to their owner's trash.",
]
		is_parallel = true
		notes = "parallel promo"

