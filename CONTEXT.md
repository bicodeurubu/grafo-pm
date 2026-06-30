# Grafo PM (template repo)

Scaffolding open source para um vault de produto operado por PM + LLM. Este `CONTEXT.md` documenta o domínio de engenharia do repositório em si (estrutura, guardrails, distribuição) — não confundir com `library/08-ubiquitous-language.md`, que é o glossário do *conteúdo* do vault (Outcome, Opportunity, Solution etc).

## Language

**Template repo**:
Este repositório (`bicodeurubu/grafo-pm`), o scaffolding público e vazio/demo. Tudo que está versionado aqui pode ir para o GitHub público.
_Avoid_: repo, projeto, o vault

**Vault instance**:
Uma cópia do template repo clonada e preenchida com dado real de produto. `local-vault/` é a vault instance deste autor; qualquer PM que clona o template para uso próprio cria a sua.
_Avoid_: vault (sozinho, sem contexto — ver nota abaixo), instalação, deployment

**SIGNAL.md**:
Arquivo de instrução para o LLM operar *dentro* de uma vault instance — domínio do PM (OST, Opportunities, Decisions). Existe tanto no template repo (placeholder) quanto em cada vault instance (preenchido).
_Avoid_: CONTEXT.md, manual, README

**CONTEXT.md** (este arquivo):
Glossário de engenharia sobre a estrutura do template repo em si — pastas, guardrails, hooks. Consumido por agents de engenharia (ex: `/code-review`), não pelo PM operando o vault.
_Avoid_: SIGNAL.md, documentação, README

**Guardrail público/local**:
O par de mecanismos (gitignore de `local-vault/` + hook `pre-push`) que impede dado real de produto vazar para o template público.
_Avoid_: proteção, validação, check

## Relacionamentos

- Um **Template repo** é clonado para originar uma **Vault instance**.
- `Product Example/` é uma **Vault instance** fictícia que vive *dentro* do template repo — exceção deliberada ao guardrail público/local (conteúdo é demo, não dado real).
- O **Guardrail público/local** protege o **Template repo** de receber conteúdo que pertence a uma **Vault instance**.

## Nota: "Vault" sozinho é ambíguo

`library/08-ubiquitous-language.md` define **Vault** = "o repositório inteiro — o product brain", pensando em uma única vault instance isolada. Mas o template repo hoje hospeda potencialmente várias noções de "vault" ao mesmo tempo (o próprio scaffolding, `Product Example/`, `local-vault/`). Ao escrever sobre o template repo, prefira os termos precisos acima (**Template repo** / **Vault instance**) em vez de "vault" sozinho.
