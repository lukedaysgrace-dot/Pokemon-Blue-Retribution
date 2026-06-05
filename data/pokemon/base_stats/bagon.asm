	db DEX_BAGON ; pokedex id

	db  45,  75,  60,  50,  40
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 89 ; base exp

	INCBIN "gfx/pokemon/front/bagon.pic", 0, 1
	dw BagonPicFront, BagonPicBack

	db BITE, LEER, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm CRUNCH       , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     RAGE         , DRAGON_RAGE  , MIMIC        , DOUBLE_TEAM  , FLAMETHROWER , \
	     FIRE_BLAST   , REST         , ROCK_SLIDE   , SUBSTITUTE   , CUT          , \
	     STRENGTH
	db BANK(BagonPicFront)
	assert BANK(BagonPicFront) == BANK(BagonPicBack)
