ViridianMart_Script:
	call ViridianMartCheckParcelDeliveredScript
	call EnableAutoTextBoxDrawing
	ld hl, ViridianMart_ScriptPointers
	ld a, [wViridianMartCurScript]
	jp CallFunctionInTable

ViridianMartCheckParcelDeliveredScript:
	CheckEvent EVENT_OAK_GOT_PARCEL
	jr nz, .delivered_parcel
	ld hl, ViridianMart_TextPointers
	jr .done
.delivered_parcel
	ld hl, ViridianMart_TextPointers2
.done
	ld a, l
	ld [wCurMapTextPtr], a
	ld a, h
	ld [wCurMapTextPtr+1], a
	ret

ViridianMart_ScriptPointers:
	def_script_pointers
	dw_const ViridianMartDefaultScript,    SCRIPT_VIRIDIANMART_DEFAULT
	dw_const ViridianMartOaksParcelScript, SCRIPT_VIRIDIANMART_OAKS_PARCEL
	dw_const ViridianMartNoopScript,       SCRIPT_VIRIDIANMART_NOOP

ViridianMartDefaultScript:
	call UpdateSprites
	ld a, TEXT_VIRIDIANMART_CLERK_YOU_CAME_FROM_PALLET_TOWN
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wSimulatedJoypadStatesEnd
	ld de, .PlayerMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VIRIDIANMART_OAKS_PARCEL
	ld [wViridianMartCurScript], a
	ret

.PlayerMovement:
	db PAD_LEFT, 1
	db PAD_UP, 2
	db -1 ; end

ViridianMartOaksParcelScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, TEXT_VIRIDIANMART_CLERK_PARCEL_QUEST
	ldh [hTextID], a
	call DisplayTextID
	lb bc, OAKS_PARCEL, 1
	call GiveItem
	SetEvent EVENT_GOT_OAKS_PARCEL
	ld a, SCRIPT_VIRIDIANMART_NOOP
	ld [wViridianMartCurScript], a
	; fallthrough
ViridianMartNoopScript:
	ret

ViridianMart_TextPointers:
	dw ViridianMartClerkSayHiToOakText
	dw ViridianMartYoungsterText
	dw ViridianMartCooltrainerMText
	dw ViridianMartFisherText
	const_def 5
	dw_const ViridianMartClerkYouCameFromPalletTownText, TEXT_VIRIDIANMART_CLERK_YOU_CAME_FROM_PALLET_TOWN
	dw_const ViridianMartClerkParcelQuestText,           TEXT_VIRIDIANMART_CLERK_PARCEL_QUEST

ViridianMart_TextPointers2:
	; This becomes the primary text pointers table when Oak's parcel has been delivered.
	def_text_pointers
	dw_const ViridianMartClerkText,        TEXT_VIRIDIANMART_CLERK
	dw_const ViridianMartYoungsterText,    TEXT_VIRIDIANMART_YOUNGSTER
	dw_const ViridianMartCooltrainerMText, TEXT_VIRIDIANMART_COOLTRAINER_M
	dw_const ViridianMartFisherText,       TEXT_VIRIDIANMART_FISHER

ViridianMartClerkSayHiToOakText:
	text_far _ViridianMartClerkSayHiToOakText
	text_end

ViridianMartClerkYouCameFromPalletTownText:
	text_far _ViridianMartClerkYouCameFromPalletTownText
	text_end

ViridianMartClerkParcelQuestText:
	text_far _ViridianMartClerkParcelQuestText
	sound_get_key_item
	text_end

ViridianMartYoungsterText:
	text_far _ViridianMartYoungsterText
	text_end

ViridianMartCooltrainerMText:
	text_far _ViridianMartCooltrainerMText
	text_end

ViridianMartFisherText:
	text_asm
	CheckEvent EVENT_VIRIDIAN_FISHER_GAVE_ROD
	jr nz, .already_got_rod
	ld hl, ViridianMartFisherGiveRodText
	call PrintText
	lb bc, OLD_ROD, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_VIRIDIAN_FISHER_GAVE_ROD
	ld hl, ViridianMartFisherReceivedRodText
	call PrintText
	jr .done
.bag_full
	ld hl, ViridianMartFisherBagFullText
	call PrintText
	jr .done
.already_got_rod
	ld hl, ViridianMartFisherAfterText
	call PrintText
.done
	jp TextScriptEnd

ViridianMartFisherGiveRodText:
	text_far _ViridianMartFisherGiveRodText
	text_end

ViridianMartFisherReceivedRodText:
	text_far _ViridianMartFisherReceivedRodText
	sound_get_key_item
	text_end

ViridianMartFisherBagFullText:
	text_far _ViridianMartFisherBagFullText
	text_end

ViridianMartFisherAfterText:
	text_far _ViridianMartFisherAfterText
	text_end
