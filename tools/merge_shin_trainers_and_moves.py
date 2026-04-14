#!/usr/bin/env python3
"""Merge Shin Red Legacy (Ubuntu sibling repo) parties, trainer move overrides, and move stats."""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SHIN = ROOT.parent / "Pokemon Shin Red Legacy"

V_PARTIES = ROOT / "data/trainers/parties.asm"
V_MOVES = ROOT / "data/moves/moves.asm"
V_CUSTOM = ROOT / "data/trainers/custom_trainer_moves_table.asm"
S_PARTIES = SHIN / "data/trainer_parties.asm"
S_MOVES = SHIN / "data/moves.asm"
S_TRMOVES = SHIN / "data/trainer_moves.asm"

CLASS_MAP = {"SONY1": "RIVAL1", "SONY2": "RIVAL2", "SONY3": "RIVAL3"}

REMATCH_SKIP = {
    ("RIVAL3", 4),
    ("RIVAL3", 5),
    ("RIVAL3", 6),
    ("BROCK", 2),
    ("MISTY", 2),
    ("LT_SURGE", 2),
    ("ERIKA", 2),
    ("KOGA", 2),
    ("BLAINE", 2),
    ("SABRINA", 2),
    ("GIOVANNI", 4),
    ("LORELEI", 2),
    ("BRUNO", 2),
    ("AGATHA", 2),
    ("LANCE", 2),
}


def fmt_db_line(line: str) -> str:
    s = line.strip()
    if not s.startswith("db "):
        return line.rstrip()
    inner = s[3:]
    parts = [p.strip() for p in inner.split(",")]
    return "\t" + "db " + ", ".join(parts)


def transform_shin_body(text: str) -> str:
    text = text.replace("Juggler1Data:", "UnusedJugglerData:")
    text = text.replace("Green1Data:", "Rival1Data:")
    text = text.replace("Green2Data:", "Rival2Data:")
    text = text.replace("Green3Data:", "Rival3Data:")
    text = text.replace("MISSINGNO_B5", "$B5")
    text = text.replace("GARDEVOIR", "HYPNO")
    text = text.replace("SALAMENCE", "DRAGONITE")
    text = re.sub(r"RosterLabelStart::\n?", "", text)
    text = re.sub(r"RosterLabelEnd::\n?", "", text)
    out = []
    for ln in text.splitlines():
        if ln.strip().startswith("db "):
            out.append(fmt_db_line(ln))
        else:
            out.append(ln.rstrip())
    return "\n".join(out) + "\n"


def extract_between(src: str, start: str, end: str) -> str:
    a = src.index(start)
    b = src.index(end, a)
    return src[a:b]


# Snapshots from pre-merge vanilla (wTrainerNo rematch rows only)
REMATCH_GIOVANNI = """; Post-Champion rematch (wTrainerNo 4)
\tdb $FF, 55, RHYDON, 55, NIDOQUEEN, 55, NIDOKING, 55, DUGTRIO, 55, MAROWAK, 55, PERSIAN, 0
"""
REMATCH_RIVAL3 = """; Post-Champion rematch (wTrainerNo 4–6; same starter mapping as rows 1–3)
\tdb $FF, 68, PIDGEOT, 67, ALAKAZAM, 69, RHYDON, 69, ARCANINE, 71, EXEGGUTOR, 73, BLASTOISE, 0
\tdb $FF, 68, PIDGEOT, 67, ALAKAZAM, 69, RHYDON, 69, GYARADOS, 71, ARCANINE, 73, VENUSAUR, 0
\tdb $FF, 68, PIDGEOT, 67, ALAKAZAM, 69, RHYDON, 69, EXEGGUTOR, 71, GYARADOS, 73, CHARIZARD, 0
"""
REMATCH_LORELEI = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 58, LAPRAS, 58, CLOYSTER, 58, SLOWBRO, 58, JYNX, 58, DEWGONG, 58, ARTICUNO, 0
"""
REMATCH_AGATHA = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 60, GENGAR, 60, GOLBAT, 60, HAUNTER, 60, ARBOK, 60, MUK, 60, HYPNO, 0
"""
REMATCH_BRUNO = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 58, MACHAMP, 58, HITMONLEE, 58, HITMONCHAN, 58, GOLEM, 58, ONIX, 58, PRIMEAPE, 0
"""
REMATCH_BROCK = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 55, GOLEM, 55, RHYDON, 55, ONIX, 55, OMASTAR, 55, KABUTOPS, 55, AERODACTYL, 0
"""
REMATCH_MISTY = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 55, STARMIE, 55, GYARADOS, 55, LAPRAS, 55, BLASTOISE, 55, GOLDUCK, 55, TENTACRUEL, 0
"""
REMATCH_LT_SURGE = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 55, RAICHU, 55, ELECTABUZZ, 55, JOLTEON, 55, MAGNETON, 55, ELECTRODE, 55, VOLTORB, 0
"""
REMATCH_ERIKA = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 55, VILEPLUME, 55, VICTREEBEL, 55, EXEGGUTOR, 55, TANGELA, 55, PARASECT, 55, VENUSAUR, 0
"""
REMATCH_KOGA = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 55, WEEZING, 55, MUK, 55, VENOMOTH, 55, TENTACRUEL, 55, HYPNO, 55, ARBOK, 0
"""
REMATCH_BLAINE = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 55, ARCANINE, 55, NINETALES, 55, RAPIDASH, 55, CHARIZARD, 55, MAGMAR, 55, FLAREON, 0
"""
REMATCH_SABRINA = """; Post-Champion rematch (wTrainerNo 2)
\tdb $FF, 55, ALAKAZAM, 55, HYPNO, 55, SLOWBRO, 55, JYNX, 55, MR_MIME, 55, GENGAR, 0
"""


def build_parties() -> str:
    if not SHIN.is_dir():
        raise SystemExit(f"Expected Shin repo at {SHIN}")
    # Read vanilla from Shin sibling only for Channeler + header; rematches use constants above.
    van_path = ROOT / "data/trainers/parties.asm"
    van = van_path.read_text()
    shin = S_PARTIES.read_text()

    header = van.split("YoungsterData:")[0]
    y0 = shin.index("YoungsterData:")
    y1 = shin.index("RosterLabelEnd::")
    block = transform_shin_body(shin[y0:y1])

    # Keep vanilla Channeler roster count for map scripts
    ch_v = extract_between(van, "ChannelerData:", "AgathaData:")
    cs = block.index("ChannelerData:")
    ce = block.index("AgathaData:")
    block = block[:cs] + ch_v + block[ce:]

    def ins(b: str, anchor: str, rem: str, next_lab: str) -> str:
        needle = anchor + "\n" + next_lab
        if needle not in b:
            raise SystemExit(f"merge anchor missing for {next_lab!r}")
        return b.replace(needle, anchor + "\n" + rem + next_lab, 1)

    block = ins(
        block,
        "\tdb $FF, 41, KANGASKHAN, 42, MAROWAK, 45, NIDOQUEEN, 43, NIDOKING, 42, RHYDON, 42, KABUTOPS, 0",
        REMATCH_GIOVANNI,
        "RocketData:",
    )
    block = ins(
        block,
        "\tdb $FF, 54, PIDGEOT, 57, ALAKAZAM, 55, RHYDON, 56, EXEGGUTOR, 56, GYARADOS, 60, CHARIZARD, 0",
        REMATCH_RIVAL3,
        "LoreleiData:",
    )
    block = ins(
        block,
        "\tdb $FF, 45, DEWGONG, 46, CLOYSTER, 46, SLOWBRO, 47, JYNX, 47, LAPRAS, 46, VAPOREON, 0",
        REMATCH_LORELEI,
        "ChannelerData:",
    )
    block = ins(
        block,
        "\tdb $FF, 48, GENGAR, 47, TENTACRUEL, 46, GOLBAT, 48, ARBOK, 52, GENGAR, 47, WEEZING, 0",
        REMATCH_AGATHA,
        "LanceData:",
    )
    block = ins(
        block,
        "\tdb $FF, 46, ONIX, 47, HITMONCHAN, 47, HITMONLEE, 47, GOLEM, 50, MACHAMP, 48, POLIWRATH, 0",
        REMATCH_BRUNO,
        "BrockData:",
    )
    block = ins(
        block,
        "\tdb $FF, 12, GEODUDE, 15, ONIX, 0",
        REMATCH_BROCK,
        "MistyData:",
    )
    block = ins(
        block,
        "\tdb $FF, 18, STARYU, 19, HORSEA, 22, STARMIE, 0",
        REMATCH_MISTY,
        "LtSurgeData:",
    )
    block = ins(
        block,
        "\tdb $FF, 18, VOLTORB, 21, ELECTABUZZ, 25, RAICHU, 0",
        REMATCH_LT_SURGE,
        "ErikaData:",
    )
    block = ins(
        block,
        "\tdb $FF, 29, TANGELA, 31, PARASECT, 33, VICTREEBEL, 33, VILEPLUME, 0",
        REMATCH_ERIKA,
        "KogaData:",
    )
    block = ins(
        block,
        "\tdb $FF, 37, ARBOK, 39, MUK, 38, VENOMOTH, 43, WEEZING, 41, TENTACRUEL, 0",
        REMATCH_KOGA,
        "BlaineData:",
    )
    block = ins(
        block,
        "\tdb $FF, 40, NINETALES, 43, MAGMAR, 43, RAPIDASH, 47, ARCANINE, 45, FLAREON, 0",
        REMATCH_BLAINE,
        "SabrinaData:",
    )
    block = ins(
        block,
        "\tdb $FF, 37, MR_MIME, 38, HYPNO, 38, GOLDUCK, 38, JYNX, 43, ALAKAZAM, 0",
        REMATCH_SABRINA,
        "GentlemanData:",
    )

    lance_anchor = (
        "\tdb $FF, 52, GYARADOS, 54, DRAGONITE, 54, DRAGONITE, 52, AERODACTYL, 55, DRAGONITE, 54, SEADRA, 0"
    )
    if lance_anchor + "\n; Post-Champion rematch" not in block:
        block = block.replace(
            lance_anchor + "\n",
            lance_anchor + "\n"
            + "; Post-Champion rematch (wTrainerNo 2)\n"
            + "\tdb $FF, 62, DRAGONITE, 62, DRAGONAIR, 62, CHARIZARD, 62, GYARADOS, 62, AERODACTYL, 62, GYARADOS, 0\n",
            1,
        )

    return header + block


def parse_shin_move_stats(text: str) -> dict[str, str]:
    d: dict[str, str] = {}
    for m in re.finditer(
        r"^\tmove (NO_MOVE|\w+)\s*,\s*([^;]+?)\s*(;.*)?$",
        text,
        re.MULTILINE,
    ):
        name = m.group(1)
        rest = m.group(2).strip().rstrip(",")
        d[name] = rest
    return d


def merge_moves_vanilla(shin_map: dict[str, str]) -> str:
    def fix_types(s: str) -> str:
        s = re.sub(r",\s*PSYCHIC,", ", PSYCHIC_TYPE,", s)
        s = s.replace("FREEZE_SIDE_EFFECT,", "FREEZE_SIDE_EFFECT1,")
        return s

    out = []
    for line in V_MOVES.read_text().splitlines():
        m = re.match(r"^(\tmove )(NO_MOVE|\w+)(,)(\s*)(.+)$", line)
        if not m:
            out.append(line)
            continue
        name = m.group(2)
        if name in shin_map:
            rest = fix_types(shin_map[name])
            out.append(f"{m.group(1)}{name}{m.group(3)}{m.group(4)}{rest}")
        else:
            out.append(line)
    return "\n".join(out) + "\n"


def parse_special_trainer_moves(text: str) -> dict[tuple[str, int], list[tuple[int, int, str]]]:
    i = text.index("SpecialTrainerMoves:")
    lines = text[i:].splitlines()
    blocks: dict[tuple[str, int], list[tuple[int, int, str]]] = {}
    idx = 0
    while idx < len(lines):
        ln = lines[idx].strip()
        if re.match(r"db \$ff", ln, re.I):
            break
        m = re.match(r"db (\w+)\s*,\s*\$([0-9A-Fa-f]+)\s*$", ln, re.I)
        if m:
            cname = m.group(1)
            cname = CLASS_MAP.get(cname, cname)
            tid = int(m.group(2), 16)
            idx += 1
            trips: list[tuple[int, int, str]] = []
            while idx < len(lines):
                ln2 = lines[idx].strip()
                if re.match(r"db\s+0\s*$", ln2):
                    idx += 1
                    break
                m2 = re.match(r"db\s+(\d+)\s*,\s*(\d+)\s*,\s*(\w+)", ln2)
                if m2:
                    trips.append((int(m2.group(1)), int(m2.group(2)), m2.group(3)))
                idx += 1
            blocks[(cname, tid)] = trips
            continue
        idx += 1
    return blocks


def merge_custom_table(st: dict[tuple[str, int], list[tuple[int, int, str]]]) -> str:
    van = V_CUSTOM.read_text()
    row_re = re.compile(r"^db (\w+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(.+)$")
    out = []
    seen_keys: set[tuple[str, int]] = set()
    for line in van.splitlines():
        raw = line.rstrip()
        s = raw.strip()
        if not s.startswith("db ") or s.lower() == "db $ff":
            out.append(raw)
            continue
        m = row_re.match(s)
        if not m:
            out.append(raw)
            continue
        cls, tid_s, slot_s, tail = m.group(1), m.group(2), m.group(3), m.group(4)
        tid = int(tid_s)
        slot = int(slot_s)
        seen_keys.add((cls, tid))  # any row for this trainer class + id
        if (cls, tid) in REMATCH_SKIP:
            out.append(raw)
            continue
        trips = st.get((cls, tid), [])
        if not trips:
            out.append(raw)
            continue
        comment = ""
        t = tail
        if ";" in t:
            t, c = t.split(";", 1)
            comment = " ;" + c
        moves = [x.strip() for x in t.split(",")]
        moves = (moves + ["NO_MOVE", "NO_MOVE", "NO_MOVE", "NO_MOVE"])[:4]
        for mon, mslot, mv in trips:
            if mon == slot and 1 <= mslot <= 4:
                moves[mslot - 1] = mv
        out.append(f"db {cls}, {tid}, {slot}, {', '.join(moves[:4])}{comment}")

    # Append rows for Shin-only specials (e.g. JR_TRAINER Red / Seiga, CHIEF MissingNo)
    extra: list[str] = []
    for (cls, tid), trips in sorted(st.items()):
        if (cls, tid) in REMATCH_SKIP or (cls, tid) in seen_keys:
            continue
        if not trips:
            continue
        slots = sorted({mon for mon, _, _ in trips})
        for s in slots:
            moves = ["NO_MOVE", "NO_MOVE", "NO_MOVE", "NO_MOVE"]
            for mon, mslot, mv in trips:
                if mon == s and 1 <= mslot <= 4:
                    moves[mslot - 1] = mv
            extra.append(f"db {cls}, {tid}, {s}, {', '.join(moves)}")
    if extra:
        insert_at = len(out)
        for i, ln in enumerate(out):
            if ln.strip().lower() == "db $ff":
                insert_at = i
                break
        out[insert_at:insert_at] = ["", "; --- Shin-only trainer move rows (from SpecialTrainerMoves) ---"] + extra
    return "\n".join(out) + "\n"


if __name__ == "__main__":
    shin_map = parse_shin_move_stats(S_MOVES.read_text())
    st = parse_special_trainer_moves(S_TRMOVES.read_text())
    V_PARTIES.write_text(build_parties())
    V_MOVES.write_text(merge_moves_vanilla(shin_map))
    V_CUSTOM.write_text(merge_custom_table(st))
    print("OK:", V_PARTIES.name, V_MOVES.name, V_CUSTOM.name)
