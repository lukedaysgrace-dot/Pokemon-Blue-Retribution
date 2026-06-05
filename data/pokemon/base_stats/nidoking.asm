	db DEX_NIDOKING ; pokedex id

	db  81,  92,  77,  85,  75
	;   hp  atk  def  spd  spc

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 195 ; base exp

	INCBIN "gfx/pokemon/front/nidoking.pic", 0, 1 ; sprite dimensions
	dw NidokingPicFront, NidokingPicBack

	db TACKLE, HORN_ATTACK, POISON_STING, THRASH ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , MEGA_KICK    , TOXIC        , SHADOW_BALL  , BODY_SLAM    , \
	     TAKE_DOWN    , DOUBLE_EDGE  , BUBBLEBEAM   , WATER_GUN    , ICE_BEAM     , \
	     BLIZZARD     , HYPER_BEAM   , SUBMISSION   , COUNTER      , SEISMIC_TOSS , \
	     RAGE         , THUNDERBOLT  , THUNDER      , EARTHQUAKE   , FISSURE      , \
	     DIG          , MIMIC        , DOUBLE_TEAM  , REFLECT      , BIDE         , \
	     FLAMETHROWER , FIRE_BLAST   , SLUDGE_BOMB  , REST         , ROCK_SLIDE   , \
	     SUBSTITUTE   , CUT          , SURF         , STRENGTH
	; end

	db BANK(NidokingPicFront)
	assert BANK(NidokingPicFront) == BANK(NidokingPicBack)
