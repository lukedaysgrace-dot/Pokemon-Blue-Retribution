ThunderFangEffect_:
	callfar CheckTargetSubstitute
	ret nz
	call .paralyzeEffect
; fallthrough
.flinchEffect
	ld hl, wEnemyBattleStatus1
	ldh a, [hWhoseTurn]
	and a
	jr z, .gotFlinchTarget
	ld hl, wPlayerBattleStatus1
.gotFlinchTarget
	callfar BattleRandom
	cp 10 percent + 1
	ret nc
	set FLINCHED, [hl]
	callfar ClearHyperBeam
	ret

.paralyzeEffect
	ldh a, [hWhoseTurn]
	and a
	jr nz, .opponentAttacker
	ld a, [wEnemyMonStatus]
	and a
	ret nz
	ld a, [wPlayerMoveType]
	ld b, a
	ld a, [wEnemyMonType1]
	cp b
	ret z
	ld a, [wEnemyMonType2]
	cp b
	ret z
	callfar BattleRandom
	cp 10 percent + 1
	ret nc
	ld a, 1 << PAR
	ld [wEnemyMonStatus], a
	callfar QuarterSpeedDueToParalysis
	ld a, ENEMY_HUD_SHAKE_ANIM
	callfar PlayBattleAnimation
	callfar PrintMayNotAttackText
	ret
.opponentAttacker
	ld a, [wBattleMonStatus]
	and a
	ret nz
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wBattleMonType1]
	cp b
	ret z
	ld a, [wBattleMonType2]
	cp b
	ret z
	callfar BattleRandom
	cp 10 percent + 1
	ret nc
	ld a, 1 << PAR
	ld [wBattleMonStatus], a
	callfar QuarterSpeedDueToParalysis
	callfar PrintMayNotAttackText
	ret
