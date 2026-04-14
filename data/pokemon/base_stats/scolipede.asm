	db DEX_SCOLIPEDE ; pokedex id

	db   60, 100,  89, 112,  62
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 45 ; catch rate
	db 173 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/scolipede.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/scolipede.pic", 0, 1
	dw ScolipedePicFront, ScolipedePicBack

	db POISON_STING, STRING_SHOT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MEGA_DRAIN,   MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   CUT
	; end

	db 0 ; padding
