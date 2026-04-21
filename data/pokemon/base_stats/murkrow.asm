	db DEX_MURKROW ; pokedex id

	db  60,  85,  42,  91,  42
	;   hp  atk  def  spd  spc

	db DARK, FLYING ; type
	db 30 ; catch rate
	db 107 ; base exp

	INCBIN "gfx/pokemon/front/murkrow.pic", 0, 1
	dw MurkrowPicFront, MurkrowPicBack

	db PECK, NO_MOVE, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm TOXIC,        MEGA_KICK,    RAZOR_WIND,   MIMIC,        DOUBLE_TEAM,  \
	     SWIFT,        SKY_ATTACK,   REST,         SUBSTITUTE,   FLY
	db 0 ; padding
