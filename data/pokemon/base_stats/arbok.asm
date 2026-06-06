	db DEX_ARBOK ; pokedex id

	db  70, 105,  79,  91,  75
	;   hp  atk  def  spd  spc

IF DEF(_BLUE)
	db POISON, DARK ; type
ELSE
	db POISON, POISON ; type
ENDC
	db 90 ; catch rate
	db 147 ; base exp

	INCBIN "gfx/pokemon/front/arbok.pic", 0, 1 ; sprite dimensions
	dw ArbokPicFront, ArbokPicBack

	db WRAP, LEER, POISON_STING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CRUNCH       , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     HYPER_BEAM   , MEGA_DRAIN   , EARTHQUAKE   , FISSURE      , \
	     DIG          , MIMIC        , DOUBLE_TEAM  , BIDE         , SLUDGE_BOMB  , \
	     REST         , ROCK_SLIDE   , SUBSTITUTE   , STRENGTH
	; end

	db BANK(ArbokPicFront)
	assert BANK(ArbokPicFront) == BANK(ArbokPicBack)
