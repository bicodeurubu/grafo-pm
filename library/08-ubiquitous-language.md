---
type: library
status: active
tldr: Glossário canônico de termos — o LLM usa este arquivo para enforçar vocabulário consistente em todo o vault
last_reviewed: 2026-04-28
---

# 08 — Ubiquitous Language

> Este arquivo é a fonte de verdade para terminologia. Injete ao escrever qualquer página do vault.
> Quando um termo novo surgir em descoberta ou conversa, rodar `/glossary` para capturar e canonizar.
> Editar diretamente quando a definição de um conceito evoluir.

---

## Framework OST — Estrutura do vault

| Termo | Definição | Aliases a evitar |
| --- | --- | --- |
| **Outcome** | Resultado de negócio mensurável que o produto busca atingir no quarter. O "por quê". | Goal, KPI, OKR, objetivo, meta |
| **Opportunity** | Necessidade confirmada de usuário que, se atendida, move um Outcome. O "o quê e quem". | Problema, pain point, user need, job to be done, feature request |
| **Solution** | Proposta concreta de como atender uma Opportunity. Pode ser spec, PRD ou referência de design. | Feature, entrega, task, user story, épico |
| **Experiment** | Teste com hipótese clara, métrica definida e critério de validação. Vinculado a uma Solution. | Teste A/B, POC, spike, piloto, protótipo |
| **Decision** | Escolha aprovada e imutável. Tem trilha completa de contexto e opções descartadas. | Resolução, definição, alinhamento |
| **Research** | Síntese de entrevistas, testes de usabilidade ou fontes qualitativas. Alimenta Opportunities. | Discovery, user feedback, entrevista bruta |
| **Data** | Análise quantitativa, métricas de produto, analytics, análise competitiva. | Relatório, número, dashboard, KPI |

## Estrutura do vault

| Termo | Definição | Aliases a evitar |
| --- | --- | --- |
| **Vault** | O repositório inteiro — o product brain. | Repo, pasta, base de conhecimento, wiki |
| **Inbox** | Drop zone para conteúdo bruto não processado. Nada vive aqui permanentemente. | Input, uploads, drafts, rascunhos |
| **Library** | Arquivos 01–08 que comprimem o vault em instruções injetáveis para LLMs externos. | Contexto, docs, documentação |
| **Intelligence** | Subpastas `research/`, `data/` e `decisions/` — conhecimento estruturado e rastreável. | Insights, aprendizados, descobertas |
| **Wikilink** | Referência `[[nome-do-arquivo]]` que conecta páginas no grafo. É o tecido do vault. | Link, referência, hiperlink |
| **Frontmatter** | Bloco YAML no topo de cada página com `type`, `status` e `tldr`. O LLM sempre preenche. | Metadata, cabeçalho, header |
| **Gap check** | Relatório automático de buracos estruturais no OST — opportunities sem solution, etc. | Audit, health check, revisão |
| **Bias check** | Seção obrigatória em Research e Data com `Counter-arguments` e `Data gaps`. | Devil's advocate, revisão crítica |
| **Freshness** | Validade de um dado. Dado stale = confiança reduzida = precisa de revisão. | Atualização, validade, expiração |

## Conceitos de vocabulário de domínio (preencher com termos do produto)

> Esta seção é vazia no template. O PM popula via `/glossary` conforme o produto é descoberto.
> Cada bloco abaixo é um grupo semântico emergente das conversas e entrevistas.

<!-- Exemplo de estrutura ao rodar /glossary:

| Termo | Definição | Aliases a evitar |
| --- | --- | --- |
| **[Termo canônico]** | [O que É — máximo 1 frase] | [palavra1, palavra2] |

-->

---

## Relacionamentos canônicos

- Um **Outcome** tem uma ou mais **Opportunities** que o movem
- Uma **Opportunity** tem zero ou mais **Solutions** propostas
- Uma **Solution** tem zero ou mais **Experiments** que a testam
- Um **Experiment** produz **Data** que valida ou invalida a **Solution**
- Uma **Decision** pode superseder outra **Decision** anterior — nunca editar, sempre criar nova
- Todo conteúdo bruto entra pela **Inbox** antes de virar **Research**, **Data** ou página OST

---

## Exemplo de diálogo canônico

> **PM:** "Recebi feedback de um usuário que quer poder editar mensagens depois de enviadas."
>
> **LLM:** "Isso é uma **Opportunity** candidata, não uma **Solution**. Antes de spec, precisamos confirmar: quantos usuários têm essa necessidade? Ela se conecta a algum **Outcome** do quarter? Se sim, crio a página em `opportunities/` e linkamos ao outcome correspondente."
>
> **PM:** "Faz sentido. Mas já temos uma ideia de como fazer — edição inline por 5 minutos."
>
> **LLM:** "Nesse caso temos duas páginas distintas: a **Opportunity** (necessidade de corrigir erros pós-envio) e a **Solution** (edição inline com janela de 5 min). A Solution linka à Opportunity, e precisamos de um **Experiment** com métrica antes de spec completo. Quer que eu crie as duas?"
>
> **PM:** "Sim. E chama de 'message editing', não 'post-send correction'."
>
> **LLM:** "Registrado. Adicionando `message-editing` como **Opportunity** canônica e `post-send correction` como alias a evitar no glossário."

---

## Ambiguidades sinalizadas

> Esta seção é atualizada pelo LLM ao rodar `/glossary`. Cada entrada fica aqui até ser resolvida.

<!-- Formato:
- "[termo]" foi usado com dois sentidos diferentes: [sentido A] e [sentido B]. Recomendação: usar **[canônico]** para [sentido A] e **[outro canônico]** para [sentido B].
-->

_Nenhuma ambiguidade registrada ainda._
