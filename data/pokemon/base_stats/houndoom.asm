	db DEX_HOUNDOOM ; pokedex id

	db  75,  90,  50,  95, 110
	;   hp  atk  def  spd  spc

	db DARK, FIRE ; type
	db 45 ; catch rate
	db 204 ; base exp

	INCBIN "gfx/pokemon/front/houndoom.pic", 0, 1
	dw HoundoomPicFront, HoundoomPicBack

	db LEER, EMBER, SMOG, NO_MOVE
	db GROWTH_SLOW

	tmhm CRUNCH       , TOXIC        , SHADOW_BALL  , BODY_SLAM    , TAKE_DOWN    , \
	     DOUBLE_EDGE  , HYPER_BEAM   , COUNTER      , SOLARBEAM    , DIG          , \
	     MIMIC        , DOUBLE_TEAM  , FLAMETHROWER , FIRE_BLAST   , SWIFT        , \
	     SLUDGE_BOMB  , DREAM_EATER  , REST         , SUBSTITUTE   , STRENGTH
	db BANK(HoundoomPicFront)
	assert BANK(HoundoomPicFront) == BANK(HoundoomPicBack)
