#!/bin/bash
set -e

echo "🎮 Enjoyable - Build & Package Script"
echo "======================================"
echo ""

cd "$(dirname "$0")"

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

PROJECT_DIR="$(pwd)"
BUILD_DIR="$HOME/Library/Developer/Xcode/DerivedData"
RELEASE_DIR="$PROJECT_DIR/release"

# Verificar se o novo ícone existe
if [ ! -f "Icon_new.icns" ]; then
    echo -e "${YELLOW}⚠️  Icon_new.icns não encontrado${NC}"
    echo "   Usando o ícone atual..."
else
    echo -e "${BLUE}🎨 Substituindo ícone...${NC}"
    cp Icon.icns Icon_original.icns.bak
    cp Icon_new.icns Icon.icns
    echo -e "${GREEN}✅ Ícone atualizado${NC}"
fi

echo ""
echo -e "${BLUE}🏗️  Compilando Enjoyable (Universal Binary)...${NC}"
echo ""

if ! xcodebuild -project Enjoyable.xcodeproj \
                -scheme Enjoyable \
                -configuration Release \
                clean build \
                CODE_SIGN_IDENTITY="-" \
                CODE_SIGN_INJECT_BASE_ENTITLEMENTS=NO \
                > build.log 2>&1; then
    echo -e "${RED}❌ Build falhou!${NC}"
    echo "Veja o log: $PROJECT_DIR/build.log"
    exit 1
fi

echo -e "${GREEN}✅ Build bem-sucedido!${NC}"
echo ""

# Encontrar o .app
APP_PATH=$(find "$BUILD_DIR" -name "Enjoyable.app" -path "*/Build/Products/Release/*" -print -quit)

if [ ! -d "$APP_PATH" ]; then
    echo -e "${RED}❌ Enjoyable.app não encontrado!${NC}"
    exit 1
fi

echo -e "${BLUE}📦 App gerado:${NC} $APP_PATH"
echo ""

# Verificar arquiteturas
echo -e "${BLUE}🔍 Verificando arquiteturas...${NC}"
BINARY="$APP_PATH/Contents/MacOS/Enjoyable"
file "$BINARY"
echo ""

# Preparar diretório de release
mkdir -p "$RELEASE_DIR"
rm -rf "$RELEASE_DIR"/*

# Copiar app
cp -R "$APP_PATH" "$RELEASE_DIR/"

echo -e "${BLUE}📝 Criando README.txt para o DMG...${NC}"
cat > "$RELEASE_DIR/README.txt" << 'EOF'
Enjoyable - Game Controller Mapper
===================================

Installation:
1. Drag Enjoyable to Applications folder
2. Right-click Enjoyable and select "Open" (first time only)
3. Grant Accessibility permissions when prompted

Important:
This app is not signed with an Apple Developer certificate.
You MUST right-click and select "Open" on first launch.

Need help?
Press Command+? (⌘?) inside Enjoyable for the manual.

More info:
See the full README.md on GitHub
EOF

echo -e "${BLUE}💾 Criando DMG...${NC}"
echo ""

DMG_NAME="Enjoyable-Universal-$(date +%Y%m%d).dmg"
DMG_PATH="$RELEASE_DIR/$DMG_NAME"

# Criar DMG temporário
hdiutil create -volname "Enjoyable" \
               -srcfolder "$RELEASE_DIR/Enjoyable.app" \
               -ov -format UDRW \
               "$RELEASE_DIR/temp.dmg" > /dev/null 2>&1

# Montar DMG
MOUNT_DIR=$(hdiutil attach "$RELEASE_DIR/temp.dmg" | grep "/Volumes/Enjoyable" | awk '{print $3}')

if [ -z "$MOUNT_DIR" ]; then
    echo -e "${RED}❌ Falha ao montar DMG temporário${NC}"
    exit 1
fi

# Adicionar link simbólico para /Applications
ln -s /Applications "$MOUNT_DIR/Applications"

# Copiar README
cp "$RELEASE_DIR/README.txt" "$MOUNT_DIR/"

# Configurar aparência da janela do Finder
echo '
   tell application "Finder"
     tell disk "Enjoyable"
           open
           set current view of container window to icon view
           set toolbar visible of container window to false
           set statusbar visible of container window to false
           set the bounds of container window to {400, 100, 900, 450}
           set viewOptions to the icon view options of container window
           set arrangement of viewOptions to not arranged
           set icon size of viewOptions to 72
           set position of item "Enjoyable.app" of container window to {125, 150}
           set position of item "Applications" of container window to {375, 150}
           set position of item "README.txt" of container window to {250, 300}
           close
           open
           update without registering applications
           delay 2
     end tell
   end tell
' | osascript > /dev/null 2>&1

# Desmontar
hdiutil detach "$MOUNT_DIR" > /dev/null 2>&1

# Converter para DMG comprimido final
hdiutil convert "$RELEASE_DIR/temp.dmg" \
                -format UDZO \
                -o "$DMG_PATH" > /dev/null 2>&1

# Limpar
rm "$RELEASE_DIR/temp.dmg"
rm -rf "$RELEASE_DIR/Enjoyable.app"
rm "$RELEASE_DIR/README.txt"

echo ""
echo -e "${GREEN}🎉 Sucesso!${NC}"
echo ""
echo -e "${BLUE}📦 DMG criado:${NC}"
echo "   $DMG_PATH"
echo ""

# Informações do arquivo
DMG_SIZE=$(du -h "$DMG_PATH" | cut -f1)
echo -e "${BLUE}📊 Tamanho:${NC} $DMG_SIZE"
echo ""

echo -e "${GREEN}✨ Pronto para distribuir!${NC}"
echo ""
echo "Próximos passos:"
echo "  1. Teste o DMG: open '$DMG_PATH'"
echo "  2. Atualize o README.md com seu nome/username"
echo "  3. Faça commit e push para GitHub"
echo "  4. Crie uma Release no GitHub e anexe o DMG"
echo ""
