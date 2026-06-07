; Badge-based level caps for hard mode (wHardMode in saved player data).
; 0 badges uses 17 instead of Brock's highest (15). 8 badges removes the cap.
HardModeLevelCaps:
	db 17 ; 0 badges
	db 22 ; 1 badge  (Misty)
	db 25 ; 2 badges (Lt. Surge)
	db 33 ; 3 badges (Erika)
	db 43 ; 4 badges (Koga)
	db 43 ; 5 badges (Sabrina)
	db 45 ; 6 badges (Blaine)
	db 50 ; 7 badges (Giovanni)

; out: D = level cap, or D = 0 if hard mode is off or uncapped
GetHardModeLevelCap::
	ld a, [wHardMode]
	and a
	jr nz, .enabled
.noCap
	ld d, 0
	ret
.enabled
	ld hl, wObtainedBadges
	ld b, $1
	homecall CountSetBits
	ld a, [wNumSetBits]
	cp NUM_BADGES
	jr nc, .noCap
	ld e, a
	ld d, 0
	ld hl, HardModeLevelCaps
	add hl, de
	ld d, [hl]
	ret
