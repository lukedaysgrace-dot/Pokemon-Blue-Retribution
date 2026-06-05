	db DEX_KIRLIA ; pokedex id

	db  68,  35,  71,  60,  95
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 120 ; catch rate
	db 140 ; base exp

	INCBIN "gfx/pokemon/front/kirlia.pic", 0, 1
	dw KirliaPicFront, KirliaPicBack

	db CONFUSION, DOUBLE_TEAM, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm MEGA_PUNCH   , MEGA_KICK    , TOXIC        , SHADOW_BALL  , BODY_SLAM    , \
	     DOUBLE_EDGE  , HYPER_BEAM   , THUNDERBOLT  , PSYCHIC_M    , TELEPORT     , \
	     MIMIC        , DOUBLE_TEAM  , REFLECT      , METRONOME    , SWIFT        , \
	     DREAM_EATER  , REST         , THUNDER_WAVE , SUBSTITUTE   , FLASH
	db BANK(KirliaPicFront)
	assert BANK(KirliaPicFront) == BANK(KirliaPicBack)
