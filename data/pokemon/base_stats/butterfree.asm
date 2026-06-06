	db DEX_BUTTERFREE ; pokedex id

	db  65,  85,  60,  90, 100
	;   hp  atk  def  spd  spc

IF DEF(_BLUE)
	db BUG, PSYCHIC_TYPE ; type
ELSE
	db BUG, FLYING ; type
ENDC
	db 45 ; catch rate
	db 160 ; base exp

	INCBIN "gfx/pokemon/front/butterfree.pic", 0, 1 ; sprite dimensions
	dw ButterfreePicFront, ButterfreePicBack

	db CONFUSION, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND   , TOXIC        , SHADOW_BALL  , TAKE_DOWN    , DOUBLE_EDGE  , \
	     HYPER_BEAM   , MEGA_DRAIN   , SOLARBEAM    , PSYCHIC_M    , \
	     TELEPORT     , MIMIC        , DOUBLE_TEAM  , REFLECT      , BIDE         , \
	     SWIFT        , DREAM_EATER  , REST         , PSYWAVE      , SUBSTITUTE   , \
	     FLASH
	; end

	db BANK(ButterfreePicFront)
	assert BANK(ButterfreePicFront) == BANK(ButterfreePicBack)
