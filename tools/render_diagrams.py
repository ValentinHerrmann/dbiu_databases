#!/usr/bin/env python3
"""Render Mermaid UML sources (*.mmd) to PNG and PDF via mermaid-cli.

Usage: python3 tools/render_diagrams.py [FILE.mmd ...]   (default: dbiu_databases/*.mmd)

Each diagram is laid out top-down (TB) and left-right (LR); the more landscape one becomes
<name>.png/.pdf (and is written back into the .mmd), a portrait alternative <name>_portrait.png/.pdf.
"""
import glob
import json
import os
import shutil
import struct
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MMDC = ["npx", "-y", "@mermaid-js/mermaid-cli@11.17.1"]
TB, LR = "  direction TB\n", "  direction LR\n"


def png_size(path):
    with open(path, "rb") as f:
        return struct.unpack(">II", f.read(24)[16:24])


def main():
    os.environ["PUPPETEER_SKIP_DOWNLOAD"] = "1"
    os.environ.setdefault("PUPPETEER_EXECUTABLE_PATH", shutil.which("chromium") or shutil.which("google-chrome") or "")
    srcs = sys.argv[1:] or sorted(glob.glob(os.path.join(ROOT, "dbiu_databases", "*.mmd")))
    with tempfile.TemporaryDirectory() as tmp:
        cfg = os.path.join(tmp, "puppeteer.json")
        with open(cfg, "w") as f:
            json.dump({"args": ["--no-sandbox"]}, f)

        def render(text, out_path, extra):
            src = os.path.join(tmp, "in.mmd")
            with open(src, "w", encoding="utf-8") as f:
                f.write(text)
            subprocess.run(MMDC + ["-q", "-p", cfg, "-b", "white", "-i", src, "-o", out_path] + extra, check=True)

        for path in srcs:
            base = path[:-len(".mmd")]
            with open(path, encoding="utf-8") as f:
                text = f.read()
            layouts = {}
            for key, direction in (("TB", TB), ("LR", LR)):
                variant = text.replace(LR, TB).replace(TB, direction)
                png = os.path.join(tmp, f"{key}.png")
                render(variant, png, ["-s", "2", "-w", "4000"])
                w, h = png_size(png)
                layouts[key] = (variant, png, w, h)

            # Landscape wins; among two landscape layouts the one closest to 16:9, else the wider one
            def score(key):
                _, _, w, h = layouts[key]
                return (w >= h, -abs(w / h - 16 / 9) if w >= h else w / h)
            main_key = max(layouts, key=score)
            other_key = "LR" if main_key == "TB" else "TB"
            variant, png, w, h = layouts[main_key]
            shutil.copy(png, base + ".png")
            render(variant, base + ".pdf", ["-f", "-w", "4000"])
            if variant != text:
                with open(path, "w", encoding="utf-8") as f:
                    f.write(variant)
            o_variant, o_png, ow, oh = layouts[other_key]
            portrait = w >= h and oh > ow
            if portrait:
                shutil.copy(o_png, base + "_portrait.png")
                render(o_variant, base + "_portrait.pdf", ["-f", "-w", "4000"])
            for stale in ([] if portrait else [base + "_portrait.png", base + "_portrait.pdf"]) + [base + ".svg"]:
                if os.path.exists(stale):
                    os.remove(stale)
            print(f"rendered {os.path.relpath(base, ROOT)} ({main_key}{', +portrait' if portrait else ''})", flush=True)


if __name__ == "__main__":
    main()
