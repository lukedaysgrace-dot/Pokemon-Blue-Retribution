	db DEX_ARMALDO ; pokedex id

	db  75, 125, 100,  55,  85
	;   hp  atk  def  spd  spc

	db ROCK, BUG ; type
	db 45 ; catch rate
	db 199 ; base exp

	INCBIN "gfx/pokemon/front/armaldo.pic", 0, 1
	dw ArmaldoPicFront, ArmaldoPicBack

	db SCRATCH, HARDEN, WATER_GUN, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm SWORDS_DANCE , TOXIC        , BODY_SLAM    , DOUBLE_EDGE  , WATER_GUN    , \
	     HYPER_BEAM   , METAL_CLAW   , SEISMIC_TOSS , EARTHQUAKE   , DIG          , \
	     MIMIC        , DOUBLE_TEAM  , REST         , ROCK_SLIDE   , SUBSTITUTE   , \
	     CUT          , STRENGTH
	db BANK(ArmaldoPicFront)
	assert BANK(ArmaldoPicFront) == BANK(ArmaldoPicBack)
