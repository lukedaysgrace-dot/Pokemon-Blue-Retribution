	db DEX_BISHARP ; pokedex id

	db  65, 125, 100,  70,  60
	;   hp  atk  def  spd  spc

	db DARK, STEEL ; type
	db 45 ; catch rate
	db 172 ; base exp

	INCBIN "gfx/pokemon/front/bisharp.pic", 0, 1
	dw BisharpPicFront, BisharpPicBack

	db SCRATCH, LEER, METAL_CLAW, CRUNCH
	db GROWTH_MEDIUM_FAST

	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  CRUNCH,       \
	     HYPER_BEAM,   RAGE,         DIG,          MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         SWIFT,        REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     CUT
	db BANK(BisharpPicFront)
	assert BANK(BisharpPicFront) == BANK(BisharpPicBack)