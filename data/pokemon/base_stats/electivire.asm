	db DEX_ELECTIVIRE ; pokedex id

	db   75, 123,  67,  95,  90
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 30 ; catch rate
	db 199 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/electivire.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/electivire.pic", 0, 1
	dw ElectivirePicFront, ElectivirePicBack

	db QUICK_ATTACK, LEER, THUNDERSHOCK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         THUNDERBOLT,  THUNDER,      PSYCHIC_M,    MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      BIDE,         METRONOME,    SWIFT,        \
	     SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,      SUBSTITUTE,   \
	     FLASH,        STRENGTH
	; end

	db 0 ; padding
