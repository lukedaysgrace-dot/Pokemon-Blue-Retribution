	db DEX_HYDREIGON ; pokedex id

	db  92, 115,  90,  98, 105
	;   hp  atk  def  spd  spc

	db DARK, DRAGON ; type
	db 45 ; catch rate
	db 243 ; base exp

	INCBIN "gfx/pokemon/front/hydreigon.pic", 0, 1
	dw HydreigonPicFront, HydreigonPicBack

	db BITE, DRAGON_RAGE, HEADBUTT, NO_MOVE
	db GROWTH_SLOW

	tmhm CRUNCH       , TOXIC        , BODY_SLAM    , TAKE_DOWN    , HYPER_BEAM   , \
	     DRAGON_RAGE  , EARTHQUAKE   , DOUBLE_TEAM  , REFLECT      , FLAMETHROWER , \
	     FIRE_BLAST   , REST         , THUNDER_WAVE , ROCK_SLIDE   , TRI_ATTACK   , \
	     SUBSTITUTE   , FLY          , SURF         , STRENGTH
	db BANK(HydreigonPicFront)
	assert BANK(HydreigonPicFront) == BANK(HydreigonPicBack)