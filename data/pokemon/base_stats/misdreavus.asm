	db DEX_MISDREAVUS ; pokedex id

	db  60,  60,  60,  85,  85
	;   hp  atk  def  spd  spc

	db GHOST, GHOST ; type
	db 45 ; catch rate
	db 147 ; base exp

	INCBIN "gfx/pokemon/front/misdreavus.pic", 0, 1
	dw MisdreavusPicFront, MisdreavusPicBack

	db PSYWAVE, CONFUSE_RAY, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm TOXIC,        THUNDERBOLT,  THUNDER,      PSYCHIC_M,    MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         DREAM_EATER,  REST,         SUBSTITUTE
	db 0 ; padding
