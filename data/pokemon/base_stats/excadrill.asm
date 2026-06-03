	db DEX_EXCADRILL ; pokedex id

	db  110, 135,  60,  88,  65
	;   hp  atk  def  spd  spc

	db GROUND, STEEL ; type
	db 60 ; catch rate
	db 178 ; base exp

; First byte: .pic from pkmncompress(gfx/pokemon/front/excadrill.png). INCBIN must stay .pic, not .png.
	INCBIN "gfx/pokemon/front/excadrill.pic", 0, 1
	dw ExcadrillPicFront, ExcadrillPicBack

	db SCRATCH, SAND_ATTACK, METAL_CLAW, DIG ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC, BODY_SLAM, TAKE_DOWN, DOUBLE_EDGE, HYPER_BEAM, RAGE, EARTHQUAKE, FISSURE, DIG, MIMIC, DOUBLE_TEAM, BIDE, REST, ROCK_SLIDE, SUBSTITUTE, CUT, STRENGTH
	; end

	db BANK(ExcadrillPicFront)
	assert BANK(ExcadrillPicFront) == BANK(ExcadrillPicBack)
