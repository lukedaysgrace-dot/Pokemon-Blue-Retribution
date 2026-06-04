	db DEX_AXEW ; pokedex id

	db  46,  87,  60,  57,  30
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 75 ; catch rate
	db  64 ; base exp

	INCBIN "gfx/pokemon/front/axew.pic", 0, 1
	dw AxewPicFront, AxewPicBack

	db SCRATCH, LEER, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         DRAGON_RAGE,  DIG,          MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE,   CUT,          \
	     STRENGTH
	db BANK(AxewPicFront)
	assert BANK(AxewPicFront) == BANK(AxewPicBack)