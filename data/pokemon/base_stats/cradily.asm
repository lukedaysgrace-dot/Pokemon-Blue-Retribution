	db DEX_CRADILY ; pokedex id

	db  96,  91, 107,  43, 103
	;   hp  atk  def  spd  spc

	db ROCK, GRASS ; type
	db 45 ; catch rate
	db 201 ; base exp

	INCBIN "gfx/pokemon/front/cradily.pic", 0, 1
	dw CradilyPicFront, CradilyPicBack

	db CONSTRICT, ACID, MEGA_DRAIN, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm SWORDS_DANCE , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     BUBBLEBEAM   , WATER_GUN    , HYPER_BEAM   , MEGA_DRAIN   , \
	     SOLARBEAM    , EARTHQUAKE   , DIG          , MIMIC        , DOUBLE_TEAM  , \
	     BIDE         , SLUDGE_BOMB  , REST         , ROCK_SLIDE   , SUBSTITUTE   , \
	     STRENGTH     , FLASH
	db BANK(CradilyPicFront)
	assert BANK(CradilyPicFront) == BANK(CradilyPicBack)
