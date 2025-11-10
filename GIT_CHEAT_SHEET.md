# 🔧 Git Cheat Sheet - enjoyable-silicon

Comandos Git úteis para gerenciar o repositório.

## 🚀 Setup Inicial

### Configurar Remote
```bash
# Ver remotes atuais
git remote -v

# Remover remote antigo
git remote remove origin

# Adicionar novo remote
git remote add origin https://github.com/pedroh77/enjoyable-silicon.git

# Verificar
git remote -v
```

### Primeira Push
```bash
# Garantir que está na branch main
git branch -M main

# Push inicial
git push -u origin main
```

## 📝 Commits Diários

### Workflow Básico
```bash
# Ver status
git status

# Ver mudanças
git diff

# Adicionar arquivos específicos
git add README.md
git add Classes/

# Ou adicionar tudo
git add -A

# Commit
git commit -m "feat: add new feature"

# Push
git push
```

### Tipos de Commit
```bash
# Nova feature
git commit -m "feat: add controller vibration support"

# Correção de bug
git commit -m "fix: menu bar icon not updating"

# Documentação
git commit -m "docs: update installation instructions"

# Manutenção/limpeza
git commit -m "chore: remove temporary files"

# Refatoração
git commit -m "refactor: improve input handling"

# Testes
git commit -m "test: add unit tests for mapping"

# Performance
git commit -m "perf: optimize controller polling"

# Estilo/formatação
git commit -m "style: format code with clang-format"
```

## 🏷️ Tags e Releases

### Criar Tags
```bash
# Tag anotada (recomendado)
git tag -a v1.0.0 -m "Initial release"

# Tag leve (não recomendado para releases)
git tag v1.0.0

# Ver todas as tags
git tag

# Ver detalhes de uma tag
git show v1.0.0
```

### Push de Tags
```bash
# Push de uma tag específica
git push origin v1.0.0

# Push de todas as tags
git push --tags
```

### Remover Tags
```bash
# Remover tag local
git tag -d v1.0.0

# Remover tag remota
git push origin --delete v1.0.0
```

### Versioning
```bash
# Major release (quebra compatibilidade)
git tag -a v2.0.0 -m "Release 2.0.0: Major refactor"

# Minor release (nova feature, compatível)
git tag -a v1.1.0 -m "Release 1.1.0: Add feature X"

# Patch release (bug fixes)
git tag -a v1.0.1 -m "Release 1.0.1: Fix critical bug"
```

## 🔙 Desfazer Mudanças

### Antes de Commit
```bash
# Desfazer mudanças em arquivo específico
git checkout -- README.md

# Desfazer todas as mudanças
git checkout -- .

# Remover arquivo do staging
git reset HEAD README.md

# Descartar todas as mudanças (CUIDADO!)
git reset --hard HEAD
```

### Depois de Commit (local)
```bash
# Desfazer último commit (mantém mudanças)
git reset --soft HEAD~1

# Desfazer último commit (descarta mudanças)
git reset --hard HEAD~1

# Desfazer últimos 3 commits
git reset --hard HEAD~3
```

### Depois de Push (remoto)
```bash
# Reverter commit específico (cria novo commit)
git revert <commit-hash>

# Force push (CUIDADO! Reescreve histórico)
git push --force
```

## 📚 Histórico

### Ver Histórico
```bash
# Log completo
git log

# Log resumido
git log --oneline

# Log com graph
git log --oneline --graph --all

# Log de arquivo específico
git log README.md

# Log com diffs
git log -p

# Últimos 5 commits
git log -5
```

### Buscar no Histórico
```bash
# Buscar por mensagem
git log --grep="fix"

# Buscar por autor
git log --author="Pedro"

# Buscar por data
git log --since="2025-10-01"
git log --until="2025-10-31"
```

## 🔍 Inspeção

### Ver Mudanças
```bash
# Mudanças não staged
git diff

# Mudanças staged
git diff --staged

# Mudanças em arquivo específico
git diff README.md

# Diferença entre branches
git diff main feature-branch

# Diferença entre commits
git diff abc123 def456
```

### Informações
```bash
# Ver informações do repo
git remote show origin

# Ver branches
git branch -a

# Ver último commit
git show HEAD

# Ver commit específico
git show abc123

# Ver quem mudou cada linha
git blame README.md
```

## 🌿 Branches (Futuro)

### Criar e Usar Branches
```bash
# Criar branch
git branch feature-new-controller

# Mudar para branch
git checkout feature-new-controller

# Criar e mudar em um comando
git checkout -b feature-new-controller

# Ver branches
git branch

# Ver todas (incluindo remotas)
git branch -a
```

### Merge
```bash
# Voltar para main
git checkout main

# Fazer merge da feature
git merge feature-new-controller

# Deletar branch após merge
git branch -d feature-new-controller
```

## 🔧 Manutenção

### Limpeza
```bash
# Limpar arquivos não rastreados (dry run)
git clean -n

# Limpar arquivos não rastreados
git clean -f

# Limpar inclusive diretórios
git clean -fd

# Otimizar repositório
git gc

# Verificar integridade
git fsck
```

### Atualizar .gitignore
```bash
# Depois de atualizar .gitignore, remover cache
git rm -r --cached .
git add .
git commit -m "chore: update .gitignore"
```

## 🆘 Resolução de Problemas

### "Divergent branches"
```bash
# Pull com rebase
git pull --rebase origin main

# Ou configurar como padrão
git config pull.rebase true
```

### "Failed to push"
```bash
# Pull primeiro
git pull origin main

# Resolver conflitos se houver
# Então push
git push origin main
```

### "Detached HEAD"
```bash
# Voltar para main
git checkout main
```

### "Merge conflicts"
```bash
# Ver arquivos com conflito
git status

# Depois de resolver conflitos manualmente
git add <arquivo-resolvido>
git commit -m "fix: resolve merge conflicts"
```

## 📊 Estatísticas

### Informações do Repo
```bash
# Número de commits
git rev-list --count HEAD

# Contribuidores
git shortlog -sn

# Linhas adicionadas/removidas
git log --stat

# Atividade por autor
git log --author="Pedro" --oneline
```

## ⚙️ Configuração

### Config Local
```bash
# Configurar nome
git config user.name "Pedro Albuquerque"

# Configurar email
git config user.email "seu-email@example.com"

# Ver configurações
git config --list

# Editor padrão
git config core.editor "nano"
```

### Aliases Úteis
```bash
# Criar aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global alias.lg "log --oneline --graph --all"

# Usar
git co main
git st
git lg
```

## 🚀 Workflow Recomendado

### Desenvolvimento Normal
```bash
# 1. Ver o que mudou
git status

# 2. Adicionar mudanças
git add -A

# 3. Commit com mensagem clara
git commit -m "tipo: descrição curta"

# 4. Push
git push
```

### Nova Feature
```bash
# 1. Criar branch
git checkout -b feature-nome

# 2. Desenvolver e commitar
git add .
git commit -m "feat: implementar feature X"

# 3. Voltar para main
git checkout main

# 4. Merge
git merge feature-nome

# 5. Push
git push

# 6. Deletar branch
git branch -d feature-nome
```

### Nova Release
```bash
# 1. Atualizar versão em arquivos relevantes
# 2. Commit
git add .
git commit -m "chore: bump version to 1.1.0"

# 3. Criar tag
git tag -a v1.1.0 -m "Release 1.1.0: New features"

# 4. Push commits e tags
git push
git push --tags

# 5. Criar release no GitHub com binário
```

## 📝 Boas Práticas

### Mensagens de Commit
✅ **Bom:**
```bash
git commit -m "fix: menu bar icon not updating in dark mode"
git commit -m "feat: add support for Xbox Elite controller"
git commit -m "docs: update installation instructions for macOS 15"
```

❌ **Ruim:**
```bash
git commit -m "fix"
git commit -m "changes"
git commit -m "asdf"
```

### Quando Commitar
- ✅ Após completar uma unidade lógica de trabalho
- ✅ Quando o código compila sem erros
- ✅ Antes de mudar de contexto (ex: começar outra feature)
- ❌ Não commitar código quebrado
- ❌ Não commitar arquivos temporários

### Quando Fazer Push
- ✅ No final do dia de trabalho
- ✅ Após completar uma feature
- ✅ Antes de fazer grandes mudanças
- ✅ Quando quiser backup remoto

## 🔗 Links Úteis

- **Git Book:** https://git-scm.com/book/en/v2
- **GitHub Docs:** https://docs.github.com
- **Conventional Commits:** https://www.conventionalcommits.org

---

**Salve este arquivo para referência rápida!**
