# 🚀 Quick Start - enjoyable-silicon

Este é o guia rápido. Para detalhes completos, veja **NEW_REPO_GUIDE.md**.

## Comandos Rápidos

### 1. Limpar Repositório
```bash
cd /Users/pedro/git/enjoyable-roddi
./clean_for_new_repo.sh
```

### 2. Configurar Git
```bash
git remote remove origin
git remote add origin https://github.com/pedroh77/enjoyable-silicon.git
git remote -v
```

### 3. Commit e Push
```bash
git add -A
git commit -m "chore: prepare repository for independent fork"
git branch -M main
git push -u origin main
```

### 4. Criar Tag
```bash
git tag -a v1.0.0 -m "Initial release: Enjoyable Silicon v1.0.0"
git push origin v1.0.0
```

### 5. Criar Release no GitHub
1. Ir em: https://github.com/pedroh77/enjoyable-silicon/releases/new
2. Tag: `v1.0.0`
3. Title: `v1.0.0 - Initial Release`
4. Upload: `release/Enjoyable-Universal-20251025.dmg` → renomear para `Enjoyable-Universal.dmg`
5. Publicar

## Checklist Mínimo

- [ ] Executar clean_for_new_repo.sh
- [ ] Criar repo no GitHub (enjoyable-silicon)
- [ ] Atualizar remote do git
- [ ] Push para main
- [ ] Criar release v1.0.0 com DMG
- [ ] Testar download

## Links Importantes

- **Criar Repo**: https://github.com/new
- **Guia Completo**: NEW_REPO_GUIDE.md
- **Resumo Executivo**: EXECUTIVE_SUMMARY.md

## Em Caso de Erro

```bash
# Desfazer último commit (se necessário)
git reset --hard HEAD~1

# Ver status
git status

# Ver remotes
git remote -v

# Ver histórico
git log --oneline
```

---

**Tempo estimado: 30 minutos**
