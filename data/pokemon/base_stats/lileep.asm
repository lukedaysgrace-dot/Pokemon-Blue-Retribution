	db DEX_LILEEP ; pokedex id

	db  66,  41,  77,  23,  74
	;   hp  atk  def  spd  spc

	db ROCK, GRASS ; type
	db 45 ; catch rate
	db 121 ; base exp

	INCBIN "gfx/pokemon/front/lileep.pic", 0, 1
	dw LileepPicFront, LileepPicBack

	db CONSTRICT, ACID, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm SWORDS_DANCE , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     BUBBLEBEAM   , WATER_GUN    , RAGE         , MEGA_DRAIN   , SOLARBEAM    , \
	     MIMIC        , DOUBLE_TEAM  , BIDE         , SLUDGE_BOMB  , REST         , \
	     ROCK_SLIDE   , SUBSTITUTE   , FLASH
	db BANK(LileepPicFront)
	assert BANK(LileepPicFront) == BANK(LileepPicBack)
