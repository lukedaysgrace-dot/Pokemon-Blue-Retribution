	db DEX_DONPHAN ; pokedex id

	db  90, 120, 120,  50,  60
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 60 ; catch rate
	db 189 ; base exp

	INCBIN "gfx/pokemon/front/donphan.pic", 0, 1
	dw DonphanPicFront, DonphanPicBack

	db HORN_ATTACK, GROWL, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,   HYPER_BEAM,   \
	     EARTHQUAKE,   DIG,          MIMIC,        DOUBLE_TEAM,   BIDE,         \
	     REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	db 0 ; padding
