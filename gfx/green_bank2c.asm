; Green-only graphics in ROM bank $2C to avoid overflowing "NPC Sprites 2", "Pics 4",
; "Blue Cloak OW Sprite" (bank $1), etc.
SECTION "Green Fishing Tiles", ROMX

GreenFishingTilesFront:: INCBIN "gfx/overworld/green_fish_front.2bpp"
GreenFishingTilesBack::  INCBIN "gfx/overworld/green_fish_back.2bpp"
GreenFishingTilesSide::  INCBIN "gfx/overworld/green_fish_side.2bpp"


SECTION "Green Player OW Sprites", ROMX

GreenSprite::     INCBIN "gfx/sprites/green.2bpp"
GreenBikeSprite:: INCBIN "gfx/sprites/green_bike.2bpp"


SECTION "Green Rocket OW Sprite", ROMX

GreenRocketSprite:: INCBIN "gfx/sprites/greenrocket.2bpp"


SECTION "Green Pic Back", ROMX

GreenPicBack:: INCBIN "gfx/player/greenb.pic"


SECTION "Green Rocket Trainer Pic", ROMX

GreenRocketPic:: INCBIN "gfx/trainers/greenrocket.pic"


SECTION "Ninja Janine Trainer Pics", ROMX

NinjaPic::  INCBIN "gfx/trainers/ninja.pic"
JaninePic:: INCBIN "gfx/trainers/janine.pic"
