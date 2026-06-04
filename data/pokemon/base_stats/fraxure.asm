	db DEX_FRAXURE ; pokedex id

	db  66, 117,  70,  67,  40
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 60 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/front/fraxure.pic", 0, 1
	dw FraxurePicFront, FraxurePicBack

	db SCRATCH, LEER, DRAGON_RAGE, NO_MOVE
	db GROWTH_SLOW

	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         DRAGON_RAGE,  DIG,          MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE,   CUT,          \
	     STRENGTH
	db BANK(FraxurePicFront)
	assert BANK(FraxurePicFront) == BANK(FraxurePicBack)