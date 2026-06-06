	db DEX_SALAMENCE ; pokedex id

	db  95, 135,  80, 100,  90
	;   hp  atk  def  spd  spc

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front/salamence.pic", 0, 1
	dw SalamencePicFront, SalamencePicBack

	db BITE, LEER, HEADBUTT, EMBER
	db GROWTH_SLOW

	tmhm CRUNCH       , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     HYPER_BEAM   , EARTHQUAKE   , MIMIC        , DOUBLE_TEAM  , \
	     FLAMETHROWER , FIRE_BLAST   , SWIFT        , REST         , ROCK_SLIDE   , \
	     SUBSTITUTE   , CUT          , FLY          , STRENGTH
	db BANK(SalamencePicFront)
	assert BANK(SalamencePicFront) == BANK(SalamencePicBack)
