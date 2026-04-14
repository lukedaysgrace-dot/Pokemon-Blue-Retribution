	db DEX_KINGDRA ; pokedex id

	db   75,  95,  95,  85,  95
	;   hp  atk  def  spd  spc

	db WATER, DRAGON ; type
	db 45 ; catch rate
	db 243 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/kingdra.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/kingdra.pic", 0, 1
	dw KingdraPicFront, KingdraPicBack

	db BUBBLE, SMOKESCREEN, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	db 0 ; padding
