	db DEX_RAPIDASH ; pokedex id

	db  75, 100,  70, 105,  80
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 60 ; catch rate
	db 192 ; base exp

	INCBIN "gfx/pokemon/front/rapidash.pic", 0, 1 ; sprite dimensions
	dw RapidashPicFront, RapidashPicBack

	db EMBER, TAIL_WHIP, STOMP, GROWL ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE , TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , \
	     HYPER_BEAM   , RAGE         , SOLARBEAM    , MIMIC        , DOUBLE_TEAM  , \
	     REFLECT      , BIDE         , FLAMETHROWER , FIRE_BLAST   , SWIFT        , \
	     REST         , SUBSTITUTE   , STRENGTH
	; end

	db BANK(RapidashPicFront)
	assert BANK(RapidashPicFront) == BANK(RapidashPicBack)
