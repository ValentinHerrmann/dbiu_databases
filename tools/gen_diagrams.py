"""Generate course-style UML class diagrams (Mermaid) and one-line table schemes from SQLite databases.

Usage: python3 tools/gen_diagrams.py [--out DIR] [--readme] DB [DB ...]

Writes per database <name>.mmd (or <name>_mn.mmd + <name>_1n-1n.mmd if m:n junction tables exist)
and <name>.schema.txt next to the database (or into DIR). With --readme, prints the README section.
PNG/PDF rendering is done separately by tools/render_diagrams.py.
"""
import argparse
import os
import re
import sqlite3

MERMAID_INIT = '%%{init: {"theme": "base", "themeVariables": {"primaryColor": "#ffffff", "mainBkg": "#ffffff", "primaryBorderColor": "#000000", "nodeBorder": "#000000", "lineColor": "#000000", "primaryTextColor": "#000000", "textColor": "#000000", "edgeLabelBackground": "#ffffff", "fontFamily": "Arial, sans-serif"}, "class": {"hideEmptyMembersBox": true, "useMaxWidth": false}}}%%'
PK_MARK = "̲"  # combining low line: underlined
FK_MARK = "̣"  # combining dot below: under-dotted
RAW_BASE = "https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases"

# Relations not declared as FOREIGN KEY in the database: name -> [(table, column, ref_table)]
EXTRA_FKS = {
    "netflix": [
        ("season", "tv_show_id", "tv_show"),
        ("view_summary", "movie_id", "movie"),
        ("view_summary", "season_id", "season"),
    ],
    "pokemon": [
        ("pokemon_evolution_matchup", "evolves_from_species_id", "pokemon"),
    ],
    "geodaten": [
        ("Ort", "land", "Land"),
    ],
}


MERMAID_KEYWORDS = { "note", "class", "classDef", "click", "link", "callback", "direction", "namespace", "style",
                     "cssClass", "interface", "end" }


def ident(table):
    """Mermaid class id; reserved words get a prefixed id (the label still shows the table name)."""
    return f"T_{table}" if table in MERMAID_KEYWORDS else table


def course_type(sql_type):
    t = sql_type.lower()
    if re.match(r"(tinyint\(1\)|bool)", t):
        return "boolean"
    if re.match(r"(date|time)", t):
        return "Date"
    if re.match(r"(int|bigint|smallint|mediumint|tinyint|integer)", t):
        return "int"
    if re.match(r"(double|float|real|decimal|numeric)", t):
        return "float"
    return "String"


def read_schema(db_path, name):
    con = sqlite3.connect(f"file:{db_path}?mode=ro", uri=True)
    tables = [r[0] for r in con.execute(
        "SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%' ORDER BY rowid")]
    schema = {}
    for t in tables:
        cols = con.execute(f"PRAGMA table_info(\"{t}\")").fetchall()
        fks = {}
        for fk_id, _seq, ref, col, to, *_ in con.execute(f"PRAGMA foreign_key_list(\"{t}\")"):
            fks.setdefault(fk_id, (ref, [], []))
            fks[fk_id][1].append(col)
            fks[fk_id][2].append(to)
        schema[t] = {
            "cols": [(c[1], course_type(c[2] or "")) for c in cols],
            "pk": [c[1] for c in sorted(cols, key=lambda c: c[5]) if c[5] > 0],
            "fks": [(cols_, ref) for ref, cols_, _ in fks.values()],
            "fk_to": [(ref, to) for ref, _, to in fks.values()],
        }
    con.close()
    for t, col, ref in EXTRA_FKS.get(name, []):
        schema[t]["fks"].append(([col], ref))

    # Tables without declared PK: treat columns referenced by other tables as key (e.g. Terra)
    for t, info in schema.items():
        if info["pk"]:
            continue
        cols = [c for c, _ in info["cols"]]
        for other in schema.values():
            for ref, to in other["fk_to"]:
                if ref == t and len(to) == 1 and to[0] in cols and to[0] not in info["pk"]:
                    info["pk"].append(to[0])
    return schema


def junction(info):
    """Return the two referenced tables if the table is a pure m:n junction, else None."""
    fk_cols = {c for cols, _ in info["fks"] for c in cols}
    rest = [c for c, _ in info["cols"] if c not in fk_cols]
    surrogate = rest == ["id"] and info["pk"] == ["id"]
    if len(info["fks"]) == 2 and all(len(cols) == 1 for cols, _ in info["fks"]) and (not rest or surrogate):
        return [ref for _, ref in info["fks"]]
    return None


def ordered_cols(info):
    return [c for c in info["cols"] if c[0] in info["pk"]] + [c for c in info["cols"] if c[0] not in info["pk"]]


def mermaid(schema, collapse_mn):
    lines = [MERMAID_INIT, "classDiagram", "  direction TB"]
    hidden = {t for t, info in schema.items() if collapse_mn and junction(info)}
    for t, info in schema.items():
        if t in hidden:
            continue
        fk_cols = {c for cols, _ in info["fks"] for c in cols}
        attrs = [f"    {typ} {col}" for col, typ in ordered_cols(info) if col not in fk_cols]
        decl = f"{ident(t)}[\"{t}\"]" if ident(t) != t else t
        lines.append(f"  class {decl} {{" if attrs else f"  class {decl}")
        if attrs:
            lines += attrs + ["  }"]
    for t, info in schema.items():
        if t in hidden:
            a, b = junction(info)
            lines.append(f"  {ident(a)} \"n\" -- \"m\" {ident(b)} : {t}")
            continue
        for cols, ref in info["fks"]:
            tail = "1" if sorted(cols) == sorted(info["pk"]) else "n"
            lines.append(f"  {ident(t)} \"{tail}\" --> \"1\" {ident(ref)} : {', '.join(cols)}")
    return "\n".join(lines) + "\n"


def mark(text, m):
    return "".join(ch + m for ch in text)


def scheme(schema):
    lines = []
    for t, info in schema.items():
        fk_cols = {c for cols, _ in info["fks"] for c in cols}
        parts = []
        for col, typ in ordered_cols(info):
            marks = (PK_MARK if col in info["pk"] else "") + (FK_MARK if col in fk_cols else "")
            parts.append(f"{typ} {mark(col, marks)}")
        lines.append(f"{t}({', '.join(parts)})")
    return "\n".join(lines) + "\n"


def readme_block(name, variants, schema_text, out_dir):
    out = []
    for v in variants:
        label = {"": "", "_mn": " (m:n direkt)", "_1n-1n": " (m:n mit Beziehungstabelle)"}[v]
        line1 = f"**UML{label}:** [PNG]({RAW_BASE}/{name}{v}.png) · [PDF]({RAW_BASE}/{name}{v}.pdf)"
        if os.path.exists(os.path.join(out_dir, f"{name}{v}_portrait.png")):
            line1 += f" · Hochformat: [PNG]({RAW_BASE}/{name}{v}_portrait.png) · [PDF]({RAW_BASE}/{name}{v}_portrait.pdf)"
        out += [line1, "",
                f"<img src=\"{RAW_BASE}/{name}{v}.png\" alt=\"UML {name}{v}\" style=\"max-width: 100%;\"/>", ""]
    out += ["**Tabellenschema:**", "", "```text", schema_text.rstrip("\n"), "```", ""]
    return "\n".join(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out")
    ap.add_argument("--readme", action="store_true")
    ap.add_argument("dbs", nargs="+")
    args = ap.parse_args()
    for db in args.dbs:
        name = os.path.splitext(os.path.basename(db))[0]
        out = args.out or os.path.dirname(db) or "."
        schema = read_schema(db, name)
        has_mn = any(junction(i) for i in schema.values())
        variants = ["_mn", "_1n-1n"] if has_mn else [""]
        sources = {v: mermaid(schema, collapse_mn=(v == "_mn")) for v in variants}
        for v in variants:
            mmd_path = os.path.join(out, f"{name}{v}.mmd")
            content = sources[v]
            if os.path.exists(mmd_path):
                with open(mmd_path, encoding="utf-8") as f:
                    old = f.read()
                if "  direction LR\n" in old:
                    content = content.replace("  direction TB\n", "  direction LR\n")
            with open(mmd_path, "w", encoding="utf-8") as f:
                f.write(content)
        text = scheme(schema)
        with open(os.path.join(out, f"{name}.schema.txt"), "w", encoding="utf-8") as f:
            f.write(text)
        if args.readme:
            print(readme_block(name, variants, text, out))


if __name__ == "__main__":
    main()
