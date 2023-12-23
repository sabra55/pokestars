Frame1:	INCBIN "gfx/movie/1.2bpp"
;Frame2:	INCBIN "gfx/movie/2.2bpp"
;Frame3:	INCBIN "gfx/movie/3.2bpp"
Frame4:	INCBIN "gfx/movie/4.2bpp"
;Frame5:	INCBIN "gfx/movie/5.2bpp"
;Frame6:	INCBIN "gfx/movie/6.2bpp"
Frame7:	INCBIN "gfx/movie/7.2bpp"
;Frame8:	INCBIN "gfx/movie/8.2bpp"
;Frame9:	INCBIN "gfx/movie/9.2bpp"
FrameA:	INCBIN "gfx/movie/10.2bpp"
;FrameB:	INCBIN "gfx/movie/11.2bpp"
;FrameC:	INCBIN "gfx/movie/12.2bpp"
FrameD:	INCBIN "gfx/movie/13.2bpp"
;FrameE:	INCBIN "gfx/movie/14.2bpp"
FramesEnd:

FRAME_SIZE EQU FramesEnd - FrameD

SECTION "Movie Engine", ROMX

PlayIntroMovie:: ; intro movie playback engine
	xor a
.loop:
	cp a,5
	ret z
	inc a
	ld [wFrameNo], a
	ld c, a
	call LoadMovieFrame
	halt
	halt
	halt
	jr .loop
	
LoadMovieFrame: ; c - frame no.
	ld hl, Frame1
	xor a
	ld b, a
	ld [hMultiplicand], a
	ld [hMultiplicand+1], a
	ld a, c
	ld [hMultiplicand+2], a
	ld a, FRAME_SIZE
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct+3]
	ld d, a
	ld a, [hProduct+4]
	ld e, a
	add hl,de
	push bc
	ld bc, FRAME_SIZE
	ld de, $8800
	call CopyData
	pop bc
	ret
	