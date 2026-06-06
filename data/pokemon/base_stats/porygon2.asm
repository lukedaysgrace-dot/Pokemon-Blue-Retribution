	db DEX_PORYGON2 ; pokedex id

	db  85,  80,  90,  60, 105
	;   hp  atk  def  spd  spc

IF DEF(_BLUE)
	db NORMAL, ELECTRIC ; type
ELSE
	db NORMAL, NORMAL ; type
ENDC
	db 45 ; catch rate
	db 180 ; base exp

	INCBIN "gfx/pokemon/front/porygon2.pic", 0, 1
	dw Porygon2PicFront, Porygon2PicBack

	db TACKLE, RECOVER, THUNDER_WAVE, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm TOXIC        , SHADOW_BALL  , TAKE_DOWN    , DOUBLE_EDGE  , ICE_BEAM     , \
	     BLIZZARD     , HYPER_BEAM   , SOLARBEAM    , THUNDERBOLT  , THUNDER      , \
	     PSYCHIC_M    , MIMIC        , DOUBLE_TEAM  , SWIFT        , DREAM_EATER  , \
	     REST         , THUNDER_WAVE , TRI_ATTACK   , SUBSTITUTE   , FLASH
	db BANK(Porygon2PicFront)
	assert BANK(Porygon2PicFront) == BANK(Porygon2PicBack)
