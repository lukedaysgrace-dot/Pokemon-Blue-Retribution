	db DEX_AMPHAROS ; pokedex id

	db  90,  75,  85,  55, 105
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 230 ; base exp

	INCBIN "gfx/pokemon/front/ampharos.pic", 0, 1
	dw AmpharosPicFront, AmpharosPicBack

	db TACKLE, GROWL, THUNDERSHOCK, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     THUNDERBOLT,  THUNDER,      MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     REST,         THUNDER_WAVE, SUBSTITUTE,   FLASH,        STRENGTH
	db BANK(AmpharosPicFront)
	assert BANK(AmpharosPicFront) == BANK(AmpharosPicBack)
