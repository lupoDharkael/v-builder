# Content autogenerated. Data from wikimon.net

static func register_cards():
	CardDB.add_card(ST5_01.new())
	CardDB.add_card(ST5_02.new())
	CardDB.add_card(ST5_03.new())
	CardDB.add_card(ST5_04.new())
	CardDB.add_card(ST5_05.new())
	CardDB.add_card(ST5_06.new())
	CardDB.add_card(ST5_07.new())
	CardDB.add_card(ST5_08.new())
	CardDB.add_card(ST5_09.new())
	CardDB.add_card(ST5_10.new())
	CardDB.add_card(ST5_11.new())
	CardDB.add_card(ST5_12.new())
	CardDB.add_card(ST5_13.new())
	CardDB.add_card(ST5_14.new())
	CardDB.add_card(ST5_15.new())
	CardDB.add_card(ST5_16.new())

	CardDB.register_booster("ST5", "ST-5: Mugen Black")

class ST5_01 extends Card:
	func _init():
		name = "Kapurimon"
		type = Type.DIGITAMA
		color = ColorGroup.BLACK
		rarity = Rarity.U
		id = "ST5-01"
		level = 2
		stage_level = Stage.IN_TRAINING
		digimon_type = "Lesser"
		inherited_effect_text = "[Your Turn] While this Digimon has [Blocker] it gets +1000 DP."

class ST5_02 extends Card:
	func _init():
		name = "Jazamon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.C
		id = "ST5-02"
		play_cost = 2
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.DATA
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 1
		digivolve_level = 2
		digimon_type = "Bird Dragon"
		power = 4000

class ST5_03 extends Card:
	func _init():
		name = "Agumon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.U
		id = "ST5-03"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 0
		digivolve_level = 2
		digimon_type = "Reptile"
		power = 1000
		effect_text = "[Blocker]."

class ST5_04 extends Card:
	func _init():
		name = "ToyAgumon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.C
		id = "ST5-04"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 0
		digivolve_level = 2
		digimon_type = "Puppet"
		power = 2000
		inherited_effect_text = "[End of Opponent\'s Turn] If your opponent didn't attack with a Digimon this turn, trigger [Draw 1]."

class ST5_05 extends Card:
	func _init():
		name = "Commandramon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.C
		id = "ST5-05"
		play_cost = 4
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 0
		digivolve_level = 2
		digimon_type = "Cyborg"
		power = 5000

class ST5_06 extends Card:
	func _init():
		name = "Greymon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.C
		id = "ST5-06"
		play_cost = 4
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 2
		digivolve_level = 3
		digimon_type = "Dinosaur"
		power = 4000
		inherited_effect_text = "[End of Opponent\'s Turn] If your opponent didn't attack with a Digimon this turn, trigger [Draw 1]."

class ST5_07 extends Card:
	func _init():
		name = "Jazardmon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.C
		id = "ST5-07"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.DATA
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 2
		digivolve_level = 3
		digimon_type = "Machine Dragon"
		power = 6000

class ST5_08 extends Card:
	func _init():
		name = "DarkTyrannomon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.U
		id = "ST5-08"
		play_cost = 6
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 1
		digivolve_level = 3
		digimon_type = "Dinosaur"
		power = 5000
		effect_text = "[Blocker].\n [When Attacking] Lose 2 memory."

class ST5_09 extends Card:
	func _init():
		name = "MetalGreymon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.U
		id = "ST5-09"
		play_cost = 6
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Cyborg"
		power = 7000
		effect_text = "[When Digivolved] Until the end of your opponent's next turn, 1 of your Digimon gains [Blocker]."

class ST5_10 extends Card:
	func _init():
		name = "MetalTyrannomon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.C
		id = "ST5-10"
		play_cost = 6
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Cyborg"
		power = 9000

class ST5_11 extends Card:
	func _init():
		name = "Megadramon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.R
		id = "ST5-11"
		play_cost = 7
		level = 5
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Cyborg"
		power = 7000
		inherited_effect_text = "[Blocker]."

class ST5_12 extends Card:
	func _init():
		name = "Machinedramon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.R
		id = "ST5-12"
		play_cost = 10
		level = 6
		stage_level = Stage.MEGA
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 3
		digivolve_level = 5
		digimon_type = "Machine"
		power = 11000
		effect_text = "[When Digivolved] Up to 2 of your Digimon gain [Reboot] until the end of your opponent's next turn."
		notes = "Mugendramon"

class ST5_13 extends Card:
	func _init():
		name = "BlitzGreymon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.SR
		id = "ST5-13"
		play_cost = 12
		level = 6
		stage_level = Stage.MEGA
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.BLACK
		digivolve_cost = 4
		digivolve_level = 5
		digimon_type = "Cyborg"
		power = 12000
		effect_text = "[Security Attack +].\n[Main] [Digiburst 2].\n・1 of your Digimon gets +4000 DP until the end of your opponent's next turn."

class ST5_14 extends Card:
	func _init():
		name = "Tai Kamiya"
		type = Type.TAMER
		color = ColorGroup.BLACK
		rarity = Rarity.R
		id = "ST5-14"
		play_cost = 2
		effect_text = "[Opponent Turn] When you use [Blocker] to suspend one of your Digimon, you may suspend this Tamer to unsuspend 1 of your Digimon."
		sec_effect_text = "[Security] Play this card without paying its memory cost."
		notes = "Yagami Taichi"

class ST5_15 extends Card:
	func _init():
		name = "Laser Eye"
		type = Type.OPTION
		color = ColorGroup.BLACK
		rarity = Rarity.C
		id = "ST5-15"
		play_cost = 4
		effect_text = "[Main] Trigger [De-Digivolve 1]."
		sec_effect_text = "[Security] Activate this card's [Main] effect."

class ST5_16 extends Card:
	func _init():
		name = "Genocide Attack"
		type = Type.OPTION
		color = ColorGroup.BLACK
		rarity = Rarity.U
		id = "ST5-16"
		play_cost = 5
		effect_text = "[Main] Delete 1 of your opponent's Digimon with a play cost of 7 or less."
		sec_effect_text = "[Security] Activate this card's [Main] effect."

