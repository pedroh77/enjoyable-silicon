# Guia: Como fazer Fork e Push do Enjoyable

## Passo 1: Fork no GitHub

1. Vá para https://github.com/roddi/enjoyable
2. Clique no botão **"Fork"** (canto superior direito)
3. Isso criará uma cópia em `https://github.com/SEU_USERNAME/enjoyable`

## Passo 2: Configurar o repositório local

```bash
cd ~/git/enjoyable-roddi

# Ver o remote atual (deve ser o do roddi)
git remote -v

# Adicionar seu fork como "origin" e renomear o do roddi para "upstream"
git remote rename origin upstream
git remote add origin https://github.com/SEU_USERNAME/enjoyable.git

# Verificar
git remote -v
# Deve mostrar:
# origin    https://github.com/SEU_USERNAME/enjoyable.git (fetch)
# origin    https://github.com/SEU_USERNAME/enjoyable.git (push)
# upstream  https://github.com/roddi/enjoyable.git (fetch)
# upstream  https://github.com/roddi/enjoyable.git (push)
```

## Passo 3: Limpar e preparar

```bash
# Executar script de limpeza
chmod +x cleanup.sh
./cleanup.sh

# Verificar status
git status
```

## Passo 4: Commit das mudanças

```bash
# Adicionar arquivos modificados
git add .

# Ver o que será commitado
git status

# Fazer commit
git commit -m "Add Xcode 26 compatibility and modernizations

- Fix CoreGraphics header imports for macOS 15 SDK
- Add Universal Binary support (ARM64 + Intel)
- Enable Dark Mode support
- Fix menu bar icons for light/dark themes
- Update to high-resolution Big Sur+ style icon
- Add build and package script"

# Push para seu fork
git push origin master
```

## Passo 5: Criar Release no GitHub

1. Vá para `https://github.com/SEU_USERNAME/enjoyable`
2. Clique em **"Releases"** → **"Create a new release"**
3. Tag: `v1.5-xcode26` (ou similar)
4. Release title: "Enjoyable 1.5 - Xcode 26 Compatible"
5. Description: Copie o conteúdo relevante do README.md
6. **Anexe o DMG** arrastando o arquivo
7. Clique em **"Publish release"**

## Passo 6 (Opcional): Pull Request para o upstream

Se quiser contribuir de volta para o projeto original:

```bash
# Certifique-se de que está atualizado
git fetch upstream
git checkout master
git merge upstream/master

# Crie uma branch para o PR
git checkout -b xcode26-compatibility

# Push da branch
git push origin xcode26-compatibility
```

Depois, no GitHub:
1. Vá ao seu fork
2. Clique em **"Pull Request"**
3. Selecione sua branch `xcode26-compatibility`
4. Descreva as mudanças
5. Submeta o PR

**Nota**: O roddi pode não aceitar, pois o projeto parece estar em manutenção mínima. Seu fork independente é perfeitamente válido!

## Estrutura Final dos Remotes

```
upstream (roddi) ← você fez fork daqui
    ↓
origin (seu fork) ← você trabalha aqui
```

## Comandos Úteis

```bash
# Ver histórico de commits
git log --oneline

# Ver diferenças antes de commit
git diff

# Desfazer mudanças não commitadas
git checkout -- arquivo.txt

# Atualizar do upstream
git fetch upstream
git merge upstream/master
```

## Troubleshooting

**"authentication failed"**: Configure seu token do GitHub
```bash
# Use Personal Access Token como senha
# Ou configure SSH keys
```

**"conflict"**: Resolva manualmente e depois:
```bash
git add arquivo_resolvido
git commit
```
