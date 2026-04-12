# Extera Next

A feature-rich Matrix client for mobile and desktop platforms built on [FluffyChat](https://github.com/krille-chan/fluffychat). Extera Next extends FluffyChat with additional features and improvements.

## Features

### Core Messaging
- Send all kinds of messages, images, and files
- Voice messages
- Location sharing
- Message translation (built-in)
- Unlimited private and public group chats
- Public channels with thousands of participants

### Security & Privacy
- End-to-end encryption
- Encrypted chat backup
- Emoji verification & cross-signing
- Compatible with Element, Nheko, NeoChat, and all other Matrix clients

### UI & Design
- Dark & AMOLED modes
- Material You design
- Custom emotes and stickers
- Spaces support
- Push notifications

### Moderation & Administration
- Feature-rich group moderation (all Matrix features)
- Discover and join public groups
- Redacted message recovery (for Synapse admins)

### Extera Next Exclusives
- Built-in message translation
- "About" field in user profiles
- Enhanced profile design with mutual rooms list
- 1:1 voice/video call support

## Prerequisites

Before building, ensure you have:
- Flutter SDK installed
- The [matrix-dart-sdk](https://github.com/ExteraApp/matrix-dart-sdk) in the same directory as Extera Next

## Building

### Setup

The `matrix` dependency can be configured in two ways:

**Option 1: Directory-based (Recommended for development)**
Ensure `matrix-dart-sdk` is cloned in the same parent directory:
```
parent-directory/
├── ExteraNext/
└── matrix-dart-sdk/
```

**Option 2: Git reference**
Update `pubspec.yaml`:
```yaml
matrix:
  git:
    url: https://github.com/ExteraApp/matrix-dart-sdk.git
    ref: main
```

### GitHub Actions Builds

Pre-built release APKs are generated via GitHub Actions. **Note:** The automated Android release build currently produces an **`arm64-v8a` APK only**. If your device uses a different architecture (e.g., `armeabi-v7a` or `x86_64`), you will need to build the app locally with the appropriate `--target-platform` flag.

### Build Commands

Platform-specific build scripts are available in the `scripts/` directory:
- `./scripts/build-macos.sh` - macOS
- `./scripts/build-windows.ps1` - Windows
- `./scripts/build-ios.sh` - iOS
- `./scripts/build-appimage.sh` - AppImage (Linux)
- `./scripts/build-linux.sh` - Linux (Run only after build-appimage.sh)

## License

This project is licensed under the [AGPL-3.0 License](LICENSE). See the LICENSE file for details.

## Resources

- [Matrix.org](https://matrix.org/) - The Matrix protocol specification
- [FluffyChat](https://github.com/krille-chan/fluffychat) - The original FluffyChat project
- [matrix-dart-sdk](https://github.com/ExteraApp/matrix-dart-sdk) - Dart SDK for Matrix