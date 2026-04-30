# Graph Report - Product Example  (2026-04-29)

## Corpus Check
- 23 files · ~7,731 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 33 nodes · 46 edges · 6 communities detected
- Extraction: 91% EXTRACTED · 9% INFERRED · 0% AMBIGUOUS · INFERRED: 4 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Intent Classification Gap  Multilingual Coverage Gap|Intent Classification Gap / Multilingual Coverage Gap]]
- [[_COMMUNITY_Fine-tuned LLM Classifier  Confidence Score|Fine-tuned LLM Classifier / Confidence Score]]
- [[_COMMUNITY_Escalation  Intent Misclassification|Escalation / Intent Misclassification]]
- [[_COMMUNITY_Rule-based Classifier  Acme Support AI|Rule-based Classifier / Acme Support AI]]
- [[_COMMUNITY_Cost per Ticket  CS Voice of Customer|Cost per Ticket / CS Voice of Customer]]
- [[_COMMUNITY_AB Test Intent v2  Autonomous Resolution Rate|A/B Test Intent v2 / Autonomous Resolution Rate]]

## God Nodes (most connected - your core abstractions)
1. `Intent Classification Gap` - 8 edges
2. `Multilingual Coverage Gap` - 6 edges
3. `Decision: Intent First Q2` - 5 edges
4. `Escalation` - 5 edges
5. `Q2 Autonomous Resolution OKR` - 4 edges
6. `Fine-tuned LLM Classifier` - 4 edges
7. `Autonomous Resolution Rate` - 3 edges
8. `Intent Misclassification` - 3 edges
9. `Intent Classifier v2` - 3 edges
10. `A/B Test Intent v2` - 3 edges

## Surprising Connections (you probably didn't know these)
- `CS Voice of Customer` --corroborates--> `Intent Classification Gap`  [EXTRACTED]
  intelligence/research/cs-team-voice-of-customer.md → opportunities/intent-classification-gap.md
- `Intent Classification Gap` --architecture_enables--> `Q3 Multilingual Expansion`  [INFERRED]
  opportunities/intent-classification-gap.md → intelligence/decisions/prioritize-intent-over-multilingual.md
- `Autonomous Resolution Rate` --measures--> `Q2 Autonomous Resolution OKR`  [EXTRACTED]
  intelligence/data/resolution-rate-baseline.md → outcomes/increase-autonomous-resolution-q2.md
- `Rule-based Classifier` --root_cause_of--> `Intent Misclassification`  [EXTRACTED]
  solutions/prd-intent-classifier-v2.md → intelligence/data/chatbot-funnel-q1.md
- `Intent Classifier v2` --addresses--> `Intent Classification Gap`  [EXTRACTED]
  solutions/prd-intent-classifier-v2.md → opportunities/intent-classification-gap.md

## Communities

### Community 0 - "Intent Classification Gap / Multilingual Coverage Gap"
Cohesion: 0.33
Nodes (10): Chatbot Funnel Q1, Decision: Intent First Q2, English Customers, Intent Classification Gap, Interview Synthesis Q1, Multilingual Coverage Gap, Opportunity Solution Tree, Q2 Autonomous Resolution OKR (+2 more)

### Community 1 - "Fine-tuned LLM Classifier / Confidence Score"
Cohesion: 0.29
Nodes (7): Clarifying Question UX, Confidence Score, Experiment Infrastructure, Fine-tuned LLM Classifier, ML Engineers, Sprint Q2-W1, Training Data Pipeline

### Community 2 - "Escalation / Intent Misclassification"
Cohesion: 0.4
Nodes (6): CS Team, Escalation, Intent Misclassification, LATAM Churn, LATAM Customers, Learned Helplessness

### Community 3 - "Rule-based Classifier / Acme Support AI"
Cohesion: 0.5
Nodes (4): Acme Support AI, KB Expansion Diminishing Returns, Knowledge Base, Rule-based Classifier

### Community 4 - "Cost per Ticket / CS Voice of Customer"
Cohesion: 0.67
Nodes (3): Cost per Ticket, CS Voice of Customer, Human Handle Time

### Community 5 - "A/B Test Intent v2 / Autonomous Resolution Rate"
Cohesion: 0.67
Nodes (3): A/B Test Intent v2, Autonomous Resolution Rate, Intent Classifier v2

## Knowledge Gaps
- **4 isolated node(s):** `English Customers`, `ML Engineers`, `Clarifying Question UX`, `LATAM Churn`
  These have ≤1 connection - possible missing edges or undocumented components.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Escalation` connect `Escalation / Intent Misclassification` to `Cost per Ticket / CS Voice of Customer`, `A/B Test Intent v2 / Autonomous Resolution Rate`?**
  _High betweenness centrality (0.269) - this node is a cross-community bridge._
- **Why does `Rule-based Classifier` connect `Rule-based Classifier / Acme Support AI` to `Fine-tuned LLM Classifier / Confidence Score`, `Escalation / Intent Misclassification`?**
  _High betweenness centrality (0.242) - this node is a cross-community bridge._
- **Why does `Fine-tuned LLM Classifier` connect `Fine-tuned LLM Classifier / Confidence Score` to `Rule-based Classifier / Acme Support AI`?**
  _High betweenness centrality (0.217) - this node is a cross-community bridge._
- **What connects `English Customers`, `ML Engineers`, `Clarifying Question UX` to the rest of the system?**
  _4 weakly-connected nodes found - possible documentation gaps or missing edges._