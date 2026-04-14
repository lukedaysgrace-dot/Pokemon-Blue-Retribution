	db DEX_TANGROWTH ; pokedex id

	db  100, 125, 100,  50,  80
	;   hp  atk  def  spd  spc

	db GRASS, GRASS ; type
	db 30 ; catch rate
	db 187 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/tangrowth.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/tangrowth.pic", 0, 1
	dw TangrowthPicFront, TangrowthPicBack

	db CONSTRICT, SHADOW_BALL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     MEGA_DRAIN,   SOLARBEAM,    RAGE,         MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   \
	     CUT
	; end

	db 0 ; padding
