	db DEX_SNORUNT ; pokedex id

	db  50,  50,  50,  50,  50
	;   hp  atk  def  spd  spc

	db ICE, ICE ; type
	db 190 ; catch rate
	db  60 ; base exp

	INCBIN "gfx/pokemon/front/snorunt.pic", 0, 1 ; sprite dimensions
	dw SnoruntPicFront, SnoruntPicBack

	db POWDER_SNOW, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CRUNCH       , TOXIC        , SHADOW_BALL  , BODY_SLAM    , TAKE_DOWN    , \
	     DOUBLE_EDGE  , ICE_BEAM     , BLIZZARD     , MIMIC        , DOUBLE_TEAM  , \
	     BIDE         , REST         , SUBSTITUTE   , FLASH
	; end

	db BANK(SnoruntPicFront)
	assert BANK(SnoruntPicFront) == BANK(SnoruntPicBack)
