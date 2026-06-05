	db DEX_PORYGONZ ; pokedex id

	db  85,  80,  70,  90, 135
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 185 ; base exp

	INCBIN "gfx/pokemon/front/porygon_z.pic", 0, 1
	dw PorygonZPicFront, PorygonZPicBack

	db TACKLE, PSYBEAM, AGILITY, TRI_ATTACK
	db GROWTH_MEDIUM_FAST

	tmhm TOXIC        , SHADOW_BALL  , TAKE_DOWN    , DOUBLE_EDGE  , ICE_BEAM     , \
	     BLIZZARD     , HYPER_BEAM   , SOLARBEAM    , THUNDERBOLT  , THUNDER      , \
	     PSYCHIC_M    , DOUBLE_TEAM  , SWIFT        , DREAM_EATER  , REST         , \
	     THUNDER_WAVE , TRI_ATTACK   , SUBSTITUTE   , FLASH
	db BANK(PorygonZPicFront)
	assert BANK(PorygonZPicFront) == BANK(PorygonZPicBack)