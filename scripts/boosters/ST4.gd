# Content autogenerated. Data from wikimon.net

static func register_cards():
	CardDB.add_card(ST4_01.new())
	CardDB.add_card(ST4_02.new())
	CardDB.add_card(ST4_03.new())
	CardDB.add_card(ST4_04.new())
	CardDB.add_card(ST4_05.new())
	CardDB.add_card(ST4_06.new())
	CardDB.add_card(ST4_07.new())
	CardDB.add_card(ST4_08.new())
	CardDB.add_card(ST4_09.new())
	CardDB.add_card(ST4_10.new())
	CardDB.add_card(ST4_11.new())
	CardDB.add_card(ST4_12.new())
	CardDB.add_card(ST4_13.new())
	CardDB.add_card(ST4_14.new())
	CardDB.add_card(ST4_15.new())
	CardDB.add_card(ST4_16.new())

	CardDB.register_booster("ST4", "Giga Green")

class ST4_01 extends Card:
	func _init():
		name = "Mochimon"
		type = Type.DIGITAMA
		color = ColorGroup.GREEN
		rarity = Rarity.U
		id = "ST4-01"
		level = 2
		stage_level = Stage.IN_TRAINING
		digimon_type = "Lesser"
		inherited_effect_text = "<<Your Turn>> If this Digimon is Lv.6 or above, this Digimon gets +1000 DP."

class ST4_02 extends Card:
	func _init():
		name = "Floramon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.C
		id = "ST4-02"
		play_cost = 2
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.DATA
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 1
		digivolve_level = 2
		digimon_type = "Plant"
		power = 4000

class ST4_03 extends Card:
	func _init():
		name = "Tentomon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.U
		id = "ST4-03"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 0
		digivolve_level = 2
		digimon_type = "Insect"
		power = 2000
		effect_text = "<<When Played>> Reveal the top card of your deck; if it is a Green Digimon card, add it to your hand. Return the remaining cards to the bottom of your deck."

class ST4_04 extends Card:
	func _init():
		name = "Palmon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.C
		id = "ST4-04"
		play_cost = 3
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.DATA
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 0
		digivolve_level = 2
		digimon_type = "Plant"
		power = 2000
		inherited_effect_text = "<<When Attacking>> When attacking an opponent Digimon, this Digimon gets +2000 DP for the rest of this turn."

class ST4_05 extends Card:
	func _init():
		name = "Kunemon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.C
		id = "ST4-05"
		play_cost = 4
		level = 3
		stage_level = Stage.ROOKIE
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 0
		digivolve_level = 2
		digimon_type = "Larva"
		power = 5000

class ST4_06 extends Card:
	func _init():
		name = "Togemon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.C
		id = "ST4-06"
		play_cost = 4
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.DATA
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 2
		digivolve_level = 3
		digimon_type = "Plant"
		power = 4000
		inherited_effect_text = "<<When Attacking>> When attacking an opponent Digimon, this Digimon gets +2000 DP for the rest of this turn."

class ST4_07 extends Card:
	func _init():
		name = "Kuwagamon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.C
		id = "ST4-07"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 2
		digivolve_level = 3
		digimon_type = "Insect"
		power = 6000

class ST4_08 extends Card:
	func _init():
		name = "Kabuterimon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.U
		id = "ST4-08"
		play_cost = 6
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 1
		digivolve_level = 3
		digimon_type = "Insect"
		power = 2000
		effect_text = "<<Blocker>> (When the opponent Digimon performs an attack, if this Digimon is in the Active position, you may Rest this Digimon and change the target of the attack to this Digimon)\n<<When Attacking>> Memory -2."

class ST4_09 extends Card:
	func _init():
		name = "Okuwamon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.C
		id = "ST4-09"
		play_cost = 6
		level = 5
		stage_level = ""
		attribute = Attribute.VIRUS
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 2
		digivolve_level = 4
		digimon_type = "Insect"
		power = 7000

class ST4_10 extends Card:
	func _init():
		name = "Lilimon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.U
		id = "ST4-10"
		play_cost = 6
		level = 5
		stage_level = Stage.MEGA
		attribute = Attribute.DATA
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Fairy"
		power = 7000
		effect_text = "<<When Evolving>> Reveal the top 5 cards of your deck, and add 1 Lv.6 or above Digimon card among those cards to your hand. Return the remaining cards to the bottom of your deck in any order."

class ST4_11 extends Card:
	func _init():
		name = "Atlur Kabuterimon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.R
		id = "ST4-11"
		play_cost = 7
		level = 5
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Insect"
		power = 7000
		inherited_effect_text = "<<Your Turn>> <<Once per Turn>> If this Digimon enters a battle and the opponent Digimon is the only Digimon destroyed, discard the top card from the opponent's Security."

class ST4_12 extends Card:
	func _init():
		name = "Rosemon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.R
		id = "ST4-12"
		play_cost = 10
		level = 6
		stage_level = Stage.ULTIMATE
		attribute = Attribute.DATA
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 3
		digivolve_level = 5
		digimon_type = "Fairy"
		power = 11000
		effect_text = "<<When Evolving>> Choose 1 opponent Digimon; that Digimon cannot attack or block until the end of the opponent's next turn."

class ST4_13 extends Card:
	func _init():
		name = "Herakle Kabuterimon"
		type = Type.DIGIMON
		color = ColorGroup.GREEN
		rarity = Rarity.SR
		id = "ST4-13"
		play_cost = 12
		level = 6
		stage_level = Stage.ULTIMATE
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.GREEN
		digivolve_cost = 4
		digivolve_level = 5
		digimon_type = "Insect"
		power = 12000
		effect_text = "<<Pierce>> (When this Digimon attacks and initiates a battle, if the opponent Digimon is the only Digimon destroyed in that battle, this Digimon Checks Security)\n<<Main>> <<Digiburst 2>> (Choose 2 of this Digimon's Evolution Bases and discard them. If you do, activate the following effect:)\n- Rest 1 opponent Digimon."

class ST4_14 extends Card:
	func _init():
		name = "Izumi Koshiro"
		type = Type.TAMER
		color = ColorGroup.GREEN
		rarity = Rarity.R
		id = "ST4-14"
		play_cost = 2
		effect_text = "<<Your Turn>> When an opponent Digimon Rests, you may Rest this Tamer; if you do, Memory +1."
		sec_effect_text = "<<Security>> Play this card without paying its Cost."

class ST4_15 extends Card:
	func _init():
		name = "Chikuchiku Bang Bang"
		type = Type.OPTION
		color = ColorGroup.GREEN
		rarity = Rarity.C
		id = "ST4-15"
		play_cost = 2
		effect_text = "<<Main>> Rest 1 opponent Digimon."
		sec_effect_text = "<<Security>>  Activate this card's <<Main>> effect. After that, add this card to your hand."

class ST4_16 extends Card:
	func _init():
		name = "Mega Blaster"
		type = Type.OPTION
		color = ColorGroup.GREEN
		rarity = Rarity.U
		id = "ST4-16"
		play_cost = 5
		effect_text = "<<Main>> Choose 1 opponent Digimon in the Rest position and return it to the opponent's hand. Discard that Digimon's Evolution Bases."
		sec_effect_text = "<<Security>>  Activate this card's <<Main>> effect."

