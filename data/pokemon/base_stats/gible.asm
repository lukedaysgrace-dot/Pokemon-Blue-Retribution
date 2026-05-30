	db DEX_GIBLE ; pokedex id

	db  58,  70,  45,  42,  41
	;   hp  atk  def  spd  spc

	db DRAGON, GROUND ; type
	db 45 ; catch rate
	db  67 ; base exp

	INCBIN "gfx/pokemon/front/gible.pic", 0, 1
	dw GiblePicFront, GiblePicBack

	db TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     EARTHQUAKE,   DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	db BANK(GiblePicFront)
	assert BANK(GiblePicFront) == BANK(GiblePicBack)
