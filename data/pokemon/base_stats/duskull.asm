	db DEX_DUSKULL ; pokedex id

	db  50,  40,  60,  25,  60
	;   hp  atk  def  spd  spc

	db GHOST, GHOST ; type
	db 190 ; catch rate
	db 97 ; base exp

	INCBIN "gfx/pokemon/front/duskull.pic", 0, 1
	dw DuskullPicFront, DuskullPicBack

	db CONFUSE_RAY, NIGHT_SHADE, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC        , SHADOW_BALL  , BODY_SLAM    , DOUBLE_EDGE  , ICE_BEAM     , \
	     BLIZZARD     , PSYCHIC_M    , MIMIC        , DOUBLE_TEAM  , DREAM_EATER  , \
	     REST         , SUBSTITUTE   , FLASH
	db BANK(DuskullPicFront)
	assert BANK(DuskullPicFront) == BANK(DuskullPicBack)
