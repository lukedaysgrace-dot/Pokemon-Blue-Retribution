	db DEX_PAWNIARD ; pokedex id

	db  45,  85,  70,  60,  40
	;   hp  atk  def  spd  spc

	db DARK, STEEL ; type
	db 120 ; catch rate
	db  68 ; base exp

	INCBIN "gfx/pokemon/front/pawniard.pic", 0, 1
	dw PawniardPicFront, PawniardPicBack

	db SCRATCH, LEER, METAL_CLAW, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  CRUNCH,       \
	     RAGE,         DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        REST,         ROCK_SLIDE,   SUBSTITUTE,   CUT
	db BANK(PawniardPicFront)
	assert BANK(PawniardPicFront) == BANK(PawniardPicBack)