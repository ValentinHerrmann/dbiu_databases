#!/usr/bin/env python3
"""Render Mermaid UML sources (*.mmd) to PNG/PDF and table schemes (*.schema.txt) to PNG.

Usage: python3 tools/render_diagrams.py [FILE.mmd|FILE.schema.txt ...]
       (default: dbiu_databases/*.mmd and dbiu_databases/*.schema.txt)

Each diagram is laid out with ELK and dagre, left-right and top-down. The first layout (in that order)
with an aspect ratio between 4:3 and 21:9 becomes <name>.png/.pdf and is written back into the .mmd;
the best portrait layout becomes <name>_portrait.png/.pdf.
"""
import glob
import json
import math
import os
import re
import shutil
import struct
import subprocess
import sys
import tempfile

from PIL import Image, ImageChops

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MMDC = ["npx", "-y", "@mermaid-js/mermaid-cli@11.17.1"]
TB, LR = "  direction TB\n", "  direction LR\n"
ELK = '"layout": "elk", '
CANDIDATES = [("elk", LR), ("elk", TB), ("dagre", LR), ("dagre", TB)]
LANDSCAPE = (4 / 3, 21 / 9)
PORTRAIT = (9 / 21, 3 / 4)
SCHEME_HTML = """<!doctype html><meta charset="utf-8">
<style>body { margin: 0; background: #fff; }
div { margin: 20px; font: 18px/2 "Liberation Sans", Arial, sans-serif; color: #000; white-space: pre; }
.pk { text-decoration: underline; text-underline-offset: 3px; }
.fk { text-decoration: underline dotted; text-underline-offset: 3px; }
.pkfk { text-decoration: underline; text-underline-offset: 3px; border-bottom: 2px dotted; padding-bottom: 6px; }
span { text-decoration-skip-ink: none; }</style>
<div>{}</div>"""
PK_MARK, FK_MARK = "\u0332", "\u0323"


def scheme_html(text):
    """Turn the combining key marks of the plain-text scheme into CSS underline (PK) / dotted (FK)."""
    text = text.replace("&", "&amp;").replace("<", "&lt;")

    def span(m):
        run = m.group()
        cls = ("pk" if PK_MARK in run else "") + ("fk" if FK_MARK in run else "")
        return f'<span class="{cls}">{run.replace(PK_MARK, "").replace(FK_MARK, "")}</span>'
    return re.sub(f"(?:[^{PK_MARK}{FK_MARK}][{PK_MARK}{FK_MARK}]+)+", span, text)


def png_size(path):
    with open(path, "rb") as f:
        return struct.unpack(">II", f.read(24)[16:24])


def distance(ratio, bounds):
    """0 inside the ratio range, else the log distance to it."""
    lo, hi = bounds
    return max(0.0, math.log(lo) - math.log(ratio), math.log(ratio) - math.log(hi))


def pick(layouts, bounds, keys):
    """First key in preference order inside bounds, else the key closest to bounds."""
    keys = [k for k in keys if k in layouts]
    if not keys:
        return None
    return min(keys, key=lambda k: (distance(layouts[k][2] / layouts[k][3], bounds), keys.index(k)))


def render_scheme(path, chromium):
    base = path[:-len(".schema.txt")]
    with open(path, encoding="utf-8") as f:
        text = f.read().rstrip("\n")
    with tempfile.TemporaryDirectory() as tmp:
        html = os.path.join(tmp, "scheme.html")
        with open(html, "w", encoding="utf-8") as f:
            f.write(SCHEME_HTML.replace("{}", scheme_html(text)))
        shot = os.path.join(tmp, "shot.png")
        height = 60 + 38 * (text.count("\n") + 1)
        subprocess.run([chromium, "--headless", "--no-sandbox", "--hide-scrollbars", "--force-device-scale-factor=2",
                        f"--window-size=4000,{height}", f"--screenshot={shot}", f"file://{html}"],
                       check=True, capture_output=True)
        img = Image.open(shot).convert("RGB")
        box = ImageChops.difference(img, Image.new("RGB", img.size, "white")).getbbox()
        pad = 30
        img.crop((max(box[0] - pad, 0), max(box[1] - pad, 0), box[2] + pad, box[3] + pad)).save(base + ".schema.png")
    print(f"rendered {os.path.relpath(base, ROOT)}.schema.png", flush=True)


def main():
    os.environ["PUPPETEER_SKIP_DOWNLOAD"] = "1"
    chromium = shutil.which("chromium") or shutil.which("google-chrome") or ""
    os.environ.setdefault("PUPPETEER_EXECUTABLE_PATH", chromium)
    srcs = sys.argv[1:] or sorted(glob.glob(os.path.join(ROOT, "dbiu_databases", "*.mmd"))
                                  + glob.glob(os.path.join(ROOT, "dbiu_databases", "*.schema.txt")))
    with tempfile.TemporaryDirectory() as tmp:
        cfg = os.path.join(tmp, "puppeteer.json")
        with open(cfg, "w") as f:
            json.dump({"args": ["--no-sandbox"]}, f)

        def render(text, out_path, extra):
            src = os.path.join(tmp, "in.mmd")
            with open(src, "w", encoding="utf-8") as f:
                f.write(text)
            subprocess.run(MMDC + ["-q", "-p", cfg, "-b", "white", "-w", "4000", "-i", src, "-o", out_path] + extra,
                           check=True)

        for path in srcs:
            if path.endswith(".schema.txt"):
                render_scheme(path, os.environ["PUPPETEER_EXECUTABLE_PATH"])
                continue
            base = path[:-len(".mmd")]
            with open(path, encoding="utf-8") as f:
                plain = f.read().replace(ELK, "").replace(LR, TB)
            layouts = {}
            for engine, direction in CANDIDATES:
                key = f"{engine} {direction.split()[1]}"
                text = plain.replace(TB, direction)
                if engine == "elk":
                    text = text.replace("{init: {", "{init: {" + ELK, 1)
                png = os.path.join(tmp, key.replace(" ", "_") + ".png")
                try:
                    render(text, png, ["-s", "2"])
                except subprocess.CalledProcessError:
                    continue
                layouts[key] = (text, png, *png_size(png))
            order = [f"{e} {d.split()[1]}" for e, d in CANDIDATES]
            main_key = pick(layouts, LANDSCAPE, order)
            text, png, w, h = layouts[main_key]
            shutil.copy(png, base + ".png")
            render(text, base + ".pdf", ["-f"])
            with open(path, "w", encoding="utf-8") as f:
                f.write(text)
            portrait_key = pick({k: v for k, v in layouts.items() if v[3] > v[2]}, PORTRAIT, order) if w >= h else None
            if portrait_key:
                p_text, p_png, _, _ = layouts[portrait_key]
                shutil.copy(p_png, base + "_portrait.png")
                render(p_text, base + "_portrait.pdf", ["-f"])
            else:
                for stale in (base + "_portrait.png", base + "_portrait.pdf"):
                    if os.path.exists(stale):
                        os.remove(stale)
            info = f"{main_key} {w}x{h}" + (f", portrait {portrait_key}" if portrait_key else "")
            print(f"rendered {os.path.relpath(base, ROOT)} ({info})", flush=True)


if __name__ == "__main__":
    main()
