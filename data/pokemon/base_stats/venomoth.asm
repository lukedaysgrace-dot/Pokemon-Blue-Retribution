	db DEX_VENOMOTH ; pokedex id

	db  70,  70,  60,  90,  110
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 75 ; catch rate
	db 138 ; base exp

	INCBIN "gfx/pokemon/front/venomoth.pic", 0, 1 ; sprite dimensions
	dw VenomothPicFront, VenomothPicBack

	db TACKLE, DISABLE, POISONPOWDER, LEECH_LIFE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND   , TOXIC        , TAKE_DOWN    , DOUBLE_EDGE  , HYPER_BEAM   , \
	     MEGA_DRAIN   , SOLARBEAM    , PSYCHIC_M    , TELEPORT     , \
	     MIMIC        , DOUBLE_TEAM  , REFLECT      , BIDE         , SWIFT        , \
	     SLUDGE_BOMB  , DREAM_EATER  , REST         , PSYWAVE      , SUBSTITUTE   , \
	     FLASH
	; end

	db BANK(VenomothPicFront)
	assert BANK(VenomothPicFront) == BANK(VenomothPicBack)
