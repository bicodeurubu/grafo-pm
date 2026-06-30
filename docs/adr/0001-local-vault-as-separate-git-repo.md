# Guardrail público/local via repo Git separado, não apenas .gitignore

O template repo precisa impedir que dado real de produto (decisões, pesquisa, métricas proprietárias) vaze para o GitHub público. Um `.gitignore` sozinho não basta: não impede commit acidental se a regra for removida ou contornada, e não dá versionamento real ao trabalho proprietário do PM. Decidimos que `local-vault/` é um repositório Git **próprio**, sem remote público, gitignorado pela raiz — e reforçamos com um hook `pre-push` (`.githooks/pre-push`) que bloqueia o push se `SIGNAL.md` ou `library/01-07*.md` na raiz saírem do estado de template (placeholders / `status: draft`). Duas camadas independentes: estrutural (repo separado) e automática (hook), porque qualquer uma sozinha é contornável.

`Product Example/` é exceção deliberada — conteúdo fictício, feito para ser público, fora da checagem do hook.
