#!/usr/bin/env python3
"""Split gfx/overworld/green_fishing_strip.png (16x48) into front/back/side 16x16 PNGs."""
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
    names = ["green_fish_front.png", "green_fish_back.png", "green_fish_side.png"]
    for i, name in enumerate(names):
        crop = im.crop((0, i * 16, 16, (i + 1) * 16))
        crop.save(out_dir / name)


def split_with_magick(src: Path, out_dir: Path) -> None:
    magick = shutil.which("magick") or shutil.which("convert")
    if not magick:
        raise RuntimeError("ImageMagick not found")
    for i, name in enumerate(["green_fish_front.png", "green_fish_back.png", "green_fish_side.png"]):
        y = i * 16
        subprocess.run(
            [magick, str(src), "-crop", "16x16+0+%d" % y, "+repage", str(out_dir / name)],
            check=True,
        )


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    src = root / "gfx" / "overworld" / "green_fishing_strip.png"
    if not src.is_file():
        sys.exit(f"Missing {src} (run tools/setup_green_player_pngs.py first)")
    out_dir = root / "gfx" / "overworld"
    try:
        split_with_pil(src, out_dir)
    except ImportError:
        split_with_magick(src, out_dir)
    for name in ["green_fish_front.png", "green_fish_back.png", "green_fish_side.png"]:
        print(f"Wrote gfx/overworld/{name}")


if __name__ == "__main__":
    main()
