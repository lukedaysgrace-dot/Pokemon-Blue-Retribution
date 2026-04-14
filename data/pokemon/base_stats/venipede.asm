	db DEX_VENIPEDE ; pokedex id

	db   30,  45,  59,  57,  35
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 255 ; catch rate
	db 52 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/venipede.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/venipede.pic", 0, 1
	dw VenipedePicFront, VenipedePicBack

	db POISON_STING, STRING_SHOT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         MEGA_DRAIN,   \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE
	; end

	db 0 ; padding
