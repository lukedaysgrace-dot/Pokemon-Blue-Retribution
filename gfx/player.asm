RedPicFront::   INCBIN "gfx/player/red.pic"
GreenPicFront:: INCBIN "gfx/player/green.pic"
MintPicFront::  INCBIN "gfx/player/mint.pic"
ShrinkPic1::   INCBIN "gfx/player/shrink1.pic"
ShrinkPic2::   INCBIN "gfx/player/shrink2.pic"

	ASSERT BANK(RedPicFront) == BANK(GreenPicFront)
	ASSERT BANK(RedPicFront) == BANK(MintPicFront)
