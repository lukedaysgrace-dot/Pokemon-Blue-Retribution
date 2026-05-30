	db DEX_FROSLASS ; pokedex id

	db  70,  80,  70, 110,  80
	;   hp  atk  def  spd  spc

	db ICE, GHOST ; type
	db  75 ; catch rate
	db 168 ; base exp

	INCBIN "gfx/pokemon/front/froslass.pic", 0, 1 ; sprite dimensions
	dw FroslassPicFront, FroslassPicBack

	db POWDER_SNOW, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    HYPER_BEAM,   TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     PSYCHIC_M,    \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         REST,         SUBSTITUTE,   \
	     FLASH
	; end

	db BANK(FroslassPicFront)
	assert BANK(FroslassPicFront) == BANK(FroslassPicBack)
