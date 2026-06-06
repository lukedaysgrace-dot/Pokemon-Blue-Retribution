	db DEX_SHELGON ; pokedex id

	db  65,  95, 100,  50,  50
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 147 ; base exp

	INCBIN "gfx/pokemon/front/shelgon.pic", 0, 1
	dw ShelgonPicFront, ShelgonPicBack

	db BITE, LEER, HEADBUTT, NO_MOVE
	db GROWTH_SLOW

	tmhm CRUNCH       , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     MIMIC        , DOUBLE_TEAM  , FLAMETHROWER , FIRE_BLAST   , \
	     REST         , ROCK_SLIDE   , SUBSTITUTE   , CUT          , STRENGTH
	db BANK(ShelgonPicFront)
	assert BANK(ShelgonPicFront) == BANK(ShelgonPicBack)
