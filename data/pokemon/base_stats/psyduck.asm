	db DEX_PSYDUCK ; pokedex id

	db  50,  52,  48,  55,  50
	;   hp  atk  def  spd  spc

IF DEF(_BLUE)
	db WATER, PSYCHIC_TYPE ; type
ELSE
	db WATER, WATER ; type
ENDC
	db 190 ; catch rate
	db 80 ; base exp

	INCBIN "gfx/pokemon/front/psyduck.pic", 0, 1 ; sprite dimensions
	dw PsyduckPicFront, PsyduckPicBack

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , MEGA_KICK    , TOXIC        , BODY_SLAM    , TAKE_DOWN    , \
	     DOUBLE_EDGE  , BUBBLEBEAM   , WATER_GUN    , ICE_BEAM     , BLIZZARD     , \
	     SUBMISSION   , COUNTER      , SEISMIC_TOSS , PAY_DAY      , DIG          , \
	     PSYCHIC_M    , MIMIC        , DOUBLE_TEAM  , BIDE         , METRONOME    , \
	     SWIFT        , REST         , SUBSTITUTE   , SURF         , STRENGTH     , \
	     FLASH
	; end

	db BANK(PsyduckPicFront)
	assert BANK(PsyduckPicFront) == BANK(PsyduckPicBack)
