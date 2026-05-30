	db DEX_MIMIKYU ; pokedex id

	db  55,  90,  80,  96,  78
	;   hp  atk  def  spd  spc

	db GHOST, DARK ; type
	db 45 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front/mimikyu.pic", 0, 1
	dw MimikyuPicFront, MimikyuPicBack

	db SCRATCH, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  BIDE,         REST,         \
	     SUBSTITUTE,   FLASH
	; end

	db BANK(MimikyuPicFront)
	assert BANK(MimikyuPicFront) == BANK(MimikyuPicBack)
