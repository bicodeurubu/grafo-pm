#!/bin/bash
# Instala as skills do Matt Pocock no Claude Code / Cowork

SKILLS=(
  "mattpocock/skills/grill-me"
  "mattpocock/skills/design-an-interface"
  "mattpocock/skills/request-refactor-plan"
  "mattpocock/skills/to-prd"
  "mattpocock/skills/scaffold-exercises"
  "mattpocock/skills/improve-codebase-architecture"
  "mattpocock/skills/tdd"
  "mattpocock/skills/git-guardrails-claude-code"
  "mattpocock/skills/write-a-skill"
  "mattpocock/skills/edit-article"
  "mattpocock/skills/ubiquitous-language"
  "mattpocock/skills/obsidian-vault"
)

echo "Instalando ${#SKILLS[@]} skills do Matt Pocock..."
echo ""

for skill in "${SKILLS[@]}"; do
  echo "→ $skill"
  npx skills@latest add "$skill"
  echo ""
done

echo "✓ Concluído!"
