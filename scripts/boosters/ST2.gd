# Content autogenerated. Data from wikimon.net

static func register_cards():
	CardDB.add_card(ST2_01.new())
	CardDB.add_card(ST2_02.new())
	CardDB.add_card(ST2_03.new())
	CardDB.add_card(ST2_04.new())
	CardDB.add_card(ST2_05.new())
	CardDB.add_card(ST2_06.new())
	CardDB.add_card(ST2_06_B.new())
	CardDB.add_card(ST2_07.new())
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
	CardDB.add_card(ST2_14.new())
	CardDB.add_card(ST2_15.new())
	CardDB.add_card(ST2_16.new())
	CardDB.add_card(ST2_16_B.new())

	CardDB.register_booster("ST2", "Cocytus Blue")

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
		inherited_effect_text = "<<Your Turn>> As long as you are battling an opponent Digimon that has no Evolution Bases, this Digimon gets +1000 DP."

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
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 0
		digivolve_level = 2
		digimon_type = "Marine Animal"
		power = 3000

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
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 0
		digivolve_level = 2
		digimon_type = "Reptile"
		power = 2000
		inherited_effect_text = "<<When Attacking>> Choose 1 Lv.5 or below opponent Digimon, and discard its bottom-most Evolution Base."

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
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 0
		digivolve_level = 2
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
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 2
		digivolve_level = 3
		digimon_type = "Marine Animal"
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
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 2
		digivolve_level = 3
		digimon_type = "Beast"
		power = 4000
		inherited_effect_text = "<<When Attacking>> Choose 1 opponent Digimon and discard its bottom-most Evolution Base."

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
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 2
		digivolve_level = 3
		digimon_type = "Beast"
		power = 4000
		inherited_effect_text = "<<When Attacking>> Choose 1 opponent Digimon and discard its bottom-most Evolution Base."
		is_parallel = true
		notes = "parallel promo"

class ST2_07 extends Card:
	func _init():
		name = "Gryzzlymon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-07"
		play_cost = 5
		level = 4
		stage_level = Stage.CHAMPION
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 2
		digivolve_level = 3
		digimon_type = "Beast"
		power = 6000
		effect_text = "<<Blocker>> (When the opponent Digimon performs an attack, if this Digimon is in the Active position, you may Rest this Digimon and change the target of the attack to this Digimon.)\n<<When Attacking>> Memory -2."

class ST2_08 extends Card:
	func _init():
		name = "WereGarurumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.R
		id = "ST2-08"
		play_cost = 7
		level = 5
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Beast Man"
		power = 7000
		inherited_effect_text = "<<Your Turn>> As long as there is an opponent Digimon in play that has no Evolution Bases, this Digimon gains <<Security Attack + 1>> (The number of Security cards this Digimon Checks increases by 1)."

class ST2_08_B extends Card:
	func _init():
		name = "WereGarurumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.R
		id = "ST2-08 (B)"
		play_cost = 7
		level = 5
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Beast Man"
		power = 7000
		inherited_effect_text = "<<Your Turn>> As long as there is an opponent Digimon in play that has no Evolution Bases, this Digimon gains <<Security Attack + 1>> (The number of Security cards this Digimon Checks increases by 1)."
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
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Beast Man"
		power = 7000
		inherited_effect_text = "<<Your Turn>> As long as there is an opponent Digimon in play that has no Evolution Bases, this Digimon gains <<Security Attack + 1>> (The number of Security cards this Digimon Checks increases by 1)."
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
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Marine Animal"
		power = 7000
		effect_text = "<<When Evolving>> Choose 1 opponent Digimon and discard its bottom-most 2 Evolution Bases."

class ST2_09_B extends Card:
	func _init():
		name = "Zudomon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-09 (B)"
		play_cost = 6
		level = 5
		stage_level = Stage.MEGA
		attribute = Attribute.VACCINE
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 3
		digivolve_level = 4
		digimon_type = "Marine Animal"
		power = 7000
		effect_text = "<<When Evolving>> Choose 1 opponent Digimon and discard its bottom-most 2 Evolution Bases."
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
		stage_level = Stage.ULTIMATE
		attribute = Attribute.DATA
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 2
		digivolve_level = 5
		digimon_type = "Plesiosaur"
		power = 12000

class ST2_11 extends Card:
	func _init():
		name = "MetalGarurumon"
		type = Type.DIGIMON
		color = ColorGroup.BLUE
		rarity = Rarity.SR
		id = "ST2-11"
		play_cost = 12
		level = 6
		stage_level = Stage.ULTIMATE
		attribute = Attribute.DATA
		digivolve_color = ColorGroup.BLUE
		digivolve_cost = 4
		digivolve_level = 5
		digimon_type = "Cyborg"
		power = 11000
		effect_text = "<<When Attacking>> <<Once per Turn>> Turn this Digimon Active."

class ST2_12 extends Card:
	func _init():
		name = "Matt Ishida"
		type = Type.TAMER
		color = ColorGroup.BLUE
		rarity = Rarity.R
		id = "ST2-12"
		play_cost = 2
		effect_text = "<<Beginning of Your Turn>> If there is an opponent Digimon in play that has no Evolution Bases, Memory +1."
		sec_effect_text = "<<Security>> Play this card without paying its Cost."
		notes = "Ishida Yamato"

class ST2_13 extends Card:
	func _init():
		name = "Hammer Spark"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-13"
		play_cost = 0
		effect_text = "<<Main>> Memory +1."
		sec_effect_text = "<<Security>> Memory +2."

class ST2_13_B extends Card:
	func _init():
		name = "Hammer Spark"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-13 (B)"
		play_cost = 0
		effect_text = "<<Main>> Memory +1."
		sec_effect_text = "<<Security>> Memory +2."
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
		effect_text = "<<Main>> Choose 1 opponent Digimon that has no Evolution Bases. That Digimon cannot attack or block until the end of the opponent's next turn."
		sec_effect_text = "<<Security>> Choose 1 opponent Digimon that has no Evolution Bases. That Digimon cannot attack or block until the end of your next turn."

class ST2_15 extends Card:
	func _init():
		name = "Kaiser Nail"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.C
		id = "ST2-15"
		play_cost = 4
		effect_text = "<<Main>> Choose 1 of your Digimon, then choose 1 Digimon card in its Evolution Bases; play that card as a separate Digimon without paying its Cost."
		sec_effect_text = "<<Security>> Activate this card's <<Main>> effect."

class ST2_16 extends Card:
	func _init():
		name = "Cocytus Breath"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-16"
		play_cost = 7
		effect_text = "<<Main>> Choose 1 opponent Digimon and return it to the opponent's hand. Discard that Digimon's Evolution Bases."
		sec_effect_text = "<<Security>> Activate this card's <<Main>> effect."

class ST2_16_B extends Card:
	func _init():
		name = "Cocytus Breath"
		type = Type.OPTION
		color = ColorGroup.BLUE
		rarity = Rarity.U
		id = "ST2-16 (B)"
		play_cost = 7
		effect_text = "<<Main>> Choose 1 opponent Digimon and return it to the opponent's hand. Discard that Digimon's Evolution Bases."
		sec_effect_text = "<<Security>> Activate this card's <<Main>> effect."
		is_parallel = true
		notes = "parallel promo"

