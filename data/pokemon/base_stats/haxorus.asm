	db DEX_HAXORUS ; pokedex id

	db  76, 147,  90,  97,  60
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 243 ; base exp

	INCBIN "gfx/pokemon/front/haxorus.pic", 0, 1
	dw HaxorusPicFront, HaxorusPicBack

	db SCRATCH, LEER, DRAGON_RAGE, SLASH
	db GROWTH_SLOW

	tmhm SWORDS_DANCE , CRUNCH       , TOXIC        , BODY_SLAM    , TAKE_DOWN    , \
	     DOUBLE_EDGE  , HYPER_BEAM   , DRAGON_RAGE  , EARTHQUAKE   , DIG          , \
	     DOUBLE_TEAM  , SWIFT        , REST         , ROCK_SLIDE   , SUBSTITUTE   , \
	     CUT          , SURF         , STRENGTH
	db BANK(HaxorusPicFront)
	assert BANK(HaxorusPicFront) == BANK(HaxorusPicBack)