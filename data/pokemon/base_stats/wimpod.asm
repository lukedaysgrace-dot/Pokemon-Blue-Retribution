	db DEX_WIMPOD ; pokedex id

	db  25,  35,  40,  80,  25
	;   hp  atk  def  spd  spc

	db BUG, WATER ; type
	db 255 ; catch rate
	db 46 ; base exp

	INCBIN "gfx/pokemon/front/wimpod.pic", 0, 1
	dw WimpodPicFront, WimpodPicBack

	db SAND_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_FAST

	tmhm TOXIC        , WATER_GUN   , METAL_CLAW  , DOUBLE_TEAM        , SWIFT         , \
	     SUBSTITUTE   , SURF
	db BANK(WimpodPicFront)
	assert BANK(WimpodPicFront) == BANK(WimpodPicBack)
