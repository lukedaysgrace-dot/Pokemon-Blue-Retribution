	db DEX_CRANIDOS ; pokedex id

	db  67, 105,  50,  58,  45
	;   hp  atk  def  spd  spc

	db ROCK, ROCK ; type
	db 45 ; catch rate
	db 119 ; base exp

	INCBIN "gfx/pokemon/front/cranidos.pic", 0, 1
	dw CranidosPicFront, CranidosPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm SWORDS_DANCE , CRUNCH       , TOXIC        , BODY_SLAM    , TAKE_DOWN    , \
	     DOUBLE_EDGE  , ICE_BEAM     , BLIZZARD     , RAGE         , THUNDERBOLT  , \
	     THUNDER      , EARTHQUAKE   , FISSURE      , DIG          , DOUBLE_TEAM  , \
	     FLAMETHROWER , FIRE_BLAST   , REST         , ROCK_SLIDE   , SUBSTITUTE   , \
	     STRENGTH
	db BANK(CranidosPicFront)
	assert BANK(CranidosPicFront) == BANK(CranidosPicBack)
