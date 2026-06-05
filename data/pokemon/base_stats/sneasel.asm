	db DEX_SNEASEL ; pokedex id

	db   55,  95,  55, 115,  55
	;   hp  atk  def  spd  spc

	db DARK, ICE ; type
	db 60 ; catch rate
	db 132 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/sneasel.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/sneasel.pic", 0, 1
	dw SneaselPicFront, SneaselPicBack

	db SCRATCH, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , SWORDS_DANCE , MEGA_KICK    , TOXIC        , SHADOW_BALL  , \
	     BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , ICE_BEAM     , BLIZZARD     , \
	     METAL_CLAW   , COUNTER      , DIG          , MIMIC        , DOUBLE_TEAM  , \
	     REFLECT      , SWIFT        , DREAM_EATER  , REST         , SUBSTITUTE   , \
	     CUT          , SURF         , STRENGTH
	; end

	db BANK(SneaselPicFront)
	assert BANK(SneaselPicFront) == BANK(SneaselPicBack)
