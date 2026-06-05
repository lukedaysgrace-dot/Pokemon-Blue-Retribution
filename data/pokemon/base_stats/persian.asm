	db DEX_PERSIAN ; pokedex id

	db  70,  90,  60, 120,  75
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 148 ; base exp

	INCBIN "gfx/pokemon/front/persian.pic", 0, 1 ; sprite dimensions
	dw PersianPicFront, PersianPicBack

	db SCRATCH, GROWL, BITE, SCREECH ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC        , SHADOW_BALL  , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     BUBBLEBEAM   , WATER_GUN    , HYPER_BEAM   , METAL_CLAW   , RAGE         , \
	     THUNDERBOLT  , THUNDER      , DIG          , MIMIC        , DOUBLE_TEAM  , \
	     BIDE         , SWIFT        , DREAM_EATER  , REST         , THUNDER_WAVE , \
	     SUBSTITUTE   , CUT          , FLASH
	; end

	db BANK(PersianPicFront)
	assert BANK(PersianPicFront) == BANK(PersianPicBack)
