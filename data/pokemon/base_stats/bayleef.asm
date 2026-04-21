	db DEX_BAYLEEF ; pokedex id

	db  60,  62,  80,  60,  80
	;   hp  atk  def  spd  spc

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 142 ; base exp

	INCBIN "gfx/pokemon/front/bayleef.pic", 0, 1
	dw BayleefPicFront, BayleefPicBack

	db POUND, GROWL, RAZOR_LEAF, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     MEGA_DRAIN,   SOLARBEAM,    DIG,          MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         REST,         SUBSTITUTE,   \
	     CUT
	db 0 ; padding
