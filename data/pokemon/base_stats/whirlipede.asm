	db DEX_WHIRLIPEDE ; pokedex id

	db   40,  55,  99,  47,  60
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 120 ; catch rate
	db 72 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/whirlipede.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/whirlipede.pic", 0, 1
	dw WhirlipedePicFront, WhirlipedePicBack

	db HARDEN, POISON_STING, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         MEGA_DRAIN,   \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE
	; end

	db 0 ; padding
