	db DEX_LICKITUNG ; pokedex id

	db  90,  55,  75,  30,  60
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 127 ; base exp

	INCBIN "gfx/pokemon/front/lickitung.pic", 0, 1 ; sprite dimensions
	dw LickitungPicFront, LickitungPicBack

	db WRAP, SUPERSONIC, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , SWORDS_DANCE , MEGA_KICK    , TOXIC        , SHADOW_BALL  , \
	     BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , BUBBLEBEAM   , WATER_GUN    , \
	     ICE_BEAM     , BLIZZARD     , HYPER_BEAM   , SUBMISSION   , COUNTER      , \
	     SEISMIC_TOSS , RAGE         , SOLARBEAM    , THUNDERBOLT  , THUNDER      , \
	     EARTHQUAKE   , FISSURE      , DIG          , MIMIC        , DOUBLE_TEAM  , \
	     BIDE         , FLAMETHROWER , FIRE_BLAST   , DREAM_EATER  , REST         , \
	     ROCK_SLIDE   , SUBSTITUTE   , CUT          , SURF         , STRENGTH
	; end

	db BANK(LickitungPicFront)
	assert BANK(LickitungPicFront) == BANK(LickitungPicBack)
