BorderPalettes:
	INCBIN "gfx/sgb/red_border.tilemap"

	ds $100

	RGB 30,30,30 ; PAL_SGB1
	RGB $12,$12,$18
	RGB 5,5,5 ; unused
	RGB 1,1,1

	ds $18

	RGB 31,26,10 ; PAL_SGB2
	RGB 30,30,30
	RGB 27,0,0
	RGB 1,1,1

	ds $18

SGBBorderGraphics:
	INCBIN "gfx/sgb/red_border.2bpp"