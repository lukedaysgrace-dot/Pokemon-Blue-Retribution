	db DEX_GARDEVOIR ; pokedex id

	db  70,  50,  80,  80, 125
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 208 ; base exp

	INCBIN "gfx/pokemon/front/gardevoir.pic", 0, 1
	dw GardevoirPicFront, GardevoirPicBack

	db CONFUSION, DOUBLE_TEAM, TELEPORT, NO_MOVE
	db GROWTH_SLOW

	tmhm MEGA_PUNCH   , MEGA_KICK    , TOXIC        , SHADOW_BALL  , BODY_SLAM    , \
	     DOUBLE_EDGE  , HYPER_BEAM   , THUNDERBOLT  , PSYCHIC_M    , TELEPORT     , \
	     MIMIC        , DOUBLE_TEAM  , REFLECT      , METRONOME    , SWIFT        , \
	     DREAM_EATER  , REST         , THUNDER_WAVE , SUBSTITUTE   , FLASH
	db BANK(GardevoirPicFront)
	assert BANK(GardevoirPicFront) == BANK(GardevoirPicBack)
