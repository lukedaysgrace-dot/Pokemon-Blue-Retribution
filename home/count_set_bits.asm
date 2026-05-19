; function to count how many bits are set in a string of bytes
; INPUT:
; hl = address of string of bytes
; b = length of string of bytes
; OUTPUT:
; [wNumSetBits] = number of set bits
CountSetBits::
	ld c, 0
.loop
	ld a, [hli]
	ld e, a
	ld d, 8
.innerLoop ; count how many bits are set in the current byte
	srl e
	ld a, 0
	adc c
	ld c, a
	dec d
	jr nz, .innerLoop
	dec b
	jr nz, .loop
	ld a, c
	cp NUM_POKEMON + 1
	jr c, .storeCount
	ld a, NUM_POKEMON
.storeCount
	ld [wNumSetBits], a
	ret

; Returns carry if the original 150 Pokédex entries are owned.
; Mew (#151, bit 6 of byte 18) is intentionally ignored.
Original150PokedexComplete::
	ld hl, wPokedexOwned
	ld b, 18
.checkFullBytes
	ld a, [hli]
	cp $ff
	jr nz, .notComplete
	dec b
	jr nz, .checkFullBytes
	ld a, [hl]
	and %00111111
	cp %00111111
	jr nz, .notComplete
	scf
	ret
.notComplete
	and a
	ret

; Returns carry if the original 151 Pokédex entries are owned (includes MEW).
Original151PokedexComplete::
	call Original150PokedexComplete
	ret nc
	ld hl, wPokedexOwned + 18
	ld a, [hl]
	bit 6, a ; DEX_MEW
	jr z, .notComplete
	scf
	ret
.notComplete
	and a
	ret
