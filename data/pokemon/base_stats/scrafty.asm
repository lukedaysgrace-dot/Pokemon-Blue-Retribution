	db DEX_SCRAFTY ; pokedex id

	db  65,  90, 115,  58,  45
	;   hp  atk  def  spd  spc

	db DARK, FIGHTING ; type
	db 90 ; catch rate
	db 171 ; base exp

	INCBIN "gfx/pokemon/front/scrafty.pic", 0, 1
	dw ScraftyPicFront, ScraftyPicBack

	db TACKLE, LEER, LOW_KICK, CRUNCH
	db GROWTH_MEDIUM_FAST

	tmhm MEGA_PUNCH   , SWORDS_DANCE , CRUNCH       , MEGA_KICK    , TOXIC        , \
	     BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , HYPER_BEAM   , SUBMISSION   , \
	     COUNTER      , SEISMIC_TOSS , DIG          , MIMIC        , \
	     DOUBLE_TEAM  , BIDE         , METRONOME    , SLUDGE_BOMB  , REST         , \
	     ROCK_SLIDE   , SUBSTITUTE   , STRENGTH
	db BANK(ScraftyPicFront)
	assert BANK(ScraftyPicFront) == BANK(ScraftyPicBack)