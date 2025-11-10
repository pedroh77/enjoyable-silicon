# Guia: Criando o Repositório enjoyable-silicon

Este guia detalha como transformar o fork atual em um repositório independente chamado **enjoyable-silicon**.

## Por que Repositório Independente?

✅ **Vantagens:**
- Mais fácil de encontrar em buscas do GitHub
- Nome descritivo que destaca as principais features (Silicon/ARM + binários)
- Seção de Releases própria e visível
- Não compete com outros forks menos atualizados
- Você tem controle total da apresentação e branding

## Passo a Passo

### 1. Criar o Novo Repositório no GitHub

1. Vá em https://github.com/new
2. **Nome:** `enjoyable-silicon`
3. **Descrição:** `Game controller to keyboard/mouse mapper for macOS. Native Apple Silicon support, dark mode, modern UI. Xcode 26 compatible.`
4. **Público** ✅
5. **NÃO** inicialize com README, .gitignore ou license (já temos)
6. Clique em **Create repository**

### 2. Preparar o Repositório Local

```bash
cd /Users/pedro/git/enjoyable-roddi

# 1. Executar limpeza (veja CLEANUP_GUIDE.md)
./clean_for_new_repo.sh

# 2. Atualizar o remote do git
git remote -v  # Ver os remotes atuais
git remote remove origin  # Remover o remote do fork original

# 3. Adicionar o novo remote
git remote add origin https://github.com/pedroh77/enjoyable-silicon.git

# 4. Verificar
git remote -v
```

### 3. Atualizar Documentação

#### README.md
Pequenas mudanças para refletir o novo nome:

```markdown
# Enjoyable Silicon

A modern macOS application for mapping game controllers to keyboard and mouse input.  
**Native Apple Silicon (ARM64) support** with **signed releases** and **dark mode**.

[![Download](https://img.shields.io/badge/Download-Universal%20Binary-blue)](https://github.com/pedroh77/enjoyable-silicon/releases)

## Why This Fork?

While several Enjoyable forks exist, **enjoyable-silicon** is the only one offering:

✅ **Pre-built Universal Binaries** (ARM64 + Intel)  
✅ **Native Apple Silicon** - No Rosetta required  
✅ **Xcode 26 Compatible** - Builds on latest macOS Sequoia  
✅ **Modern UI** - Dark mode support, Big Sur+ style icons  
✅ **Maintained** - Regular updates and bug fixes

---

[resto do README atual...]
```

#### GIT_GUIDE.md
Atualizar qualquer referência ao repositório:

```bash
# Antes:
git clone https://github.com/roddi/enjoyable.git

# Depois:
git clone https://github.com/pedroh77/enjoyable-silicon.git
```

### 4. Preparar o .gitignore

```bash
cat > .gitignore << 'EOF'
# Xcode
*.xcuserstate
*.xcuserdatad
xcuserdata/
project.xcworkspace/xcuserdata/

# Build products
build/
DerivedData/
*.app
*.dSYM.zip
*.dSYM

# macOS
.DS_Store
.AppleDouble
.LSOverride

# Backups
*.bak
*.bak[0-9]
backups_*/

# Logs
*.log

# Release artifacts (manter apenas na pasta release/)
/*.dmg
/*.zip
EOF
```

### 5. Fazer Push Inicial

```bash
# Garantir que está na branch principal
git branch -M main

# Fazer o primeiro push
git push -u origin main

# Se houver tags locais antigas, remova antes:
git tag -d $(git tag -l)

# Crie uma tag para a versão atual
git tag -a v1.0.0 -m "Initial release: Enjoyable Silicon v1.0.0"
git push origin v1.0.0
```

### 6. Criar a Release no GitHub

1. Vá em `https://github.com/pedroh77/enjoyable-silicon/releases/new`
2. **Tag:** `v1.0.0` (usar a tag que acabamos de criar)
3. **Release title:** `v1.0.0 - Initial Release`
4. **Descrição:**

```markdown
# 🎮 Enjoyable Silicon - First Release

The first release of **Enjoyable Silicon**, a modernized version of the classic Enjoyable game controller mapper.

## ✨ What's New

### Native Apple Silicon Support
- **Universal Binary** with native ARM64 + Intel support
- No Rosetta required on Apple Silicon Macs
- Optimized performance on M1/M2/M3 chips

### Modern macOS Integration
- ✅ **Dark Mode** - Full system appearance support
- ✅ **Big Sur+ Icon** - Modern rounded square design
- ✅ **Adaptive Menu Bar** - Icons adapt to light/dark menu bars
- ✅ **Xcode 26 Compatible** - Builds on latest macOS Sequoia

### Technical Improvements
- Fixed CoreGraphics API deprecations
- Removed forced light mode
- Updated project for modern Xcode toolchain
- Clean build with zero warnings

## 📦 Installation

1. Download `Enjoyable-Universal.dmg` below
2. Open the DMG and drag Enjoyable to Applications
3. **First launch:** Right-click → Open (to bypass Gatekeeper)
4. Grant Accessibility permissions when prompted

## ⚠️ Important Notes

- This app is **unsigned** (no Apple Developer certificate)
- macOS will require you to explicitly allow it on first launch
- See the [README](https://github.com/pedroh77/enjoyable-silicon) for detailed instructions

## 🙏 Credits

Based on the excellent work of:
- Joe Wreschnig (original Enjoyable)
- Ruotger Deecke (Apple Silicon support)
- And the entire Enjoyable community

## 📝 License

MIT License - See [LICENSE](https://github.com/pedroh77/enjoyable-silicon/blob/main/README.md#license) for details
```

5. **Anexar o arquivo:** Faça upload do `release/Enjoyable-Universal-20251025.dmg`
6. **Renomear o arquivo para:** `Enjoyable-Universal.dmg` (remover a data)
7. Marque como **Latest release**
8. Clique em **Publish release**

### 7. Atualizar Link no README

Edite o README.md para apontar para a release real:

```markdown
**[Download Enjoyable-Universal.dmg](https://github.com/pedroh77/enjoyable-silicon/releases/latest/download/Enjoyable-Universal.dmg)** (ARM64 + Intel)
```

Commit e push:
```bash
git add README.md
git commit -m "docs: update download link to GitHub releases"
git push
```

### 8. Configurar o Repositório no GitHub

Na página do repositório, vá em **Settings**:

#### About (lado direito)
- **Website:** `https://github.com/pedroh77/enjoyable-silicon/releases`
- **Topics:** `macos`, `game-controller`, `apple-silicon`, `arm64`, `joystick`, `gamepad`, `input-mapper`
- **Description:** `Game controller to keyboard/mouse mapper for macOS. Native Apple Silicon support, dark mode, modern UI.`

#### Features
- ✅ Wikis (desabilitado, a menos que queira usar)
- ✅ Issues (habilitado)
- ✅ Projects (desabilitado, a menos que queira usar)
- ✅ Discussions (opcional - pode ser útil para suporte da comunidade)

### 9. Adicionar Badges ao README (Opcional)

No topo do README.md:

```markdown
# Enjoyable Silicon

[![Platform](https://img.shields.io/badge/platform-macOS%2015%2B-blue)](https://github.com/pedroh77/enjoyable-silicon)
[![Architecture](https://img.shields.io/badge/arch-ARM64%20|%20Intel-green)](https://github.com/pedroh77/enjoyable-silicon/releases)
[![License](https://img.shields.io/badge/license-MIT-orange)](https://github.com/pedroh77/enjoyable-silicon#license)
[![Download](https://img.shields.io/github/downloads/pedroh77/enjoyable-silicon/total)](https://github.com/pedroh77/enjoyable-silicon/releases)
```

## 10. Divulgação (Opcional)

Para ajudar outros usuários a encontrar o projeto:

### Reddit
- r/macgaming
- r/MacApps
- r/AppleSilicon

**Post sugerido:**
```
[Release] Enjoyable Silicon - Game Controller Mapper with Native Apple Silicon Support

After years of the original Enjoyable project being unmaintained, I've created 
a modernized fork with:

• Native Apple Silicon (ARM64) support
• Pre-built universal binaries (no need to build from source!)
• Dark mode support
• Modern Big Sur+ UI
• Xcode 26 compatible

Perfect if you want to use your game controller in games that don't support 
gamepads natively.

GitHub: https://github.com/pedroh77/enjoyable-silicon
Download: [link to release]
```

### MacRumors Forums
- macOS Apps forum

### Hacker News (se ganhar tração)
- "Show HN: Enjoyable Silicon - Native Apple Silicon game controller mapper"

## ✅ Checklist Final

Antes de considerar concluído:

- [ ] Limpeza executada (sem .bak, sem scripts temporários)
- [ ] README.md atualizado com novo nome e links
- [ ] .gitignore configurado
- [ ] Remote git apontando para novo repo
- [ ] Push inicial feito
- [ ] Tag v1.0.0 criada e pushed
- [ ] Release criada no GitHub com DMG anexado
- [ ] Link de download no README funciona
- [ ] Configurações do repo (About, Topics) preenchidas
- [ ] Testado o download e instalação do DMG

## Próximos Passos

1. **Monitorar Issues** - Responder dúvidas de usuários
2. **Considerar CI/CD** - GitHub Actions para builds automáticos
3. **Versões Futuras** - Incrementar features e corrigir bugs
4. **Documentação** - Expandir wiki se necessário

---

**Dúvidas?** Verifique:
- CLEANUP_GUIDE.md - Como limpar a pasta
- GIT_GUIDE.md - Comandos git básicos
- README.md - Documentação do projeto
