# `/publish` — PM Portfolio
> Feature spec · Grafo PM · Rascunho v1

---

## O problema

PMs não têm portfólio.

Devs têm GitHub. Designers têm Behance. PMs têm... um PDF de currículo com bullet points de resultados que qualquer um poderia ter escrito.

O que diferencia um PM forte não é o que ele construiu — é como ele pensa. Como conecta evidências a decisões. Como lida com incerteza. Como prioriza sem dados completos. Como reconhece quando estava errado.

O Grafo PM já captura isso tudo no vault. O `/publish` torna isso visível.

---

## O que é

Um comando que exporta partes selecionadas do vault como uma página estática — um portfólio de raciocínio de produto.

```
/publish
```

Gera uma pasta `_public/` com um `index.html` auto-contido, deployável no GitHub Pages com um único `git push`.

Não é um dump do vault. É uma curadoria do pensamento.

---

## Para que serve

**Para o PM:**
- Mostrar forma de pensar em processos seletivos, sem precisar explicar "minha metodologia" em palavras
- Compartilhar raciocínio com stakeholders externos sem expor dados sensíveis
- Construir reputação na comunidade de produto mostrando o processo, não só o resultado

**Para quem vê:**
- Hiring manager entende em 5 minutos se o PM pensa estruturado ou caótico
- Colega de produto aprende com a forma como o PM estruturou um OST
- Stakeholder entende a lógica por trás de uma decisão sem precisar de uma apresentação

**Para o Grafo PM (produto):**
- Cada portfólio publicado é uma demonstração pública do que o Grafo PM faz
- Loop viral: PM usa → publica → outro PM vê → quer usar
- Distribuição orgânica sem budget de marketing

---

## O que aparece na página

A página é dividida em seções. O PM escolhe quais incluir antes de publicar.

### Seção 1 — Sobre o produto
Gerada a partir de `library/01-product-context.md`. Descrição do produto, usuários, e contexto estratégico — na versão que o PM quiser expor publicamente (pode ser redacted).

### Seção 2 — OST: como penso o produto
Visualização do Opportunity Solution Tree atual:
- Outcomes ativos (metas do quarter)
- Oportunidades identificadas, com nível de confiança
- Soluções em andamento vinculadas a oportunidades
- Experimentos e o que aprendemos

Não é uma lista — é uma árvore de raciocínio navegável. O visitante vê a lógica de como chego de um OKR a uma decisão de construção.

### Seção 3 — Decisões documentadas
Extrai de `intelligence/decisions/`. Mostra as decisões mais importantes com:
- Contexto em que foi tomada
- Opções consideradas
- Evidências que informaram
- Resultado e aprendizado

Não é um changelog de features. É arqueologia de raciocínio.

### Seção 4 — O que aprendi com os experimentos
Extrai de `experiments/`. Mostra hipóteses testadas, resultados, e o que mudou na forma de pensar. Inclui experimentos que **falharam** — porque isso diferencia um PM honesto de um PM que só conta os sucessos.

### Seção 5 — Perguntas abertas (opcional)
Extrai de `library/05-open-hypotheses.md`. Mostra o que o PM ainda não sabe — o que está investigando, o que não tem resposta ainda. Honestidade sobre incerteza é um sinal forte de maturidade.

---

## Checklist de privacidade antes de publicar

Antes de gerar a página, o comando exibe:

```
⚠️  /publish vai expor o seguinte. Confirme o que incluir:

[ ] Contexto do produto (library/01)
[ ] Usuários-alvo (library/02)
[ ] Apostas estratégicas (library/03)
[ ] Decisões documentadas (N arquivos)
[ ] Experimentos e resultados (N arquivos)
[ ] Hipóteses abertas (library/05)

O seguinte NÃO será incluído por padrão:
✗ Dados quantitativos (library/06)
✗ Constraints de decisão (library/04)
✗ Ops (sprints, meetings)
✗ Inbox (dados brutos)

Quer prosseguir?
```

O PM confirma item a item. Qualquer arquivo com `confidential: true` no frontmatter é automaticamente excluído.

---

## Design da página

A página precisa ser bonita. Não é um dump de markdown — é um portfólio.

**Princípios visuais:**
- Tipografia limpa, leitura prioritária (sem distrações)
- Dark mode por padrão (PM tech feel)
- OST como visualização visual, não tabela
- Cada seção colapsável (não força scroll infinito)
- Link de "gerado com Grafo PM" discreto no rodapé (atribuição + distribuição)

**Referências visuais de tom:** Notion public pages + Linear changelog + are.na

**O que NÃO é:** não é um site corporativo, não tem hero com foto do PM, não tem "10 anos de experiência". É uma janela para o raciocínio.

---

## Escopo de implementação

### Fase 1 — Export de markdown curado (MVP)
**Complexidade: baixa. É puro prompt.**

O `/publish` compila os arquivos selecionados em um único `handover-public.md` bem formatado. O PM publica onde quiser (coloca no Notion público, GitHub, whatever). Sem HTML, sem design.

O valor já existe: o conteúdo compilado e curado é o portfólio. O design vem depois.

**Entregável:** Um prompt no `SIGNAL.md` que responde ao comando `/publish` e gera o `_public/PORTFOLIO.md`.

---

### Fase 2 — HTML estático com design (versão completa)
**Complexidade: média. Requer template HTML.**

Um template `_public/index.html` único, auto-contido (sem dependências externas), gerado pelo LLM a partir do vault. O PM faz `git push` e está no ar via GitHub Pages.

O HTML é gerado pelo LLM como parte da resposta ao `/publish` — não precisa de pipeline de build, npm, ou qualquer tooling. É literalmente um arquivo HTML que o LLM escreve com o conteúdo do vault injetado.

**Entregável:** Template de HTML que o LLM preenche + instrução no `SIGNAL.md`.

---

### Fase 3 — Personalização e deploy automático (futuro)
**Complexidade: alta. Avaliar se vale a pena vs. simplicidade.**

- Temas visuais customizáveis
- Deploy automático via GitHub Actions
- Analytics de visitantes (quantos viram o portfólio)

⚠️ **Atenção:** Fase 3 viola a filosofia de simplicidade se não for executada com cuidado. Avaliar antes de construir se Fase 1+2 não são suficientes para o valor prometido.

---

## Critério de sucesso

- Um PM consegue gerar e publicar o portfólio em menos de 10 minutos na primeira vez
- A página publicada é boa o suficiente para ser incluída em um LinkedIn ou email de candidatura
- Pelo menos 1 usuário novo descobre o Grafo PM por mês através de um portfólio publicado

---

## O que este feature NÃO é

- Não é um site pessoal de PM (não tem bio, foto, redes sociais)
- Não é um blog (não tem artigos)
- Não é um dashboard de métricas do produto (dados sensíveis ficam fora)
- Não substitui um README público de produto

É uma janela para o raciocínio. Nada mais, nada menos.
