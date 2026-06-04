	db DEX_DEINO ; pokedex id

	db  52,  65,  50,  38,  45
	;   hp  atk  def  spd  spc

	db DARK, DRAGON ; type
	db 45 ; catch rate
	db  60 ; base exp

	INCBIN "gfx/pokemon/front/deino.pic", 0, 1
	dw DeinoPicFront, DeinoPicBack

	db TACKLE, DRAGON_RAGE, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  CRUNCH,       \
	     RAGE,         DRAGON_RAGE,  MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     REST,         SUBSTITUTE,   STRENGTH
	db BANK(DeinoPicFront)
	assert BANK(DeinoPicFront) == BANK(DeinoPicBack)