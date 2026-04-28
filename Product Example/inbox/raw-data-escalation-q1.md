# Raw Data Drop — Chatbot Escalation Export Q1 2026
Source: Metabase — Chatbot Escalation Analysis | Exported: 2026-04-06 | By: Bruno Lima

---

Q1 2026 escalation breakdown — 3,847 escalated tickets total

Exit point analysis:
- Intent classification failure: 38% (1,461 tickets) ← HIGHEST
- No KB match found: 24% (923 tickets)
- User explicitly requested human: 21% (808 tickets)
- Timeout / no response: 11% (423 tickets)
- Other: 6% (232 tickets)

Language breakdown (escalated tickets): English 82% | Portuguese 11% | Spanish 4% | Other 3%
Resolution rate by language: English 44% | Portuguese 9% | Spanish 7%

Top misclassified intents (from agent corrections):
1. "account locked" → classified as password reset (28% of intent errors)
2. "cancel subscription" → classified as billing inquiry (19%)
3. "not receiving emails" → classified as notification settings (16%)
4. "upgrade plan" → classified as billing (14%)
5. long tail: 23%

Avg handle time — wrong first bot response: 18 min vs correct: 6 min
Cost delta: ~$1.40/ticket extra when bot misclassifies (3× handle time)
