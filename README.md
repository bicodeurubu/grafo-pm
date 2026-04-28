# Grafo PM

> For PMs who want to use LLMs as a co-pilot without becoming an engineer.

Grafo PM is a convention: a conceptual structure + an instruction file (`SIGNAL.md`). You open it in Obsidian and talk to any LLM with file access. It's not an app, has no server, no running code — built to be tool-agnostic and fit into any workflow.

> ⚠️ **License:** [CC BY-NC-SA 4.0](LICENSE) — Free for personal use and non-profits. Commercial use requires a separate arrangement.

---

[🇧🇷 Leia em Português](README.pt-br.md)

---

## What it is / What it isn't

| Is | Is not |
|---|---|
| 1 PM / 1 product | Multi-PM or multi-product |
| Local — files on your computer | Database |
| Pure Markdown | Obsidian app or plugin |
| OST framework (Outcome → Opportunity → Solution → Experiment) | Deterministic guarantee |
| Injectable context for any LLM | SaaS or hosted service |

---

## How it works

The PM drops raw material into `inbox/` and talks to the LLM. The LLM classifies it, creates wiki pages, connects them via wikilinks, and builds the Opportunity Solution Tree automatically. The `library/` is the vault's living synthesis layer — its 8 files are first-class wiki pages, visible in Obsidian's graph view and referenceable from any page.

```
inbox/          → drop zone: interviews, data, clippings, ideas
outcomes/       → OKRs and goals
opportunities/  → confirmed user needs
solutions/      → PRDs and specs
experiments/    → hypotheses and results
intelligence/   → research, data, decisions
ops/            → sprints and meetings
library/        → living vault synthesis — first-class wiki + injectable into prompts
  01-product-context        → what the product is, who it's for, out-of-scope
  02-user-truths            → evidence-confirmed user behaviors
  03-strategic-bets         → strategic bets and quarter OKRs
  04-decision-constraints   → approved decisions that constrain the solution space
  05-open-hypotheses        → active hypotheses and experiments
  06-data-anchors           → north-star metrics with current values and baselines
  07-agent-instructions     → synthesis of 01–06 for external agents
  08-ubiquitous-language    → canonical glossary of vault and product terms
```

---

## PM Workflow — step by step

### Initialization (once per product)

**1. Configure product context**
Open `SIGNAL.md`, section 1, and fill in:
```
Product:  <product name>
Quarter:  <e.g., Q2-2026>
Core OKR: <one sentence — the quarter's main objective>
```

**2. Fill in library/**
All 8 files ship with `status: draft`. Fill them in order:
- `01-product-context` — describe the product, current state, and what's out of scope
- `02-user-truths` — document user behaviors you already know (can be shallow at first)
- `03-strategic-bets` — paste the quarter OKR and what won't be done
- `04-decision-constraints` — list approved decisions that constrain the solution space
- `05-open-hypotheses` — leave empty until experiments are running
- `06-data-anchors` — note 2–3 north-star metrics with current values
- `07-agent-instructions` — compile after filling the above (LLM can help)
- `08-ubiquitous-language` — leave for the LLM to populate via `/glossary`

After filling each file, change `status: draft` to `status: active` and set `last_reviewed` to today's date.

---

### Daily use

**3. Drop raw material into inbox/**
Anything goes here first: interview transcript, data screenshot, meeting note, competitor PDF, loose idea. No formatting needed — it's a drop zone.

**4. Ask the LLM to process it**
```
"Process what's in my inbox"
```
The LLM will:
- Classify the content and create the page in the right folder
- Connect it via wikilinks to existing pages
- Run a **library check** — reporting which of the 8 library files may need updating based on the new content
- Run a **gap check** — reporting holes in the OST

**5. Review library suggestions**
The LLM never edits the library automatically. When it reports a library check, evaluate each item:
```
📚 Library check:
• 02-user-truths — impacted? (new behavior identified in the interview)
• 06-data-anchors — impacted? (new metric emerged from the data)
```
If you agree, open the indicated file and edit directly. Update `last_reviewed` and `status: active`.

**6. Confirm what was created**
After processing, the LLM reports:
- Pages created and where they were saved
- Wikilinks established
- Gaps detected in the OST
- Library check with update suggestions

---

### Weekly management

**7. Health check**
```
"Health check on the vault"
```
The LLM reports: OST gaps, unreviewed pages, stale library items, expired data, pages with `confidence: low`.

**8. Update library as the product evolves**
- OKRs changed → edit `03-strategic-bets`
- New approved decision → create page in `intelligence/decisions/` and reflect in `04-decision-constraints`
- Experiment started → update `05-open-hypotheses`
- New metric → update `06-data-anchors`
- After editing 01–06 → check whether `07-agent-instructions` needs recompiling

**9. Glossary**
```
"/glossary"
```
When a new domain term surfaces in interviews or conversations, run `/glossary`. The LLM scans and proposes canonical terms for `08-ubiquitous-language`.

---

### When to use each library file for injection into other prompts

| Task | What to inject |
|---|---|
| Write spec or PRD | `01` + `02` + `04` |
| Plan sprint | `03` + `05` + `06` |
| Full context for any external agent | `07` |
| Review vocabulary in any doc | `08` |

---

## Prerequisites

You'll need:

- **[Obsidian](https://obsidian.md/)** — free. This is where the vault lives and where you visualize the graph. Download and install before continuing.
- **Git** — to clone the repository. [Install here](https://git-scm.com/) if you don't have it.
- **An LLM with file access** — any of the options below works:
  - [Claude](https://claude.ai) (Projects or Cowork) — recommended
  - [ChatGPT](https://chatgpt.com) with Projects
  - Cursor, VS Code with AI extension, or a local model via Ollama/LM Studio

> No Obsidian plugins required. No server setup. No node or python dependencies.

---

## Installation

**1. Clone the repository**
```bash
git clone https://github.com/bicodeurubu/grafo-pm.git my-product
cd my-product
```

**2. Open in Obsidian**

- Open Obsidian
- Click **"Open folder as vault"**
- Select the `my-product` folder you just cloned

The vault will appear with the full folder structure ready.

**3. Configure product context**

Open `SIGNAL.md` and fill in **Section 1** (takes 2 minutes):

```
Product: <your product name>
Quarter: <e.g., Q2 2026>
Core OKR: <e.g., Increase activation by 20%>
```

This file is the system's brain — it instructs the LLM on how to behave with your vault.

**4. Connect your LLM**

Choose one of the options:

- **Claude Projects / Cowork:** upload vault content as project context and chat normally
- **Cursor / VS Code:** open the folder as workspace and use SIGNAL.md as system instruction
- **ChatGPT Projects:** upload SIGNAL.md and relevant folders to the project

**5. Start talking**

```
"Process what's in my inbox"
"Here are my notes from 3 onboarding interviews..."
"We decided to cut feature X from Q2"
"Show the OST for our main OKR"
"Health check on the vault"
"/glossary" → captures terms from a conversation or inbox file and updates the canonical glossary
"/publish"  → exports the vault as a public reasoning portfolio
```

Want to see a working vault first? Open `Product Example/` — a fictional support product with connected outcomes, opportunities, PRDs, and decisions.

---

## What Grafo PM does

### 🧠 Knowledge management
Captures and structures raw product knowledge — interviews, data, clippings, Slack decisions, meeting notes. Connects everything in a live graph via wikilinks: not a file folder, but an evidence network. Keeps knowledge active: detects what went stale, what has low confidence, what was never reviewed.

### 🌳 OST reasoning framework
Organizes product thinking in Outcome → Opportunity → Solution → Experiment. Detects structural gaps automatically ("this solution has no experiment", "this opportunity has no solution"). Detects contradictions between evidence and preserves them visibly — never resolves them silently.

### 📋 Record-keeping and audit
Decisions are immutable once approved, with a complete trail: context, discarded options, evidence that informed them. To change a decision, create a new one that supersedes it. Full traceability: any claim connects to a specific source.

### 📚 Library — first-class wiki and injectable context
8 files that are simultaneously vault wiki pages (visible in graph view, referenceable via wikilinks from any OST page) and injectable context for external prompts. The LLM runs a library check at every interaction — proposes updates based on new content, never edits automatically. Selective injection by task: writing a spec uses `01 + 02 + 04`, sprint planning uses `03 + 05 + 06`, full context uses `07`. Works in any tool — Cursor, GPT, Claude, Gemini, Cowork. It's the portable product memory, not locked to any tool.

### 🔄 Session continuity
Reads the git history at the start of each session and tells the PM what was in progress. Doesn't start from scratch. No technical setup, no hooks — works on day 1.

### 🔤 Canonical language
The glossary of vault and product terms lives in `library/08-ubiquitous-language.md`. The `/glossary` command scans a conversation or inbox file, elects canonical terms, bans conflicting aliases, and flags ambiguities. Passive enforcement: when creating any page, the LLM checks and corrects vocabulary automatically, without the PM needing to ask.

### ✅ Validation and health
Health check after every interaction: OST gaps, expired data, unreviewed pages, low confidence. Mandatory bias check on research: every research page needs "Counter-arguments" and "Data gaps" before it's considered complete. Automatic research (`/autoresearch`) that synthesizes web sources into pages connected to the vault.

### 🌐 Public portfolio — `/publish`
Exports the vault as a self-contained static page, deployable to GitHub Pages. Shows product reasoning — OST, decisions with full context, experiments and open hypotheses — without exposing sensitive data. A window into how the PM thinks, not just what they built. → [See full documentation](PUBLISH.md)

---

## Known limitations

- **Quality depends on the LLM**: the same vault with different models produces different results. There's no consistency guarantee across sessions.
- **Context has limits**: very large vaults (many files or long files) may overflow the model's context. Break work into smaller sessions when needed.
- **Immutability is a convention**: the "immutable decision" rule is enforced by `SIGNAL.md`, not by code. The LLM can err if it doesn't have full context.
- **Automatic commits need review**: if the LLM creates or edits files via a code tool, review before committing. Git is your safety net.
- **Basic git is a prerequisite**: clone, commit, and push. Without this the vault has no history or rollback.

---

## ⚠️ Security checklist before using

Follow these 5 points before each session. The vault may contain sensitive product data — one slip here leaks real information.

- [ ] **Use the ZDR endpoint** — ensures your messages aren't used to train the model.
- [ ] **Don't paste PII into inbox** — user personal data (name, email, ID numbers, etc.) doesn't belong in the vault; if you need to analyze it, anonymize first.
- [ ] **Confirm `.gitignore` covers your case** — before committing, verify that sensitive files (tokens, local configs, research data) are listed and ignored.
- [ ] **Review the diff before pushing** — a quick `git diff --staged` prevents accidentally uploading content that shouldn't be public.
- [ ] **Don't run `/publish` without rereading the content** — the command publishes what's in the vault; confirm nothing confidential is in scope before running.

---

## FAQ

**Why no Jira / Linear / Notion integration?**
Integrations create maintenance dependencies. The goal is to be tool-agnostic — you choose which tool to use alongside the vault, not the other way around. Copying content from a tool into `inbox/` takes 30 seconds.

**Why Markdown and not a database?**
Markdown survives any tool change. No schema to migrate, no vendor lock-in, works offline, and native git gives full history. A database would be complexity without proportional benefit for 1 PM.

**Why 1 PM and 1 product?**
Because the proposition is maximum simplicity. With multiple PMs come edit conflicts, permission management, and coordination — problems that are out of scope. If your team needs something shared, use a team wiki. Grafo PM is the PM's individual brain.

**What if I want a graphical interface or a SaaS?**
Grafo PM won't become a SaaS. The simplicity of "folder + instruction file" is the feature, not the limitation. If you want an interface, Obsidian already is one. If you want cloud sync, Obsidian Sync or a private GitHub repository works.

**Behavior depends on the LLM — isn't that a problem?**
It's a real limitation, documented in "Known limitations" above. `SIGNAL.md` reduces variance, but doesn't eliminate it. Treat the LLM's output as a suggestion that needs human review, not as fact — especially on important decisions.

---

## Feedback and contact

Report bugs, suggest improvements, or start discussions via **[GitHub Issues](https://github.com/bicodeurubu/grafo-pm/issues)**. It's the only feedback channel.

---

## License and attribution

[CC BY-NC-SA 4.0](LICENSE) — personal use and NGOs: free with attribution. Commercial use: not permitted without a separate agreement.

Created by [Diogo Soares](https://github.com/bicodeurubu). Based on [llm-wikid](https://github.com/shannhk/llm-wikid) by Shann Holmberg, inspired by the LLM Wiki pattern by [Andrej Karpathy](https://github.com/karpathy).

*Compatible with Claude (Projects, API, Cowork, Cursor), Gemini, GPT-4, and local models via Ollama or LM Studio.*
