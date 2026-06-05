	db DEX_RIOLU ; pokedex id

	db  40,  70,  40,  60,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 75 ; catch rate
	db 72 ; base exp

	INCBIN "gfx/pokemon/front/riolu.pic", 0, 1
	dw RioluPicFront, RioluPicBack

	db QUICK_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_SLOW

	tmhm MEGA_PUNCH   , SWORDS_DANCE , CRUNCH       , MEGA_KICK    , TOXIC        , \
	     BODY_SLAM    , TAKE_DOWN    , METAL_CLAW   , SUBMISSION   , COUNTER      , \
	     EARTHQUAKE   , DIG          , DOUBLE_TEAM  , SWIFT        , REST         , \
	     ROCK_SLIDE   , SUBSTITUTE   , STRENGTH
	db BANK(RioluPicFront)
	assert BANK(RioluPicFront) == BANK(RioluPicBack)
