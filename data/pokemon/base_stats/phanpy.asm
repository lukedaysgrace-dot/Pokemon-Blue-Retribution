	db DEX_PHANPY ; pokedex id

	db  90,  60,  60,  40,  40
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 120 ; catch rate
	db 124 ; base exp

	INCBIN "gfx/pokemon/front/phanpy.pic", 0, 1
	dw PhanpyPicFront, PhanpyPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,   EARTHQUAKE,   \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,          REST,         \
	     ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	db 0 ; padding
