TextScriptEndingText::
	text_end

TextScriptEnd::
	ld hl, TextScriptEndingText
	ret

ExclamationText::
	text_far _ExclamationText
	text_end

GroundRoseText::
	text_far _GroundRoseText
	text_end

BoulderText::
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_STRENGTH_ACTIVE, a
	jp nz, TextScriptEnd
	ld hl, .NeedStrengthText
	call PrintText
	jp TextScriptEnd
.NeedStrengthText:
	text_far _BoulderText
	text_end

MartSignText::
	text_far _MartSignText
	text_end

PokeCenterSignText::
	text_far _PokeCenterSignText
	text_end

PickUpItemText::
	text_asm
	predef PickUpItem
	jp TextScriptEnd
