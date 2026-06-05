	db DEX_GRIMER ; pokedex id

	db  80,  80,  50,  25,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/grimer.pic", 0, 1 ; sprite dimensions
	dw GrimerPicFront, GrimerPicBack

	db TACKLE, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC        , SHADOW_BALL  , BODY_SLAM    , TAKE_DOWN    , RAGE         , \
	     MEGA_DRAIN   , THUNDERBOLT  , THUNDER      , DIG          , MIMIC        , \
	     DOUBLE_TEAM  , BIDE         , METRONOME    , SELFDESTRUCT , FLAMETHROWER , \
	     FIRE_BLAST   , SLUDGE_BOMB  , REST         , EXPLOSION    , ROCK_SLIDE   , \
	     SUBSTITUTE   , STRENGTH
	; end

	db BANK(GrimerPicFront)
	assert BANK(GrimerPicFront) == BANK(GrimerPicBack)
