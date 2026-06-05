	db DEX_RHYDON ; pokedex id

	db 115, 130, 110,  40,  45
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 60 ; catch rate
	db 204 ; base exp

	INCBIN "gfx/pokemon/front/rhydon.pic", 0, 1 ; sprite dimensions
	dw RhydonPicFront, RhydonPicBack

	db HORN_ATTACK, STOMP, TAIL_WHIP, FURY_ATTACK ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , SWORDS_DANCE , CRUNCH       , MEGA_KICK    , TOXIC        , \
	     BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , BUBBLEBEAM   , WATER_GUN    , \
	     ICE_BEAM     , BLIZZARD     , HYPER_BEAM   , SUBMISSION   , COUNTER      , \
	     SEISMIC_TOSS , RAGE         , THUNDERBOLT  , THUNDER      , EARTHQUAKE   , \
	     FISSURE      , DIG          , MIMIC        , DOUBLE_TEAM  , BIDE         , \
	     FLAMETHROWER , FIRE_BLAST   , REST         , ROCK_SLIDE   , SUBSTITUTE   , \
	     CUT          , SURF         , STRENGTH
	; end

	db BANK(RhydonPicFront)
	assert BANK(RhydonPicFront) == BANK(RhydonPicBack)
