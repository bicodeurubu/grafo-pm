# Grafo PM

> Para PMs que querem usar LLM como copiloto sem virar engenheiro.

Grafo PM é uma convenção: uma estrutura conceitual + um arquivo de instrução (`SIGNAL.md`). Você abre no Obsidian e conversa com qualquer LLM com acesso a arquivos. Não é um app, não tem servidor, não tem código rodando — é feito para ser agnóstico e se encaixar em qualquer fluxo.

> ⚠️ **License:** [CC BY-NC-SA 4.0](LICENSE) — Free for personal use and non-profits. Commercial use requires a separate arrangement.

---

[🇺🇸 Read in English](README.md)

---

## É / Não é

| É | Não é |
|---|---|
| 1 PM / 1 produto | Multi-PM ou multi-produto |
| Local — arquivos no seu computador | Banco de dados |
| Markdown puro | App ou plugin do Obsidian |
| Framework OST (Outcome → Opportunity → Solution → Experiment) | Garantia determinística |
| Contexto injetável em qualquer LLM | SaaS ou serviço hospedado |

---

## Como funciona

O PM joga material bruto no `inbox/` e fala com o LLM. O LLM classifica, cria páginas wiki, conecta via wikilinks, e monta o Opportunity Solution Tree automaticamente. A `library/` é a camada de síntese viva do vault — seus 8 arquivos são páginas wiki de primeira classe, visíveis no graph view do Obsidian e referenciáveis por qualquer página.

```
inbox/          → drop zone: entrevistas, dados, clippings, ideias
outcomes/       → OKRs e metas
opportunities/  → necessidades confirmadas de usuário
solutions/      → PRDs e specs
experiments/    → hipóteses e resultados
intelligence/   → research, data, decisions
ops/            → sprints e meetings
library/        → síntese viva do vault — wiki de primeira classe + injetável em prompts
  01-product-context        → o que o produto é, para quem, fora de escopo
  02-user-truths            → comportamentos de usuário confirmados por evidência
  03-strategic-bets         → apostas estratégicas e OKRs do quarter
  04-decision-constraints   → decisões aprovadas que limitam o espaço de solução
  05-open-hypotheses        → hipóteses e experimentos ativos
  06-data-anchors           → métricas norte com valores atuais e baselines
  07-agent-instructions     → síntese de 01–06 para agentes externos
  08-ubiquitous-language    → glossário canônico de termos do vault e do produto
```

---

## Fluxo do PM — passo a passo

### Inicialização (uma vez por produto)

**1. Configure o contexto do produto**
Abra `SIGNAL.md`, seção 1, e preencha:
```
Produto:  <nome do produto>
Quarter:  <ex: Q2-2026>
OKR core: <uma frase — o objetivo principal do quarter>
```

**2. Preencha a library/**
Os 8 arquivos vêm com `status: draft`. Preencha-os na ordem:
- `01-product-context` — descreva o produto, o estado atual e o que está fora de escopo
- `02-user-truths` — documente os comportamentos de usuário que você já sabe (pode ser raso no começo)
- `03-strategic-bets` — cole o OKR do quarter e o que não vai ser feito
- `04-decision-constraints` — liste decisões já tomadas que limitam o espaço de solução
- `05-open-hypotheses` — deixe vazio até ter experimentos rodando
- `06-data-anchors` — anote 2–3 métricas norte com valores atuais
- `07-agent-instructions` — compile após preencher os anteriores (o LLM pode ajudar)
- `08-ubiquitous-language` — deixe para o LLM popular via `/glossary`

Após preencher cada arquivo, mude `status: draft` para `status: active` e preencha `last_reviewed` com a data.

---

### Uso diário

**3. Jogue material bruto no inbox/**
Qualquer coisa vai aqui primeiro: transcrição de entrevista, print de dados, nota de reunião, PDF de concorrente, ideia solta. Não precisa formatar — é drop zone.

**4. Peça ao LLM para processar**
```
"Processa o que está no meu inbox"
```
O LLM vai:
- Classificar o conteúdo e criar a página na pasta certa
- Conectar via wikilinks às páginas existentes
- Rodar o **library check** — reportando quais dos 8 arquivos de library podem precisar de atualização com base no novo conteúdo
- Rodar o **gap check** — reportando holes no OST

**5. Revise as sugestões de library**
O LLM nunca edita a library automaticamente. Quando ele reportar um library check, avalie cada item:
```
📚 Library check:
• 02-user-truths — impactado? (novo comportamento identificado na entrevista)
• 06-data-anchors — impactado? (nova métrica emergiu nos dados)
```
Se concordar, abra o arquivo indicado e edite diretamente. Atualize `last_reviewed` e `status: active`.

**6. Confirme o que foi criado**
Após o processamento, o LLM reporta:
- Páginas criadas e onde foram salvas
- Wikilinks estabelecidos
- Gaps detectados no OST
- Library check com sugestões de atualização

---

### Gestão semanal

**7. Health check**
```
"Health check do vault"
```
O LLM reporta: gaps no OST, páginas sem revisão, library items stale, dados expirados, páginas com `confidence: low`.

**8. Atualize a library conforme o produto evolui**
- OKRs mudaram → edite `03-strategic-bets`
- Nova decisão aprovada → crie página em `intelligence/decisions/` e reflita em `04-decision-constraints`
- Experimento começou → atualize `05-open-hypotheses`
- Nova métrica → atualize `06-data-anchors`
- Após editar 01–06 → verifique se `07-agent-instructions` precisa ser recompilado

**9. Glossário**
```
"/glossary"
```
Quando um novo termo de domínio surgir em entrevistas ou conversas, rode `/glossary`. O LLM escaneia e propõe termos canônicos para `08-ubiquitous-language`.

---

### Quando usar cada arquivo de library para injeção em outros prompts

| Tarefa | O que injetar |
|---|---|
| Escrever spec ou PRD | `01` + `02` + `04` |
| Planejar sprint | `03` + `05` + `06` |
| Contexto completo para qualquer agente externo | `07` |
| Revisar vocabulário em qualquer doc | `08` |

---

## Pré-requisitos

Você vai precisar de:

- **[Obsidian](https://obsidian.md/)** — gratuito. É onde o vault vive e onde você visualiza o grafo. Baixe e instale antes de continuar.
- **Git** — para clonar o repositório. [Instale aqui](https://git-scm.com/) se não tiver.
- **Um LLM com acesso a arquivos** — qualquer uma das opções abaixo funciona:
  - [Claude](https://claude.ai) (Projects ou Cowork) — recomendado
  - [ChatGPT](https://chatgpt.com) com Projects
  - Cursor, VS Code com extensão de IA, ou modelo local via Ollama/LM Studio

> Sem plugins do Obsidian necessários. Sem configuração de servidor. Sem dependências de node ou python.

---

## Instalação

**1. Clone o repositório**
```bash
git clone https://github.com/bicodeurubu/grafo-pm.git meu-produto
cd meu-produto
```

**2. Abra no Obsidian**

- Abra o Obsidian
- Clique em **"Open folder as vault"**
- Selecione a pasta `meu-produto` que você acabou de clonar

O vault vai aparecer com toda a estrutura de pastas pronta.

**3. Configure o contexto do produto**

Abra `SIGNAL.md` e preencha a **Seção 1** (leva 2 minutos):

```
Produto: <nome do seu produto>
Quarter: <ex: Q2 2025>
OKR principal: <ex: Aumentar ativação em 20%>
```

Esse arquivo é o cérebro do sistema — ele instrui o LLM sobre como se comportar com o seu vault.

**4. Conecte seu LLM**

Escolha uma das opções:

- **Claude Projects / Cowork:** sobe o conteúdo do vault como contexto do projeto e conversa normalmente
- **Cursor / VS Code:** abre a pasta como workspace e usa o SIGNAL.md como instrução de sistema
- **ChatGPT Projects:** faz upload do SIGNAL.md e das pastas relevantes no projeto

**5. Comece a falar**

```
"Processa o que está no meu inbox"
"Aqui minhas notas de 3 entrevistas sobre onboarding..."
"A gente decidiu cortar a feature X do Q2"
"Mostra o OST do nosso OKR principal"
"Health check do vault"
"/glossary" → captura termos de uma conversa ou entrevista e atualiza o glossário canônico
"/publish"  → exporta o vault como portfólio público de raciocínio de produto
```

Quer ver um vault funcionando antes? Abra `Product Example/` — produto fictício de suporte com outcomes, oportunidades, PRDs e decisões conectados.

---

## O que o Grafo PM faz

### 🧠 Gestão de conhecimento
Captura e estrutura conhecimento bruto de produto — entrevistas, dados, clippings, decisões de Slack, notas de reunião. Conecta tudo em grafo vivo via wikilinks: não é uma pasta de arquivos, é uma rede de evidências. Mantém o conhecimento ativo: detecta o que ficou stale, o que tem baixa confiança, o que nunca foi revisado pelo PM.

### 🌳 Framework de raciocínio OST
Organiza o pensamento de produto em Outcome → Opportunity → Solution → Experiment. Detecta gaps estruturais automaticamente ("essa solução não tem experimento", "essa oportunidade não tem solução"). Detecta contradições entre evidências e as preserva visivelmente — nunca resolve silenciosamente.

### 📋 Registro e auditoria
Decisões são imutáveis quando aprovadas, com trilha completa: contexto, opções descartadas, evidências que informaram. Para mudar uma decisão, cria-se uma nova que supersede. Rastreabilidade total: qualquer claim conecta a uma fonte específica.

### 📚 Library — wiki de primeira classe e contexto injetável
8 arquivos que são simultaneamente páginas wiki do vault (visíveis no graph view, referenciáveis via wikilinks por qualquer página OST) e contexto injetável em prompts externos. O LLM faz um library check a cada interação — propõe atualizações com base no novo conteúdo, nunca edita automaticamente. Injeção seletiva por tarefa: escrever spec usa `01 + 02 + 04`, planejar sprint usa `03 + 05 + 06`, contexto completo usa `07`. Funciona em qualquer ferramenta — Cursor, GPT, Claude, Gemini, Cowork. É a memória de produto portátil, não presa a uma ferramenta.

### 🔄 Continuidade de sessão
Lê o histórico git ao iniciar cada sessão e informa o PM o que estava em andamento. Não recomeça do zero. Sem setup técnico, sem hooks — funciona no dia 1.

### 🔤 Linguagem canônica
Glossário de termos do vault e do produto vive em `library/08-ubiquitous-language.md`. O comando `/glossary` escaneia uma conversa ou arquivo de inbox, elege termos canônicos, bana aliases conflitantes e sinaliza ambiguidades. Enforçamento passivo: ao criar qualquer página, o LLM verifica e corrige vocabulário automaticamente, sem o PM precisar pedir.

### ✅ Validação e saúde
Health check após toda interação: gaps no OST, dados expirados, páginas sem revisão, baixa confiança. Bias check obrigatório em pesquisa: toda página de research precisa de "Counter-arguments" e "Data gaps" antes de ser considerada completa. Pesquisa automática (`/autoresearch`) que sintetiza fontes web em páginas conectadas ao vault.

### 🌐 Portfólio público — `/publish`
Exporta o vault como uma página estática auto-contida, deployável no GitHub Pages. Mostra o raciocínio de produto — OST, decisões com contexto completo, experimentos e hipóteses abertas — sem expor dados sensíveis. Uma janela para como o PM pensa, não só o que construiu. → [Ver documentação completa](PUBLISH.md)

---

## Limitações conhecidas

- **Qualidade depende do LLM**: o mesmo vault com modelos diferentes produz resultados diferentes. Não há garantia de consistência entre sessões.
- **Contexto tem limite**: vaults muito grandes (muitos arquivos ou arquivos longos) podem estourar o contexto do modelo. Divida o trabalho em sessões menores quando necessário.
- **Imutabilidade é convenção**: a regra de "decisão imutável" é enforçada pelo `SIGNAL.md`, não por código. O LLM pode errar se não estiver com o contexto completo.
- **Commits automáticos exigem revisão**: se o LLM criar ou editar arquivos via ferramenta de código, revise antes de commitar. Git é a sua rede de segurança.
- **Git básico é pré-requisito**: clonar, commitar e fazer push. Sem isso o vault não tem histórico nem rollback.

---

## ⚠️ Checklist de segurança antes de usar

Siga estes 5 pontos antes de cada sessão. O vault pode conter dados sensíveis do produto — um descuido aqui vaza informação real.

- [ ] **Use o endpoint ZDR** — garante que suas mensagens não são usadas para treinar o modelo.
- [ ] **Não cole PII no inbox** — dados pessoais de usuários (nome, e-mail, CPF etc.) não pertencem ao vault; se precisar analisar, anonimize antes.
- [ ] **Confirme que o `.gitignore` cobre seu caso** — antes de commitar, verifique se arquivos sensíveis (tokens, configs locais, dados de pesquisa) estão listados e ignorados.
- [ ] **Revise o diff antes de fazer push** — um `git diff --staged` rápido evita subir acidentalmente conteúdo que não deveria ser público.
- [ ] **Não rode `/publish` sem reler o conteúdo** — o comando publica o que está no vault; confirme que nada confidencial está no escopo antes de executar.

---

## FAQ

**Por que não tem integração com Jira / Linear / Notion?**
Integrações criam dependências de manutenção. O objetivo é ser agnóstico — você escolhe qual ferramenta usar junto com o vault, não o contrário. Copiar conteúdo de uma ferramenta para o `inbox/` leva 30 segundos.

**Por que Markdown e não um banco de dados?**
Markdown sobrevive a qualquer mudança de ferramenta. Não tem schema para migrar, não tem vendor lock-in, funciona offline, e git nativo dá histórico completo. Um banco de dados seria complexidade sem benefício proporcional para 1 PM.

**Por que 1 PM e 1 produto?**
Porque a proposta é simplicidade máxima. Com múltiplos PMs surgem conflitos de edição, gestão de permissões e coordenação — problemas que fogem do escopo. Se seu time precisa de algo compartilhado, use uma wiki de time. O Grafo PM é o brain individual do PM.

**E se eu quiser uma interface gráfica ou um SaaS?**
Grafo PM não vai virar SaaS. A simplicidade de "pasta + arquivo de instrução" é a feature, não a limitação. Se você quer uma interface, o Obsidian já é uma. Se quer sincronização em nuvem, Obsidian Sync ou um repositório privado no GitHub funcionam.

**O comportamento depende do LLM — isso não é um problema?**
É uma limitação real, documentada em "Limitações conhecidas" acima. O `SIGNAL.md` reduz a variância, mas não a elimina. Trate o output do LLM como sugestão que precisa de revisão humana, não como fato — especialmente em decisões importantes.

---

## Feedback e contato

Reporte bugs, sugira melhorias ou inicie discussões via **[Issues no GitHub](https://github.com/bicodeurubu/grafo-pm/issues)**. É o único canal de feedback.

---

## Licença e atribuição

[CC BY-NC-SA 4.0](LICENSE) — uso pessoal e ONGs: gratuito com atribuição. Uso comercial: não permitido sem acordo separado.

Criado por [Diogo Soares](https://github.com/bicodeurubu). Baseado em [llm-wikid](https://github.com/shannhk/llm-wikid) por Shann Holmberg, inspirado no padrão LLM Wiki de [Andrej Karpathy](https://github.com/karpathy).

*Compatível com Claude (Projects, API, Cowork, Cursor), Gemini, GPT-4 e modelos locais via Ollama ou LM Studio.*
