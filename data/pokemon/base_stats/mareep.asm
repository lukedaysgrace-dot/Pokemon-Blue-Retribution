	db DEX_MAREEP ; pokedex id

	db  55,  40,  40,  35,  50
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 235 ; catch rate
	db  56 ; base exp

	INCBIN "gfx/pokemon/front/mareep.pic", 0, 1
	dw MareepPicFront, MareepPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  THUNDERBOLT,  \
	     THUNDER,      MIMIC,        DOUBLE_TEAM,  BIDE,         REST,         \
	     THUNDER_WAVE, SUBSTITUTE,   FLASH
	db BANK(MareepPicFront)
	assert BANK(MareepPicFront) == BANK(MareepPicBack)
