# _bases/ — Obsidian Views ao Vivo

Arquivos `.base` gerados pelo workflow `/bases`. O Obsidian os renderiza como tabelas e boards dinâmicos — sem nenhuma ação do PM.

> **Para gerar ou atualizar:** diga `/bases` na sessão com o LLM.  
> **Para abrir no Obsidian:** clique em qualquer arquivo `.base` — renderiza automaticamente.

---

## Views disponíveis

| Arquivo | O que mostra |
|---------|-------------|
| `ost-board.base` | Todos os OST nodes agrupados por tipo e status |
| `unexplored-gaps.base` | Nodes com `explored: false` — nunca investigados |
| `confidence-map.base` | Páginas com `confidence: low`, mais antigas primeiro |
| `stale-radar.base` | Tudo não atualizado nos últimos 30 dias |
| `data-freshness.base` | Data pages prestes a expirar |
| `research-integrity.base` | Research e data com `bias_checked: false` |
| `decision-log.base` | Todas as decisões, da mais recente à mais antiga |
| `experiment-board.base` | Experimentos agrupados por resultado |
| `library-health.base` | Arquivos de library/ ordenados por `last_reviewed` |

---

## Nota sobre o formato `.base`

O formato Obsidian Bases está em evolução ativa. Se um arquivo não renderizar corretamente, rode `/bases` novamente — o LLM vai gerar com a versão mais atual do formato.
