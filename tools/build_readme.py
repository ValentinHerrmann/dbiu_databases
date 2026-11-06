#!/usr/bin/env python3
"""Rebuild README.md: overview table and one section (UML, downloads, table scheme) per database.

Usage: python3 tools/build_readme.py [--ref REF] [--planned-dir DIR]

Released databases are read from the numbered list "N. `dbiu.<name>`: <source>" in README.md,
planned ones from the list "- `dbiu.<name>`: <source>" below "### Planned databases" (their .db files in DIR).
Diagrams must already be rendered (tools/gen_diagrams.py, tools/render_diagrams.py).
"""
import argparse
import os
import re
import sqlite3
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gen_diagrams import junction, read_schema  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DB_DIR = os.path.join(ROOT, "dbiu_databases")
FIRST_SECTION = "#### Database in version: 1 "
PLANNED_HEAD = "### Planned databases (not yet released)"
OVERVIEW_HEAD = "### Overview"
INTRO = "The following SQLite databases are available"


def relations(db):
    """Relation kinds of a database and what it is suitable for in class."""
    schema = read_schema(db, os.path.splitext(os.path.basename(db))[0])
    kinds = set()
    for t, info in schema.items():
        if junction(info):
            kinds.add("m:n")
            if len(set(junction(info))) == 1:
                kinds.add("self-reference")
            continue
        for cols, ref in info["fks"]:
            if ref == t:
                kinds.add("self-reference")
            elif sorted(cols) == sorted(info["pk"]):
                kinds.add("1:1")
            else:
                kinds.add("1:n")
    con = sqlite3.connect(f"file:{db}?mode=ro", uri=True)
    rows = sum(con.execute(f"SELECT count(*) FROM \"{t}\"").fetchone()[0] for t in schema)
    con.close()
    suitable = []
    if "1:n" in kinds or "1:1" in kinds:
        suitable.append("JOIN over 1:n" + ("/1:1" if "1:1" in kinds else ""))
    if "m:n" in kinds:
        suitable.append("JOIN over junction tables (m:n)")
    if "self-reference" in kinds:
        suitable.append("self-join")
    order = ["1:1", "1:n", "m:n", "self-reference"]
    if len(schema) > 1 and not kinds:
        suitable.append("several independent tables")
    basics = "SELECT, WHERE, ORDER BY, GROUP BY" + ("" if suitable else " (no JOINs)")
    return len(schema), rows, ", ".join(k for k in order if k in kinds) or "none", "; ".join([basics] + suitable)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--ref", default="main", help="git ref the image/download links point to")
    ap.add_argument("--planned-dir", help="directory holding the .db files of planned databases")
    args = ap.parse_args()
    readme_path = os.path.join(ROOT, "README.md")
    with open(readme_path, encoding="utf-8") as f:
        readme = f.read()
    head = readme[:readme.index(FIRST_SECTION)]
    planned_text = readme[readme.index(PLANNED_HEAD):] if PLANNED_HEAD in readme else ""
    released = re.findall(r"^(\d+)\. `dbiu\.(\w+)`", head, re.M)
    planned = re.findall(r"^- `dbiu\.(\w+)`: (.*)$", planned_text, re.M)
    head = re.sub(r"number \(`1` to `\d+`\)", f"number (`1` to `{released[-1][0]}`)", head)

    def db_path(name, is_planned):
        return os.path.join(args.planned_dir if is_planned else DB_DIR, f"{name}.db")

    table = [OVERVIEW_HEAD, "", "| Nr | Key | Tables | Rows | Relations | Suitable for |", "|---|---|---|---|---|---|"]
    for num, name in released:
        table.append(f"| {num} | `dbiu.{name}` | " + " | ".join(map(str, relations(db_path(name, False)))) + " |")
    for name, _ in planned:
        table.append(f"| planned | `dbiu.{name}` | " + " | ".join(map(str, relations(db_path(name, True)))) + " |")
    if OVERVIEW_HEAD in head:
        head = head[:head.index(OVERVIEW_HEAD)] + head[head.index("### Available SQLite Databases"):]
    head = head.replace("### Available SQLite Databases", "\n".join(table) + "\n\n\n### Available SQLite Databases", 1)

    def block(name, is_planned):
        return subprocess.run([sys.executable, os.path.join(ROOT, "tools", "gen_diagrams.py"), "--readme",
                               "--ref", args.ref, "--out", DB_DIR, db_path(name, is_planned)],
                              capture_output=True, text=True, check=True).stdout

    parts = [head.rstrip("\n") + "\n\n"]
    for num, name in released:
        parts.append(f"#### Database in version: {num} - dbiu.{name}\n\n{block(name, False)}\n")
    if planned:
        parts.append(f"{PLANNED_HEAD}\n\nThe following databases are prepared but not yet published as package versions; "
                     "keys and version numbers are provisional.\n\n")
        parts += [f"- `dbiu.{name}`: {src}\n" for name, src in planned]
        parts.append("\n")
        for name, _ in planned:
            parts.append(f"#### Planned - dbiu.{name}\n\n{block(name, True)}\n")
    with open(readme_path, "w", encoding="utf-8") as f:
        f.write("".join(parts).rstrip("\n") + "\n")


if __name__ == "__main__":
    main()
