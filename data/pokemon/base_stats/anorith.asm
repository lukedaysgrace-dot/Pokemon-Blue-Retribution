	db DEX_ANORITH ; pokedex id

	db  45,  95,  50,  75,  45
	;   hp  atk  def  spd  spc

	db ROCK, BUG ; type
	db 45 ; catch rate
	db 119 ; base exp

	INCBIN "gfx/pokemon/front/anorith.pic", 0, 1
	dw AnorithPicFront, AnorithPicBack

	db SCRATCH, HARDEN, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,     \
	     DOUBLE_EDGE,  WATER_GUN,    ICE_BEAM,     BLIZZARD,      \
	     RAGE,         DIG,          MIMIC,        DOUBLE_TEAM,   \
	     BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE,    \
	     SURF
	db BANK(AnorithPicFront)
	assert BANK(AnorithPicFront) == BANK(AnorithPicBack)
