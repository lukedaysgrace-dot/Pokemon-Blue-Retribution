; Extra graphics in ROM bank $2C (same bank as custom trainer moves) to avoid overflowing
; "Blue Cloak OW Sprite" (bank $1), etc.
SECTION "Mint Fishing Tiles", ROMX

MintFishingTilesFront:: INCBIN "gfx/overworld/mint_fish_front.2bpp"
MintFishingTilesBack::  INCBIN "gfx/overworld/mint_fish_back.2bpp"
MintFishingTilesSide::  INCBIN "gfx/overworld/mint_fish_side.2bpp"


SECTION "Green Player OW Sprites", ROMX

GreenSprite::           INCBIN "gfx/sprites/green.2bpp"
MintSprite::            INCBIN "gfx/sprites/mint.2bpp"
MintBikeSprite::        INCBIN "gfx/sprites/mint_bike.2bpp"
MintSkateboardSprite::   INCBIN "gfx/sprites/mint_skateboard.2bpp"


SECTION "Green Rocket OW Sprite", ROMX

GreenRocketSprite:: INCBIN "gfx/sprites/greenrocket.2bpp"


SECTION "Green Pic Back", ROMX

GreenPicBack:: INCBIN "gfx/player/greenb.pic"


SECTION "Mint Pic Back", ROMX

MintPicBack:: INCBIN "gfx/player/mintb.pic"


SECTION "Green Rocket Trainer Pic", ROMX

GreenRocketPic:: INCBIN "gfx/trainers/greenrocket.pic"


SECTION "Ninja Janine Trainer Pics", ROMX

NinjaPic::  INCBIN "gfx/trainers/ninja.pic"
JaninePic:: INCBIN "gfx/trainers/janine.pic"


SECTION "Rocket Executive Trainer Pics", ROMX

PetrelPic:: INCBIN "gfx/trainers/petrel.pic"
ProtonPic:: INCBIN "gfx/trainers/proton.pic"
ArcherPic:: INCBIN "gfx/trainers/archer.pic"
ArianaPic:: INCBIN "gfx/trainers/ariana.pic"
SoldierPic:: INCBIN "gfx/trainers/soldier.pic"
