# Privacy Policy for Plusly

**Plusly** is a Matrix client developed by Daan D.

## Contact

For privacy concerns, contact us at: **danielplusly@gmail.com**

## About Plusly

Plusly is a fork of [FluffyChat](https://fluffychat.im). Plusly builds on FluffyChat's features with additional enhancements.

## Data Handling

Plusly is a Matrix client. This means Plusly is just a client that connects to Matrix servers. The data protection agreement of the server you choose to use applies.

For convenience, `plusly.im` is set as the default server. We do not guarantee the trustworthiness of this server. Before your first communication, you will be informed which server you are connecting to.

Plusly communicates with:
- Your selected Matrix server
- [OpenStreetMap](https://www.openstreetmap.org) for displaying maps

## Data Storage

Plusly caches data received from the server in a local SQLite database on your device. On web, IndexedDB is used. Plusly encrypts the database using SQLCipher and stores the encryption key in the secure storage of your device.

## Encryption

All communication between Plusly and servers uses transport encryption. Plusly also supports End-to-End Encryption using libvodozemac, enabled by default for private chats.

## App Permissions

Plusly needs the following permissions:

- **Internet access** - to communicate with Matrix servers
- **Vibration** - for local notifications
- **Microphone** - for voice messages
- **Storage** - to save and send files
- **Location** - if you choose to share your location in chats

## Push Notifications

Plusly uses Firebase Cloud Messaging (FCM) for push notifications on Android. The push notification process:

1. Your Matrix server sends a push notification to the Plusly Push Gateway
2. The Push Gateway forwards it to Firebase Cloud Messaging
3. Firebase delivers it to your device when you're offline

A typical push notification contains:
- Event ID
- Room ID  
- Unread count
- Device information

Plusly uses `event_id_only` format to minimize data sent.

If FCM is unavailable, Plusly may use UnifiedPush as an alternative.

## Child Safety

Plusly is committed to a safe environment for all users. Plusly enables users to report inappropriate content to server administrators. To report a message, long-press it and select "Report".

## Your Rights

As a user, you have the right to:
- Know what data Plusly stores
- Delete your Plusly app data (uninstall removes all local data)
- Choose your Matrix server

## Changes to This Policy

We may update this privacy policy. Any changes will be posted on this page.

## Last Updated

April 2026
