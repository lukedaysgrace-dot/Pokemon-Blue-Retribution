	db DEX_RHYPERIOR ; pokedex id

	db  115, 130, 120,  40,  45
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 30 ; catch rate
	db 217 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/rhyperior.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/rhyperior.pic", 0, 1
	dw RhyperiorPicFront, RhyperiorPicBack

	db HORN_ATTACK, STOMP, TAIL_WHIP, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH   , SWORDS_DANCE , CRUNCH       , MEGA_KICK    , TOXIC        , \
	     SHADOW_BALL  , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , BUBBLEBEAM   , \
	     WATER_GUN    , ICE_BEAM     , BLIZZARD     , HYPER_BEAM   , METAL_CLAW   , \
	     SUBMISSION   , COUNTER      , SEISMIC_TOSS , RAGE         , THUNDERBOLT  , \
	     THUNDER      , EARTHQUAKE   , FISSURE      , DIG          , MIMIC        , \
	     DOUBLE_TEAM  , BIDE         , FLAMETHROWER , FIRE_BLAST   , REST         , \
	     ROCK_SLIDE   , SUBSTITUTE   , CUT          , SURF         , STRENGTH
	; end

	db BANK(RhyperiorPicFront)
	assert BANK(RhyperiorPicFront) == BANK(RhyperiorPicBack)
