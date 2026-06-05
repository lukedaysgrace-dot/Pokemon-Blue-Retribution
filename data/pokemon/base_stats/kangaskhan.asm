	db DEX_KANGASKHAN ; pokedex id

	db 105,  95,  80,  90,  40
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 175 ; base exp

	INCBIN "gfx/pokemon/front/kangaskhan.pic", 0, 1 ; sprite dimensions
	dw KangaskhanPicFront, KangaskhanPicBack

	db COMET_PUNCH, RAGE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , CRUNCH       , MEGA_KICK    , TOXIC        , SHADOW_BALL  , \
	     BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , BUBBLEBEAM   , WATER_GUN    , \
	     ICE_BEAM     , BLIZZARD     , HYPER_BEAM   , SUBMISSION   , COUNTER      , \
	     SEISMIC_TOSS , RAGE         , SOLARBEAM    , THUNDERBOLT  , THUNDER      , \
	     EARTHQUAKE   , FISSURE      , DIG          , MIMIC        , DOUBLE_TEAM  , \
	     BIDE         , FLAMETHROWER , FIRE_BLAST   , REST         , ROCK_SLIDE   , \
	     SUBSTITUTE   , CUT          , SURF         , STRENGTH
	; end

	db BANK(KangaskhanPicFront)
	assert BANK(KangaskhanPicFront) == BANK(KangaskhanPicBack)
