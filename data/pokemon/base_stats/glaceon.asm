	db DEX_GLACEON ; pokedex id

	db   65,  60, 110,  82, 113
	;   hp  atk  def  spd  spc

	db ICE, ICE ; type
	db 45 ; catch rate
	db 196 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/glaceon.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/glaceon.pic", 0, 1
	dw GlaceonPicFront, GlaceonPicBack

	db TACKLE, TAIL_WHIP, SAND_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC        , SHADOW_BALL  , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     BUBBLEBEAM   , ICE_BEAM     , BLIZZARD     , HYPER_BEAM   , DIG          , \
	     MIMIC        , DOUBLE_TEAM  , SWIFT        , REST         , SUBSTITUTE   , \
	     STRENGTH
	; end

	db BANK(GlaceonPicFront)
	assert BANK(GlaceonPicFront) == BANK(GlaceonPicBack)
