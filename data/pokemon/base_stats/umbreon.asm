	db DEX_UMBREON ; pokedex id

	db   95, 95,  90,  70,  80
	;   hp  atk  def  spd  spc

	db DARK, DARK ; type
	db 45 ; catch rate
	db 197 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/umbreon.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/umbreon.pic", 0, 1
	dw UmbreonPicFront, UmbreonPicBack

	db TACKLE, TAIL_WHIP, SAND_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CRUNCH       , TOXIC        , SHADOW_BALL  , BODY_SLAM    , TAKE_DOWN    , \
	     DOUBLE_EDGE  , HYPER_BEAM   , DIG          , PSYCHIC_M    , MIMIC        , \
	     DOUBLE_TEAM  , REFLECT      , SWIFT        , DREAM_EATER  , REST         , \
	     THUNDER_WAVE , SUBSTITUTE   , CUT          , FLASH
	; end

	db BANK(UmbreonPicFront)
	assert BANK(UmbreonPicFront) == BANK(UmbreonPicBack)
