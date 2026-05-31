CeladonMart5F_Script:
	call CeladonMart5FCheckVendorUnlockedScript
	jp EnableAutoTextBoxDrawing

CeladonMart5FCheckVendorUnlockedScript:
	call PostGameRematchesUnlocked
	jr nz, .unlocked
	ld hl, CeladonMart5F_TextPointers
	jr .done
.unlocked
	ld hl, CeladonMart5F_TextPointers2
.done
	ld a, l
	ld [wCurMapTextPtr], a
	ld a, h
	ld [wCurMapTextPtr + 1], a
	ret

CeladonMart5F_TextPointers:
	dw CeladonMart5FGentlemanText
	dw CeladonMart5FSailorText
	dw CeladonMart5FClerk1Text
	dw CeladonMart5FClerk2LockedText
	dw CeladonMart5FCurrentFloorSignText

CeladonMart5F_TextPointers2:
	def_text_pointers
	dw_const CeladonMart5FGentlemanText,        TEXT_CELADONMART5F_GENTLEMAN
	dw_const CeladonMart5FSailorText,           TEXT_CELADONMART5F_SAILOR
	dw_const CeladonMart5FClerk1Text,           TEXT_CELADONMART5F_CLERK1
	dw_const CeladonMart5FClerk2Text,           TEXT_CELADONMART5F_CLERK2
	dw_const CeladonMart5FCurrentFloorSignText, TEXT_CELADONMART5F_CURRENT_FLOOR_SIGN

CeladonMart5FGentlemanText:
	text_far _CeladonMart5FGentlemanText
	text_end

CeladonMart5FSailorText:
	text_far _CeladonMart5FSailorText
	text_end

CeladonMart5FClerk2LockedText:
	text_far _CeladonMart5FClerk2NotYetChampionText
	text_end

CeladonMart5FCurrentFloorSignText:
	text_far _CeladonMart5FCurrentFloorSignText
	text_end
