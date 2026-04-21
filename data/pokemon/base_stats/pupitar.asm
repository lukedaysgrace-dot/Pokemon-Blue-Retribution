	db DEX_PUPITAR ; pokedex id

	db  70,  84,  70,  51,  70
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/front/pupitar.pic", 0, 1
	dw PupitarPicFront, PupitarPicBack

	db BITE, SAND_ATTACK, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    ROCK_SLIDE,   DIG,          DOUBLE_TEAM,  \
	     REST,         SUBSTITUTE
	db 0 ; padding
