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

	tmhm CRUNCH       , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DRAGON_RAGE  , \
	     DOUBLE_TEAM  , REST         , THUNDER_WAVE , SUBSTITUTE   , STRENGTH
	db BANK(ZweilousPicFront)
	assert BANK(ZweilousPicFront) == BANK(ZweilousPicBack)