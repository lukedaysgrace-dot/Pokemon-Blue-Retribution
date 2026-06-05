	db DEX_HERACROSS ; pokedex id

	db  80, 125,  75,  85,  78
	;   hp  atk  def  spd  spc

	db BUG, FIGHTING ; type
	db 45 ; catch rate
	db 200 ; base exp

	INCBIN "gfx/pokemon/front/heracross.pic", 0, 1
	dw HeracrossPicFront, HeracrossPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm SWORDS_DANCE , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     HYPER_BEAM   , SUBMISSION   , COUNTER      , SEISMIC_TOSS , EARTHQUAKE   , \
	     DIG          , MIMIC        , DOUBLE_TEAM  , BIDE         , REST         , \
	     ROCK_SLIDE   , SUBSTITUTE   , CUT          , STRENGTH
	db BANK(HeracrossPicFront)
	assert BANK(HeracrossPicFront) == BANK(HeracrossPicBack)
