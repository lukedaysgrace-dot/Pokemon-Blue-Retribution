	db DEX_HERACROSS ; pokedex id

	db  80, 125,  75,  85,  78
	;   hp  atk  def  spd  spc

	db BUG, FIGHTING ; type
	db 45 ; catch rate
	db 200 ; base exp

	INCBIN "gfx/pokemon/front/heracross.pic", 0, 1
	dw HeracrossPicFront, HeracrossPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    SUBMISSION,   \
	     HYPER_BEAM,   DIG,          DOUBLE_TEAM,  REST,         ROCK_SLIDE,   \
	     SUBSTITUTE,   CUT,          STRENGTH
	db BANK(HeracrossPicFront)
	assert BANK(HeracrossPicFront) == BANK(HeracrossPicBack)
