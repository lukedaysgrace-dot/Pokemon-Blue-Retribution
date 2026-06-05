	db DEX_LUCARIO ; pokedex id

	db  70, 110,  70,  90, 93
	;   hp  atk  def  spd  spc

	db FIGHTING, STEEL ; type
	db 45 ; catch rate
	db 204 ; base exp

	INCBIN "gfx/pokemon/front/lucario.pic", 0, 1
	dw LucarioPicFront, LucarioPicBack

	db QUICK_ATTACK, COUNTER, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm MEGA_PUNCH   , SWORDS_DANCE , CRUNCH       , MEGA_KICK    , TOXIC        , \
	     SHADOW_BALL  , BODY_SLAM    , TAKE_DOWN    , HYPER_BEAM   , METAL_CLAW   , \
	     SUBMISSION   , COUNTER      , EARTHQUAKE   , DIG          , PSYCHIC_M    , \
	     DOUBLE_TEAM  , METRONOME    , SWIFT        , REST         , ROCK_SLIDE   , \
	     SUBSTITUTE   , STRENGTH
	db BANK(LucarioPicFront)
	assert BANK(LucarioPicFront) == BANK(LucarioPicBack)
