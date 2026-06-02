	db DEX_CHINCHOU ; pokedex id

	db  75,  38,  38,  67,  56
	;   hp  atk  def  spd  spc

	db WATER, ELECTRIC ; type
	db 190 ; catch rate
	db  88 ; base exp

	INCBIN "gfx/pokemon/front/chinchou.pic", 0, 1
	dw ChinchouPicFront, ChinchouPicBack

	db BUBBLEBEAM, THUNDERSHOCK, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    THUNDERBOLT,  THUNDER,      MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         REST,         THUNDER_WAVE, SUBSTITUTE,   SURF,         \
	     FLASH
	db BANK(ChinchouPicFront)
	assert BANK(ChinchouPicFront) == BANK(ChinchouPicBack)
