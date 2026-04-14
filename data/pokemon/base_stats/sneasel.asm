	db DEX_SNEASEL ; pokedex id

	db   55,  95,  55, 115,  55
	;   hp  atk  def  spd  spc

	db DARK, ICE ; type
	db 60 ; catch rate
	db 132 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/sneasel.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/sneasel.pic", 0, 1
	dw SneaselPicFront, SneaselPicBack

	db SCRATCH, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db 0 ; padding
