	db DEX_WEAVILE ; pokedex id

	db   70, 120,  55, 125,  75
	;   hp  atk  def  spd  spc

	db DARK, ICE ; type
	db 45 ; catch rate
	db 199 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/weavile.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/weavile.pic", 0, 1
	dw WeavilePicFront, WeavilePicBack

	db SCRATCH, LEER, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , SWORDS_DANCE , MEGA_KICK    , TOXIC        , SHADOW_BALL  , \
	     BODY_SLAM    , TAKE_DOWN    , ICE_BEAM     , BLIZZARD     , HYPER_BEAM   , \
	     METAL_CLAW   , DIG          , DOUBLE_TEAM  , REFLECT      , METRONOME    , \
	     SWIFT        , DREAM_EATER  , REST         , SUBSTITUTE   , CUT          , \
	     SURF         , STRENGTH
	; end

	db BANK(WeavilePicFront)
	assert BANK(WeavilePicFront) == BANK(WeavilePicBack)
