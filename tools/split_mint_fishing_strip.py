#!/usr/bin/env python3
"""Split gfx/overworld/mint_fishing_strip.png (16x48) into front/back/side 16x16 PNGs."""
from __future__ import annotations

import shutil
import subprocess
import sys
from pathlib import Path


def split_with_pil(src: Path, out_dir: Path) -> None:
    from PIL import Image

    im = Image.open(src).convert("RGBA")
    w, h = im.size
    if w != 16 or h != 48:
        sys.exit(f"Expected 16x48 fishing strip, got {w}x{h}")
    names = ["mint_fish_front.png", "mint_fish_back.png", "mint_fish_side.png"]
    for i, name in enumerate(names):
        crop = im.crop((0, i * 16, 16, (i + 1) * 16))
        crop.save(out_dir / name)


def split_with_magick(src: Path, out_dir: Path) -> None:
    magick = shutil.which("magick") or shutil.which("convert")
    if not magick:
        raise RuntimeError("ImageMagick not found")
    for i, name in enumerate(["mint_fish_front.png", "mint_fish_back.png", "mint_fish_side.png"]):
        y = i * 16
        subprocess.run(
            [magick, str(src), "-crop", "16x16+0+%d" % y, "+repage", str(out_dir / name)],
            check=True,
        )


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    src = root / "gfx" / "overworld" / "mint_fishing_strip.png"
    if not src.is_file():
        sys.exit(f"Missing {src}")
    out_dir = root / "gfx" / "overworld"
    names = ["mint_fish_front.png", "mint_fish_back.png", "mint_fish_side.png"]
    try:
        split_with_pil(src, out_dir)
    except ImportError:
        try:
            split_with_magick(src, out_dir)
        except RuntimeError:
            if all((out_dir / name).is_file() for name in names):
                for name in names:
                    print(f"Keeping existing gfx/overworld/{name}")
                return
            raise
    for name in names:
        print(f"Wrote gfx/overworld/{name}")


if __name__ == "__main__":
    main()
