# Template para Release v1.0.0 no GitHub

Copie e cole este texto quando criar a release no GitHub.

---

# 🎮 Enjoyable Silicon - First Release

The first release of **Enjoyable Silicon**, a modernized version of the classic Enjoyable game controller mapper for macOS.

## ✨ What's New

### Native Apple Silicon Support
- **Universal Binary** with native ARM64 + Intel support
- No Rosetta required on Apple Silicon Macs
- Optimized performance on M1/M2/M3/M4 chips

### Modern macOS Integration
- ✅ **Dark Mode** - Full system appearance support
- ✅ **Big Sur+ Icon** - Modern rounded square design
- ✅ **Adaptive Menu Bar** - Icons adapt to light/dark menu bars
- ✅ **Xcode 26 Compatible** - Builds on latest macOS Sequoia

### Technical Improvements
- Fixed CoreGraphics API deprecations for macOS 15
- Removed forced light mode
- Updated project for modern Xcode toolchain
- Clean build with zero warnings
- Compiles successfully on Xcode 26.0/26.0.1

## 📦 Installation

### Quick Install
1. Download `Enjoyable-Universal.dmg` below
2. Open the DMG and drag Enjoyable to Applications
3. **First launch:** Right-click → Open (to bypass Gatekeeper)
4. Grant Accessibility permissions when prompted

### ⚠️ Important: Unsigned Binary

This app is **unsigned** (no Apple Developer certificate). On first launch:

**Right-click** the app → Select **"Open"** → Click **"Open"** in the dialog

Or via Terminal:
```bash
xattr -cr /Applications/Enjoyable.app
```

See the [README](https://github.com/pedroh77/enjoyable-silicon#-security-notes) for detailed security information.

## 🎮 Quick Start

1. Launch Enjoyable
2. Connect your controller (USB or Bluetooth)
3. Press a button - it will appear in the list
4. Map it to keyboard keys or mouse actions
5. Click the ▶ button to activate
6. Switch to your game and play!

## 🐛 Known Issues

- Menu bar icons may appear in wrong color until app restart after permissions grant
- Some Bluetooth controllers require pairing in System Settings before detection
- First launch may need app to be opened twice for Accessibility permissions

## 📋 System Requirements

- **macOS:** 15.0 (Sequoia) or later
- **Architecture:** Apple Silicon (ARM64) or Intel (x86_64)
- **Permissions:** Accessibility access required

## 🙏 Credits

Based on the excellent work of:
- **Joe Wreschnig** - Original Enjoyable author
- **Ruotger Deecke** - Apple Silicon support
- **Matt Millett & Sam Deane** - Additional features
- And the entire Enjoyable community

Special thanks to **databrother** for the beautiful modern icon from [macOSicons.com](https://macosicons.com).

## 💬 Support

- **Issues:** [Report bugs or request features](https://github.com/pedroh77/enjoyable-silicon/issues)
- **Documentation:** [README](https://github.com/pedroh77/enjoyable-silicon#readme)
- **Original Project:** [roddi/enjoyable](https://github.com/roddi/enjoyable)

## 📝 License

MIT License - See [LICENSE section in README](https://github.com/pedroh77/enjoyable-silicon#-credits--license) for full details.

---

**SHA-256 Checksum:** (GitHub will add this automatically)

**Enjoy your gaming! 🎮**
