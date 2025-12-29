## Extera 25.1.1
- Added context menu for messages. Now, when selecting a single message, a context menu will appear. Multi-selection is still available.
- Added timestamp and message status icon in message bubbles.
- Removed "seen by" row in favour of context menu and status icons.
- Always use foreground service for calls.
- Slide to answer/reject call on mobile.
- Custom privacy settings per room.
- Add ringtone "Homebase"
- Ringtone and calling sounds on Linux

## Extera 25.1.0
- Brought back calls. Just enable "Experimental video calls" and press that phone button in a chat - calls will probably work.
- Fixed screen sharing in calls. Screen sharing now works, the problem was the foreground service missing MEDIA_PROJECTION flag.
- Incoming calls will now use system ringtone.
- Added the "Seen by" dialog. Now you can see the whole exact list of users, who got the message.
- Redesigned user profile view. It is now a whole page and gives more information like mutual rooms.
- Added "About yourself" field. Tell the world about yourself, but remember to fit that only in 256 characters!
- (Probably) Fix video being stuck playing in background.
- An option to not send an image, if EXIF metadata has failed to clean. It was always on, but now an option.
- A new revamped UX for room emote settings, same as in FluffyChat.
- Optimise mxc_image. Removed AnimatedSwitcher from that file, I don't know what could happen, but it seems to reduce amount of widget updates.
- Removed some unnecessary emojis in translations (English and Russian).
- Added truncation of threads' latest message preview. No more thread previews larger than the root message itself.
- Remove CupertinoActivityIndicator from most parts. Now you won't see a loading indicator from iOS while using Android!
- Unsupported HTML tags are now rendered as plain text, instead of just being hidden!
- Bottom navigation bar instead of chat filter pills.
- Copy link action. Now, you can copy links to messages.
- Introducing background downloads on Linux! The `/sdcard/Download/Extera` directory, which is exclusive to Android, was hard-coded the whole time. Now it's picking various directories, depending on the platform. (Android and Linux supported only)
- Now you need to hit enter to start a global search - no more query leaking.
- Fixed rendering poll events, which were redacted. No more large yellow tiles.
- Fixed encryption key backup GUI: now the button has linear progress bar in it instead of circular, like in most parts of the app.
- Fixed poll events not being parsed properly on another clients. The problem was incorrect `kind` parameter.
- Update poll results when a new response was sent.
- Use download icon instead of share icon when selecting a message.
- Do not show "Block" action on group rooms.
- Hide translation button in encrypted rooms instead of displaying a long message, explaining why this feature does not work there.
- Optimise invitation selection view. It no longer requests all users' profiles.
...and some internal work :)

## Extera 2.1.0
- Introduce threads
- Add support for restricted join rule
- Improved UX for spaces
- fix: Create a subdirectory in the tmp directory