// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Esperanto (`eo`).
class L10nEo extends L10n {
  L10nEo([String locale = 'eo']) : super(locale);

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
  String get repeatPassword => 'Repeat password';

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
  String get remove => 'Forigi';

  @override
  String get importNow => 'Import now';

  @override
  String get importEmojis => 'Import Emojis';

  @override
  String get importFromZipFile => 'Import from .zip file';

  @override
  String get exportEmotePack => 'Export Emote pack as .zip';

  @override
  String get replace => 'Replace';

  @override
  String get about => 'Prio';

  @override
  String aboutHomeserver(String homeserver) {
    return 'About $homeserver';
  }

  @override
  String get accept => 'Akcepti';

  @override
  String acceptedTheInvitation(String username) {
    return '$username akceptis la inviton';
  }

  @override
  String get account => 'Konto';

  @override
  String activatedEndToEndEncryption(String username) {
    return '$username aktivigis tutvojan ĉifradon';
  }

  @override
  String get addEmail => 'Aldoni retpoŝtadreson';

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
  String get addToSpace => 'Aldoni al aro';

  @override
  String get admin => 'Administranto';

  @override
  String get alias => 'kromnomo';

  @override
  String get all => 'Ĉio';

  @override
  String get allChats => 'Ĉiuj babiloj';

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
    return '$senderName respondis la vokon';
  }

  @override
  String get anyoneCanJoin => 'Ĉiu ajn povas aliĝi';

  @override
  String get appLock => 'Ŝlosado';

  @override
  String get appLockDescription =>
      'Lock the app when not using with a pin code';

  @override
  String get archive => 'Arĥivo';

  @override
  String get areGuestsAllowedToJoin => 'Ĉu gastoj rajtas aliĝi';

  @override
  String get areYouSure => 'Ĉu vi certas?';

  @override
  String get areYouSureYouWantToLogout => 'Ĉu vi certe volas adiaŭi?';

  @override
  String get askSSSSSign =>
      'Por ke vi povu kontroli (subskribi) la alian personon, bonvolu enigi pasfrazon de via sekreta deponejo aŭ vian rehavan ŝlosilon.';

  @override
  String askVerificationRequest(String username) {
    return 'Ĉu akcepti ĉi tiun kontrolpeton de $username?';
  }

  @override
  String get autoplayImages =>
      'Memage ludi movbildajn glumarkojn kaj mienetojn';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'La hejmservilo subtenas la jenajn specojn de salutoj:\n$serverVersions\nSed ĉi tiu aplikaĵo subtenas nur:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Send typing notifications';

  @override
  String get swipeRightToLeftToReply => 'Swipe right to left to reply';

  @override
  String get sendOnEnter => 'Sendi per eniga klavo';

  @override
  String badServerVersionsException(String serverVersions,
      String supportedVersions, Object serverVerions, Object suportedVersions) {
    return 'La hejmservilo subtenas la jenajn version de la specifaĵo:\n$serverVersions\nSed ĉi tiu aplikaĵo subtenas nur $supportedVersions';
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
  String get banFromChat => 'Forbari de babilo';

  @override
  String get banned => 'Forbarita';

  @override
  String bannedUser(String username, String targetName) {
    return '$username forbaris uzanton $targetName';
  }

  @override
  String get blockDevice => 'Bloki aparaton';

  @override
  String get blocked => 'Blokita';

  @override
  String get botMessages => 'Mesaĝoj de robotoj';

  @override
  String get cancel => 'Nuligi';

  @override
  String cantOpenUri(String uri) {
    return 'Ne povis malfermi URI $uri';
  }

  @override
  String get changeDeviceName => 'Ŝanĝi nomon de aparato';

  @override
  String changedTheChatAvatar(String username) {
    return '$username ŝanĝis bildon de la babilo';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username ŝanĝis priskribon de la babilo al: «$description»';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username ŝanĝis nomon de la babilo al: «$chatname»';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username ŝanĝis permesojn pri la babilo';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username ŝanĝis sian prezentan nomon al: $username';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username ŝanĝis regulojn pri aliro de gastoj';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username ŝanĝis regulojn pri aliro de gastoj al: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username ŝanĝis videblecon de la historio';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username ŝanĝis videblecon de la historio al: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username ŝanĝis regulojn pri aliĝado';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username ŝanĝis regulojn pri aliĝado al: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username ŝanĝis sian profilbildon';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username ŝanĝis la kromnomojn de la ĉambro';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username ŝanĝis la invitan ligilon';
  }

  @override
  String get changePassword => 'Ŝanĝi pasvorton';

  @override
  String get changeTheHomeserver => 'Ŝanĝi hejmservilon';

  @override
  String get changeTheme => 'Ŝanĝu la haŭton';

  @override
  String get changeTheNameOfTheGroup => 'Ŝanĝi nomon de la grupo';

  @override
  String get changeYourAvatar => 'Ŝanĝi vian profilbildon';

  @override
  String get channelCorruptedDecryptError => 'La ĉifrado estas difektita';

  @override
  String get chat => 'Babilo';

  @override
  String get yourChatBackupHasBeenSetUp => 'Your chat backup has been set up.';

  @override
  String get chatBackup => 'Savkopiado de babilo';

  @override
  String get chatBackupDescription =>
      'Via savkopio de babilo estas sekurigita per sekureca ŝlosilo. Bonvolu certigi, ke vi ne perdos ĝin.';

  @override
  String get chatDetails => 'Detaloj pri babilo';

  @override
  String get chatHasBeenAddedToThisSpace => 'Babilo aldoniĝis al ĉi tiu aro';

  @override
  String get chats => 'Babiloj';

  @override
  String get chooseAStrongPassword => 'Elektu fortan pasvorton';

  @override
  String get clearArchive => 'Vakigi arĥivon';

  @override
  String get close => 'Fermi';

  @override
  String get commandHint_markasdm =>
      'Mark as direct message room for the giving Matrix ID';

  @override
  String get commandHint_markasgroup => 'Mark as group';

  @override
  String get commandHint_ban => 'Forbari la donitan uzanton de ĉi tiu ĉambro';

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
  String get commandHint_html => 'Sendi tekston formatan je HTML';

  @override
  String get commandHint_invite => 'Inviti la donitan uzanton al ĉi tiu ĉambro';

  @override
  String get commandHint_join => 'Aliĝi al la donita ĉambro';

  @override
  String get commandHint_kick => 'Forigi la donitan uzanton de ĉi tiu ĉambro';

  @override
  String get commandHint_leave => 'Foriri de ĉi tiu ĉambro';

  @override
  String get commandHint_me => 'Priskribu vian agon';

  @override
  String get commandHint_myroomavatar =>
      'Agordi vian profilbildon por ĉi tiu ĉambro (laŭ mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Agordi vian prezentan nomon en ĉi tiu ĉambro';

  @override
  String get commandHint_op =>
      'Agordi povnivelon de la donita uzanto (implicite: 50)';

  @override
  String get commandHint_plain => 'Sendi senformatan tekston';

  @override
  String get commandHint_react => 'Sendi respondon kiel reagon';

  @override
  String get commandHint_send => 'Sendi tekston';

  @override
  String get commandHint_unban =>
      'Malforbari la donitan uzanton de ĉi tiu ĉambro';

  @override
  String get commandInvalid => 'Nevalida ordono';

  @override
  String commandMissing(String command) {
    return '$command ne estas ordono.';
  }

  @override
  String get compareEmojiMatch =>
      'Komparu kaj certigu, ke la jenaj bildosignoj samas en ambaŭ aparatoj:';

  @override
  String get compareNumbersMatch =>
      'Komparu kaj certigu, ke la jenaj numeroj samas en ambaŭ aparatoj:';

  @override
  String get configureChat => 'Agordi babilon';

  @override
  String get confirm => 'Konfirmi';

  @override
  String get connect => 'Konektiĝi';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontakto invitiĝis al la grupo';

  @override
  String get containsDisplayName => 'Enhavas prezentan nomon';

  @override
  String get containsUserName => 'Enhavas uzantonomon';

  @override
  String get contentHasBeenReported =>
      'La enhavo raportiĝis al la administrantoj de la servilo';

  @override
  String get copiedToClipboard => 'Kopiite al tondujo';

  @override
  String get copy => 'Kopii';

  @override
  String get copyToClipboard => 'Kopii al tondujo';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Ne povis malĉifri mesaĝon: $error';
  }

  @override
  String countParticipants(int count) {
    return '$count partoprenantoj';
  }

  @override
  String get create => 'Krei';

  @override
  String createdTheChat(String username) {
    return '$username kreis la babilon';
  }

  @override
  String get createGroup => 'Create group';

  @override
  String get createNewSpace => 'Nova aro';

  @override
  String get currentlyActive => 'Nun aktiva';

  @override
  String get darkTheme => 'Malhela';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '${day}a de la ${month}a';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '${day}a de la ${month}a de $year';
  }

  @override
  String get deactivateAccountWarning =>
      'Ĉi tio malaktivigos vian konton de uzanto. Ne eblas tion malfari! Ĉu certe vi certas?';

  @override
  String get defaultPermissionLevel => 'Norma nivelo de permesoj';

  @override
  String get delete => 'Forigi';

  @override
  String get deleteAccount => 'Forigi konton';

  @override
  String get deleteMessage => 'Forigi mesaĝon';

  @override
  String get device => 'Aparato';

  @override
  String get deviceId => 'Identigilo de aparato';

  @override
  String get devices => 'Aparatoj';

  @override
  String get directChats => 'Rektaj babiloj';

  @override
  String get allRooms => 'All Group Chats';

  @override
  String get displaynameHasBeenChanged => 'Prezenta nomo ŝanĝiĝis';

  @override
  String get downloadFile => 'Elŝuti dosieron';

  @override
  String get edit => 'Redakti';

  @override
  String get editBlockedServers => 'Redakti blokitajn servilojn';

  @override
  String get chatPermissions => 'Chat permissions';

  @override
  String get chatThreads => 'Threads';

  @override
  String get chatThreadsDescription => 'See all threads in this room';

  @override
  String get editDisplayname => 'Redakti prezentan nomon';

  @override
  String get editRoomAliases => 'Ŝanĝi kromnomojn de ĉambro';

  @override
  String get editRoomAvatar => 'Redakti bildon de ĉambro';

  @override
  String get emoteExists => 'Mieneto jam ekzistas!';

  @override
  String get emoteInvalid => 'Nevalida mallongigo de mieneto!';

  @override
  String get emoteKeyboardNoRecents =>
      'Recently-used emotes will appear here...';

  @override
  String get emotePacks => 'Mienetaroj por la ĉambro';

  @override
  String get emoteSettings => 'Agordoj pri mienetoj';

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
  String get emoteShortcode => 'Mallongigo de mieneto';

  @override
  String get emoteWarnNeedToPick =>
      'Vi devas elekti mallongigon de mieneto kaj bildon!';

  @override
  String get emptyChat => 'Malplena babilo';

  @override
  String get enableEmotesGlobally => 'Ŝalti mienetaron ĉie';

  @override
  String get enableEncryption => 'Ŝalti ĉifradon';

  @override
  String get enableEncryptionWarning =>
      'Vi ne povos malŝalti la ĉifradon. Ĉu vi certas?';

  @override
  String get encrypted => 'Ĉifrite';

  @override
  String get encryption => 'Ĉifrado';

  @override
  String get encryptionNotEnabled => 'Ĉifrado ne estas ŝaltita';

  @override
  String endedTheCall(String senderName) {
    return '$senderName finis la vokon';
  }

  @override
  String get enterAnEmailAddress => 'Enigu retpoŝtadreson';

  @override
  String get homeserver => 'Hejmservilo';

  @override
  String get enterYourHomeserver => 'Enigu vian hejmservilon';

  @override
  String errorObtainingLocation(String error) {
    return 'Eraris akirado de loko: $error';
  }

  @override
  String get everythingReady => 'Ĉio pretas!';

  @override
  String get extremeOffensive => 'Tre ofenda';

  @override
  String get fileName => 'Dosiernomo';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Grandeco de tiparo';

  @override
  String get forward => 'Plusendi';

  @override
  String get fromJoining => 'Ekde aliĝo';

  @override
  String get fromTheInvitation => 'Ekde la invito';

  @override
  String get goToTheNewRoom => 'Iri al la nova ĉambro';

  @override
  String get group => 'Grupo';

  @override
  String get chatDescription => 'Chat description';

  @override
  String get chatDescriptionHasBeenChanged => 'Chat description changed';

  @override
  String get groupIsPublic => 'Grupo estas publika';

  @override
  String get groups => 'Grupoj';

  @override
  String groupWith(String displayname) {
    return 'Grupo kun $displayname';
  }

  @override
  String get guestsAreForbidden => 'Gastoj estas malpermesitaj';

  @override
  String get guestsCanJoin => 'Gastoj povas aliĝi';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username nuligis la inviton por $targetName';
  }

  @override
  String get help => 'Helpo';

  @override
  String get hideRedactedEvents => 'Kaŝi obskurigitajn eventojn';

  @override
  String get hideRedactedMessages => 'Hide redacted messages';

  @override
  String get hideRedactedMessagesBody =>
      'If someone redacts a message, this message won\'t be visible in the chat anymore.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Hide invalid or unknown message formats';

  @override
  String get howOffensiveIsThisContent => 'Kiel ofenda estas ĉi tiu enhavo?';

  @override
  String get id => 'Identigilo';

  @override
  String get identity => 'Identeco';

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
  String get iHaveClickedOnLink => 'Mi klakis la ligilon';

  @override
  String get incorrectPassphraseOrKey => 'Neĝusta pasfrazo aŭ rehava ŝlosilo';

  @override
  String get inoffensive => 'Neofenda';

  @override
  String get inviteContact => 'Inviti kontakton';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Do you want to invite $contact to the chat \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Inviti kontakton al $groupName';
  }

  @override
  String get noChatDescriptionYet => 'No chat description created yet.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidServerName => 'Invalid server name';

  @override
  String get invited => 'Invitita';

  @override
  String get redactMessageDescription =>
      'The message will be redacted for all participants in this conversation. This cannot be undone.';

  @override
  String get optionalRedactReason =>
      '(Optional) Reason for redacting this message...';

  @override
  String invitedUser(String username, String targetName) {
    return '$username invitis uzanton $targetName';
  }

  @override
  String get invitedUsersOnly => 'Nur invititoj';

  @override
  String get inviteForMe => 'Invito por mi';

  @override
  String inviteText(String username, String link) {
    return '$username invitis vin al FluffyChat. \n1. Instalu la aplikaĵon FluffyChat: https://fluffychat.im \n2. Registriĝu aŭ salutu \n3. Malfermu la invitan ligilon: $link';
  }

  @override
  String get isTyping => 'tajpas…';

  @override
  String joinedTheChat(String username) {
    return '$username aliĝis al la babilo';
  }

  @override
  String get joinRoom => 'Aliĝi al ĉambro';

  @override
  String kicked(String username, String targetName) {
    return '$username forpelis uzanton $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '$username forpelis kaj forbaris uzanton $targetName';
  }

  @override
  String get kickFromChat => 'Forpeli de babilo';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Lastafoje aktiva: $localizedTimeShort';
  }

  @override
  String get leave => 'Foriri';

  @override
  String get leftTheChat => 'Foriris de la ĉambro';

  @override
  String get license => 'Permesilo';

  @override
  String get lightTheme => 'Hela';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Enlegi $count pliajn partoprenantojn';
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
  String get loadingPleaseWait => 'Enlegante… bonvolu atendi.';

  @override
  String get loadMore => 'Enlegi pli…';

  @override
  String get locationDisabledNotice =>
      'Location services are disabled. Please enable them to be able to share your location.';

  @override
  String get locationPermissionDeniedNotice =>
      'Location permission denied. Please grant them to be able to share your location.';

  @override
  String get login => 'Saluti';

  @override
  String logInTo(String homeserver) {
    return 'Saluti servilon $homeserver';
  }

  @override
  String get logout => 'Adiaŭi';

  @override
  String get memberChanges => 'Ŝanĝoj de anoj';

  @override
  String get mention => 'Mencii';

  @override
  String get messages => 'Mesaĝoj';

  @override
  String get messagesStyle => 'Messages:';

  @override
  String get moderator => 'Reguligisto';

  @override
  String get muteChat => 'Silentigi babilon';

  @override
  String get needPantalaimonWarning =>
      'Bonvolu scii, ke vi ankoraŭ bezonas la programon Pantalaimon por uzi tutvojan ĉifradon.';

  @override
  String get newChat => 'Nova babilo';

  @override
  String get newMessageInFluffyChat => 'Nova mesaĝo en FluffyChat';

  @override
  String get newVerificationRequest => 'Nova kontrolpeto!';

  @override
  String get next => 'Sekva';

  @override
  String get no => 'Ne';

  @override
  String get noConnectionToTheServer => 'Neniu konekto al la servilo';

  @override
  String get noEmotesFound => 'Neniuj mienetoj troviĝis. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Vi nur povas aktivigi ĉifradon kiam la ĉambro ne plu estas publike alirebla.';

  @override
  String get noGoogleServicesWarning =>
      'Ŝajnas, ke via telefono ne havas servojn de Google. Tio estas bona decido por via privateco! Por ricevadi pasivajn sciigojn en FluffyChat, ni rekomendas, ke vi uzu la https://microg.org/ aŭ https://unifiedpush.org/.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 ne estas matriksa servilo, eble provu anstataŭe servilon $server2?';
  }

  @override
  String get shareInviteLink => 'Share invite link';

  @override
  String get scanQrCode => 'Scan QR code';

  @override
  String get none => 'Neniu';

  @override
  String get noPasswordRecoveryDescription =>
      'Vi ankoraŭ ne aldonis manieron rehavi vian pasvorton.';

  @override
  String get noPermission => 'Neniu permeso';

  @override
  String get noRoomsFound => 'Neniuj ĉambroj troviĝis…';

  @override
  String get notifications => 'Sciigoj';

  @override
  String get notificationsEnabledForThisAccount =>
      'Sciigoj ŝaltiĝis por ĉi tiu konto';

  @override
  String numUsersTyping(int count) {
    return '$count uzantoj tajpas…';
  }

  @override
  String get obtainingLocation => 'Akirante lokon…';

  @override
  String get offensive => 'Ofenda';

  @override
  String get offline => 'Eksterrete';

  @override
  String get ok => 'bone';

  @override
  String get online => 'Enrete';

  @override
  String get onlineKeyBackupEnabled =>
      'Enreta savkopiado de ŝlosiloj estas ŝaltita';

  @override
  String get oopsPushError =>
      'Oj! Bedaŭrinde eraris la agordado de pasivaj sciigoj.';

  @override
  String get oopsSomethingWentWrong => 'Oj! Io misokazis…';

  @override
  String get openAppToReadMessages => 'Malfermu la aplikaĵon por legi mesaĝojn';

  @override
  String get openCamera => 'Malfermi fotilon';

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
  String get or => 'Aŭ';

  @override
  String get participant => 'Partoprenanto';

  @override
  String get passphraseOrKey => 'pasfrazo aŭ rehava ŝlosilo';

  @override
  String get password => 'Pasvorto';

  @override
  String get downloads => 'Downloads';

  @override
  String get passwordForgotten => 'Forgesita pasvorto';

  @override
  String get passwordHasBeenChanged => 'Pasvorto ŝanĝiĝis';

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
  String get passwordRecovery => 'Rehavo de pasvorto';

  @override
  String get people => 'Personoj';

  @override
  String get pickImage => 'Elekti bildon';

  @override
  String get pin => 'Fiksi';

  @override
  String play(String fileName) {
    return 'Ludi $fileName';
  }

  @override
  String get pleaseChoose => 'Bonvolu elekti';

  @override
  String get pleaseChooseAPasscode => 'Bonvolu elekti paskodon';

  @override
  String get pleaseClickOnLink =>
      'Bonvolu klaki la ligilon en la retletero kaj pluiĝi.';

  @override
  String get pleaseEnter4Digits =>
      'Bonvolu enigi 4 ciferojn, aŭ nenion por malŝalti ŝlosadon de la aplikaĵo.';

  @override
  String get pleaseEnterRecoveryKey => 'Please enter your recovery key:';

  @override
  String get pleaseEnterYourPassword => 'Bonvolu enigi vian pasvorton';

  @override
  String get pleaseEnterYourPin =>
      'Bonvolu enigi vian personan identigan numeron';

  @override
  String get pleaseEnterYourUsername => 'Bonvolu enigi vian uzantonomon';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Bonvolu sekvi la instrukciojn de la retejo kaj tuŝetu al «Sekva».';

  @override
  String get privacy => 'Privateco';

  @override
  String get publicRooms => 'Publikaj ĉambroj';

  @override
  String get pushRules => 'Reguloj de pasivaj sciigoj';

  @override
  String get reason => 'Kialo';

  @override
  String get recording => 'Registrante';

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
    return '$username obskurigis eventon';
  }

  @override
  String get redactMessage => 'Obskurigi mesaĝon';

  @override
  String get register => 'Registriĝi';

  @override
  String get reject => 'Rifuzi';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rifuzis la inviton';
  }

  @override
  String get rejoin => 'Ree aliĝi';

  @override
  String get removeAllOtherDevices => 'Forigi ĉiujn aliajn aparatojn';

  @override
  String removedBy(String username) {
    return 'Forigita de $username';
  }

  @override
  String get removeDevice => 'Forigi aparaton';

  @override
  String get unbanFromChat => 'Malforbari';

  @override
  String get removeYourAvatar => 'Forigi vian profilbildon';

  @override
  String get replaceRoomWithNewerVersion =>
      'Anstataŭigi ĉambron per nova versio';

  @override
  String get reply => 'Respondi';

  @override
  String get reportMessage => 'Raporti mesaĝon';

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
  String get requestPermission => 'Peti permeson';

  @override
  String get roomHasBeenUpgraded => 'Ĉambro gradaltiĝis';

  @override
  String get roomVersion => 'Versio de ĉambro';

  @override
  String get saveFile => 'Konservi dosieron';

  @override
  String get retry => 'Retry';

  @override
  String get search => 'Serĉi';

  @override
  String get security => 'Sekureco';

  @override
  String get recoveryKey => 'Recovery key';

  @override
  String get recoveryKeyLost => 'Recovery key lost?';

  @override
  String seenByUser(String username) {
    return 'Vidita de $username';
  }

  @override
  String get send => 'Sendi';

  @override
  String get sendAMessage => 'Sendi mesaĝon';

  @override
  String get sendAsText => 'Sendi kiel tekston';

  @override
  String get sendAudio => 'Sendi sondosieron';

  @override
  String get sendFile => 'Sendi dosieron';

  @override
  String get sendImage => 'Sendi bildon';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Sendi mesaĝojn';

  @override
  String get sendOriginal => 'Sendi originalon';

  @override
  String get sendSticker => 'Sendi glumarkon';

  @override
  String get sendVideo => 'Sendi filmon';

  @override
  String sentAFile(String username) {
    return '$username sendis dosieron';
  }

  @override
  String sentAnAudio(String username) {
    return '$username sendis sondosieron';
  }

  @override
  String sentAPicture(String username) {
    return '$username sendis bildon';
  }

  @override
  String sentASticker(String username) {
    return '$username sendis glumarkon';
  }

  @override
  String sentAVideo(String username) {
    return '$username sendis filmon';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName sendis informojn pri voko';
  }

  @override
  String get separateChatTypes => 'Separate Direct Chats and Groups';

  @override
  String get setAsCanonicalAlias => 'Agordi kiel ĉefan kromnomon';

  @override
  String get setCustomEmotes => 'Agordi proprajn mienetojn';

  @override
  String get setChatDescription => 'Set chat description';

  @override
  String get setInvitationLink => 'Agordi invitan ligilon';

  @override
  String get setPermissionsLevel => 'Agordi nivelon de permesoj';

  @override
  String get setStatus => 'Agordi staton';

  @override
  String get settings => 'Agordoj';

  @override
  String get share => 'Konigi';

  @override
  String sharedTheLocation(String username) {
    return '$username konigis sian lokon';
  }

  @override
  String get shareLocation => 'Konigi lokon';

  @override
  String get showPassword => 'Montri pasvorton';

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
  String get singlesignon => 'Ununura saluto';

  @override
  String get skip => 'Preterpasi';

  @override
  String get sourceCode => 'Fontkodo';

  @override
  String get spaceIsPublic => 'Aro estas publika';

  @override
  String get spaceName => 'Nomo de aro';

  @override
  String startedACall(String senderName) {
    return '$senderName komencis vokon';
  }

  @override
  String get startFirstChat => 'Start your first chat';

  @override
  String get status => 'Stato';

  @override
  String get statusExampleMessage => 'Kiel vi fartas?';

  @override
  String get submit => 'Sendi';

  @override
  String get synchronizingPleaseWait => 'Spegulante… Bonvolu atendi.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'Ili ne akordas';

  @override
  String get theyMatch => 'Ili akordas';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Baskuli elstarigon';

  @override
  String get toggleMuted => 'Basklui silentigon';

  @override
  String get toggleUnread => 'Baskuli legitecon';

  @override
  String get tooManyRequestsWarning =>
      'Tro multaj petoj. Bonvolu reprovi poste!';

  @override
  String get transferFromAnotherDevice => 'Transporti de alia aparato';

  @override
  String get tryToSendAgain => 'Reprovi sendi';

  @override
  String get unavailable => 'Nedisponeble';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username malforbaris uzanton $targetName';
  }

  @override
  String get unblockDevice => 'Malbloki aparaton';

  @override
  String get unknownDevice => 'Nekonata aparato';

  @override
  String get unknownEncryptionAlgorithm => 'Nekonata ĉifra algoritmo';

  @override
  String unknownEvent(String type) {
    return 'Nekonata evento «$type»';
  }

  @override
  String get unmuteChat => 'Malsilentigi babilon';

  @override
  String get unpin => 'Malfiksi';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount nelegitaj babiloj',
      one: '1 nelegita babilo',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username kaj $count aliaj tajpas…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username kaj $username2 tajpas…';
  }

  @override
  String userIsTyping(String username) {
    return '$username tajpas…';
  }

  @override
  String userLeftTheChat(String username) {
    return '$username foriris de la babilo';
  }

  @override
  String get username => 'Uzantonomo';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username sendis eventon de speco $type';
  }

  @override
  String get unverified => 'Unverified';

  @override
  String get verified => 'Kontrolita';

  @override
  String get verify => 'Kontroli';

  @override
  String get verifyStart => 'Komenci kontrolon';

  @override
  String get verifySuccess => 'Vi sukcese kontrolis!';

  @override
  String get verifyTitle => 'Kontrolante alian konton';

  @override
  String get videoCall => 'Vidvoko';

  @override
  String get visibilityOfTheChatHistory => 'Videbleco de historio de la babilo';

  @override
  String get visibleForAllParticipants => 'Videbla al ĉiuj partoprenantoj';

  @override
  String get visibleForEveryone => 'Videbla al ĉiuj';

  @override
  String get voiceMessage => 'Voĉmesaĝo';

  @override
  String get waitingPartnerAcceptRequest =>
      'Atendante konfirmon de peto de la kunulo…';

  @override
  String get waitingPartnerEmoji =>
      'Atendante akcepton de la bildosignoj de la kunulo…';

  @override
  String get waitingPartnerNumbers =>
      'Atendante akcepton de la numeroj, de la kunulo…';

  @override
  String get wallpaper => 'Fonbildo';

  @override
  String get warning => 'Averto!';

  @override
  String get weSentYouAnEmail => 'Ni sendis retleteron al vi';

  @override
  String get whoCanPerformWhichAction => 'Kiu povas kion';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Kiu rajtas aliĝi al ĉi tiu grupo';

  @override
  String get whyDoYouWantToReportThis => 'Kial vi volas tion ĉi raporti?';

  @override
  String get wipeChatBackup =>
      'Ĉu forviŝi la savkopion de via babilo por krei novan sekurecan ŝlosilon?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Per tiuj ĉi adresoj vi povas rehavi vian pasvorton.';

  @override
  String get writeAMessage => 'Skribi mesaĝon…';

  @override
  String get yes => 'Jes';

  @override
  String get you => 'Vi';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Vi ne plu partoprenas ĉi tiun babilon';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Vi estas forbarita de ĉi tiu babilo';

  @override
  String get yourPublicKey => 'Via publika ŝlosilo';

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
