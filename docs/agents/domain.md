# Domain Docs

How the engineering skills should consume this repo's domain documentation when exploring the codebase.

## Before exploring, read these

- **`CONTEXT.md`** at the repo root, or
- **`CONTEXT-MAP.md`** at the repo root if it exists — it points at one `CONTEXT.md` per context. Read each one relevant to the topic.
- **`docs/adr/`** — read ADRs that touch the area you're about to work in.

`CONTEXT.md` and `docs/adr/` exist as of 2026-06-30. `/domain-modeling` (reached via `/grill-with-docs` and `/improve-codebase-architecture`) keeps creating/updating entries lazily when terms or decisions actually get resolved.

This repo already ships `library/08-ubiquitous-language.md` — the canonical glossary for vault/product terminology (separate concern from engineering domain modeling, but check it first for any vault-related term before assuming it's undefined).

## File structure

Single-context repo:

```
/
├── CONTEXT.md
├── docs/adr/
│   ├── 0001-....md
│   └── 0002-....md
```

## Use the glossary's vocabulary

When your output names a domain concept, use the term as defined in `CONTEXT.md` (engineering) or `library/08-ubiquitous-language.md` (vault/product). Don't drift to synonyms the glossary explicitly avoids.

If the concept you need isn't in either glossary yet, that's a signal — either you're inventing language the project doesn't use (reconsider) or there's a real gap (note it for `/domain-modeling`).

## Flag ADR conflicts

If your output contradicts an existing ADR, surface it explicitly rather than silently overriding:

> _Contradicts ADR-0007 (...) — but worth reopening because…_
