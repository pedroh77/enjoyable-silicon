#!/bin/bash

# Script de Limpeza para enjoyable-silicon
# Remove arquivos temporários e prepara o repositório para publicação

set -e  # Para na primeira falha

cd "$(dirname "$0")"

echo "🧹 Enjoyable Silicon - Limpeza de Repositório"
echo "=============================================="
echo ""

# Função para contar arquivos antes e depois
count_files() {
    find . -type f | wc -l | xargs
}

BEFORE=$(count_files)

echo "📊 Arquivos antes da limpeza: $BEFORE"
echo ""

# 1. Backups e arquivos .bak
echo "🗑️  Removendo backups (.bak)..."
rm -f Classes/EnjoyableApplicationDelegate.m.bak
rm -f Classes/EnjoyableApplicationDelegate.m.bak2
rm -f Enjoyable.xcodeproj/project.pbxproj.bak3
rm -f Enjoyable.xcodeproj/project.pbxproj.bak4
rm -f Icon_original.icns.bak

# 2. Pasta de backups antiga
echo "🗑️  Removendo pasta de backups antiga..."
rm -rf backups_20251023_230113

# 3. Zips antigos
echo "🗑️  Removendo arquivos zip temporários..."
rm -f Enjoyable3.zip

# 4. Scripts temporários (manter apenas build_and_package.sh)
echo "🗑️  Removendo scripts temporários de desenvolvimento..."
rm -f cleanup.sh
rm -f fix_and_build.sh
rm -f fix_coregraphics.sh
rm -f fix_icons.sh
rm -f fix_xcode26_simple.sh
rm -f setup_fork.sh
rm -f build.log

# 5. Estado do usuário Xcode
echo "🗑️  Removendo estado do usuário do Xcode..."
rm -rf Enjoyable.xcodeproj/project.xcworkspace/xcuserdata

# 6. .DS_Store (macOS)
echo "🗑️  Removendo arquivos .DS_Store..."
find . -name ".DS_Store" -delete

# 7. Remover os próprios guias após uso (opcional)
# Descomente se quiser remover os guias também:
# rm -f CLEANUP_GUIDE.md
# rm -f NEW_REPO_GUIDE.md
# rm -f clean_for_new_repo.sh

AFTER=$(count_files)
REMOVED=$((BEFORE - AFTER))

echo ""
echo "✅ Limpeza concluída!"
echo "📊 Arquivos depois: $AFTER"
echo "🗑️  Arquivos removidos: $REMOVED"
echo ""

# Verificar se há arquivos pendentes no git
if git diff --quiet && git diff --cached --quiet; then
    echo "✅ Nenhuma mudança pendente no Git"
else
    echo "⚠️  Há mudanças pendentes no Git:"
    echo ""
    git status --short
    echo ""
    echo "Para commitar:"
    echo "  git add -A"
    echo "  git commit -m 'chore: cleanup repository for new fork'"
fi

echo ""
echo "📝 Próximos passos:"
echo "   1. Revise: ls -la"
echo "   2. Teste o build: ./build_and_package.sh"
echo "   3. Veja NEW_REPO_GUIDE.md para criar o repositório"
