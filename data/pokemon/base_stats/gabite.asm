	db DEX_GABITE ; pokedex id

	db  68,  90,  65,  82,  53
	;   hp  atk  def  spd  spc

	db DRAGON, GROUND ; type
	db 45 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/front/gabite.pic", 0, 1
	dw GabitePicFront, GabitePicBack

	db TACKLE, SAND_ATTACK, BITE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     EARTHQUAKE,   DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	db BANK(GabitePicFront)
	assert BANK(GabitePicFront) == BANK(GabitePicBack)
