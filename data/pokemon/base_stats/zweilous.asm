	db DEX_ZWEILOUS ; pokedex id

	db  72,  85,  70,  58,  65
	;   hp  atk  def  spd  spc

	db DARK, DRAGON ; type
	db 45 ; catch rate
	db 147 ; base exp

	INCBIN "gfx/pokemon/front/zweilous.pic", 0, 1
	dw ZweilousPicFront, ZweilousPicBack

	db TACKLE, BITE, DRAGON_RAGE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  CRUNCH,       \
	     RAGE,         DRAGON_RAGE,  MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     REST,         SUBSTITUTE,   STRENGTH
	db BANK(ZweilousPicFront)
	assert BANK(ZweilousPicFront) == BANK(ZweilousPicBack)