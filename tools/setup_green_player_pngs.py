#!/usr/bin/env python3
"""Copy bundled Green player PNGs from Cursor workspaceStorage into gfx/.

Run from repo root on the machine that has the Cursor asset PNGs, e.g.:

  python3 tools/setup_green_player_pngs.py

Optional: pass the assets directory as argv[1].
"""
from __future__ import annotations

import shutil
import sys
from pathlib import Path


def find_assets_dir(explicit: Path | None) -> Path:
    if explicit and explicit.is_dir():
        return explicit
    home = Path.home()
    candidates = [
        home
        / ".cursor"
        / "projects"
        / "wsl-localhost-Ubuntu-home-luke-romhacks-pokemon-red-vanilla"
        / "assets",
        Path(r"C:\Users\luked\.cursor\projects\wsl-localhost-Ubuntu-home-luke-romhacks-pokemon-red-vanilla\assets"),
    ]
    for c in candidates:
        if c.is_dir():
            return c
    sys.exit("Could not find Cursor assets folder; pass it as argv[1].")


def first_match(d: Path, part: str) -> Path:
    matches = sorted(d.glob(f"*{part}*.png"))
    if not matches:
        sys.exit(f"No PNG matching *{part}*.png in {d}")
    return matches[0]


def optional_match(d: Path, part: str) -> Path | None:
    matches = sorted(d.glob(f"*{part}*.png"))
    return matches[0] if matches else None


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    assets = find_assets_dir(Path(sys.argv[1]) if len(sys.argv) > 1 else None)

    copies = [
        (first_match(assets, "images_Green-"), root / "gfx" / "sprites" / "green.png"),
        (first_match(assets, "images_GreenFront-"), root / "gfx" / "player" / "green.png"),
        (first_match(assets, "images_GreenBack-"), root / "gfx" / "player" / "greenb.png"),
    ]
    for optional in (
        ("images_MintFishing-", root / "gfx" / "overworld" / "mint_fishing_strip.png"),
        ("images_MintBike-", root / "gfx" / "sprites" / "mint_bike.png"),
    ):
        src = optional_match(assets, optional[0])
        if src:
            copies.append((src, optional[1]))
    for src, dst in copies:
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)
        print(f"Copied {src.name} -> {dst.relative_to(root)}")


if __name__ == "__main__":
    main()
