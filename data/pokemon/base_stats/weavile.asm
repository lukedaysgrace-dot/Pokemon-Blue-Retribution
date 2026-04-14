	db DEX_WEAVILE ; pokedex id

	db   70, 120,  65, 125,  65
	;   hp  atk  def  spd  spc

	db DARK, ICE ; type
	db 45 ; catch rate
	db 199 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/weavile.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/weavile.pic", 0, 1
	dw WeavilePicFront, WeavilePicBack

	db SCRATCH, LEER, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db 0 ; padding
