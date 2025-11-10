# Guia de Limpeza para enjoyable-silicon

## Arquivos e Pastas a Remover

### Backups e Arquivos Temporários
```bash
# Arquivos .bak (backups manuais)
rm Classes/EnjoyableApplicationDelegate.m.bak
rm Classes/EnjoyableApplicationDelegate.m.bak2
rm Enjoyable.xcodeproj/project.pbxproj.bak3
rm Enjoyable.xcodeproj/project.pbxproj.bak4
rm Icon_original.icns.bak

# Pasta de backups antiga
rm -rf backups_20251023_230113

# Zip antigo (já que você tem um DMG no release/)
rm Enjoyable3.zip
```

### Scripts de Build Temporários
```bash
# Manter apenas o build_and_package.sh (o mais completo)
rm cleanup.sh
rm fix_and_build.sh
rm fix_coregraphics.sh
rm fix_icons.sh
rm fix_xcode26_simple.sh
rm setup_fork.sh
rm build.log
```

### Arquivos Específicos do Xcode (usuário-específico)
```bash
# Remover estado do usuário do Xcode
rm -rf Enjoyable.xcodeproj/project.xcworkspace/xcuserdata
```

### Arquivos do macOS
```bash
# Remover .DS_Store
find . -name ".DS_Store" -delete
```

## Script Automatizado de Limpeza

Copie e execute:

```bash
#!/bin/bash
cd /Users/pedro/git/enjoyable-roddi

echo "🧹 Limpando arquivos desnecessários..."

# Backups
rm -f Classes/EnjoyableApplicationDelegate.m.bak
rm -f Classes/EnjoyableApplicationDelegate.m.bak2
rm -f Enjoyable.xcodeproj/project.pbxproj.bak3
rm -f Enjoyable.xcodeproj/project.pbxproj.bak4
rm -f Icon_original.icns.bak
rm -rf backups_20251023_230113

# Zips antigos
rm -f Enjoyable3.zip

# Scripts temporários (manter apenas build_and_package.sh)
rm -f cleanup.sh
rm -f fix_and_build.sh
rm -f fix_coregraphics.sh
rm -f fix_icons.sh
rm -f fix_xcode26_simple.sh
rm -f setup_fork.sh
rm -f build.log

# Estado do usuário Xcode
rm -rf Enjoyable.xcodeproj/project.xcworkspace/xcuserdata

# .DS_Store
find . -name ".DS_Store" -delete

echo "✅ Limpeza concluída!"
echo ""
echo "📦 Estrutura final:"
ls -la
```

## Após a Limpeza

1. **Teste o build:**
   ```bash
   ./build_and_package.sh
   ```

2. **Atualize o .gitignore** (se necessário):
   ```gitignore
   # Xcode
   *.xcuserstate
   xcuserdata/
   
   # Build products
   build/
   DerivedData/
   
   # macOS
   .DS_Store
   
   # Backups
   *.bak
   *.bak[0-9]
   backups_*/
   
   # Logs
   *.log
   ```

3. **Commit a limpeza:**
   ```bash
   git add -A
   git commit -m "chore: cleanup temporary files and backups"
   ```
