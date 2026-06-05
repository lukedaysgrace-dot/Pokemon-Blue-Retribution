	db DEX_DUSCLOPS ; pokedex id

	db  90,  60, 110,  25,  85
	;   hp  atk  def  spd  spc

	db GHOST, GHOST ; type
	db 90 ; catch rate
	db 147 ; base exp

	INCBIN "gfx/pokemon/front/dusclops.pic", 0, 1
	dw DusclopsPicFront, DusclopsPicBack

	db CONFUSE_RAY, NIGHT_SHADE, DISABLE, NO_MOVE
	db GROWTH_SLOW

	tmhm MEGA_PUNCH   , MEGA_KICK    , TOXIC        , SHADOW_BALL  , BODY_SLAM    , \
	     DOUBLE_EDGE  , ICE_BEAM     , BLIZZARD     , HYPER_BEAM   , COUNTER      , \
	     SEISMIC_TOSS , EARTHQUAKE   , PSYCHIC_M    , MIMIC        , DOUBLE_TEAM  , \
	     METRONOME    , DREAM_EATER  , REST         , ROCK_SLIDE   , SUBSTITUTE   , \
	     STRENGTH     , FLASH
	db BANK(DusclopsPicFront)
	assert BANK(DusclopsPicFront) == BANK(DusclopsPicBack)
