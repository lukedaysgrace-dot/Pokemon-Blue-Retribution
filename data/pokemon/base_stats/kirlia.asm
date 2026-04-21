	db DEX_KIRLIA ; pokedex id

	db  38,  35,  35,  50,  55
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 120 ; catch rate
	db 140 ; base exp

	INCBIN "gfx/pokemon/front/kirlia.pic", 0, 1
	dw KirliaPicFront, KirliaPicBack

	db CONFUSION, DOUBLE_TEAM, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    PSYCHIC_M,    DOUBLE_TEAM,  \
	     REFLECT,      REST,         SUBSTITUTE
	db 0 ; padding
