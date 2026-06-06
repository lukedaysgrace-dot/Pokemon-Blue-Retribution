	db DEX_NIDOQUEEN ; pokedex id

	db  90,  82,  87,  76,  75
	;   hp  atk  def  spd  spc

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 194 ; base exp

	INCBIN "gfx/pokemon/front/nidoqueen.pic", 0, 1 ; sprite dimensions
	dw NidoqueenPicFront, NidoqueenPicBack

	db TACKLE, SCRATCH, TAIL_WHIP, BODY_SLAM ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , CRUNCH       , MEGA_KICK    , TOXIC        , SHADOW_BALL  , \
	     BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , BUBBLEBEAM   , WATER_GUN    , \
	     ICE_BEAM     , BLIZZARD     , HYPER_BEAM   , SUBMISSION   , COUNTER      , \
	     SEISMIC_TOSS , PAY_DAY      , THUNDERBOLT  , THUNDER      , EARTHQUAKE   , \
	     FISSURE      , DIG          , MIMIC        , DOUBLE_TEAM  , REFLECT      , \
	     BIDE         , FLAMETHROWER , FIRE_BLAST   , SLUDGE_BOMB  , REST         , \
	     ROCK_SLIDE   , SUBSTITUTE   , CUT          , SURF         , STRENGTH
	; end

	db BANK(NidoqueenPicFront)
	assert BANK(NidoqueenPicFront) == BANK(NidoqueenPicBack)
