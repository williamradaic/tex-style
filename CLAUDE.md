# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal LaTeX class and package files. The working/development directory is `~/phd/tools/tex-style/`; the TeX install path (where the TeX engine finds them) is a separate clone at `~/Library/texmf/tex/latex/tex-style/`. After editing class or package files, changes must be manually synced to the install path for compiled documents to pick them up.

## Compilation

All classes require **LuaLaTeX** (not pdflatex or xelatex) because `wrp.sty` loads `unicode-math`. For documents with a bibliography, use biber:

```
lualatex file.tex && biber file && lualatex file.tex && lualatex file.tex
```

## Architecture

### `wrp.sty` — shared base package

Loaded by all three classes via `\RequirePackage[text]{wrp}`. It provides:
- All core imports (fonts, math, color, hyperref, tikz, etc.)
- Math commands (`\R`, `\E`, `\P`, `\eps`, `\given`, `\diff`, `\indic`, operators)
- Theorem environments (`theorem`, `lemma`, `proposition`, `assumption`, `corollary`, `definition`, `fact`, `conjecture`, `example`, `remark`, `note`)
- Two toggles (off by default): `printFileName` and `printTripleBracket`
- The `filename` environment (wraps content, only prints when `printFileName` is toggled on)
- The `[text]` option loads enumitem, lmodern, fancyhdr, tocloft, and biblatex-chicago (authordate, biber backend)

### Three document classes

All extend `article`, load `wrp` with `[text]`, use identical margin/spacing/section settings, and share the same spacing dial names (`\TitleSep`, `\AuthorSep`, `\BlockBelow`, `\ProjectSep`).

| Class | Title style | Layout |
|---|---|---|
| `wr-article` | `\LARGE`, centered | Centered block: filename → project → title → author → date |
| `wr-note` | `\Large`, no bold | Flush left: project\|filename → title → author → date |
| `wr-memo` | header bar + optional `\Large` title | Two-column header (left: project/title + filename; right: author + date) |

### Commands available in all three classes

- **`\project{name}`** — optional project label. Behaviour per class:
  - `wr-article`: small italic label between filename line and title
  - `wr-note`: small italic label on the pre-title line; if unset, filename alone appears there
  - `wr-memo`: replaces the left-header text with the project name and drops `\title` as a large title below the header bar
- **`\and`** — comma-separated in `wr-note` and `wr-memo`; side-by-side tabular columns in `wr-article`
- **`\thanks{}`** — produces symbol footnotes on page 1; footnote counter resets to 0 after `\maketitle` so body footnotes start from 1

### Toggles (preamble)

```latex
\toggletrue{printFileName}       % show filename in title block
\toggletrue{printTripleBracket}  % show \triple{} / triplebracket environment content
```

## Typical document preamble

```latex
\documentclass[english,11pt]{wr-note}   % or wr-memo / wr-article
\addbibresource{Bib.bib}
\setmainfont{STIX Two Text}
\setmathfont{STIX Two Math}
\toggletrue{printFileName}
\project{Course or project name}
\title{Document title}
\author{Name\thanks{Affiliation}}
\date{\today}
```
