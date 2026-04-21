	db DEX_MISMAGIUS ; pokedex id

	db  60,  60,  60, 105, 105
	;   hp  atk  def  spd  spc

	db GHOST, GHOST ; type
	db 45 ; catch rate
	db 187 ; base exp

	INCBIN "gfx/pokemon/front/mismagius.pic", 0, 1
	dw MismagiusPicFront, MismagiusPicBack

	db PSYWAVE, CONFUSE_RAY, SHADOW_BALL, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm TOXIC,        HYPER_BEAM,   THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         DREAM_EATER,  REST,         \
	     SUBSTITUTE
	db 0 ; padding
