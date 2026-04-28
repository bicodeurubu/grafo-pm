# `/handover` — Product Brain Transfer
> Feature spec · Grafo PM · Rascunho v1

---

## O problema

Todo handover de produto é uma mentira bem-intencionada.

O PM de saída organiza o Notion, escreve um doc de "contexto do produto", grava uma Loom. O PM de entrada lê tudo, assiste tudo, e mesmo assim passa os primeiros 3 meses tomando decisões baseadas em premissas erradas — porque o que importava não estava escrito. Estava na cabeça do PM anterior.

O que estava na cabeça:
- Por que aquela abordagem foi descartada (a que o novo PM vai "redescobrir" em 30 dias)
- Qual a confiança real por trás de cada claim no deck de estratégia
- Quais tensões existem no entendimento do produto que nunca foram resolvidas
- O que foi tentado, falhou, e não está documentado em lugar nenhum
- Onde a evidência é sólida e onde é instinto do PM

Um handover tradicional transfere **outputs**. O `/handover` do Grafo PM transfere **contexto** — a forma como o PM anterior pensava, incluindo suas dúvidas, seus erros, e o que ele ainda não sabe.

> O contexto é o produto. O handover transfere o produto.

---

## O que é

Um comando que compila o vault em um documento de transferência honesto e completo — estruturado para que o PM de entrada comece de onde o PM de saída parou, não do zero.

```
/handover
```

Gera `handover-[YYYY-MM-DD].md` na raiz do vault. É um documento longo, técnico, e deliberadamente não-polido. Não é uma apresentação. É um transfer de estado mental.

---

## Para que serve

**Para o PM de saída:**
- Deixar um legado real, não só uma formalidade
- Forçar uma reflexão honesta sobre o que sabe vs. o que assumiu
- Documentar o raciocínio enquanto ainda está fresco

**Para o PM de entrada:**
- Saber o que já foi tentado antes de tentar de novo
- Entender onde a evidência é sólida e onde é especulação
- Ver as tensões não resolvidas e os blind spots herdados
- Começar a fazer perguntas certas no dia 1, não no mês 3

**Para a organização:**
- Reduzir o custo de transição de produto
- Preservar aprendizado institucional que normalmente se perde
- Criar um padrão de transferência de conhecimento rastreável

---

## Estrutura do documento gerado

O documento segue uma ordem específica e deliberada. Cada seção tem um propósito claro.

---

### Seção 1 — Identidade do Produto

**O que é:** O que este produto está tentando fazer no mundo. Não o pitch — a aposta real.

```
Produto: [nome]
PM de saída: [nome] | Período: [datas]
Data do handover: [data]
Vault health no momento do handover: [resultado do health check]
```

Inclui:
- A razão de existir do produto (o problema que ele resolve, de verdade)
- Para quem serve e quem são os usuários que mais importam
- A aposta estratégica central — e **o que precisaria ser verdade para ela estar certa**
- O que diferencia este produto no mercado (e se isso ainda é verdade)

> ⚠️ Esta seção deve ser escrita com honestidade sobre incerteza. Se a aposta estratégica não está validada, diz isso.

---

### Seção 2 — Mapa de Conhecimento

**O que é:** O inventário epistemológico do vault. O que sabemos, o que acreditamos, o que estamos chutando.

Dividido em quatro camadas:

**🟢 Alta confiança** — evidência direta, dados quantitativos, experimentos concluídos
> Ex: "A taxa de abandono no step 3 é 47% (dado Analytics, atualizado Q1)"

**🟡 Média confiança** — entrevistas qualitativas, pesquisa secundária, padrões observados
> Ex: "Usuários B2B têm mais paciência com onboarding longo (5 entrevistas, Q4)"

**🔴 Baixa confiança** — hipóteses não testadas, extrapolações, intuições do PM
> Ex: "Acreditamos que o price point atual é o maior bloqueador de conversão (hipótese, nunca testada diretamente)"

**⬛ Não sabemos** — perguntas abertas sem resposta, blind spots conhecidos
> Ex: "Não sabemos por que a cohorte de usuários enterprise tem churn 3x maior"

Gerado automaticamente a partir das confidence levels dos arquivos do vault.

---

### Seção 3 — OST: Estado Atual

**O que é:** Uma fotografia do Opportunity Solution Tree no momento do handover.

```
OUTCOME ATIVO
└── Oportunidade A [alta confiança, última evidência: 45 dias atrás]
    ├── Solução 1 → Experimento X [em andamento]
    └── Solução 2 → [sem experimento — órfã]
└── Oportunidade B [baixa confiança, stale — última evidência: 120 dias atrás]
    └── [sem solução]

OUTCOMES ANTERIORES (encerrados)
└── Outcome Q3: [resultado e aprendizado em 1 linha]
```

Para cada item inclui:
- Status atual (ativo / em progresso / encerrado / stale)
- Último update (quando foi alimentado com evidência nova)
- Links para os arquivos fonte no vault

> O PM de entrada precisa saber o que está ativo de verdade vs. o que ficou aberto por inércia.

---

### Seção 4 — Arqueologia de Decisões

**O que é:** As decisões mais importantes do período, com o contexto completo — não só o que foi decidido, mas o que estava em jogo.

Para cada decisão relevante:

```
## Decisão: [título]
Data: | Status: [ativa / supersedida / em revisão]

**Contexto:**
O que estava acontecendo que forçou esta decisão.

**Opções consideradas:**
- Opção A: [o que era + por que foi descartada]
- Opção B: [o que era + por que foi descartada]
- Opção escolhida: [o que era + por que foi escolhida]

**Evidências que informaram:**
Links para os arquivos de research, data, e entrevistas que pesaram na decisão.

**O que eu faria diferente hoje:**
Honestidade sobre o que se aprendeu depois. Não é arrependimento — é informação para o próximo PM.

**Sinal de reversão:**
Qual evidência ou mudança de contexto invalidaria esta decisão.
```

> Esta seção não polida a narrativa. Se a decisão foi tomada com dados ruins, diz isso.

---

### Seção 5 — O Cemitério

**O que é:** O que foi tentado e não funcionou. A seção mais importante que nenhum handover tradicional tem.

Dividido em:

**Experimentos que falharam (e o que aprendemos)**
> Inclui experimentos com resultado negativo ou inconclusivo. Com link para o arquivo original e a hipótese que foi invalidada.

**Abordagens abandonadas**
> Soluções ou estratégias que foram consideradas seriamente e descartadas — com o motivo. O próximo PM vai "redescobrir" algumas dessas. Melhor que saiba de antemão por que foram descartadas.

**Hipóteses que se provaram erradas**
> O que o PM acreditava no início e mudou de ideia — e o que causou a mudança.

> ⚠️ Se o Cemitério está vazio, provavelmente não foi preenchido honestamente.

---

### Seção 6 — Tensões Vivas

**O que é:** Contradições e conflitos que existem no vault e **não foram resolvidos**. O próximo PM herda esses conflitos — é melhor que saiba.

Exemplos de tensões:

```
TENSÃO: Usuários dizem que querem X, mas comportam-se como se precisassem de Y
- Evidência de X: [link]
- Evidência de Y: [link]
- Status: não resolvida. Abordagem atual assume Y por enquanto.

TENSÃO: Time de vendas acredita que o bloqueador é preço. CS acredita que é onboarding.
- Evidência de vendas: [link]
- Evidência de CS: [link]
- Status: experimento planejado para Q3 (nunca executado).
```

> Tensões não resolvidas NÃO são falhas do PM de saída. São a realidade de produtos complexos. Escondê-las seria desonesto.

---

### Seção 7 — Zonas Stale

**O que é:** Partes do vault que provavelmente estão desatualizadas e precisam ser re-validadas pelo PM de entrada.

```
⚠️ STALE (>90 dias sem atualização):
- Análise competitiva de [Concorrente X] — última atualização: 4 meses atrás
- Personas de usuário B2B — última entrevista: 6 meses atrás
- Baseline de métricas de engajamento — última atualização: Q2

📅 PRÓXIMO A VENCER (30-90 dias):
- Research de pricing — recomendado revisar antes do próximo ciclo de planejamento
```

Gerado automaticamente a partir das datas nos arquivos do vault.

---

### Seção 8 — Hipóteses Órfãs

**O que é:** Coisas que o vault registrou como hipóteses mas que nunca viraram experimentos. O PM de entrada deve decidir: testar, descartar, ou manter como especulação.

```
HIPÓTESE: [título]
Origem: [de onde veio — entrevista, intuição, dado indireto]
Por que nunca foi testada: [contexto]
Relevância hoje: [ainda faz sentido investigar?]
```

---

### Seção 9 — Se eu fosse você (opcional)

**O que é:** A recomendação honesta do PM de saída para o PM de entrada. Não é uma instrução — é uma opinião informada.

```
Se eu fosse começar amanhã, faria:

1. [Primeira coisa] — porque [razão]
2. [Segunda coisa] — porque [razão]
3. [Terceira coisa] — porque [razão]

Evitaria, pelo menos por enquanto:
- [X] — porque [razão]

A pergunta que eu ainda não respondi e que mais me incomoda:
[Pergunta em aberto mais importante]
```

> Esta seção é opcional. O PM de saída pode omitir se não quiser influenciar excessivamente o próximo PM.

---

## O que o `/handover` NÃO é

| Não é | É |
|---|---|
| Um PRD do produto | Uma transferência do raciocínio por trás do produto |
| Um relatório de resultados | Um mapa de certezas e incertezas |
| Uma versão polida da realidade | Um estado honesto incluindo conflitos e dúvidas |
| Um documento para stakeholders | Um documento para o próximo PM |
| Um documento de "tudo que fizemos" | Um documento de "tudo que você precisa saber para continuar" |

> A diferença mais importante: um PRD documenta o que foi construído. O `/handover` transfere o contexto que permite construir bem o que vem a seguir.

---

## Pré-condição: Handover Readiness Check

Antes de gerar o documento, o comando executa um health check e exibe:

```
📊 HANDOVER READINESS CHECK

✅ Vault tem pelo menos 1 Outcome documentado
✅ Vault tem pelo menos 3 Decisões documentadas
⚠️  2 experimentos sem resultado registrado (recomendado documentar antes do handover)
⚠️  Análise competitiva com >90 dias — será marcada como stale no documento
❌  Nenhuma hipótese órfã registrada — seção 8 ficará vazia (normal se vault está bem cuidado)

Qualidade estimada do handover: MÉDIA
Para um handover completo, recomendado: registrar resultados dos experimentos em andamento

Gerar mesmo assim? [S/N]
```

O PM pode gerar mesmo com gaps — mas é informado do que estará faltando.

---

## Escopo de implementação

### Fase 1 — Documento gerado por prompt (MVP)
**Complexidade: baixa. Puro prompt.**

O `/handover` é uma instrução no `SIGNAL.md` que, quando acionada, faz o LLM percorrer os arquivos do vault e compilar o documento estruturado.

O LLM lê: `library/`, `intelligence/decisions/`, `experiments/`, `opportunities/`, `outcomes/`. Compila seguindo o template das 9 seções. Salva como `handover-[data].md`.

**Limitação:** O LLM só acessa o que o PM trouxer para o contexto. Em vaults grandes, pode ser necessário acionar por partes.

**Entregável:** Prompt no `SIGNAL.md` + template das 9 seções.

---

### Fase 2 — Staleness automático + confidence scoring
**Complexidade: média.**

Os arquivos do vault passam a ter `last_updated` e `confidence_level` no frontmatter como campos padrão. O `/handover` usa esses campos para popular automaticamente as seções 2 (Mapa de Conhecimento) e 7 (Zonas Stale) sem depender da interpretação do LLM.

Isso torna o handover mais preciso e menos dependente de o PM ter alimentado bem os arquivos manualmente.

**Entregável:** Extensão do schema de frontmatter dos arquivos + lógica de coleta no prompt.

---

### Fase 3 — Handover diff (futuro)
**Complexidade: média-alta. Avaliar ROI.**

Dado um período (ex: "últimos 6 meses"), gera um handover que destaca especificamente o que **mudou** — decisões revertidas, hipóteses que se confirmaram ou falharam, tensões que foram resolvidas ou surgiram.

Útil para handovers parciais (PM continua no produto mas vai de férias, ou passa responsabilidade para outro PM por uma iniciativa específica).

---

## Critério de sucesso

- O PM de entrada consegue entender o estado do produto em profundidade lendo apenas o handover — sem precisar marcar reunião com o PM de saída para perguntas básicas
- O documento expõe pelo menos 1 tensão não resolvida que não estava documentada em nenhum outro lugar
- O PM de entrada comenta "não sabia que isso havia sido tentado" ao ler o Cemitério

---

## Nota sobre o formato

O `/handover` é deliberadamente um documento longo. Isso é intencional.

Um handover curto é um handover incompleto. A pressão para "ser conciso" no handover é o que causa perda de contexto. O próximo PM vai passar semanas re-aprendendo o que poderia ter lido em 2 horas.

O documento deve ser lido, não apresentado.
