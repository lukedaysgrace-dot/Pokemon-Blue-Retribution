	db DEX_GARCHOMP ; pokedex id

	db 108, 130,  95, 102,  83
	;   hp  atk  def  spd  spc

	db DRAGON, GROUND ; type
	db 45 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/garchomp.pic", 0, 1
	dw GarchompPicFront, GarchompPicBack

	db TACKLE, SAND_ATTACK, BITE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         EARTHQUAKE,   DIG,          MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH,     \
	     FLY
	db BANK(GarchompPicFront)
	assert BANK(GarchompPicFront) == BANK(GarchompPicBack)
