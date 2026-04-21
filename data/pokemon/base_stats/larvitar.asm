	db DEX_LARVITAR ; pokedex id

	db  50,  64,  50,  41,  50
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 67 ; base exp

	INCBIN "gfx/pokemon/front/larvitar.pic", 0, 1
	dw LarvitarPicFront, LarvitarPicBack

	db BITE, NO_MOVE, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    ROCK_SLIDE,   DIG,          DOUBLE_TEAM,  \
	     REST,         SUBSTITUTE
	db 0 ; padding
