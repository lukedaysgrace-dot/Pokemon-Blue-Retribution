DEF TILE_1BPP_SIZE EQU TILE_SIZE / 2 ; bytes

DEF BLOCK_WIDTH EQU 4 ; tiles
DEF BLOCK_HEIGHT EQU BLOCK_WIDTH ; tiles
DEF SCREEN_BLOCK_WIDTH EQU 6 ; blocks
DEF SCREEN_BLOCK_HEIGHT EQU 5 ; blocks
DEF SURROUNDING_WIDTH  EQU SCREEN_BLOCK_WIDTH * BLOCK_WIDTH ; tiles
DEF SURROUNDING_HEIGHT EQU SCREEN_BLOCK_HEIGHT * BLOCK_HEIGHT ; tiles

DEF PIC_WIDTH  EQU 7 ; tiles
DEF PIC_HEIGHT EQU PIC_WIDTH ; tiles
DEF PIC_SIZE   EQU PIC_WIDTH * PIC_HEIGHT ; tiles
; Trainer card: 7x7 portrait uses tile IDs 0–48 (vFrontPic). Badges used to load at vChars2 $20 (IDs
; 32–95), overlapping the portrait. Load badge .2bpp at $31 so IDs 32–48 are portrait-only.
DEF TRAINER_CARD_BADGE_GFX_BASE EQU $31
; Blank leader-name strips ($17 tiles). Vanilla loaded them at vChars2 $60 (tile IDs $96+), which sat
; right after the old badge block ($20–$5f). Badges at $31 occupy $31–$70, so IDs $96–$b0 overlap;
; those indices are still used for name strips in DrawBadges, so badge tiles appeared “mixed” into
; faces. Map blank strips at vChars1 tile $20 → IDs $a0–$b6 (same scheme as digits: vChars1 $58 → $d8).
DEF TRAINER_CARD_BLANK_LEADER_NAMES_BASE EQU $a0

DEF SPRITEBUFFERSIZE EQU PIC_WIDTH * PIC_HEIGHT * TILE_1BPP_SIZE

; HP bar
DEF HP_BAR_GREEN  EQU 0
DEF HP_BAR_YELLOW EQU 1
DEF HP_BAR_RED    EQU 2

; hAutoBGTransferEnabled
DEF TRANSFERTOP    EQU 0
DEF TRANSFERMIDDLE EQU 1
DEF TRANSFERBOTTOM EQU 2

; hRedrawRowOrColumnMode
DEF REDRAW_COL EQU 1
DEF REDRAW_ROW EQU 2

; hUILayoutFlags
	const_def
	const BIT_PARTY_MENU_HP_BAR   ; 0
	const BIT_DOUBLE_SPACED_MENU  ; 1
	const BIT_SINGLE_SPACED_LINES ; 2

; tile list ids
; TileIDListPointerTable indexes (see data/tilemaps.asm)
	const_def
	const TILEMAP_MON_PIC
	const TILEMAP_SLIDE_DOWN_MON_PIC_7X5
	const TILEMAP_SLIDE_DOWN_MON_PIC_7X3
	const TILEMAP_GENGAR_INTRO_1
	const TILEMAP_GENGAR_INTRO_2
	const TILEMAP_GENGAR_INTRO_3
	const TILEMAP_GAME_BOY
	const TILEMAP_LINK_CABLE
DEF NUM_TILEMAPS EQU const_value
