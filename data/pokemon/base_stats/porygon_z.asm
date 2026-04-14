	db DEX_PORYGON_Z ; pokedex id

	db   85,  80,  70,  90, 105
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 185 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/porygon_z.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/porygon_z.pic", 0, 1
	dw PorygonZPicFront, PorygonZPicBack

	db TACKLE, METAL_CLAW, STEEL_WING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   RAGE,         THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,      \
	     TRI_ATTACK,   SUBSTITUTE,   FLASH
	; end

	db 0 ; padding
