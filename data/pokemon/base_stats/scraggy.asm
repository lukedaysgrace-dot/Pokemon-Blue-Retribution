	db DEX_SCRAGGY ; pokedex id

	db  50,  75,  70,  48,  35
	;   hp  atk  def  spd  spc

	db DARK, FIGHTING ; type
	db 180 ; catch rate
	db  70 ; base exp

	INCBIN "gfx/pokemon/front/scraggy.pic", 0, 1
	dw ScraggyPicFront, ScraggyPicBack

	db TACKLE, LEER, LOW_KICK, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm MEGA_PUNCH   , CRUNCH       , MEGA_KICK    , TOXIC        , BODY_SLAM    , \
	     TAKE_DOWN    , DOUBLE_EDGE  , SUBMISSION   , COUNTER      , SEISMIC_TOSS , \
	     DIG          , MIMIC        , DOUBLE_TEAM  , BIDE         , \
	     SLUDGE_BOMB  , REST         , ROCK_SLIDE   , SUBSTITUTE   , STRENGTH
	db BANK(ScraggyPicFront)
	assert BANK(ScraggyPicFront) == BANK(ScraggyPicBack)