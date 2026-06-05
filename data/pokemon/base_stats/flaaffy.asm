	db DEX_FLAAFFY ; pokedex id

	db  70,  55,  55,  45,  70
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 120 ; catch rate
	db 117 ; base exp

	INCBIN "gfx/pokemon/front/flaaffy.pic", 0, 1
	dw FlaaffyPicFront, FlaaffyPicBack

	db TACKLE, GROWL, THUNDERSHOCK, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm MEGA_PUNCH   , MEGA_KICK    , TOXIC        , BODY_SLAM    , TAKE_DOWN    , \
	     DOUBLE_EDGE  , COUNTER      , SEISMIC_TOSS , THUNDERBOLT  , THUNDER      , \
	     DIG          , MIMIC        , DOUBLE_TEAM  , REFLECT      , SWIFT        , \
	     REST         , THUNDER_WAVE , SUBSTITUTE   , STRENGTH     , FLASH
	db BANK(FlaaffyPicFront)
	assert BANK(FlaaffyPicFront) == BANK(FlaaffyPicBack)
