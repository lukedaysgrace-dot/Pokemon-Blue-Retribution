	db DEX_GOLETT ; pokedex id

	db  44,  70,  50,  35,  55
	;   hp  atk  def  spd  spc

	db GROUND, GHOST ; type
	db 190 ; catch rate
	db 89 ; base exp

	INCBIN "gfx/pokemon/front/golett.pic", 0, 1
	dw GolettPicFront, GolettPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm MEGA_PUNCH,   TOXIC,        BODY_SLAM,    EARTHQUAKE,   DIG,          \
	     DOUBLE_TEAM,  REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	db 0 ; padding
