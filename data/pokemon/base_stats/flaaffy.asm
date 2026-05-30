	db DEX_FLAAFFY ; pokedex id

	db  70,  55,  55,  45,  70
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 120 ; catch rate
	db 117 ; base exp

	INCBIN "gfx/pokemon/front/flaaffy.pic", 0, 1
	dw FlaaffyPicFront, FlaaffyPicBack

	db TACKLE, GROWL, THUNDERSHOCK, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  THUNDERBOLT,  \
	     THUNDER,      MIMIC,        DOUBLE_TEAM,  BIDE,         REST,         \
	     THUNDER_WAVE, SUBSTITUTE,   FLASH
	db BANK(FlaaffyPicFront)
	assert BANK(FlaaffyPicFront) == BANK(FlaaffyPicBack)
