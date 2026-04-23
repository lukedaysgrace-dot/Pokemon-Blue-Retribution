	db DEX_CROAGUNK ; pokedex id

	db  48,  61,  40,  50,  50
	;   hp  atk  def  spd  spc

	db POISON, FIGHTING ; type
	db 150 ; catch rate
	db  97 ; base exp

	INCBIN "gfx/pokemon/front/croagunk.pic", 0, 1 ; sprite dimensions
	dw CroagunkPicFront, CroagunkPicBack

	db POISON_STING, POUND, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  SUBMISSION,   \
	     DIG,          MIMIC,        DOUBLE_TEAM,  ROCK_SLIDE,   REST,         \
	     SUBSTITUTE,   STRENGTH
	; end

	db 0 ; padding
