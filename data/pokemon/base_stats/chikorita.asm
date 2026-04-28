	db DEX_CHIKORITA ; pokedex id

	db  45,  49,  49,  45,  65
	;   hp  atk  def  spd  spc

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 64 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/chikorita.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/chikorita.pic", 0, 1
	dw ChikoritaPicFront, ChikoritaPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     MEGA_DRAIN,   SOLARBEAM,    DIG,          MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         REST,         SUBSTITUTE,   \
	     CUT
	db 0 ; padding
