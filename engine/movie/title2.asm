TitleScroll_WaitBall:
; Wait around for the TitleBall animation to play out.
; hi: speed
; lo: duration
	db $05, $05, 0

TitleScroll_In:
; Scroll a TitleMon in from the right.
; hi: speed
; lo: duration
	db $a2, $94, $84, $63, $52, $31, $11, 0

TitleScroll_Out:
; Scroll a TitleMon out to the left.
; hi: speed
; lo: duration
	db $12, $22, $32, $42, $52, $62, $83, $93, 0

TitleScroll:
	ld a, d

	ld bc, TitleScroll_In
	ld d, $88
	ld e, 0 ; don't animate titleball

	and a
	jr nz, .ok

	ld bc, TitleScroll_Out
	ld d, $00
	ld e, 0 ; don't animate titleball
.ok

_TitleScroll:
	ld a, [bc]
	and a
	ret z

	inc bc
	push bc

	ld b, a
	and $f
	ld c, a
	ld a, b
	and $f0
	swap a
	ld b, a

.loop
	ld h, d
	ld l, $48
	call .ScrollBetween

	ld h, $00
	ld l, $88
	call .ScrollBetween

	ld a, d
	add b
	ld d, a

	call GetTitleBallY
	dec c
	jr nz, .loop

	pop bc
	jr _TitleScroll

.ScrollBetween:
.wait
	ldh a, [rLY] ; rLY
	cp l
	jr nz, .wait

	ld a, h
	ldh [rSCX], a

.wait2
	ldh a, [rLY] ; rLY
	cp h
	jr z, .wait2
	ret

TitleBallYTable:
; HOW TO KEEP THIS IN SYNC WITH title.asm (SetupBlueTitleHandBall):
; 1) Pick the hand height Y in title.asm (the "ld a, $.." before wShadowOAMSprite35). Call it CENTER.
; 2) Replace the 10 bytes between the two 0s below with a small bounce around CENTER (same ±4 pattern).
;    Example: if CENTER=$70, use exactly these 10 bytes:
;    $78,$76,$74,$72,$74,$76,$78,$7a,$78,$76
;    If you change CENTER by N, add N to EACH of those 10 bytes.
; 3) Leave the leading 0 and final 0 alone — they mark the start/end of the table.
; GetTitleBallY reads index 1..10 (see GetTitleBallY, index starts at 1).
; Two $05 entries in TitleScroll_WaitBall run this for 10 frames.
	db 0, $78, $76, $74, $72, $74, $76, $78, $7a, $78, $76, 0

TitleScreenAnimateBlueTitleHandBall:
; Blue title: bounce the Poké Ball in sprite 35 (SetupBlueTitleHandBall in title.asm).
	ld e, 1 ; animate titleball
	ld bc, TitleScroll_WaitBall
	ld d, 0
	jp _TitleScroll

GetTitleBallY:
; Get position e from TitleBallYTable
	push de
	push hl
	xor a
	ld d, a
	ld hl, TitleBallYTable
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	and a
	ret z
	ld [wShadowOAMSprite35YCoord], a
	inc e
	ret
