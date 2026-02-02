# Extera Next
Extera Next is another generation of Extera, made on top of FluffyChat.

# Features

- Send all kinds of messages, images and files
- Voice messages
- Location sharing
- Push notifications
- Unlimited private and public group chats
- Public channels with thousands of participants
- Feature rich group moderation including all matrix features
- Discover and join public groups
- Dark & AMOLED mode
- Material You design
- Custom emotes and stickers
- Spaces
- Compatible with Element, Nheko, NeoChat and all other Matrix apps
- End to end encryption
- Encrypted chat backup
- Emoji verification & cross signing
- **Things exclusive to Extera (compared to FluffyChat)**
- Built-in message translation
- "About" field in profiles
- Updated profile design with a list of mutual rooms
- Redacted message recovery for Synapse admins (might be removed)
- Probably working calls

... and much more. (actually no)


# Build
**Do this if I forgot to edit pubspec.yaml**
To build, make sure you have [matrix-dart-sdk](https://git.extera.xyz/OfficialDakari/matrix-dart-sdk) in the same directory as Extera Next.

Or, replace `matrix` in pubspec.yaml:
```yaml
matrix:
    git:
        url: https://git.extera.xyz/OfficialDakari/matrix-dart-sdk.git
        ref: main
```