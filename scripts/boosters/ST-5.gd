# Content autogenerated. Data from digimoncardgame.fandom.com

static func register_cards():

	CardDB.register_booster("ST-5", "ST-5: Mugen Black")
	CardDB.add_card(ST5_01.new())
	CardDB.add_card(ST5_02.new())
	CardDB.add_card(ST5_03.new())
	CardDB.add_card(ST5_03_B.new())
	CardDB.add_card(ST5_04.new())
	CardDB.add_card(ST5_05.new())
	CardDB.add_card(ST5_06.new())
	CardDB.add_card(ST5_07.new())
	CardDB.add_card(ST5_08.new())
	CardDB.add_card(ST5_08_B.new())
	CardDB.add_card(ST5_09.new())
	CardDB.add_card(ST5_10.new())
	CardDB.add_card(ST5_11.new())
	CardDB.add_card(ST5_12.new())
	CardDB.add_card(ST5_12_B.new())
	CardDB.add_card(ST5_13.new())
	CardDB.add_card(ST5_14.new())
	CardDB.add_card(ST5_15.new())
	CardDB.add_card(ST5_16.new())

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
		inherited_effect_text = "[Your Turn] While this Digimon has <Blocker> it gets +1000 DP."

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
		digimon_type = "Reptile"
		power = 1000
		effect_text = "<Blocker> (When an opponent's Digimon attacks, you may suspend this Digimon to force the opponent to attack it instead)."

class ST5_03_B extends Card:
	func _init():
		name = "Agumon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.U
		id = "ST5-03 (B)"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digimon_type = "Reptile"
		power = 1000
		effect_text = "<Blocker> (When an opponent's Digimon attacks, you may suspend this Digimon to force the opponent to attack it instead)."
		is_parallel = true
		notes = "parallel promo"

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
		digimon_type = "Puppet"
		power = 2000
		inherited_effect_text = "[End of Opponent's Turn] If your opponent didn't attack with a Digimon this turn, trigger <Draw 1> (Draw 1 card from your deck)."
		ruling = [
					"Q: Does this card's inherited effect activate even if your opponent didn't have a Digimon in play for their entire turn?",
					"A: Yes, it does.",
					"Q: Does this card's inherited effect activate if you activate effects to prevent all of your opponent's Digimon from attacking?",
					"A: Yes, it does.",
					"Q: Does this card's inherited effect activates if you ended an attack with [BT5-111 Omnimon X-Anti-body]?",
					"A: No, it does not because your opponent still declared an attack this turn.",
]

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
		digimon_type = "Cyborg/D-Brigade"
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
		digimon_type = "Dinosaur"
		power = 4000
		inherited_effect_text = "[End of Opponent's Turn] If your opponent didn't attack with a Digimon this turn, trigger <Draw 1> (Draw 1 card from your deck)."
		ruling = [
					"Q: Does this card's inherited effect activate even if your opponent didn't have a Digimon in play for their entire turn?",
					"A: Yes, it does.",
					"Q: Does this card's inherited effect activate if you use effects to prevent your opponent's Digimon from attacking?",
					"A: Yes, it does.",
					"Q: Does this card's inherited effect activate if your opponent's Digimon were all deleted in battle after attacking?",
					"A: No, it doesn't. They attacked this turn, so the effect doesn't apply.",
]

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
		digimon_type = "Dinosaur"
		power = 5000
		effect_text = "<Blocker> (When an opponent's Digimon attacks, you may suspend this Digimon to force the opponent to attack it instead).\n [When Attacking] Lose 2 memory."
		ruling = [
					"Q: Can this Digimon attack if I have less than 2 memory?",
					"A: Yes, it can. Even if your memory counter moves to 1 on your opponent's side due to this Digimon's [When Attacking] effect, your turn doesn't end until the attack does.",
]

class ST5_08_B extends Card:
	func _init():
		name = "DarkTyrannomon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.U
		id = "ST5-08 (B)"
		play_cost = 6
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VIRUS
		digimon_type = "Dinosaur"
		power = 5000
		effect_text = "<Blocker> (When an opponent's Digimon attacks, you may suspend this Digimon to force the opponent to attack it instead).\n [When Attacking] Lose 2 memory."
		ruling = [
					"Q: Can this Digimon attack if I have less than 2 memory?",
					"A: Yes, it can. Even if your memory counter moves to 1 on your opponent's side due to this Digimon's [When Attacking] effect, your turn doesn't end until the attack does.",
]
		is_parallel = true
		notes = "parallel promo"

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
		digimon_type = "Cyborg"
		power = 7000
		effect_text = "[When Digivolving] Until the end of your opponent's next turn, 1 of your Digimon gains <Blocker> (When an opponent's Digimon attacks, you may suspend this Digimon to force the opponent to attack it instead)."
		ruling = [
					"Q: Can I use this card's effect to give this Digimon <Blocker>?",
					"A: Yes, you can.",
					"Q: I use this card to give a Digimon <Blocker>. If that Digimon digivolves into a different Digimon, what happens to <Blocker>?",
					"A: Digimon retain effects when digivolving or dedigivolving, so <Blocker> remains.",
]

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
		digimon_type = "Cyborg"
		power = 7000
		inherited_effect_text = "<Blocker> (When an opponent's Digimon attacks, you may suspend this Digimon to force the opponent to attack it instead)."

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
		digimon_type = "Machine"
		power = 11000
		effect_text = "[When Digivolving] Up to 2 of your Digimon gain <Reboot> (Unsuspend this Digimon during your opponent's unsuspend phase) until the end of your opponent's next turn."
		ruling = [
					"Q: Can I use this card's effect to give this Digimon <Reboot>?",
					"A: Yes, you can.",
					"Q: I use this card to give a Digimon <Reboot>. If that Digimon digivolves into a different Digimon, what happens to <Reboot>?",
					"A: Digimon retain effects when digivolving or dedigivolving, so <Reboot> remains.",
]
		notes = "Mugendramon"

class ST5_12_B extends Card:
	func _init():
		name = "Machinedramon"
		type = Type.DIGIMON
		color = ColorGroup.BLACK
		rarity = Rarity.R
		id = "ST5-12 (B)"
		play_cost = 10
		level = 6
		stage_level = Stage.MEGA
		attribute = Attribute.VIRUS
		digimon_type = "Machine"
		power = 11000
		effect_text = "[When Digivolving] Up to 2 of your Digimon gain <Reboot> (Unsuspend this Digimon during your opponent's unsuspend phase) until the end of your opponent's next turn."
		ruling = [
					"Q: Can I use this card's effect to give this Digimon <Reboot>?",
					"A: Yes, you can.",
					"Q: I use this card to give a Digimon <Reboot>. If that Digimon digivolves into a different Digimon, what happens to <Reboot>?",
					"A: Digimon retain effects when digivolving or dedigivolving, so <Reboot> remains.",
]
		is_parallel = true
		notes = "parallel promo Mugendramon"

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
		digimon_type = "Cyborg"
		power = 12000
		effect_text = "<Security Attack +1> (This Digimon checks 1 additional security card).\n[Main] <Digi-Burst 2> (You may trash 2 of this Digimon's digivolution cards to activate the effect below).\n・1 of your Digimon gets +4000 DP until the end of your opponent's next turn."

class ST5_14 extends Card:
	func _init():
		name = "Tai Kamiya"
		type = Type.TAMER
		color = ColorGroup.BLACK
		rarity = Rarity.R
		id = "ST5-14"
		play_cost = 2
		effect_text = "[Opponent's Turn] When you use <Blocker> to suspend one of your Digimon, you may suspend this Tamer to unsuspend 1 of your Digimon."
		sec_effect_text = "[Security] Play this card without paying its memory cost."
		ruling = [
					"Q: Can I use this card's effect to unsuspend a Digimon that didn't suspend itself by activating <Blocker>?",
					"A: Yes, you can.",
]
		notes = "Yagami Taichi"

class ST5_15 extends Card:
	func _init():
		name = "Laser Eye"
		type = Type.OPTION
		color = ColorGroup.BLACK
		rarity = Rarity.C
		id = "ST5-15"
		play_cost = 4
		effect_text = "[Main] Trigger <De-Digivolve  1> on 2 of your opponent's Digimon (Trash up to 1 card from the top of one of your opponent's Digimon. If it has no digivolution cards, or becomes a level 3 Digimon, you can't trash any more cards)."
		sec_effect_text = "[Security] Activate this card's [Main] effect."

class ST5_16 extends Card:
	func _init():
		name = "Dark Side Attack"
		type = Type.OPTION
		color = ColorGroup.BLACK
		rarity = Rarity.U
		id = "ST5-16"
		play_cost = 5
		effect_text = "[Main] Delete 1 of your opponent's Digimon with a play cost of 7 or less."
		sec_effect_text = "[Security] Activate this card's [Main] effect."

