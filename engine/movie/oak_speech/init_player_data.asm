InitPlayerData:
InitPlayerData2:

	call Random
	ldh a, [hRandomSub]
	ld [wPlayerID], a

	call Random
	ldh a, [hRandomAdd]
	ld [wPlayerID + 1], a

	ld a, $ff
	ld [wUnusedPlayerDataByte], a

	ld hl, wPartyCount
	call InitializeEmptyList
	ld hl, wBoxCount
	call InitializeEmptyList
	ld hl, wNumBagItems
	call InitializeEmptyList
	ld hl, wNumBoxItems
	call InitializeEmptyList

; TEST: HM03 Surf for island / overworld checks (remove for release).
	lb bc, HM_SURF, 1
	call GiveItem

	lb bc, FRESH_WATER, 1
	call GiveItem

DEF START_MONEY EQU $3000
	ld hl, wPlayerMoney + 1
	ld a, HIGH(START_MONEY)
	ld [hld], a
	xor a ; LOW(START_MONEY)
	ld [hli], a
	inc hl
	ld [hl], a

	ld [wMonDataLocation], a

; TEST: all Kanto badges + postgame flags so rematches are reachable (remove for release).
	ld hl, wObtainedBadges
	ld a, %11111111
	ld [hli], a
	ASSERT wObtainedBadges + 1 == wUnusedObtainedBadges
	xor a
	ld [hl], a
	ld hl, wBeatGymFlags
	ld a, %11111111
	ld [hl], a

	xor a
	ld hl, wPlayerCoins
	ld [hli], a
	ld [hl], a

	ld hl, wGameProgressFlags
	ld bc, wGameProgressFlagsEnd - wGameProgressFlags
	call FillMemory ; clear all game progress flags (FillMemory uses a; must be 0)

; TEST: Champion beaten + Brock's gym cleared so Pewter rematch dialogue unlocks (remove for release).
	SetEvent EVENT_BEAT_CHAMPION_RIVAL
	SetEvent EVENT_BEAT_BROCK
	SetEvent EVENT_GOT_TM34
; TEST: all rematch flags so Pallet final rival is fightable (remove for release).
	SetEvent EVENT_REMATCH_DEFEATED_BROCK
	SetEvent EVENT_REMATCH_DEFEATED_MISTY
	SetEvent EVENT_REMATCH_DEFEATED_LT_SURGE
	SetEvent EVENT_REMATCH_DEFEATED_ERIKA
	SetEvent EVENT_REMATCH_DEFEATED_KOGA
	SetEvent EVENT_REMATCH_DEFEATED_BLAINE
	SetEvent EVENT_REMATCH_DEFEATED_SABRINA
	SetEvent EVENT_REMATCH_DEFEATED_GIOVANNI
	SetEvent EVENT_REMATCH_DEFEATED_LORELEI
	SetEvent EVENT_REMATCH_DEFEATED_BRUNO
	SetEvent EVENT_REMATCH_DEFEATED_AGATHA
	SetEvent EVENT_REMATCH_DEFEATED_LANCE
	SetEvent EVENT_REMATCH_DEFEATED_RIVAL_CHAMPION

	jp InitializeToggleableObjectsFlags

InitializeEmptyList:
	xor a ; count
	ld [hli], a
	dec a ; terminator
	ld [hl], a
	ret
