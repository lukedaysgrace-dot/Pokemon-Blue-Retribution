	db DEX_BLISSEY ; pokedex id

	db  255,  10,  10,  50, 125
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 255 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/blissey.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/blissey.pic", 0, 1
	dw BlisseyPicFront, BlisseyPicBack

	db TACKLE, DEFENSE_CURL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , MEGA_KICK    , TOXIC        , SHADOW_BALL  , BODY_SLAM    , \
	     TAKE_DOWN    , DOUBLE_EDGE  , ICE_BEAM     , BLIZZARD     , HYPER_BEAM   , \
	     COUNTER      , SEISMIC_TOSS , SOLARBEAM    , THUNDERBOLT  , THUNDER      , \
	     EARTHQUAKE   , PSYCHIC_M    , MIMIC        , DOUBLE_TEAM  , METRONOME    , \
	     FLAMETHROWER , FIRE_BLAST   , SWIFT        , SOFTBOILED   , DREAM_EATER  , \
	     REST         , THUNDER_WAVE , ROCK_SLIDE   , TRI_ATTACK   , SUBSTITUTE   , \
	     STRENGTH     , FLASH
	; end

	db BANK(BlisseyPicFront)
	assert BANK(BlisseyPicFront) == BANK(BlisseyPicBack)
