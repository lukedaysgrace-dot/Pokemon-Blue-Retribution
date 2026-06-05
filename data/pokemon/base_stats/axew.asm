	db DEX_AXEW ; pokedex id

	db  46,  87,  60,  57,  30
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 75 ; catch rate
	db  64 ; base exp

	INCBIN "gfx/pokemon/front/axew.pic", 0, 1
	dw AxewPicFront, AxewPicBack

	db SCRATCH, LEER, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm RAZOR_WIND   , SWORDS_DANCE , CRUNCH       , TOXIC        , TAKE_DOWN    , \
	     DOUBLE_EDGE  , COUNTER      , DRAGON_RAGE  , DIG          , DOUBLE_TEAM  , \
	     SWIFT        , REST         , SUBSTITUTE   , CUT          , SURF         , \
	     STRENGTH
	db BANK(AxewPicFront)
	assert BANK(AxewPicFront) == BANK(AxewPicBack)