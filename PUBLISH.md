# /publish — PM Portfolio

> Exporte seu raciocínio de produto como uma página pública. Mostre como você pensa, não só o que você construiu.

---

## O que é

`/publish` transforma o vault do Grafo PM em uma página estática — um portfólio de raciocínio de produto. Deployável no GitHub Pages com um único `git push`.

Não é um dump do vault. É uma curadoria do pensamento: o OST, as decisões com contexto completo, o que foi testado e aprendido, e as hipóteses ainda abertas.

---

## Como usar

No seu LLM (Claude, ChatGPT, Cursor, etc.), com o vault carregado:

```
/publish
```

O LLM vai:
1. Exibir o **checklist de privacidade** com o que será exposto
2. Aguardar sua confirmação
3. Gerar `_public/index.html` com o conteúdo selecionado

---

## O que aparece na página

| Seção | Fonte no vault | Incluída por padrão |
|---|---|---|
| Sobre o produto | `library/01-product-context.md` | ✅ |
| Para quem | `library/02-user-truths.md` | ✅ |
| A aposta estratégica | `library/03-strategic-bets.md` | ✅ |
| OST (Outcomes → Experiments) | `outcomes/` + `opportunities/` + `solutions/` + `experiments/` | ✅ |
| Decisões documentadas | `intelligence/decisions/` (só `status: approved`) | ✅ |
| Hipóteses abertas | `library/05-open-hypotheses.md` | ✅ |
| Dados e métricas | `library/06-data-anchors.md` | ❌ |
| Constraints de decisão | `library/04-decision-constraints.md` | ❌ |
| Ops (sprints, meetings) | `ops/` | ❌ |
| Inbox | `inbox/` | ❌ |

Qualquer arquivo com `confidential: true` no frontmatter é automaticamente excluído, independente da seleção.

---

## Publicar no GitHub Pages

Após gerar `_public/index.html`:

**1. Commit e push**
```bash
git add _public/index.html
git commit -m "feat(publish): update portfolio"
git push origin main
```

**2. Ativar GitHub Pages**
- Ir em Settings → Pages
- Source: `Deploy from a branch`
- Branch: `main` · Folder: `/_public`
- Salvar

**3. Acessar**
```
https://[seu-usuario].github.io/[nome-do-repo]/
```

A partir daí, qualquer `git push` com mudanças em `_public/` atualiza o portfólio automaticamente.

---

## Privacidade — o que não expor

Antes de publicar, revise:

- **Dados quantitativos sensíveis** — métricas internas, benchmarks, revenue. Estão em `library/06` e excluídos por padrão.
- **Informações de clientes** — mesmo anonimizadas, avalie o risco contextual antes de incluir research.
- **Decisões não aprovadas** — o `/publish` só inclui `status: approved`. Drafts ficam fora.
- **Contexto de empresa** — se o vault contém informação que a empresa considera confidencial, não publique.

> Quando em dúvida: não inclua. O portfólio é sobre raciocínio, não sobre dados.

---

## Personalizar o visual

O template está em `_public/template.html`. O LLM usa este arquivo como base e gera o `index.html` com o conteúdo injetado.

Para customizar cores, fontes ou layout: edite `_public/template.html` antes de rodar `/publish`. As variáveis CSS estão no início do arquivo:

```css
:root {
  --accent:   #7c6fff;  /* cor principal */
  --bg:       #0d0d0d;  /* fundo */
  --text:     #e8e8e8;  /* texto */
  ...
}
```

---

## Atualizar o portfólio

Sempre que o vault evoluir (novas decisões, experimentos concluídos, hipóteses atualizadas), rode `/publish` novamente. O arquivo `index.html` é sobrescrito.

Sugestão de cadência: ao final de cada quarter, gerar uma versão atualizada do portfólio junto com a retrospectiva de sprint.

---

## Estrutura de arquivos

```
_public/
  template.html   ← template base (edite para customizar visual)
  index.html      ← gerado pelo /publish (não edite manualmente)
```

O `index.html` é gerado — não edite manualmente. Qualquer mudança manual será sobrescrita na próxima vez que `/publish` rodar.

---

## Limitações conhecidas

- **Vaults grandes**: o LLM tem limite de contexto. Para vaults com muitos arquivos, pode ser necessário rodar `/publish` em partes (ex: "gera o /publish focando só nas últimas 3 decisões").
- **Imagens**: o template não inclui imagens por padrão. Se quiser adicionar screenshots ou diagramas, edite o `template.html` manualmente.
- **Idioma**: o template padrão está em português. Para inglês, edite os textos estáticos do `template.html`.
- **Conteúdo com caracteres especiais**: antes de injetar qualquer conteúdo do vault no `template.html`, o LLM deve escapar os caracteres `<`, `>` e `&` como entidades HTML (`&lt;`, `&gt;`, `&amp;`). Conteúdo bruto com esses caracteres (ex: trechos de código, URLs, comparações) pode quebrar o HTML gerado.

> **Instrução para o LLM ao rodar `/publish`:** ao injetar conteúdo do vault no template HTML, sempre escapar `<` → `&lt;`, `>` → `&gt;`, `&` → `&amp;` no corpo do texto antes de inserir. Nunca inserir conteúdo bruto do vault diretamente em atributos ou elementos HTML.
