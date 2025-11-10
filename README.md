# Enjoyable Silicon

A modern macOS application for mapping game controllers to keyboard and mouse input.  
**Native Apple Silicon (ARM64) support** with **universal binaries** and **dark mode**.

[![Platform](https://img.shields.io/badge/platform-macOS%2015%2B-blue)](https://github.com/pedroh77/enjoyable-silicon)
[![Architecture](https://img.shields.io/badge/arch-ARM64%20|%20Intel-green)](https://github.com/pedroh77/enjoyable-silicon/releases)
[![License](https://img.shields.io/badge/license-MIT-orange)](https://github.com/pedroh77/enjoyable-silicon#license)

---

## Why This Fork?

While several Enjoyable forks exist, **enjoyable-silicon** is the only one offering:

✅ **Pre-built Universal Binaries** (ARM64 + Intel)  
✅ **Native Apple Silicon** - No Rosetta required  
✅ **Xcode 26 Compatible** - Builds on latest macOS Sequoia  
✅ **Modern UI** - Dark mode support, Big Sur+ style icons  
✅ **Maintained** - Regular updates and bug fixes  

## What is Enjoyable?

Enjoyable is a macOS application that allows you to use game controllers (joysticks, gamepads) as keyboard and mouse input. Perfect for games that don't support controllers natively.

---

## 📦 Download & Installation

### Pre-built Binary (Recommended)

**[Download Enjoyable-Universal.dmg](https://github.com/pedroh77/enjoyable-silicon/releases/latest/download/Enjoyable-Universal.dmg)** (ARM64 + Intel)

1. Download and open the DMG
2. Drag Enjoyable to Applications
3. **Right-click** Enjoyable and select **"Open"** (first time only)
4. Grant Accessibility permissions when prompted

> ⚠️ **Note:** This app is unsigned (no Apple Developer certificate). See [Security Notes](#-security-notes) below.

### Building from Source

Requirements:
- Xcode 26.0 or later
- macOS 15.0+ SDK

```bash
git clone https://github.com/pedroh77/enjoyable-silicon.git
cd enjoyable-silicon
xcodebuild -project Enjoyable.xcodeproj -scheme Enjoyable -configuration Release

# Or use the build script:
./build_and_package.sh
```

---

## 🎮 Quick Start

1. **Launch Enjoyable** from Applications
2. **Connect your controller** (USB or Bluetooth)
3. **Press a button** on your controller - it will appear in the list
4. **Map it** to a keyboard key or mouse action
5. Click the **▶ button** in the toolbar to activate
6. **Switch to your game** and start playing!

For detailed instructions, press **⌘?** in Enjoyable to open the built-in manual.

---

## ✨ What's New in This Fork

### Technical Improvements
- ✅ **Xcode 26 Compatibility**: Fixed compilation errors with macOS 15 SDK (CoreGraphics headers)
- ✅ **Universal Binary**: Native support for both Apple Silicon (ARM64) and Intel (x86_64)
- ✅ **Dark Mode Support**: Full system appearance integration (removed forced light mode)
- ✅ **Adaptive Menu Bar Icon**: Icons now properly adapt to light/dark menu bars using template mode

### Visual Improvements
- ✅ **Modern App Icon**: High-resolution icon following Big Sur+ design language
  - Based on the original Tango icon set (public domain)
  - Modernized version from [macOSicons.com](https://macosicons.com)
  - Uploaded by user "databrother" on 24/06/2025
  - Thanks to databrother for making this beautiful icon available!

---

## 🔒 Security Notes

### Why is the app unsigned?

Creating signed macOS apps requires an **Apple Developer Program** membership ($99/year). Since this is a free, open-source project, the binary is **unsigned**.

### First Launch Instructions

macOS Gatekeeper will block unsigned apps by default. To run Enjoyable:

**Method 1: Right-click Open**
1. **Right-click** (or Control-click) on Enjoyable.app
2. Select **"Open"**
3. Click **"Open"** in the security dialog

**Method 2: Terminal Command**
```bash
xattr -cr /Applications/Enjoyable.app
```

**Method 3: System Settings**
1. Try to open Enjoyable normally
2. Go to **System Settings** → **Privacy & Security**
3. Click **"Open Anyway"** next to the Enjoyable warning

### Accessibility Permissions

Enjoyable needs **Accessibility** permissions to simulate keyboard/mouse input.

**If not prompted automatically:**
1. Open **System Settings** → **Privacy & Security** → **Accessibility**
2. Click the **(+)** button
3. Navigate to and select **Enjoyable.app**
4. Enable the checkbox

### Self-Signing (Optional)

For a smoother experience, you can create an ad-hoc signature yourself:

```bash
codesign --force --deep --sign - /Applications/Enjoyable.app
```

This creates a local signature that macOS will trust on your specific Mac.

---

## 🐛 Known Issues

- Menu bar icons may appear in the wrong color until you restart the app after granting permissions
- Some Bluetooth controllers may require pairing via System Settings before Enjoyable can detect them
- On first launch, you may need to open the app twice for Accessibility permissions to take effect

---

## 🛠️ Development

### Project Structure

```
enjoyable-silicon/
├── Classes/              # Core application classes
├── Categories/           # Objective-C category extensions
├── Resources/            # Icons, UI files, Help documentation
├── Other Sources/        # Precompiled headers, main.m
├── Enjoyable.xcodeproj/  # Xcode project file
└── build_and_package.sh  # Build and packaging script
```

### Building

```bash
# Debug build
xcodebuild -project Enjoyable.xcodeproj \
           -scheme Enjoyable \
           -configuration Debug

# Release build with packaging
./build_and_package.sh
```

### Contributing

Pull requests are welcome! Please ensure:
- Code compiles on **Xcode 26+**
- Maintains **Universal Binary** support (ARM64 + Intel)
- Follows existing code style
- Includes appropriate comments for complex logic

---

## 📜 Credits & License

### This Fork
Modernizations, Apple Silicon optimization, and Xcode 26 compatibility by **Pedro Albuquerque** (pedroh77)

### Original Authors
- **Joe Wreschnig** - Original Enjoyable author
- **Ruotger Deecke** (roddi) - Apple Silicon support fork
- **Matt Millett** - Additional features
- **Sam Deane** - Contributions
- Based on **Enjoy** by Yifeng Huang and Sam McCall

### Icon Credits
- **Original icon:** Tango icon set (public domain)
- **Modernized version:** From [macOSicons.com](https://macosicons.com)
- **Uploaded by:** "databrother" (24/06/2025)
- **Formatted for:** Big Sur+ design language

### License

Copyright 2025 Pedro Albuquerque  
Copyright 2020 Matt Millett, Ruotger Deecke  
Copyright 2013 Joe Wreschnig  
Copyright 2012 Yifeng Huang  
Copyright 2009 Sam McCall, University of Otago

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

## 🔗 Links

- **Releases**: [Download latest version](https://github.com/pedroh77/enjoyable-silicon/releases)
- **Issues**: [Report bugs or request features](https://github.com/pedroh77/enjoyable-silicon/issues)
- **Original Project**: [roddi/enjoyable](https://github.com/roddi/enjoyable)

---

## ❓ FAQ

### Why create a separate repository instead of a fork?

Forks on GitHub are hard to discover in search results. By creating an independent repository with a descriptive name (**enjoyable-silicon**), users can more easily find a version that:
- Provides ready-to-use binaries
- Has native Apple Silicon support
- Features a modern, maintained codebase

### Will this work on older macOS versions?

This build targets **macOS 15 (Sequoia)** and later. For older systems, you may need to build from source with an older Xcode version, or use one of the original Enjoyable versions.

### Can I use this with any game?

Yes! Enjoyable works system-wide. It translates controller input to keyboard/mouse events at the OS level, so it works with any application - games, emulators, creative software, etc.

### My controller isn't detected. What should I do?

1. **USB controllers**: Try a different USB port
2. **Bluetooth controllers**: Pair via System Settings first
3. **Check compatibility**: Some controllers may need additional drivers
4. **Console controllers**: PS4/PS5/Xbox controllers work great!

### Does this support multiple controllers?

Yes! You can connect and map multiple controllers simultaneously.

---

**Enjoy your gaming! 🎮**
