	db DEX_RATICATE ; pokedex id

	db  55,  81,  60,  97,  50
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 116 ; base exp

	INCBIN "gfx/pokemon/front/raticate.pic", 0, 1 ; sprite dimensions
	dw RaticatePicFront, RaticatePicBack

	db TACKLE, TAIL_WHIP, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE , CRUNCH       , TOXIC        , SHADOW_BALL  , BODY_SLAM    , \
	     TAKE_DOWN    , DOUBLE_EDGE  , BUBBLEBEAM   , WATER_GUN    , ICE_BEAM     , \
	     BLIZZARD     , HYPER_BEAM   , COUNTER      , THUNDERBOLT  , \
	     THUNDER      , DIG          , MIMIC        , DOUBLE_TEAM  , BIDE         , \
	     SWIFT        , SLUDGE_BOMB  , REST         , THUNDER_WAVE , SUBSTITUTE   , \
	     CUT          , STRENGTH
	; end

	db BANK(RaticatePicFront)
	assert BANK(RaticatePicFront) == BANK(RaticatePicBack)
