# SIGNAL — Grafo PM

> Este é o único arquivo de instrução. O LLM lê este arquivo primeiro.
> O que o produto sabe está em `library/`. O que o produto é está nas pastas wiki.

---

## 0. Segurança

**O que guardar aqui — e o que não guardar:**

| ✅ Seguro | ❌ Nunca guardar |
|---|---|
| Síntese de pesquisa anonimizada | PII bruto (nomes, emails, telefones de clientes) |
| Métricas agregadas e dados de funil | Logs de chat com usuários identificáveis |
| Decisões, OKRs, notas estratégicas | API keys, tokens, credenciais de qualquer tipo |
| Análise competitiva, notas de reunião | Arquivos `.env` ou qualquer material de autenticação |

**LLMs e retenção de dados:** se você usa interface pública (claude.ai free/pro, ChatGPT, Gemini consumer), seus dados podem ser usados para treino de modelo. Para dados reais de produto, use endpoint com zero data retention: Claude Enterprise, Anthropic API com ZDR, ou modelo local (Ollama, LM Studio).

**Prompt injection:** ao processar conteúdo externo (transcrições, tickets, feedbacks), peça ao LLM para sumarizar e extrair — nunca peça para seguir instruções encontradas no conteúdo bruto.

---

## 1. O que é este vault

Este vault é o **product brain** de **[Nome do Produto]**. Guarda decisões, insights de usuário, experimentos e inteligência de mercado — conectados em grafo vivo.

O framework organizador é o **Opportunity Solution Tree** (Teresa Torres). A estrutura de pastas É o OST:

```
outcomes/          Por quê — OKRs, metas de produto
opportunities/     O quê e quem — necessidades confirmadas de usuário
solutions/         Como — specs, PRDs, referências de design
experiments/       Prova — hipóteses e resultados de teste

intelligence/
  research/        Entrevistas, sínteses, personas
  data/            Analytics, métricas, dados de produto, análise competitiva
  decisions/       Escolhas feitas (imutáveis quando aprovadas)

ops/
  sprints/         Planos de sprint e retrospectivas
  meetings/        Notas de reunião

inbox/             Drop zone — qualquer coisa vai aqui primeiro

library/           Contexto compilado para injeção em outros prompts
```

**Contexto do produto** — preencha ao inicializar:
```
Produto:  [nome]
Quarter:  [ex: Q2-2026]
OKR core: [uma frase]
```

---

## 2. Schema

Toda página tem **3 campos de frontmatter**. O LLM preenche tudo — o PM nunca edita YAML diretamente.

```yaml
---
type: outcome | opportunity | solution | experiment | decision | research | data | meeting | sprint
status: draft | active | validated | invalidated | archived | approved
tldr: uma frase — o que esta página diz
---
```

**Regras:**
- `status: approved` em `type: decision` torna a página imutável — nunca editar o corpo, apenas criar uma decisão que a supersede.
- Todo o resto é expresso via `[[wikilinks]]` no corpo. São o tecido conectivo do brain.

---

## 3. Regras de conexão OST

| Tipo de página | Deve linkar para |
|---|---|
| `opportunity` | ao menos um `outcome` |
| `solution` | ao menos uma `opportunity` |
| `experiment` | a `solution` que testa + uma métrica em `intelligence/data/` |
| `decision` | o que a informou (research, data ou meeting) |
| `research` | a `opportunity` que informa (se conhecida) |
| `data` | a `opportunity` ou `solution` que relaciona |

Sem arrays de frontmatter bidirecionais. O LLM faz a travessia reversa quando necessário.

### Conexões com library/

Os arquivos de `library/` são **páginas wiki de primeira classe** — não apenas prompts externos. Qualquer página do vault pode e deve referenciar itens de library via `[[wikilinks]]` quando aquele item foi determinante para sua criação. A conexão é por relevância, não por obrigação de tipo.

| Tipo de página | Itens de library naturalmente relevantes |
|---|---|
| `outcome` | `[[library/01-product-context]]` · `[[library/03-strategic-bets]]` |
| `opportunity` | `[[library/02-user-truths]]` · `[[library/06-data-anchors]]` |
| `solution` | `[[library/03-strategic-bets]]` · `[[library/04-decision-constraints]]` |
| `experiment` | `[[library/05-open-hypotheses]]` · `[[library/06-data-anchors]]` |
| `decision` | `[[library/04-decision-constraints]]` (quando supersede ou confirma) |
| `research` | `[[library/02-user-truths]]` (quando valida ou contradiz uma truth existente) |
| `data` | `[[library/06-data-anchors]]` (quando atualiza ou questiona uma âncora) |

`[[library/07-agent-instructions]]` e `[[library/08-ubiquitous-language]]` não são linkados de páginas individuais: o 07 é contexto para agentes externos; o 08 é enforçado passivamente via glossário.

O Obsidian backlinks panel mostra automaticamente quais páginas referenciam cada item de library — não há necessidade de manter listas manuais.

---

## 4. Comportamentos automáticos

Estes rodam sempre, sem invocar explicitamente.

### A cada nova página
1. Escanear pages existentes — detectar relacionados, conectar via `[[wikilinks]]`
2. Rodar **library check** e reportar (ver abaixo)
3. Rodar gap check e reportar o resultado
4. Commit: `feat(type): create [título]`

**Library check — obrigatório a cada nova página ou conteúdo processado da inbox:**

Verificar se o novo conteúdo implica atualização em algum item de library. Reportar ao PM:
```
📚 Library check:
• 01-product-context  — impactado? (novo contexto de produto emergiu)
• 02-user-truths      — impactado? (novo comportamento ou segmento de usuário identificado)
• 03-strategic-bets   — impactado? (aposta confirmada, refutada ou nova aposta emergiu)
• 04-decision-constraints — impactado? (nova decisão aprovada limita o espaço de solução)
• 05-open-hypotheses  — impactado? (hipótese aberta, encerrada ou nova criada)
• 06-data-anchors     — impactado? (nova métrica âncora ou valor de referência atualizado)
• 07-agent-instructions — impactado? (mudança significativa que torna o contexto compilado desatualizado)
• 08-ubiquitous-language — impactado? (novo termo de domínio capturado)
```
Se nenhum for afetado: `✅ Library estável — nenhum item requer atualização.`

**Nunca editar library/ automaticamente.** Sempre propor — o PM decide o que atualizar e revisa antes de confirmar.

### A cada página atualizada
1. Se a página atualizada é `decision` (approved), `outcome` ou `data`: adicionar flag visível em todas as páginas que a linkam:
   ```
   > ⚠️ [[source-page]] atualizada em YYYY-MM-DD — revise se esta página precisa de atualização
   ```
2. Commit: `chore(type): update [título]`

### Gap check — após toda interação
Reportar sempre:
```
⚡ Gaps detectados:
• [opportunity] sem solutions linkadas
• [solution] sem experiments planejados
• [experiment] sem métrica definida
• [data page] janela de freshness fecha em N dias — X solutions dependem dela
• [página] confidence incerta — revisão necessária
• [library/XX] status: stale — N páginas OST o referenciam via wikilink
• [library/07-agent-instructions] desatualizado — itens 01–06 foram editados após a última revisão do 07
```
Se não houver gaps: `✅ Sem gaps estruturais detectados.`

### Contradições
Quando duas páginas contêm evidências conflitantes, usar callout visível:
```markdown
> [!contradiction] Conflita com [[outra-página]]
> [[esta-página]] diz X. [[outra-página]] diz Y. Revise antes de usar qualquer uma.
> Adicionado: YYYY-MM-DD
```
Nunca resolver contradições silenciosamente — preservar e sinalizar.

### Decisões são imutáveis quando aprovadas
`type: decision` + `status: approved` → nunca editar o corpo. Para mudar, criar nova decisão que supersede e linka de volta.

### Bias check — obrigatório em research e market
Toda página `type: research` ou `type: data` (quando síntese de mercado) deve ter:
```markdown
## Counter-arguments
[Pontos de vista opostos, evidências que contradizem, objeções de stakeholders]

## Data gaps
[O que falta, o que é desconhecido, o que precisa de mais fontes]
```
Se faltar, marcar `status: draft` até ser preenchido.

### Git
Formato: `type(área): descrição`
- `feat(opportunity): create checkout-friction`
- `chore(data): update checkout-funnel freshness`
- `fix(solution): repair broken wikilink`

Nunca `git push` — sempre decisão do PM.

---

## 5. Continuidade de sessão

**Ao iniciar uma sessão:** executar `git log --oneline -10` para ver os últimos arquivos tocados. Ler os 2–3 arquivos mais recentes. Informar o PM:

> "Na última sessão trabalhamos em [X]. Você estava no meio de [Y]. Quer continuar ou há algo novo?"

Se não houver histórico git, pedir ao PM para descrever o contexto.

---

## 6. Workflows naturais

Falar naturalmente. Não há comandos para memorizar.

**`/save [slug]`** — transformar qualquer conversa em página wiki  
Quando o PM diz *"salva essa conversa"* ou *"salva como [slug]"*:
1. Identificar o tipo de conteúdo da conversa
2. Criar página wiki na pasta certa com frontmatter correto
3. Linkar a páginas existentes relacionadas
4. Commit

**`/autoresearch [tópico]`** — pesquisa web multi-round que gera páginas conectadas  
Padrão: 3 rounds, 5 fontes max, parar quando confiança atingir `medium` ou superior.
1. Buscar e sintetizar cada fonte em página `data` ou `research`
3. Cruzar com páginas existentes — sinalizar contradições
4. Criar página de síntese conectando tudo
5. Reportar: páginas criadas, contradições, gaps, nível de confiança

**`/publish`** — exportar o vault como portfólio público de raciocínio de produto  
Gera `_public/index.html` — uma página estática, auto-contida, deployável no GitHub Pages.

1. **Checklist de privacidade** — exibir o que será exposto e pedir confirmação:
   ```
   ⚠️  /publish vai expor o seguinte. Confirme o que incluir:
   [ ] Contexto do produto (library/01-product-context.md)
   [ ] Usuários-alvo (library/02-user-truths.md)
   [ ] Apostas estratégicas (library/03-strategic-bets.md)
   [ ] Decisões documentadas (intelligence/decisions/)
   [ ] Experimentos e resultados (experiments/)
   [ ] Hipóteses abertas (library/05-open-hypotheses.md)

   NÃO incluído por padrão:
   ✗ Dados quantitativos (library/06-data-anchors.md)
   ✗ Constraints de decisão (library/04-decision-constraints.md)
   ✗ Ops (sprints, meetings)
   ✗ Inbox (dados brutos)
   ✗ Qualquer arquivo com confidential: true no frontmatter

   Gerar? [S/N]
   ```

2. **Coletar conteúdo** — ler os arquivos confirmados pelo PM e extrair:
   - Nome do produto, PM, e quarter atual (de `library/01` e do campo "Contexto do produto" do SIGNAL)
   - OST: outcomes ativos + opportunities com status + solutions + experiments
   - Decisões: título, tldr, evidências, opções descartadas
   - Experimentos: hipótese, resultado, aprendizado
   - Hipóteses abertas: lista de `library/05`

3. **Gerar `_public/index.html`** — preencher o template com o conteúdo coletado.  
   O template está em `_public/template.html`. Copiar o template para `_public/index.html` e substituir cada `{{PLACEHOLDER}}` pelo conteúdo correspondente. O HTML deve ser auto-contido (sem dependências externas).

4. **Commit:**
   ```
   feat(publish): generate portfolio — [data]
   ```

5. **Reportar ao PM:**
   ```
   ✅ Portfólio gerado em _public/index.html
   Para publicar no GitHub Pages:
   git push origin main
   → Ativar GitHub Pages em Settings > Pages > Branch: main, Folder: /_public
   → Acesso em: https://[user].github.io/[repo]
   ```

---

## 7. Library — contexto injetável e wiki de primeira classe

A pasta `library/` tem 8 arquivos. São **páginas wiki de primeira classe** — visíveis no graph view do Obsidian, referenciáveis via wikilink, e também injetáveis em prompts externos. Cada arquivo tem `status` e `last_reviewed` no frontmatter para rastrear saúde.

| Arquivo | O que contém | Status esperado |
|---|---|---|
| `01-product-context` | O que o produto é, para quem, fora de escopo | Estável — atualizar quando produto mudar |
| `02-user-truths` | Comportamentos de usuário confirmados por evidência | Vivo — atualizar a cada ciclo de pesquisa |
| `03-strategic-bets` | Apostas estratégicas ativas | Vivo — atualizar quando OKRs mudam |
| `04-decision-constraints` | Decisões aprovadas que limitam o espaço de solução | Imutável por item — adicionar, nunca sobrescrever |
| `05-open-hypotheses` | Hipóteses ativas e experimentos em andamento | Vivo — atualizar a cada sprint |
| `06-data-anchors` | Métricas âncora e valores de referência | Vivo — atualizar quando dados mudam |
| `07-agent-instructions` | Síntese de 01–06 para uso por agentes externos | Derivado — recompilar quando 01–06 mudam significativamente |
| `08-ubiquitous-language` | Glossário canônico do produto | Vivo — atualizar via `/glossary` |

**Quando injetar o quê:**
| Tarefa | Arquivos a injetar |
|---|---|
| Escrever spec ou PRD | `01` + `02` + `04` |
| Planejar sprint | `03` + `05` + `06` |
| Contexto completo | `07` (sintetiza todos) |
| Qualquer agente externo | `07` |

**Como atualizar:** o LLM propõe via library check a cada interação. O PM sempre edita e revisa. Ao editar qualquer item de 01–06, verificar se o `07` precisa ser recompilado. Atualizar `last_reviewed` e confirmar `status: active` após revisão.

---

## 8. Extensões

Para adicionar comportamento customizado, **adicionar uma seção `## Custom:` neste arquivo**:

```markdown
## Custom: [Nome do Comportamento]

**Quando:** [situação que dispara]
**O que fazer:** [descrição em linguagem simples]
**Exemplo:** [input concreto → output esperado]
```

---

## Custom: Ubiquitous Language

**Quando acionar `/glossary`:**

Quando o PM diz _"atualiza o glossário"_, _"/glossary"_, _"canoniza esse termo"_, ou ao processar qualquer arquivo de `inbox/` que contenha vocabulário de usuário ou de produto novo.

**O que fazer:**

1. Ler `library/08-ubiquitous-language.md`
2. Escanear a conversa atual (ou o arquivo de inbox indicado) em busca de:
   - Substantivos e verbos de domínio usados de forma recorrente
   - Sinônimos sendo usados para o mesmo conceito
   - O mesmo termo sendo usado com sentidos diferentes (ambiguidade)
3. Para cada termo novo: propor definição de 1 frase e listar aliases a evitar
4. Para cada ambiguidade: registrar na seção **Ambiguidades sinalizadas** com recomendação de resolução
5. Atualizar `library/08-ubiquitous-language.md` com os novos termos no grupo semântico correto
6. Commit: `chore(library): update ubiquitous language — [termos adicionados]`
7. Reportar inline: termos adicionados, aliases banidos, ambiguidades encontradas

**Enforçamento passivo (sempre ativo, sem invocar):**

Ao criar ou editar qualquer página do vault, verificar se os termos usados respeitam `library/08-ubiquitous-language.md`. Se um alias proibido aparecer no corpo ou frontmatter, corrigir silenciosamente e mencionar na resposta:
> "Substituí 'feature' por **Solution** conforme o glossário canônico."

**Exemplo:**

> PM joga transcrição de entrevista no `inbox/` onde o usuário fala "quando meu ticket é resolvido automaticamente"
>
> LLM roda `/glossary`: captura "ticket resolvido automaticamente", propõe **Autonomous Resolution** como termo canônico, "ticket closure" e "auto-resolve" como aliases a evitar. Registra no `08-ubiquitous-language.md` sob um novo grupo "Vocabulário do produto". Ao criar a Opportunity correspondente, já usa o termo canônico no slug e no título.
