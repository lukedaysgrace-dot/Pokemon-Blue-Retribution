PoisonEffect_:
	ld hl, wEnemyMonStatus
	ld de, wPlayerMoveEffect
	ldh a, [hWhoseTurn]
	and a
	jr z, .poisonEffect
	ld hl, wBattleMonStatus
	ld de, wEnemyMoveEffect
.poisonEffect
	callfar CheckTargetSubstitute
	jp nz, .noEffect ; can't poison a substitute target
	ld a, [hli]
	ld b, a
	and a
	jp nz, .noEffect ; miss if target is already statused
	ld a, [hli]
	cp POISON ; can't poison a poison-type target
	jp z, .noEffect
	cp STEEL ; can't poison a steel-type target
	jp z, .noEffect
	ld a, [hld]
	cp POISON ; can't poison a poison-type target
	jp z, .noEffect
	cp STEEL ; can't poison a steel-type target
	jp z, .noEffect
	ld a, [de]
	cp POISON_SIDE_EFFECT1
	ld b, 20 percent + 1 ; chance of poisoning
	jr z, .sideEffectTest
	cp POISON_SIDE_EFFECT2
	ld b, 40 percent + 1 ; chance of poisoning
	jr z, .sideEffectTest
	push hl
	push de
	callfar MoveHitTest ; apply accuracy tests
	pop de
	pop hl
	ld a, [wMoveMissed]
	and a
	jp nz, .didntAffect
	jr .inflictPoison
.sideEffectTest
	callfar BattleRandom
	cp b ; was side effect successful?
	ret nc
.inflictPoison
	dec hl
	set PSN, [hl]
	push de
	dec de
	ldh a, [hWhoseTurn]
	and a
	ld b, SHAKE_SCREEN_ANIM
	ld hl, wPlayerBattleStatus3
	ld a, [de]
	ld de, wPlayerToxicCounter
	jr nz, .ok
	ld b, ENEMY_HUD_SHAKE_ANIM
	ld hl, wEnemyBattleStatus3
	ld de, wEnemyToxicCounter
.ok
	cp TOXIC
	jr nz, .normalPoison ; done if move is not Toxic
	set BADLY_POISONED, [hl] ; else set Toxic battstatus
	xor a
	ld [de], a
	ld hl, BadlyPoisonedText
	jr .continue
.normalPoison
	ld hl, PoisonedText
.continue
	pop de
	ld a, [de]
	cp POISON_EFFECT
	jr z, .regularPoisonEffect
	ld a, b
	callfar PlayBattleAnimation2
	jpfar PrintText
.regularPoisonEffect
	callfar PlayCurrentMoveAnimation2
	jpfar PrintText
.noEffect
	ld a, [de]
	cp POISON_EFFECT
	ret nz
.didntAffect
	ld c, 50
	call DelayFrames
	jpfar PrintDidntAffectText

PoisonedText:
	text_far _PoisonedText
	text_end

BadlyPoisonedText:
	text_far _BadlyPoisonedText
	text_end
