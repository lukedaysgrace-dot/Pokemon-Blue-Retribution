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

	tmhm CRUNCH       , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DRAGON_RAGE  , \
	     DOUBLE_TEAM  , REST         , THUNDER_WAVE , SUBSTITUTE   , STRENGTH
	db BANK(DeinoPicFront)
	assert BANK(DeinoPicFront) == BANK(DeinoPicBack)