	db DEX_SWINUB ; pokedex id

	db  50,  50,  40,  30,  30
	;   hp  atk  def  spd  spc

	db ICE, GROUND ; type
	db 225 ; catch rate
	db 78 ; base exp

	INCBIN "gfx/pokemon/front/swinub.pic", 0, 1
	dw SwinubPicFront, SwinubPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE
	db GROWTH_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    ICE_BEAM,     BLIZZARD,     \
	     EARTHQUAKE,   DIG,          DOUBLE_TEAM,  REST,         ROCK_SLIDE,   \
	     SUBSTITUTE
	db 0 ; padding
