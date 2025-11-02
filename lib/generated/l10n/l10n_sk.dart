// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class L10nSk extends L10n {
  L10nSk([String locale = 'sk']) : super(locale);

  @override
  String get noSendPermission => 'You can\'t send messages here';

  @override
  String get noMessagesYet => 'No messages yet';

  @override
  String get longPressToRecordVoiceMessage =>
      'Long press to record voice message.';

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Resume';

  @override
  String get endPoll => 'End poll';

  @override
  String get anonymousPoll => 'Anonymous';

  @override
  String get publicPoll => 'Public';

  @override
  String get endedPoll => 'Ended';

  @override
  String get activePoll => 'Active';

  @override
  String get singleChoice => 'Single choice';

  @override
  String get multipleChoice => 'Multiple choice';

  @override
  String get vote => 'Vote';

  @override
  String get changeVote => 'Re-vote';

  @override
  String choicesSelected(int selected, int max) {
    return '$selected of $max selected';
  }

  @override
  String get discuss => 'Discuss';

  @override
  String get pollType => 'Poll type';

  @override
  String get question => 'Question';

  @override
  String get answer => 'Answer';

  @override
  String get addAnswer => 'Add answer';

  @override
  String get pleaseEnterQuestion => 'Please enter a question';

  @override
  String get atLeastTwoAnswersRequired => 'At least two answers are required';

  @override
  String get maxSelections => 'Max selections';

  @override
  String get createPoll => 'Create poll';

  @override
  String get alwaysUse24HourFormat => 'false';

  @override
  String get cleanExif => 'Clean EXIF metadata';

  @override
  String get cleanExifDescription =>
      'Remove EXIF metadata (camera model, geolocation, time) when sending a photo.';

  @override
  String get repeatPassword => 'Zopakujte heslo';

  @override
  String get notAnImage => 'Not an image file.';

  @override
  String get setCustomPermissionLevel => 'Set custom permission level';

  @override
  String get setPermissionsLevelDescription =>
      'Please choose a predefined role below or enter a custom permission level between 0 and 100.';

  @override
  String get ignoreUser => 'Ignore user';

  @override
  String get normalUser => 'Normal user';

  @override
  String get pinCode => 'PIN code';

  @override
  String get displayNavigationRail => 'Display navigation rail on mobile';

  @override
  String get enableGradient => 'Enable bubble background gradient';

  @override
  String get translationDisabledInE2e =>
      'Cloud translation is disabled in encrypted rooms to preserve privacy. Select specific words and use system context menu to translate with apps that support it.';

  @override
  String get remove => 'Odstrániť';

  @override
  String get importNow => 'Importovať teraz';

  @override
  String get importEmojis => 'Import Emojis';

  @override
  String get importFromZipFile => 'Import from .zip file';

  @override
  String get exportEmotePack => 'Export Emote pack as .zip';

  @override
  String get replace => 'Replace';

  @override
  String get about => 'O aplikácii';

  @override
  String aboutHomeserver(String homeserver) {
    return 'About $homeserver';
  }

  @override
  String get accept => 'Prijať';

  @override
  String acceptedTheInvitation(String username) {
    return '$username prijali pozvánku';
  }

  @override
  String get account => 'Účet';

  @override
  String activatedEndToEndEncryption(String username) {
    return '$username aktivovali koncové šifrovanie';
  }

  @override
  String get addEmail => 'Pridať email';

  @override
  String get confirmMatrixId =>
      'Please confirm your Matrix ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'This should be $mxid';
  }

  @override
  String get addChatDescription => 'Add a chat description...';

  @override
  String get addToSpace => 'Pridať do priestoru';

  @override
  String get admin => 'Administrátor';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Všetky';

  @override
  String get allChats => 'Všetky chaty';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'Send some googly eyes';

  @override
  String get commandHint_cuddle => 'Send a cuddle';

  @override
  String get commandHint_hug => 'Send a hug';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName sends you googly eyes';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName cuddles you';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName hugs you';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName prevzal hovor';
  }

  @override
  String get anyoneCanJoin => 'Ktokoľvek sa môže pripojiť';

  @override
  String get appLock => 'Uzamknutie aplikácie';

  @override
  String get appLockDescription =>
      'Lock the app when not using with a pin code';

  @override
  String get archive => 'Archivovať';

  @override
  String get areGuestsAllowedToJoin => 'Môžu sa pripojiť hostia';

  @override
  String get areYouSure => 'Ste si istí?';

  @override
  String get areYouSureYouWantToLogout => 'Ste si istí, že sa chcete odhlásiť?';

  @override
  String get askSSSSSign =>
      'Na overenie tejto osoby, prosím zadajte prístupovu frázu k \"bezpečému úložisku\" alebo \"klúč na obnovu\".';

  @override
  String askVerificationRequest(String username) {
    return 'Akcepovať žiadosť o verifikáciu od $username?';
  }

  @override
  String get autoplayImages =>
      'Automatically play animated stickers and emotes';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Server podporuje tieto typy prihlásenia:\n$serverVersions\nAle táto aplikácia podporuje iba:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Send typing notifications';

  @override
  String get swipeRightToLeftToReply => 'Swipe right to left to reply';

  @override
  String get sendOnEnter => 'Odoslať pri vstupe';

  @override
  String badServerVersionsException(String serverVersions,
      String supportedVersions, Object serverVerions, Object suportedVersions) {
    return 'Domovský server podporuje verzie špecifikácie:\n$serverVersions\nAle táto aplikácie podporuje iba $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats chats and $participants participants';
  }

  @override
  String get noMoreChatsFound => 'No more chats found...';

  @override
  String get noChatsFoundHere =>
      'No chats found here yet. Start a new chat with someone by using the button below. ⤵️';

  @override
  String get joinedChats => 'Joined chats';

  @override
  String get unread => 'Unread';

  @override
  String get space => 'Space';

  @override
  String get spaces => 'Spaces';

  @override
  String get banFromChat => 'Zabanovať z chatu';

  @override
  String get banned => 'Zabanovaný';

  @override
  String bannedUser(String username, String targetName) {
    return '$username zabanoval $targetName';
  }

  @override
  String get blockDevice => 'Zakázať zariadenie';

  @override
  String get blocked => 'Blocked';

  @override
  String get botMessages => 'Bot messages';

  @override
  String get cancel => 'Zrušiť';

  @override
  String cantOpenUri(String uri) {
    return 'Nemožno otvoriť identifikátor prostriedku $uri';
  }

  @override
  String get changeDeviceName => 'Zmeniť názov zariadenia';

  @override
  String changedTheChatAvatar(String username) {
    return '$username si zmenili svôj avatar';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username zmenili popis chatu na: „$description“';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username zmenili meno chatu na: „$chatname“';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username zmenili nastavenie oprávnení chatu';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username si zmenili prezývku na: $displayname';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username zmenili prístupové práva pre hosťov';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username zmenili prístupové práva pro hosťov na: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username zmenili nastavenie viditelnosti histórie chatu';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username zmenili nastavenie viditelnosti histórie chatu na: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username zmenili nastavenie pravidiel pripojenia';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username zmenili nastavenie pravidiel pripojenia na: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username si zmenili profilový obrázok';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username zmenili nastavenie aliasov chatu';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username zmenili odkaz k pozvánke do miestnosti';
  }

  @override
  String get changePassword => 'Zmeniť heslo';

  @override
  String get changeTheHomeserver => 'Zmeniť použitý server';

  @override
  String get changeTheme => 'Zmena štýlu';

  @override
  String get changeTheNameOfTheGroup => 'Zmeniť názov skupiny';

  @override
  String get changeYourAvatar => 'Change your avatar';

  @override
  String get channelCorruptedDecryptError => 'Šifrovanie bolo poškodené';

  @override
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Záloha vašich chatov bola nastavená.';

  @override
  String get chatBackup => 'Záloha chatov';

  @override
  String get chatBackupDescription =>
      'Your old messages are secured with a recovery key. Please make sure you don\'t lose it.';

  @override
  String get chatDetails => 'Podrobnosti o chate';

  @override
  String get chatHasBeenAddedToThisSpace => 'Chat has been added to this space';

  @override
  String get chats => 'Čety';

  @override
  String get chooseAStrongPassword => 'Vyberte si silné heslo';

  @override
  String get clearArchive => 'Clear archive';

  @override
  String get close => 'Zavrieť';

  @override
  String get commandHint_markasdm =>
      'Mark as direct message room for the giving Matrix ID';

  @override
  String get commandHint_markasgroup => 'Mark as group';

  @override
  String get commandHint_ban => 'Ban the given user from this room';

  @override
  String get commandHint_clearcache => 'Clear cache';

  @override
  String get commandHint_create =>
      'Create an empty group chat\nUse --no-encryption to disable encryption';

  @override
  String get commandHint_discardsession => 'Discard session';

  @override
  String get commandHint_dm =>
      'Start a direct chat\nUse --no-encryption to disable encryption';

  @override
  String get commandHint_html => 'Send HTML-formatted text';

  @override
  String get commandHint_invite => 'Invite the given user to this room';

  @override
  String get commandHint_join => 'Join the given room';

  @override
  String get commandHint_kick => 'Remove the given user from this room';

  @override
  String get commandHint_leave => 'Leave this room';

  @override
  String get commandHint_me => 'Describe yourself';

  @override
  String get commandHint_myroomavatar =>
      'Set your picture for this room (by mxc-uri)';

  @override
  String get commandHint_myroomnick => 'Set your display name for this room';

  @override
  String get commandHint_op =>
      'Set the given user\'s power level (default: 50)';

  @override
  String get commandHint_plain => 'Send unformatted text';

  @override
  String get commandHint_react => 'Send reply as a reaction';

  @override
  String get commandHint_send => 'Send text';

  @override
  String get commandHint_unban => 'Unban the given user from this room';

  @override
  String get commandInvalid => 'Command invalid';

  @override
  String commandMissing(String command) {
    return '$command is not a command.';
  }

  @override
  String get compareEmojiMatch =>
      'Porovnajte a uistite sa, že nasledujúce emotikony sa zhodujú na oboch zariadeniach:';

  @override
  String get compareNumbersMatch =>
      'Porovnajte a uistite sa, že nasledujúce čísla sa zhodujú na oboch zariadeniach:';

  @override
  String get configureChat => 'Configure chat';

  @override
  String get confirm => 'Potvrdiť';

  @override
  String get connect => 'Pripojiť';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontakt bol pozvaný do skupiny';

  @override
  String get containsDisplayName => 'Contains display name';

  @override
  String get containsUserName => 'Contains username';

  @override
  String get contentHasBeenReported =>
      'The content has been reported to the server admins';

  @override
  String get copiedToClipboard => 'Skopírované do schránky';

  @override
  String get copy => 'Kopírovať';

  @override
  String get copyToClipboard => 'Copy to clipboard';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nebolo možné dešifrovať správu: $error';
  }

  @override
  String countParticipants(int count) {
    return '$count účastníkov';
  }

  @override
  String get create => 'Vytvoriť';

  @override
  String createdTheChat(String username) {
    return '$username založili chat';
  }

  @override
  String get createGroup => 'Create group';

  @override
  String get createNewSpace => 'New space';

  @override
  String get currentlyActive => 'Momentálne prítomní';

  @override
  String get darkTheme => 'Tmavá';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day.$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day.$month.$year';
  }

  @override
  String get deactivateAccountWarning =>
      'This will deactivate your user account. This can not be undone! Are you sure?';

  @override
  String get defaultPermissionLevel => 'Default permission level for new users';

  @override
  String get delete => 'Odstrániť';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteMessage => 'Odstrániť správu';

  @override
  String get device => 'Zariadenie';

  @override
  String get deviceId => 'Device ID';

  @override
  String get devices => 'Zariadenia';

  @override
  String get directChats => 'Direct Chats';

  @override
  String get allRooms => 'All Group Chats';

  @override
  String get displaynameHasBeenChanged => 'Prezývka bola zmenená';

  @override
  String get downloadFile => 'Stiahnuť súbor';

  @override
  String get edit => 'Edit';

  @override
  String get editBlockedServers => 'Edit blocked servers';

  @override
  String get chatPermissions => 'Chat permissions';

  @override
  String get chatThreads => 'Threads';

  @override
  String get chatThreadsDescription => 'See all threads in this room';

  @override
  String get editDisplayname => 'Zmeniť prezývku';

  @override
  String get editRoomAliases => 'Edit room aliases';

  @override
  String get editRoomAvatar => 'Edit room avatar';

  @override
  String get emoteExists => 'Emotikon už existuje!';

  @override
  String get emoteInvalid => 'Nesprávné označenie emotikonu!';

  @override
  String get emoteKeyboardNoRecents =>
      'Recently-used emotes will appear here...';

  @override
  String get emotePacks => 'Emote packs for room';

  @override
  String get emoteSettings => 'Nastavenie emotikonov';

  @override
  String get globalChatId => 'Global chat ID';

  @override
  String get accessAndVisibility => 'Access and visibility';

  @override
  String get accessAndVisibilityDescription =>
      'Who is allowed to join this chat and how the chat can be discovered.';

  @override
  String get calls => 'Calls';

  @override
  String get customEmojisAndStickers => 'Custom emojis and stickers';

  @override
  String get customEmojisAndStickersBody =>
      'Add or share custom emojis or stickers which can be used in any chat.';

  @override
  String get emoteShortcode => 'Kód emotikonu';

  @override
  String get emoteWarnNeedToPick => 'Musíte zvoliť kód emotikonu a obrázok!';

  @override
  String get emptyChat => 'Prázdny chat';

  @override
  String get enableEmotesGlobally => 'Enable emote pack globally';

  @override
  String get enableEncryption => 'Enable encryption';

  @override
  String get enableEncryptionWarning =>
      'Šifrovanie už nebude možné vypnúť. Ste si tým istí?';

  @override
  String get encrypted => 'Encrypted';

  @override
  String get encryption => 'Šifrovanie';

  @override
  String get encryptionNotEnabled => 'Šifrovanie nie je aktívne';

  @override
  String endedTheCall(String senderName) {
    return '$senderName ended the call';
  }

  @override
  String get enterAnEmailAddress => 'Enter an email address';

  @override
  String get homeserver => 'Homeserver';

  @override
  String get enterYourHomeserver => 'Zadajte svoj homeserver';

  @override
  String errorObtainingLocation(String error) {
    return 'Error obtaining location: $error';
  }

  @override
  String get everythingReady => 'Everything ready!';

  @override
  String get extremeOffensive => 'Extremely offensive';

  @override
  String get fileName => 'Názov súboru';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Font size';

  @override
  String get forward => 'Preposlať';

  @override
  String get fromJoining => 'Od pripojenia';

  @override
  String get fromTheInvitation => 'Od pozvania';

  @override
  String get goToTheNewRoom => 'Go to the new room';

  @override
  String get group => 'Skupina';

  @override
  String get chatDescription => 'Chat description';

  @override
  String get chatDescriptionHasBeenChanged => 'Chat description changed';

  @override
  String get groupIsPublic => 'Skupina je verejná';

  @override
  String get groups => 'Groups';

  @override
  String groupWith(String displayname) {
    return 'Skupina s $displayname';
  }

  @override
  String get guestsAreForbidden => 'Hostia sú zakázaní';

  @override
  String get guestsCanJoin => 'Hostia sa môžu pripojiť';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username vzal späť pozvánku pre $targetName';
  }

  @override
  String get help => 'Pomoc';

  @override
  String get hideRedactedEvents => 'Hide redacted events';

  @override
  String get hideRedactedMessages => 'Hide redacted messages';

  @override
  String get hideRedactedMessagesBody =>
      'If someone redacts a message, this message won\'t be visible in the chat anymore.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Hide invalid or unknown message formats';

  @override
  String get howOffensiveIsThisContent => 'How offensive is this content?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identita';

  @override
  String get block => 'Block';

  @override
  String get blockedUsers => 'Blocked users';

  @override
  String get blockListDescription =>
      'You can block users who are disturbing you. You won\'t be able to receive any messages or room invites from the users on your personal block list.';

  @override
  String get blockUsername => 'Ignore username';

  @override
  String get iHaveClickedOnLink => 'I have clicked on the link';

  @override
  String get incorrectPassphraseOrKey =>
      'Nesprávna prístupová fráza alebo kľúč na obnovenie';

  @override
  String get inoffensive => 'Inoffensive';

  @override
  String get inviteContact => 'Pozvať kontakt';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Do you want to invite $contact to the chat \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Pozvať kontakt do $groupName';
  }

  @override
  String get noChatDescriptionYet => 'No chat description created yet.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidServerName => 'Invalid server name';

  @override
  String get invited => 'Pozvanie';

  @override
  String get redactMessageDescription =>
      'The message will be redacted for all participants in this conversation. This cannot be undone.';

  @override
  String get optionalRedactReason =>
      '(Optional) Reason for redacting this message...';

  @override
  String invitedUser(String username, String targetName) {
    return '$username pozvali $targetName';
  }

  @override
  String get invitedUsersOnly => 'Len pozvaní používatelia';

  @override
  String get inviteForMe => 'Invite for me';

  @override
  String inviteText(String username, String link) {
    return '$username vás pozval na FluffyChat.\n1. Nainštalujte si FluffyChat: https://fluffychat.im\n2. Zaregistrujte sa alebo sa prihláste\n3. Otvorte odkaz na pozvánku: $link';
  }

  @override
  String get isTyping => 'píše…';

  @override
  String joinedTheChat(String username) {
    return '$username sa pripojili do chatu';
  }

  @override
  String get joinRoom => 'Pripojiť sa k miestnosti';

  @override
  String kicked(String username, String targetName) {
    return '$username vyhodili $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '$username vyhodili a zabanovali $targetName';
  }

  @override
  String get kickFromChat => 'Vyhodiť z chatu';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Naposledy prítomní: $localizedTimeShort';
  }

  @override
  String get leave => 'Opustiť';

  @override
  String get leftTheChat => 'Opustili chat';

  @override
  String get license => 'Licencia';

  @override
  String get lightTheme => 'Svetlá';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Načítať ďalších $count účastníkov';
  }

  @override
  String get dehydrate => 'Export session and wipe device';

  @override
  String get dehydrateWarning =>
      'This action cannot be undone. Ensure you safely store the backup file.';

  @override
  String get dehydrateTor => 'TOR Users: Export session';

  @override
  String get dehydrateTorLong =>
      'For TOR users, it is recommended to export the session before closing the window.';

  @override
  String get hydrateTor => 'TOR Users: Import session export';

  @override
  String get hydrateTorLong =>
      'Did you export your session last time on TOR? Quickly import it and continue chatting.';

  @override
  String get hydrate => 'Restore from backup file';

  @override
  String get loadingPleaseWait => 'Načítava sa… Čakajte prosím.';

  @override
  String get loadMore => 'Načítať viac…';

  @override
  String get locationDisabledNotice =>
      'Location services are disabled. Please enable them to be able to share your location.';

  @override
  String get locationPermissionDeniedNotice =>
      'Location permission denied. Please grant them to be able to share your location.';

  @override
  String get login => 'Prihlásiť sa';

  @override
  String logInTo(String homeserver) {
    return 'Prihlásenie k $homeserver';
  }

  @override
  String get logout => 'Odhlásiť sa';

  @override
  String get memberChanges => 'Member changes';

  @override
  String get mention => 'Mention';

  @override
  String get messages => 'Messages';

  @override
  String get messagesStyle => 'Messages:';

  @override
  String get moderator => 'Moderátor';

  @override
  String get muteChat => 'Stlmiť chat';

  @override
  String get needPantalaimonWarning =>
      'Prosím berte na vedomie, že na koncové šifrovanie zatiaľ potrebujete Pantalaimon.';

  @override
  String get newChat => 'New chat';

  @override
  String get newMessageInFluffyChat => 'Nová správa v FluffyChate';

  @override
  String get newVerificationRequest => 'Nová žiadosť o verifikáciu!';

  @override
  String get next => 'Next';

  @override
  String get no => 'No';

  @override
  String get noConnectionToTheServer => 'No connection to the server';

  @override
  String get noEmotesFound => 'Nenašli sa žiadne emotikony. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'You can only activate encryption as soon as the room is no longer publicly accessible.';

  @override
  String get noGoogleServicesWarning =>
      'Zdá sa, že nemáte žiadne služby Googlu v telefóne. To je dobré rozhodnutie pre vaše súkromie! Ak chcete dostávať push notifikácie vo FluffyChat, odporúčame používať microG: https://microg.org/.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 is no matrix server, use $server2 instead?';
  }

  @override
  String get shareInviteLink => 'Share invite link';

  @override
  String get scanQrCode => 'Scan QR code';

  @override
  String get none => 'Žiadne';

  @override
  String get noPasswordRecoveryDescription =>
      'You have not added a way to recover your password yet.';

  @override
  String get noPermission => 'Chýba povolenie';

  @override
  String get noRoomsFound => 'Nenašli sa žiadne miestnosti…';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notifications enabled for this account';

  @override
  String numUsersTyping(int count) {
    return '$count users are typing…';
  }

  @override
  String get obtainingLocation => 'Obtaining location…';

  @override
  String get offensive => 'Offensive';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'ok';

  @override
  String get online => 'Online';

  @override
  String get onlineKeyBackupEnabled => 'Online záloha kľúčov je zapnutá';

  @override
  String get oopsPushError =>
      'Oops! Unfortunately, an error occurred when setting up the push notifications.';

  @override
  String get oopsSomethingWentWrong => 'Och! Niečo sa pokazilo…';

  @override
  String get openAppToReadMessages => 'Na prečítanie správy otvorte aplikáciu';

  @override
  String get openCamera => 'Otvoriť fotoaparát';

  @override
  String get openVideoCamera => 'Open camera for a video';

  @override
  String get oneClientLoggedOut => 'One of your clients has been logged out';

  @override
  String get addAccount => 'Add account';

  @override
  String get editBundlesForAccount => 'Edit bundles for this account';

  @override
  String get addToBundle => 'Add to bundle';

  @override
  String get removeFromBundle => 'Remove from this bundle';

  @override
  String get bundleName => 'Bundle name';

  @override
  String get enableMultiAccounts =>
      '(BETA) Enable multi accounts on this device';

  @override
  String get openInMaps => 'Open in maps';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail =>
      'This server needs to validate your email address for registration.';

  @override
  String get or => 'Or';

  @override
  String get participant => 'Participant';

  @override
  String get passphraseOrKey => 'prístupová fráza alebo kľúč na obnovenie';

  @override
  String get password => 'Heslo';

  @override
  String get downloads => 'Downloads';

  @override
  String get passwordForgotten => 'Forgot password';

  @override
  String get passwordHasBeenChanged => 'Password has been changed';

  @override
  String get hideMemberChangesInPublicChats =>
      'Hide member changes in public chats';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Do not show in the chat timeline if someone joins or leaves a public chat to improve readability.';

  @override
  String get overview => 'Overview';

  @override
  String get notifyMeFor => 'Notify me for';

  @override
  String get passwordRecoverySettings => 'Password recovery settings';

  @override
  String get passwordRecovery => 'Password recovery';

  @override
  String get people => 'Ľudia';

  @override
  String get pickImage => 'Vybrať obrázok';

  @override
  String get pin => 'Pin';

  @override
  String play(String fileName) {
    return 'Prehrať $fileName';
  }

  @override
  String get pleaseChoose => 'Please choose';

  @override
  String get pleaseChooseAPasscode => 'Please choose a pass code';

  @override
  String get pleaseClickOnLink =>
      'Please click on the link in the email and then proceed.';

  @override
  String get pleaseEnter4Digits =>
      'Please enter 4 digits or leave empty to disable app lock.';

  @override
  String get pleaseEnterRecoveryKey => 'Please enter your recovery key:';

  @override
  String get pleaseEnterYourPassword => 'Prosím zadajte svoje heslo';

  @override
  String get pleaseEnterYourPin => 'Please enter your pin';

  @override
  String get pleaseEnterYourUsername => 'Zadajte svoje používateľské meno';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Please follow the instructions on the website and tap on next.';

  @override
  String get privacy => 'Privacy';

  @override
  String get publicRooms => 'Verejné miestnosti';

  @override
  String get pushRules => 'Push rules';

  @override
  String get reason => 'Reason';

  @override
  String get recording => 'Nahrávam';

  @override
  String redactedBy(String username) {
    return 'Redacted by $username';
  }

  @override
  String get directChat => 'Direct chat';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Redacted by $username because: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username odstránili udalosť';
  }

  @override
  String get redactMessage => 'Redact message';

  @override
  String get register => 'Register';

  @override
  String get reject => 'Odmietnuť';

  @override
  String rejectedTheInvitation(String username) {
    return '$username odmietli pozvánku';
  }

  @override
  String get rejoin => 'Vrátiť sa';

  @override
  String get removeAllOtherDevices => 'Odstráňiť všetky ostatné zariadenia';

  @override
  String removedBy(String username) {
    return 'Odstánené užívateľom $username';
  }

  @override
  String get removeDevice => 'Odstráňiť zariadenie';

  @override
  String get unbanFromChat => 'Odblokovať';

  @override
  String get removeYourAvatar => 'Remove your avatar';

  @override
  String get replaceRoomWithNewerVersion => 'Replace room with newer version';

  @override
  String get reply => 'Odpovedať';

  @override
  String get reportMessage => 'Nahlásiť správu';

  @override
  String get translateMessage => 'Translate message';

  @override
  String get translatedMessage => 'Translated message';

  @override
  String get errorTranslatingMessage =>
      'An error has occured while translating the message.';

  @override
  String get recoverMessage => 'Recover message';

  @override
  String get recoveredMessage => 'Recovered message';

  @override
  String get errorRecoveringMessage =>
      'An error has occured while recovering the message.';

  @override
  String get errorRecoveringMessageNoAdmin =>
      'This feature is available on Synapse homeservers only for adminstrators.';

  @override
  String get requestPermission => 'Vyžiadať si povolenie';

  @override
  String get roomHasBeenUpgraded => 'Miestnosť bola upgradeovaná';

  @override
  String get roomVersion => 'Verzia miestnosti';

  @override
  String get saveFile => 'Save file';

  @override
  String get retry => 'Retry';

  @override
  String get search => 'Hľadať';

  @override
  String get security => 'Bezpečnosť';

  @override
  String get recoveryKey => 'Recovery key';

  @override
  String get recoveryKeyLost => 'Recovery key lost?';

  @override
  String seenByUser(String username) {
    return 'Videné užívateľom $username';
  }

  @override
  String get send => 'Odoslať';

  @override
  String get sendAMessage => 'Odoslať správu';

  @override
  String get sendAsText => 'Poslať ako text';

  @override
  String get sendAudio => 'Poslať zvuk';

  @override
  String get sendFile => 'Odoslať súbor';

  @override
  String get sendImage => 'Odoslať obrázok';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Poslať správy';

  @override
  String get sendOriginal => 'Poslať originál';

  @override
  String get sendSticker => 'Poslať nálepku';

  @override
  String get sendVideo => 'Poslať video';

  @override
  String sentAFile(String username) {
    return '$username poslali súbor';
  }

  @override
  String sentAnAudio(String username) {
    return '$username poslali zvukovú nahrávku';
  }

  @override
  String sentAPicture(String username) {
    return '$username poslali obrázok';
  }

  @override
  String sentASticker(String username) {
    return '$username poslali nálepku';
  }

  @override
  String sentAVideo(String username) {
    return '$username poslali video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName sent call information';
  }

  @override
  String get separateChatTypes => 'Separate Direct Chats and Groups';

  @override
  String get setAsCanonicalAlias => 'Set as main alias';

  @override
  String get setCustomEmotes => 'Set custom emotes';

  @override
  String get setChatDescription => 'Set chat description';

  @override
  String get setInvitationLink => 'Nastaviť odkaz pre pozvánku';

  @override
  String get setPermissionsLevel => 'Nastaviť úroveň oprávnení';

  @override
  String get setStatus => 'Nastaviť status';

  @override
  String get settings => 'Nastavenia';

  @override
  String get share => 'Zdieľať';

  @override
  String sharedTheLocation(String username) {
    return '$username zdieľa lokáciu';
  }

  @override
  String get shareLocation => 'Share location';

  @override
  String get showPassword => 'Show password';

  @override
  String get presenceStyle => 'Presence:';

  @override
  String get hideAvatarsInInvites => 'Hide avatars in invites';

  @override
  String get hideAvatarsInInvitesDescription =>
      'Do not show room avatars in invites';

  @override
  String get presencesToggle => 'Show status messages from other users';

  @override
  String get pureBlackToggle => 'Pure Black';

  @override
  String get singlesignon => 'Single Sign on';

  @override
  String get skip => 'Preskočiť';

  @override
  String get sourceCode => 'Zdrojový kód';

  @override
  String get spaceIsPublic => 'Space is public';

  @override
  String get spaceName => 'Space name';

  @override
  String startedACall(String senderName) {
    return '$senderName started a call';
  }

  @override
  String get startFirstChat => 'Start your first chat';

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'Ako sa dnes máte?';

  @override
  String get submit => 'Odoslať';

  @override
  String get synchronizingPleaseWait => 'Synchronizing… Please wait.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'Systémová farba';

  @override
  String get theyDontMatch => 'Sa nezhodujú';

  @override
  String get theyMatch => 'Zhodujú sa';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Toggle Favorite';

  @override
  String get toggleMuted => 'Toggle Muted';

  @override
  String get toggleUnread => 'Mark Read/Unread';

  @override
  String get tooManyRequestsWarning =>
      'Too many requests. Please try again later!';

  @override
  String get transferFromAnotherDevice => 'Transfer from another device';

  @override
  String get tryToSendAgain => 'Skúsiť znova odoslať';

  @override
  String get unavailable => 'Unavailable';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username odbanovali $targetName';
  }

  @override
  String get unblockDevice => 'Odblokovať zariadenie';

  @override
  String get unknownDevice => 'Neznáme zariadenie';

  @override
  String get unknownEncryptionAlgorithm => 'Neznámy šifrovací algoritmus';

  @override
  String unknownEvent(String type) {
    return 'Neznáma udalosť „$type“';
  }

  @override
  String get unmuteChat => 'Zrušiť stlmenie chatu';

  @override
  String get unpin => 'Unpin';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount neprečítaných chatov',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username a $count dalších píšu…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username a $username2 píšu…';
  }

  @override
  String userIsTyping(String username) {
    return '$username píše…';
  }

  @override
  String userLeftTheChat(String username) {
    return '$username opustili chat';
  }

  @override
  String get username => 'Užívateľské meno';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username poslali udalosť $type';
  }

  @override
  String get unverified => 'Unverified';

  @override
  String get verified => 'Verified';

  @override
  String get verify => 'Overiť';

  @override
  String get verifyStart => 'Spustiť verifikáciu';

  @override
  String get verifySuccess => 'Verifikácia bola úspešná!';

  @override
  String get verifyTitle => 'Verifikujem protiľahlý účet';

  @override
  String get videoCall => 'Videohovor';

  @override
  String get visibilityOfTheChatHistory => 'Viditeľnosť histórie chatu';

  @override
  String get visibleForAllParticipants => 'Viditeľné pre všetkých účastníkov';

  @override
  String get visibleForEveryone => 'Viditeľné pre každého';

  @override
  String get voiceMessage => 'Hlasová správa';

  @override
  String get waitingPartnerAcceptRequest =>
      'Čaká sa, kým partner prijme požiadavku…';

  @override
  String get waitingPartnerEmoji => 'Čaká sa, kým partner prijme emotikon…';

  @override
  String get waitingPartnerNumbers =>
      'Čaká sa na to, kým partner prijme čísla…';

  @override
  String get wallpaper => 'Pozadie';

  @override
  String get warning => 'Warning!';

  @override
  String get weSentYouAnEmail => 'We sent you an email';

  @override
  String get whoCanPerformWhichAction => 'Who can perform which action';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Kto môže vstúpiť do tejto skupiny';

  @override
  String get whyDoYouWantToReportThis => 'Why do you want to report this?';

  @override
  String get wipeChatBackup =>
      'Wipe your chat backup to create a new recovery key?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'With these addresses you can recover your password.';

  @override
  String get writeAMessage => 'Napísať správu…';

  @override
  String get yes => 'Áno';

  @override
  String get you => 'Vy';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Už sa nezúčastňujete tohto chatu';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Máte zablokovaný prístup k tomuto chatu';

  @override
  String get yourPublicKey => 'Your public key';

  @override
  String get messageInfo => 'Message info';

  @override
  String get time => 'Time';

  @override
  String get messageType => 'Message Type';

  @override
  String get sender => 'Sender';

  @override
  String get openGallery => 'Open gallery';

  @override
  String get removeFromSpace => 'Remove from space';

  @override
  String get addToSpaceDescription => 'Select a space to add this chat to it.';

  @override
  String get start => 'Start';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'To unlock your old messages, please enter your recovery key that has been generated in a previous session. Your recovery key is NOT your password.';

  @override
  String get publish => 'Publish';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Open Chat';

  @override
  String get markAsRead => 'Mark as read';

  @override
  String get reportUser => 'Report user';

  @override
  String get dismiss => 'Dismiss';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reacted with $reaction';
  }

  @override
  String get pinMessage => 'Pin to room';

  @override
  String get confirmEventUnpin =>
      'Are you sure to permanently unpin the event?';

  @override
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Place call';

  @override
  String get voiceCall => 'Voice call';

  @override
  String get unsupportedAndroidVersion => 'Unsupported Android version';

  @override
  String get unsupportedAndroidVersionLong =>
      'This feature requires a newer Android version. Please check for updates or Lineage OS support.';

  @override
  String get videoCallsBetaWarning =>
      'Please note that video calls are currently in beta. They might not work as expected or work at all on all platforms.';

  @override
  String get experimentalVideoCalls => 'Experimental video calls';

  @override
  String get emailOrUsername => 'Email or username';

  @override
  String get indexedDbErrorTitle => 'Private mode issues';

  @override
  String get indexedDbErrorLong =>
      'The message storage is unfortunately not enabled in private mode by default.\nPlease visit\n - about:config\n - set dom.indexedDB.privateBrowsing.enabled to true\nOtherwise, it is not possible to run Extera.';

  @override
  String switchToAccount(String number) {
    return 'Switch to account $number';
  }

  @override
  String get nextAccount => 'Next account';

  @override
  String get previousAccount => 'Previous account';

  @override
  String get addWidget => 'Add widget';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Text note';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Custom';

  @override
  String get widgetName => 'Name';

  @override
  String get widgetUrlError => 'This is not a valid URL.';

  @override
  String get widgetNameError => 'Please provide a display name.';

  @override
  String get errorAddingWidget => 'Error adding the widget.';

  @override
  String get youRejectedTheInvitation => 'You rejected the invitation';

  @override
  String get youJoinedTheChat => 'You joined the chat';

  @override
  String get youAcceptedTheInvitation => '👍 You accepted the invitation';

  @override
  String youBannedUser(String user) {
    return 'You banned $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'You have withdrawn the invitation for $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 You have been invited via link to:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 You have been invited by $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invited by $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 You invited $user';
  }

  @override
  String youKicked(String user) {
    return '👞 You kicked $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 You kicked and banned $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'You unbanned $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user has knocked';
  }

  @override
  String get usersMustKnock => 'Users must knock';

  @override
  String get noOneCanJoin => 'No one can join';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user would like to join the chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'No public link has been created yet';

  @override
  String get knock => 'Knock';

  @override
  String get users => 'Users';

  @override
  String get unlockOldMessages => 'Unlock old messages';

  @override
  String get storeInSecureStorageDescription =>
      'Store the recovery key in the secure storage of this device.';

  @override
  String get saveKeyManuallyDescription =>
      'Save this key manually by triggering the system share dialog or clipboard.';

  @override
  String get storeInAndroidKeystore => 'Store in Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Store in Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Store securely on this device';

  @override
  String countFiles(int count) {
    return '$count files';
  }

  @override
  String get user => 'User';

  @override
  String get custom => 'Custom';

  @override
  String get foregroundServiceRunning =>
      'This notification appears when the foreground service is running.';

  @override
  String get screenSharingTitle => 'screen sharing';

  @override
  String get screenSharingDetail => 'You are sharing your screen in Extera';

  @override
  String get callingPermissions => 'Calling permissions';

  @override
  String get callingAccount => 'Calling account';

  @override
  String get callingAccountDetails =>
      'Allows Extera to use the native android dialer app.';

  @override
  String get appearOnTop => 'Appear on top';

  @override
  String get appearOnTopDetails =>
      'Allows the app to appear on top (not needed if you already have Fluffychat setup as a calling account)';

  @override
  String get otherCallingPermissions =>
      'Microphone, camera and other Extera permissions';

  @override
  String get whyIsThisMessageEncrypted => 'Why is this message unreadable?';

  @override
  String get noKeyForThisMessage =>
      'This can happen if the message was sent before you have signed in to your account at this device.\n\nIt is also possible that the sender has blocked your device or something went wrong with the internet connection.\n\nAre you able to read the message on another session? Then you can transfer the message from it! Go to Settings > Devices and make sure that your devices have verified each other. When you open the room the next time and both sessions are in the foreground, the keys will be transmitted automatically.\n\nDo you not want to lose the keys when logging out or switching devices? Make sure that you have enabled the chat backup in the settings.';

  @override
  String get newGroup => 'New group';

  @override
  String get newSpace => 'New space';

  @override
  String get enterSpace => 'Enter space';

  @override
  String get enterRoom => 'Enter room';

  @override
  String get allSpaces => 'All spaces';

  @override
  String numChats(String number) {
    return '$number chats';
  }

  @override
  String get hideUnimportantStateEvents => 'Hide unimportant state events';

  @override
  String get hidePresences => 'Hide Status List?';

  @override
  String get doNotShowAgain => 'Do not show again';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Empty chat (was $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Spaces allows you to consolidate your chats and build private or public communities.';

  @override
  String get encryptThisChat => 'Encrypt this chat';

  @override
  String get disableEncryptionWarning =>
      'For security reasons you can not disable encryption in a chat, where it has been enabled before.';

  @override
  String get sorryThatsNotPossible => 'Sorry... that is not possible';

  @override
  String get deviceKeys => 'Device keys:';

  @override
  String get reopenChat => 'Reopen chat';

  @override
  String get noBackupWarning =>
      'Warning! Without enabling chat backup, you will lose access to your encrypted messages. It is highly recommended to enable the chat backup first before logging out.';

  @override
  String get noOtherDevicesFound => 'No other devices found';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Unable to send! The server only supports attachments up to $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'File has been saved at $path';
  }

  @override
  String get jumpToLastReadMessage => 'Jump to last read message';

  @override
  String get readUpToHere => 'Read up to here';

  @override
  String get jump => 'Jump';

  @override
  String get openLinkInBrowser => 'Open link in browser';

  @override
  String get reportErrorDescription =>
      '😭 Oh no. Something went wrong. If you want, you can report this bug to the developers.';

  @override
  String get report => 'Report';

  @override
  String get signInWithPassword => 'Sign in with password';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Please try again later or choose a different server.';

  @override
  String signInWith(String provider) {
    return 'Sign in with $provider';
  }

  @override
  String get profileNotFound =>
      'The user could not be found on the server. Maybe there is a connection problem or the user doesn\'t exist.';

  @override
  String get setTheme => 'Set theme:';

  @override
  String get setColorTheme => 'Set color theme:';

  @override
  String get invite => 'Invite';

  @override
  String get inviteGroupChat => '📨 Invite group chat';

  @override
  String get invitePrivateChat => '📨 Invite private chat';

  @override
  String get invalidInput => 'Invalid input!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Wrong pin entered! Try again in $seconds seconds...';
  }

  @override
  String get pleaseEnterANumber => 'Please enter a number greater than 0';

  @override
  String get archiveRoomDescription =>
      'The chat will be moved to the archive. Other users will be able to see that you have left the chat.';

  @override
  String get roomUpgradeDescription =>
      'The chat will then be recreated with the new room version. All participants will be notified that they need to switch to the new chat. You can find out more about room versions at https://spec.matrix.org/latest/rooms/';

  @override
  String get removeDevicesDescription =>
      'You will be logged out of this device and will no longer be able to receive messages.';

  @override
  String get banUserDescription =>
      'Do you want to ban this user? They won\'t be able to rejoin. You also can provide a reason.';

  @override
  String get unbanUserDescription =>
      'The user will be able to enter the chat again if they try.';

  @override
  String doYouWantToKick(String user) {
    return 'Kick $user';
  }

  @override
  String doYouWantToBan(String user) {
    return 'Ban $user';
  }

  @override
  String get kickUserDescription =>
      'Do you want to kick this user? If the room is public, they can rejoin anytime. You also can provide a reason.';

  @override
  String get makeAdminDescription =>
      'Once you make this user admin, you may not be able to undo this as they will then have the same permissions as you.';

  @override
  String get pushNotificationsNotAvailable =>
      'Push notifications not available';

  @override
  String get learnMore => 'Learn more';

  @override
  String get yourGlobalUserIdIs => 'Your global user-ID is: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Unfortunately no user could be found with \"$query\". Please check whether you made a typo.';
  }

  @override
  String get knocking => 'Knocking';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Chat can be discovered via the search on $server';
  }

  @override
  String get searchChatsRooms => 'Search for #chats, @users...';

  @override
  String get nothingFound => 'Nothing found...';

  @override
  String get groupName => 'Group name';

  @override
  String get createGroupAndInviteUsers => 'Create a group and invite users';

  @override
  String get groupCanBeFoundViaSearch => 'Group can be found via search';

  @override
  String get wrongRecoveryKey =>
      'Sorry... this does not seem to be the correct recovery key.';

  @override
  String get startConversation => 'Start conversation';

  @override
  String get commandHint_sendraw => 'Send raw json';

  @override
  String get databaseMigrationTitle => 'Database is optimized';

  @override
  String get databaseMigrationBody => 'Please wait. This may take a moment.';

  @override
  String get leaveEmptyToClearStatus => 'Leave empty to clear your status.';

  @override
  String get select => 'Select';

  @override
  String get searchForUsers => 'Search for @users...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Please enter your current password';

  @override
  String get newPassword => 'New password';

  @override
  String get pleaseChooseAStrongPassword => 'Please choose a strong password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get passwordIsWrong => 'Your entered password is wrong';

  @override
  String get publicLink => 'Public link';

  @override
  String get publicChatAddresses => 'Public chat addresses';

  @override
  String get createNewAddress => 'Create new address';

  @override
  String get joinSpace => 'Join space';

  @override
  String get publicSpaces => 'Public spaces';

  @override
  String get addChatOrSubSpace => 'Add chat or sub space';

  @override
  String get subspace => 'Subspace';

  @override
  String get decline => 'Decline';

  @override
  String get thisDevice => 'This device:';

  @override
  String get initAppError => 'An error occured while init the app';

  @override
  String get userRole => 'User role';

  @override
  String minimumPowerLevel(String level) {
    return '$level is the minimum power level.';
  }

  @override
  String searchIn(String chat) {
    return 'Search in chat \"$chat\"...';
  }

  @override
  String get searchMore => 'Search more...';

  @override
  String get gallery => 'Gallery';

  @override
  String get files => 'Files';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Unable to build the SQlite database. The app tries to use the legacy database for now. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Your session is lost. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'The app now tries to restore your session from the backup. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Forward message to $roomName?';
  }

  @override
  String get sendReadReceipts => 'Send read receipts';

  @override
  String get sendTypingNotificationsDescription =>
      'Other participants in a chat can see when you are typing a new message.';

  @override
  String get sendReadReceiptsDescription =>
      'Other participants in a chat can see when you have read a message.';

  @override
  String get formattedMessages => 'Formatted messages';

  @override
  String get formattedMessagesDescription =>
      'Display rich message content like bold text using markdown.';

  @override
  String get verifyOtherUser => '🔐 Verify other user';

  @override
  String get verifyOtherUserDescription =>
      'If you verify another user, you can be sure that you know who you are really writing to. 💪\n\nWhen you start a verification, you and the other user will see a popup in the app. There you will then see a series of emojis or numbers that you have to compare with each other.\n\nThe best way to do this is to meet up or start a video call. 👭';

  @override
  String get verifyOtherDevice => '🔐 Verify other device';

  @override
  String get verifyOtherDeviceDescription =>
      'When you verify another device, those devices can exchange keys, increasing your overall security. 💪 When you start a verification, a popup will appear in the app on both devices. There you will then see a series of emojis or numbers that you have to compare with each other. It\'s best to have both devices handy before you start the verification. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender accepted key verification';
  }

  @override
  String get customReaction => 'Add reaction';

  @override
  String canceledKeyVerification(String sender) {
    return '$sender canceled key verification';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender completed key verification';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender is ready for key verification';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender requested key verification';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender started key verification';
  }

  @override
  String get transparent => 'Transparent';

  @override
  String get incomingMessages => 'Incoming messages';

  @override
  String get stickers => 'Stickers';

  @override
  String get discover => 'Discover';

  @override
  String get commandHint_ignore => 'Ignore the given matrix ID';

  @override
  String get commandHint_unignore => 'Unignore the given matrix ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread unread chats';
  }

  @override
  String get noDatabaseEncryption =>
      'Database encryption is not supported on this platform';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Right now there are $count users blocked.';
  }

  @override
  String get restricted => 'Restricted';

  @override
  String get knockRestricted => 'Knock restricted';

  @override
  String goToSpace(Object space) {
    return 'Go to space: $space';
  }

  @override
  String get markAsUnread => 'Mark as unread';

  @override
  String userLevel(int level) {
    return '$level - User';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderator';
  }

  @override
  String adminLevel(int level) {
    return '$level - Admin';
  }

  @override
  String get changeGeneralChatSettings => 'Change general chat settings';

  @override
  String get inviteOtherUsers => 'Invite other users to this chat';

  @override
  String get changeTheChatPermissions => 'Change the chat permissions';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Change the visibility of the chat history';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Change the main public chat address';

  @override
  String get sendRoomNotifications => 'Send a @room notifications';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Change the description of the chat';

  @override
  String get chatPermissionsDescription =>
      'Define which power level is necessary for certain actions in this chat. The power levels 0, 50 and 100 are usually representing users, moderators and admins, but any gradation is possible.';

  @override
  String updateInstalled(String version) {
    return '🎉 Update $version installed!';
  }

  @override
  String get changelog => 'Changelog';

  @override
  String get sendCanceled => 'Sending canceled';

  @override
  String get loginWithMatrixId => 'Login with Matrix-ID';

  @override
  String get discoverHomeservers => 'Discover homeservers';

  @override
  String get whatIsAHomeserver => 'What is a homeserver?';

  @override
  String get homeserverDescription =>
      'All your data is stored on the homeserver, just like an email provider. You can choose which homeserver you want to use, while you can still communicate with everyone. Learn more at at https://matrix.org.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Doesn\'t seem to be a compatible homeserver. Wrong URL?';

  @override
  String get calculatingFileSize => 'Calculating file size...';

  @override
  String get prepareSendingAttachment => 'Prepare sending attachment...';

  @override
  String get sendingAttachment => 'Sending attachment...';

  @override
  String get generatingVideoThumbnail => 'Generating video thumbnail...';

  @override
  String get compressVideo => 'Compressing video...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Sending attachment $index of $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Server limit reached! Waiting $seconds seconds...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'One of your devices is not verified';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Note: When you connect all your devices to the chat backup, they are automatically verified.';

  @override
  String get continueText => 'Continue';

  @override
  String get welcomeText =>
      'Hey Hey 👋 This is Extera. You can sign in to any homeserver, which is compatible with https://matrix.org. And then chat with anyone. It\'s a huge decentralized messaging network!';

  @override
  String get blur => 'Blur:';

  @override
  String get opacity => 'Opacity:';

  @override
  String get setWallpaper => 'Set wallpaper';

  @override
  String get manageAccount => 'Manage account';

  @override
  String get noContactInformationProvided =>
      'Server does not provide any valid contact information';

  @override
  String get contactServerAdmin => 'Contact server admin';

  @override
  String get contactServerSecurity => 'Contact server security';

  @override
  String get supportPage => 'Support page';

  @override
  String get serverInformation => 'Server information:';

  @override
  String get name => 'Name';

  @override
  String get version => 'Version';

  @override
  String get website => 'Website';

  @override
  String get compress => 'Compress';

  @override
  String get boldText => 'Bold text';

  @override
  String get italicText => 'Italic text';

  @override
  String get strikeThrough => 'Strikethrough';

  @override
  String get pleaseFillOut => 'Please fill out';

  @override
  String get invalidUrl => 'Invalid url';

  @override
  String get addLink => 'Add link';

  @override
  String get unableToJoinChat =>
      'Unable to join chat. Maybe the other party has already closed the conversation.';

  @override
  String get previous => 'Previous';

  @override
  String get otherPartyNotLoggedIn =>
      'The other party is currently not logged in and therefore cannot receive messages!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Use \'$server\' to log in';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'You hereby allow the app and website to share information about you.';

  @override
  String get open => 'Open';

  @override
  String get waitingForServer => 'Waiting for server...';

  @override
  String get appIntroduction =>
      'Extera lets you chat with your friends across different messengers. Learn more at https://matrix.org or just tap *Continue*.';

  @override
  String get newChatRequest => '📩 New chat request';

  @override
  String get contentNotificationSettings => 'Content notification settings';

  @override
  String get generalNotificationSettings => 'General notification settings';

  @override
  String get roomNotificationSettings => 'Room notification settings';

  @override
  String get userSpecificNotificationSettings =>
      'User specific notification settings';

  @override
  String get otherNotificationSettings => 'Other notification settings';

  @override
  String get notificationRuleContainsUserName => 'Contains User Name';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Notifies the user when a message contains their username.';

  @override
  String get notificationRuleMaster => 'Mute all notifications';

  @override
  String get notificationRuleMasterDescription =>
      'Overrides all other rules and disables all notifications.';

  @override
  String get notificationRuleSuppressNotices => 'Suppress Automated Messages';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Suppresses notifications from automated clients like bots.';

  @override
  String get notificationRuleInviteForMe => 'Invite for Me';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Notifies the user when they are invited to a room.';

  @override
  String get notificationRuleMemberEvent => 'Member Event';

  @override
  String get notificationRuleMemberEventDescription =>
      'Suppresses notifications for membership events.';

  @override
  String get notificationRuleIsUserMention => 'User Mention';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Notifies the user when they are directly mentioned in a message.';

  @override
  String get notificationRuleContainsDisplayName => 'Contains Display Name';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Notifies the user when a message contains their display name.';

  @override
  String get notificationRuleIsRoomMention => 'Room Mention';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Notifies the user when there is a room mention.';

  @override
  String get notificationRuleRoomnotif => 'Room Notification';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Notifies the user when a message contains \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Tombstone';

  @override
  String get notificationRuleTombstoneDescription =>
      'Notifies the user about room deactivation messages.';

  @override
  String get notificationRuleReaction => 'Reaction';

  @override
  String get notificationRuleReactionDescription =>
      'Suppresses notifications for reactions.';

  @override
  String get notificationRuleRoomServerAcl => 'Room Server ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Suppresses notifications for room server access control lists (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Suppress Edits';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Suppresses notifications for edited messages.';

  @override
  String get notificationRuleCall => 'Call';

  @override
  String get notificationRuleCallDescription =>
      'Notifies the user about calls.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Encrypted Room One-to-One';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Notifies the user about messages in encrypted one-to-one rooms.';

  @override
  String get notificationRuleRoomOneToOne => 'Room One-to-One';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Notifies the user about messages in one-to-one rooms.';

  @override
  String get notificationRuleMessage => 'Message';

  @override
  String get notificationRuleMessageDescription =>
      'Notifies the user about general messages.';

  @override
  String get notificationRuleEncrypted => 'Encrypted';

  @override
  String get notificationRuleEncryptedDescription =>
      'Notifies the user about messages in encrypted rooms.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Notifies the user about Jitsi widget events.';

  @override
  String get notificationRuleServerAcl => 'Suppress Server ACL Events';

  @override
  String get notificationRuleServerAclDescription =>
      'Suppresses notifications for Server ACL events.';

  @override
  String unknownPushRule(String rule) {
    return 'Unknown push rule \'$rule\'';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'If you delete this notification setting, this can not be undone.';

  @override
  String get more => 'More';

  @override
  String get shareKeysWith => 'Share keys with...';

  @override
  String get shareKeysWithDescription =>
      'Which devices should be trusted so that they can read along your messages in encrypted chats?';

  @override
  String get allDevices => 'All devices';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Cross verified devices if enabled';

  @override
  String get crossVerifiedDevices => 'Cross verified devices';

  @override
  String get verifiedDevicesOnly => 'Verified devices only';

  @override
  String get takeAPhoto => 'Take a photo';

  @override
  String get recordAVideo => 'Record a video';

  @override
  String get optionalMessage => '(Optional) message...';

  @override
  String get notSupportedOnThisDevice => 'Not supported on this device';

  @override
  String get enterNewChat => 'Enter new chat';

  @override
  String get approve => 'Approve';

  @override
  String get youHaveKnocked => 'You have knocked';

  @override
  String get pleaseWaitUntilInvited =>
      'Please wait now, until someone from the room invites you.';
}
