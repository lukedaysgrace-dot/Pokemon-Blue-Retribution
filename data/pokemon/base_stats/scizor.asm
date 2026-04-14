	db DEX_SCIZOR ; pokedex id

	db   70, 130, 100,  75,  68
	;   hp  atk  def  spd  spc

	db BUG, STEEL ; type
	db 25 ; catch rate
	db 200 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/scizor.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/scizor.pic", 0, 1
	dw ScizorPicFront, ScizorPicBack

	db QUICK_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         SUBSTITUTE,   CUT
	; end

	db 0 ; padding
