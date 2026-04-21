	db DEX_CROCONAW ; pokedex id

	db  65,  80,  65,  58,  59
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 143 ; base exp

	INCBIN "gfx/pokemon/front/croconaw.pic", 0, 1
	dw CroconawPicFront, CroconawPicBack

	db SCRATCH, LEER, WATER_GUN, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      RAGE,         DIG,          \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SKULL_BASH,   REST,         \
	     SUBSTITUTE,   CUT,          SURF,         STRENGTH,     FLASH
	db 0 ; padding
