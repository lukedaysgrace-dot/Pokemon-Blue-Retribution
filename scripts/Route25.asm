Route25_Script:
	call Route25ToggleBillsScript
	call EnableAutoTextBoxDrawing
	call Route25GreenIdleLookAround
	ld hl, Route25TrainerHeaders
	ld de, Route25_ScriptPointers
	ld a, [wRoute25CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute25CurScript], a
	ret

Route25ToggleBillsScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	ret z
	call Route25ToggleGreenObject
	CheckEventHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ret nz
	CheckEventReuseHL EVENT_MET_BILL_2
	jr nz, .met_bill
	ResetEventReuseHL EVENT_BILL_SAID_USE_CELL_SEPARATOR
	ld a, TOGGLE_BILL_POKEMON
	ld [wToggleableObjectIndex], a
	predef_jump ShowObject
.met_bill
	CheckEventAfterBranchReuseHL EVENT_GOT_SS_TICKET, EVENT_MET_BILL_2
	ret z
	SetEventReuseHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ld a, TOGGLE_NUGGET_BRIDGE_GUY
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_BILL_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_BILL_2
	ld [wToggleableObjectIndex], a
	predef_jump ShowObject

Route25ToggleGreenObject:
	CheckEvent EVENT_REMATCH_DEFEATED_RIVAL_CHAMPION
	jr z, .hide_green
	ld a, TOGGLE_ROUTE_25_GREEN
	ld [wToggleableObjectIndex], a
	predef ShowObject
	ret
.hide_green
	ld a, TOGGLE_ROUTE_25_GREEN
	ld [wToggleableObjectIndex], a
	predef HideObject
	ret

Route25_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE25_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE25_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE25_END_BATTLE
	dw_const Route25GreenAfterBattleScript,         SCRIPT_ROUTE25_GREEN_AFTER_BATTLE

Route25_TextPointers:
	def_text_pointers
	dw_const Route25Youngster1Text,    TEXT_ROUTE25_YOUNGSTER1
	dw_const Route25Youngster2Text,    TEXT_ROUTE25_YOUNGSTER2
	dw_const Route25CooltrainerMText,  TEXT_ROUTE25_COOLTRAINER_M
	dw_const Route25CooltrainerF1Text, TEXT_ROUTE25_COOLTRAINER_F1
	dw_const Route25Youngster3Text,    TEXT_ROUTE25_YOUNGSTER3
	dw_const Route25CooltrainerF2Text, TEXT_ROUTE25_COOLTRAINER_F2
	dw_const Route25Hiker1Text,        TEXT_ROUTE25_HIKER1
	dw_const Route25Hiker2Text,        TEXT_ROUTE25_HIKER2
	dw_const Route25Hiker3Text,        TEXT_ROUTE25_HIKER3
	dw_const PickUpItemText,           TEXT_ROUTE25_TM_SEISMIC_TOSS
	dw_const Route25GreenText,         TEXT_ROUTE25_GREEN
	dw_const Route25BillSignText,      TEXT_ROUTE25_BILL_SIGN
	dw_const Route25GreenAfterBattleDisplayText, TEXT_ROUTE25_GREEN_AFTER_BATTLE

Route25TrainerHeaders:
	def_trainers
Route25TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_0, 2, Route25Youngster1BattleText, Route25Youngster1EndBattleText, Route25Youngster1AfterBattleText
Route25TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_1, 3, Route25Youngster2BattleText, Route25Youngster2EndBattleText, Route25Youngster2AfterBattleText
Route25TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_2, 3, Route25CooltrainerMBattleText, Route25CooltrainerMEndBattleText, Route25CooltrainerMAfterBattleText
Route25TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_3, 2, Route25CooltrainerF1BattleText, Route25CooltrainerF1EndBattleText, Route25CooltrainerF1AfterBattleText
Route25TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_4, 4, Route25Youngster3BattleText, Route25Youngster3EndBattleText, Route25Youngster3AfterBattleText
Route25TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_5, 4, Route25CooltrainerF2BattleText, Route25CooltrainerF2EndBattleText, Route25CooltrainerF2AfterBattleText
Route25TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_6, 3, Route25Hiker1BattleText, Route25Hiker1EndBattleText, Route25Hiker1AfterBattleText
Route25TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_7, 2, Route25Hiker2BattleText, Route25Hiker2EndBattleText, Route25Hiker2AfterBattleText
Route25TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_8, 2, Route25Hiker3BattleText, Route25Hiker3EndBattleText, Route25Hiker3AfterBattleText
	db -1 ; end

Route25Youngster1Text:
	text_asm
	ld hl, Route25TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route25Youngster2Text:
	text_asm
	ld hl, Route25TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route25CooltrainerMText:
	text_asm
	ld hl, Route25TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route25CooltrainerF1Text:
	text_asm
	ld hl, Route25TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route25Youngster3Text:
	text_asm
	ld hl, Route25TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route25CooltrainerF2Text:
	text_asm
	ld hl, Route25TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route25Hiker1Text:
	text_asm
	ld hl, Route25TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route25Hiker2Text:
	text_asm
	ld hl, Route25TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route25Hiker3Text:
	text_asm
	ld hl, Route25TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route25GreenText:
	text_asm
	call Route25GreenFacePlayer
	call UpdateSprites
	CheckEvent EVENT_BEAT_ROUTE25_GREEN
	jr z, .before_battle
	ld hl, Route25GreenAfterBattleDisplayText
	call PrintText
	jr .done
.before_battle
	ld hl, Route25GreenBeforeBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, Route25GreenEndBattleText
	ld de, Route25GreenPlayerLoseText
	call SaveEndBattleTextPointers
	ld a, OPP_GREEN
	ld [wCurOpponent], a
	ld a, [wPlayerStarter]
	cp STARTER1
	jr z, .picked_charmander
	cp STARTER2
	jr z, .picked_squirtle
	ld a, 12 ; player picked Bulbasaur, Green has Squirtle
	jr .got_team
.picked_charmander
	ld a, 10 ; player picked Charmander, Green has Bulbasaur
	jr .got_team
.picked_squirtle
	ld a, 11 ; player picked Squirtle, Green has Charmander
.got_team
	ld [wTrainerNo], a
	ld a, SCRIPT_ROUTE25_GREEN_AFTER_BATTLE
	ld [wRoute25CurScript], a
	ld [wCurMapScript], a
	ld hl, wStatusFlags7
	set BIT_USE_CUR_MAP_SCRIPT, [hl]
.done
	jp TextScriptEnd

Route25GreenFacePlayer:
	ld a, [wPlayerDirection]
	bit PLAYER_DIR_BIT_UP, a
	jr z, .not_facing_up
	ld a, SPRITE_FACING_DOWN
	jr .set_facing
.not_facing_up
	bit PLAYER_DIR_BIT_DOWN, a
	jr z, .not_facing_down
	ld a, SPRITE_FACING_UP
	jr .set_facing
.not_facing_down
	bit PLAYER_DIR_BIT_LEFT, a
	jr z, .not_facing_left
	ld a, SPRITE_FACING_RIGHT
	jr .set_facing
.not_facing_left
	ld a, SPRITE_FACING_LEFT
.set_facing
	ldh [hSpriteFacingDirection], a
	ld a, ROUTE25_GREEN
	ldh [hSpriteIndex], a
	jp SetSpriteFacingDirectionAndDelay

Route25GreenIdleLookAround:
	ld a, [wRoute25CurScript]
	and a
	ret nz
	ld a, [wFontLoaded]
	bit BIT_FONT_LOADED, a
	ret nz
	ldh a, [hFrameCounter]
	and $3f
	ret nz
	CheckEvent EVENT_REMATCH_DEFEATED_RIVAL_CHAMPION
	ret z
	call Random
	and $c
	ldh [hSpriteFacingDirection], a
	ld a, ROUTE25_GREEN
	ldh [hSpriteIndex], a
	jp SetSpriteFacingDirection

Route25GreenAfterBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, .reset
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	call Route25GreenFacePlayer
	SetEvent EVENT_BEAT_ROUTE25_GREEN
	ld a, TEXT_ROUTE25_GREEN_AFTER_BATTLE
	ldh [hTextID], a
	call DisplayTextID
.reset
	xor a
	ld [wJoyIgnore], a
	ld [wRoute25CurScript], a
	ld [wCurMapScript], a
	ret

Route25Youngster1BattleText:
	text_far _Route25Youngster1BattleText
	text_end

Route25Youngster1EndBattleText:
	text_far _Route25Youngster1EndBattleText
	text_end

Route25Youngster1AfterBattleText:
	text_far _Route25Youngster1AfterBattleText
	text_end

Route25Youngster2BattleText:
	text_far _Route25Youngster2BattleText
	text_end

Route25Youngster2EndBattleText:
	text_far _Route25Youngster2EndBattleText
	text_end

Route25Youngster2AfterBattleText:
	text_far _Route25Youngster2AfterBattleText
	text_end

Route25CooltrainerMBattleText:
	text_far _Route25CooltrainerMBattleText
	text_end

Route25CooltrainerMEndBattleText:
	text_far _Route25CooltrainerMEndBattleText
	text_end

Route25CooltrainerMAfterBattleText:
	text_far _Route25CooltrainerMAfterBattleText
	text_end

Route25CooltrainerF1BattleText:
	text_far _Route25CooltrainerF1BattleText
	text_end

Route25CooltrainerF1EndBattleText:
	text_far _Route25CooltrainerF1EndBattleText
	text_end

Route25CooltrainerF1AfterBattleText:
	text_far _Route25CooltrainerF1AfterBattleText
	text_end

Route25Youngster3BattleText:
	text_far _Route25Youngster3BattleText
	text_end

Route25Youngster3EndBattleText:
	text_far _Route25Youngster3EndBattleText
	text_end

Route25Youngster3AfterBattleText:
	text_far _Route25Youngster3AfterBattleText
	text_end

Route25CooltrainerF2BattleText:
	text_far _Route25CooltrainerF2BattleText
	text_end

Route25CooltrainerF2EndBattleText:
	text_far _Route25CooltrainerF2EndBattleText
	text_end

Route25CooltrainerF2AfterBattleText:
	text_far _Route25CooltrainerF2AfterBattleText
	text_end

Route25Hiker1BattleText:
	text_far _Route25Hiker1BattleText
	text_end

Route25Hiker1EndBattleText:
	text_far _Route25Hiker1EndBattleText
	text_end

Route25Hiker1AfterBattleText:
	text_far _Route25Hiker1AfterBattleText
	text_end

Route25Hiker2BattleText:
	text_far _Route25Hiker2BattleText
	text_end

Route25Hiker2EndBattleText:
	text_far _Route25Hiker2EndBattleText
	text_end

Route25Hiker2AfterBattleText:
	text_far _Route25Hiker2AfterBattleText
	text_end

Route25Hiker3BattleText:
	text_far _Route25Hiker3BattleText
	text_end

Route25Hiker3EndBattleText:
	text_far _Route25Hiker3EndBattleText
	text_end

Route25Hiker3AfterBattleText:
	text_far _Route25Hiker3AfterBattleText
	text_end

Route25BillSignText:
	text_far _Route25BillSignText
	text_end

Route25GreenBeforeBattleText:
	text_far _Route25GreenBeforeBattleText
	text_end

Route25GreenEndBattleText:
	text_far _Route25GreenEndBattleText
	text_end

Route25GreenPlayerLoseText:
	text_far _Route25GreenPlayerLoseText
	text_end

Route25GreenAfterBattleDisplayText:
	text_far _Route25GreenAfterBattleText
	text_end
