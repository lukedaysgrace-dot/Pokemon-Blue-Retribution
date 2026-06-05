	db DEX_HOUNDOUR ; pokedex id

	db  45,  60,  30,  65,  80
	;   hp  atk  def  spd  spc

	db DARK, FIRE ; type
	db 120 ; catch rate
	db 114 ; base exp

	INCBIN "gfx/pokemon/front/houndour.pic", 0, 1
	dw HoundourPicFront, HoundourPicBack

	db LEER, EMBER, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm CRUNCH       , TOXIC        , SHADOW_BALL  , BODY_SLAM    , TAKE_DOWN    , \
	     DOUBLE_EDGE  , COUNTER      , RAGE         , SOLARBEAM    , DIG          , \
	     MIMIC        , DOUBLE_TEAM  , FLAMETHROWER , FIRE_BLAST   , SWIFT        , \
	     SLUDGE_BOMB  , DREAM_EATER  , REST         , SUBSTITUTE
	db BANK(HoundourPicFront)
	assert BANK(HoundourPicFront) == BANK(HoundourPicBack)
