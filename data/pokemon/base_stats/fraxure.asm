	db DEX_FRAXURE ; pokedex id

	db  66, 117,  70,  67,  40
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 60 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/front/fraxure.pic", 0, 1
	dw FraxurePicFront, FraxurePicBack

	db SCRATCH, LEER, DRAGON_RAGE, NO_MOVE
	db GROWTH_SLOW

	tmhm SWORDS_DANCE , CRUNCH       , TOXIC        , TAKE_DOWN    , DOUBLE_EDGE  , \
	     DRAGON_RAGE  , DIG          , DOUBLE_TEAM  , SWIFT        , REST         , \
	     SUBSTITUTE   , CUT          , SURF         , STRENGTH
	db BANK(FraxurePicFront)
	assert BANK(FraxurePicFront) == BANK(FraxurePicBack)