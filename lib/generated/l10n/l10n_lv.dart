// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class L10nLv extends L10n {
  L10nLv([String locale = 'lv']) : super(locale);

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
  String get alwaysUse24HourFormat => 'nē';

  @override
  String get cleanExif => 'Clean EXIF metadata';

  @override
  String get cleanExifDescription =>
      'Remove EXIF metadata (camera model, geolocation, time) when sending a photo.';

  @override
  String get repeatPassword => 'Atkārtot paroli';

  @override
  String get notAnImage => 'Nav attēla datne.';

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
  String get remove => 'Noņemt';

  @override
  String get importNow => 'Ievietot tagad';

  @override
  String get importEmojis => 'Ievietot emocijzīmes';

  @override
  String get importFromZipFile => 'Ievietot no .zip datnes';

  @override
  String get exportEmotePack => 'Izgūt emociju paku kā .zip';

  @override
  String get replace => 'Aizstāt';

  @override
  String get about => 'Par';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Par $homeserver';
  }

  @override
  String get accept => 'Pieņemt';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username pieņēma uzaicinājumu';
  }

  @override
  String get account => 'Konts';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username iespējoja pilnīgu šifrēšanu';
  }

  @override
  String get addEmail => 'Pievienot e-pasta adresi';

  @override
  String get confirmMatrixId =>
      'Lūgums apliecināt savu Matrix Id, lai varētu izdzēst savu kontu.';

  @override
  String supposedMxid(String mxid) {
    return 'Tam būtu jābūt $mxid';
  }

  @override
  String get addChatDescription => 'Pievienot tērzēšanas aprakstu...';

  @override
  String get addToSpace => 'Pievienot vietai';

  @override
  String get admin => 'Pārvaldītājs';

  @override
  String get alias => 'aizstājvārds';

  @override
  String get all => 'Viss';

  @override
  String get allChats => 'Visas tērzēšanas';

  @override
  String get commandHint_roomupgrade =>
      'Uzlabot šo istabu uz norādīto istabas versiju';

  @override
  String get commandHint_googly => 'Nosūtīt izbolītu acu pāri';

  @override
  String get commandHint_cuddle => 'Nosūtīt samīļojienu';

  @override
  String get commandHint_hug => 'Nosūtīt apskāvienu';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName sūta izbolītas acis';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName samīļo Tevi';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName apskauj Tevi';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName atbildēja uz zvanu';
  }

  @override
  String get anyoneCanJoin => 'Ikviens var pievienoties';

  @override
  String get appLock => 'Lietotnes aizslēgšana';

  @override
  String get appLockDescription =>
      'Aizslēgt lietotni, kad tā netiek izmantota, ar PIN kodu';

  @override
  String get archive => 'Arhīvs';

  @override
  String get areGuestsAllowedToJoin =>
      'Vai vieslietotājiem ir ļauts pievienoties';

  @override
  String get areYouSure => 'Vai tiešām?';

  @override
  String get areYouSureYouWantToLogout => 'Vai tiešām atteikties?';

  @override
  String get askSSSSSign =>
      'Lai varētu parakstīt otru cilvēku, lūgums ievadīt savu drošo krātuves paroles vārdkopu vai atkopes atslēgu.';

  @override
  String askVerificationRequest(String username) {
    return 'Pieņemt apliecināšanas pieprasījumu no $username?';
  }

  @override
  String get autoplayImages =>
      'Automātiski atskaņot animētas uzlīmes un emocijas';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Mājasserveris nodrošina pieteikšanās veidus:\n$serverVersions\nSavukārt, šī lietotne atbalsta tikai:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Nosūtīt rakstīšanas paziņojumus';

  @override
  String get swipeRightToLeftToReply =>
      'Pavilkt no labās puses uz kreiso, lai atbildētu';

  @override
  String get sendOnEnter => 'Nosūtīt ar Enter';

  @override
  String badServerVersionsException(String serverVersions,
      String supportedVersions, Object serverVerions, Object suportedVersions) {
    return 'Mājasserveris nodrošina specifikācijas versijas:\n$serverVersions\nSavukārt, lietotne atbalsta tikai $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats tērzēšanas un $participants dalībnieki';
  }

  @override
  String get noMoreChatsFound => 'Vairs netika atrasta neviena tērzēšana...';

  @override
  String get noChatsFoundHere =>
      'Šeit vēl nav tērzēšanu. Jauna saruna ar kādu ir uzsākama ar zemāk esošo pogu. ⤵️';

  @override
  String get joinedChats => 'Tērzēšanas, kurās piedalos';

  @override
  String get unread => 'Nelasītas';

  @override
  String get space => 'Vieta';

  @override
  String get spaces => 'Vietas';

  @override
  String get banFromChat => 'Izslēgt no tērzēšanas';

  @override
  String get banned => 'Izslēgts';

  @override
  String bannedUser(String username, String targetName) {
    return '$username izslēdza $targetName';
  }

  @override
  String get blockDevice => 'Liegt ierīci';

  @override
  String get blocked => 'Liegta';

  @override
  String get botMessages => 'Robotprogrammatūras ziņas';

  @override
  String get cancel => 'Atcelt';

  @override
  String cantOpenUri(String uri) {
    return 'Nevar atvērt adresi $uri';
  }

  @override
  String get changeDeviceName => 'Mainīt ierīces nosaukumu';

  @override
  String changedTheChatAvatar(String username) {
    return '$username nomainīja tērzēšanas attēlu';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username nomainīja tērzēšanas aprakstu uz \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username nomainīja tērzēšanas nosaukumu uz \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username nomainīja tērzēšanas atļaujas';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username nomainīja savu attēlojamo vārdu uz \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username nomainīja viesu piekļuves nosacījumus';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username nomainīja viesu piekļuves nosacījumus uz $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username mainīja vēstures redzamību';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username nomainīja vēstures redzamību uz $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username nomainīja pievienošanās nosacījumus';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username nomainīja pievienošanās nosacījumus uz $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username nomainīja savu attēlu';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username nomainīja istabas aizstājvārdus';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username nomainīja uzaicinājuma saiti';
  }

  @override
  String get changePassword => 'Nomainīt paroli';

  @override
  String get changeTheHomeserver => 'Mainīt mājasserveri';

  @override
  String get changeTheme => 'Mainīt izskatu';

  @override
  String get changeTheNameOfTheGroup => 'Mainīt kopas nosaukumu';

  @override
  String get changeYourAvatar => 'Mainīt savu attēlu';

  @override
  String get channelCorruptedDecryptError => 'Šifrēšana tika bojāta';

  @override
  String get chat => 'Tērzēšana';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Tērzēšanu rezerves kopēšana tika iestatīta.';

  @override
  String get chatBackup => 'Tērzēšanu rezerves kopēšana';

  @override
  String get chatBackupDescription =>
      'Iepriekšējās ziņas ir aizsargātas ar atkopes atslēgu. Lūgums nodrošināt, ka tā netiek pazaudēta.';

  @override
  String get chatDetails => 'Tērzēšanas izvērsums';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'Šai vietai tika pievienota tērzēšana';

  @override
  String get chats => 'Tērzēšanas';

  @override
  String get chooseAStrongPassword => 'Jāizvēlas droša parole';

  @override
  String get clearArchive => 'Iztīrīt arhīvu';

  @override
  String get close => 'Aizvērt';

  @override
  String get commandHint_markasdm =>
      'Atzīmēt kā tiešo ziņu istabu norādītajam Matrix Id';

  @override
  String get commandHint_markasgroup => 'Atzīmēt kā kopu';

  @override
  String get commandHint_ban => 'Izslēgt norādīto lietotāju no šīs istabas';

  @override
  String get commandHint_clearcache => 'Iztīrīt kešatmiņu';

  @override
  String get commandHint_create =>
      'Izveidot tukšu kopas tērzēšanu\nLai atspējotu šifrēšanu, jāizmanto --no-encryption';

  @override
  String get commandHint_discardsession => 'Atmest sesiju';

  @override
  String get commandHint_dm =>
      'Uzsākt tiešu tērzēšanu\nLai atspējotu šifrēšanu, jāizmanto --no-encryption';

  @override
  String get commandHint_html => 'Nosūtīt ar HTML formatētu tekstu';

  @override
  String get commandHint_invite => 'Uzaicināt norādīto lietotāju šajā istabā';

  @override
  String get commandHint_join => 'Pievienoties norādītajai istabai';

  @override
  String get commandHint_kick => 'Noņemt norādīto lietotāju no šīs istabas';

  @override
  String get commandHint_leave => 'Pamest šo istabu';

  @override
  String get commandHint_me => 'Apraksti sevi';

  @override
  String get commandHint_myroomavatar =>
      'Iestatīt savu attēlu šajā istabā (ar mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Iestatīt savu attēlojamo vārdu šajā istabā';

  @override
  String get commandHint_op =>
      'Iestatīt norādītā lietotāja pilnvaru līmeni (noklusējums: 50)';

  @override
  String get commandHint_plain => 'Nosūtīt neformatētu tekstu';

  @override
  String get commandHint_react => 'Nosūtīt atbildi kā reakciju';

  @override
  String get commandHint_send => 'Nosūtīt tekstu';

  @override
  String get commandHint_unban =>
      'Atcelt norādītā lietotāja izslēgšanu no šīs istabas';

  @override
  String get commandInvalid => 'Nederīga komanda';

  @override
  String commandMissing(String command) {
    return '$command nav komanda.';
  }

  @override
  String get compareEmojiMatch => 'Lūgums salīdzināt emocijzīmes';

  @override
  String get compareNumbersMatch => 'Lūgums salīdzināt skaitļus';

  @override
  String get configureChat => 'Konfigurēt tērzēšanu';

  @override
  String get confirm => 'Apstiprināt';

  @override
  String get connect => 'Savienot';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontaktpersona tika uzaicināta kopā';

  @override
  String get containsDisplayName => 'Satur attēlojamo vārdu';

  @override
  String get containsUserName => 'Satur lietotājvārdu';

  @override
  String get contentHasBeenReported =>
      'Par saturu tika ziņos servera pārvaldītājiem';

  @override
  String get copiedToClipboard => 'Ievietots starpliktuvē';

  @override
  String get copy => 'Ievietot starpliktuvē';

  @override
  String get copyToClipboard => 'Ievietot starpliktuvē';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nevarēja atšifrēt ziņu: $error';
  }

  @override
  String countParticipants(int count) {
    return '$count dalībnieki';
  }

  @override
  String get create => 'Izveidot';

  @override
  String createdTheChat(String username) {
    return '💬 $username izveidoja tērzēšanu';
  }

  @override
  String get createGroup => 'Izveidot kopu';

  @override
  String get createNewSpace => 'Jauna vieta';

  @override
  String get currentlyActive => 'Pašreiz darbīgi';

  @override
  String get darkTheme => 'Tumšs';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day.$month.';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day.$month.$year.';
  }

  @override
  String get deactivateAccountWarning =>
      'Tas atspējos Tavu lietotāja kontu. To nevar atdarīt. Vai tiešām?';

  @override
  String get defaultPermissionLevel =>
      'Noklusējuma atļauju līmenis jauniem lietotājiem';

  @override
  String get delete => 'Izdzēst';

  @override
  String get deleteAccount => 'Izdzēst kontu';

  @override
  String get deleteMessage => 'Izdzēst ziņu';

  @override
  String get device => 'Ierīce';

  @override
  String get deviceId => 'Ierīces Id';

  @override
  String get devices => 'Ierīces';

  @override
  String get directChats => 'Tiešās tērzēšanas';

  @override
  String get allRooms => 'Visas kopu tērzēšanas';

  @override
  String get displaynameHasBeenChanged => 'Attēlojamais vārds tika nomainīts';

  @override
  String get downloadFile => 'Lejupielādēt datni';

  @override
  String get edit => 'Labot';

  @override
  String get editBlockedServers => 'Labot liegtos serverus';

  @override
  String get chatPermissions => 'Tērzēšanas atļaujas';

  @override
  String get chatThreads => 'Threads';

  @override
  String get chatThreadsDescription => 'See all threads in this room';

  @override
  String get editDisplayname => 'Labot attēlojamo vārdu';

  @override
  String get editRoomAliases => 'Labot istabu aizstājvārdus';

  @override
  String get editRoomAvatar => 'Labot istabas attēlu';

  @override
  String get emoteExists => 'Emocija jau pastāv.';

  @override
  String get emoteInvalid => 'Nederīgs emocijas īskods.';

  @override
  String get emoteKeyboardNoRecents =>
      'Nesen izmantotās emocijas parādīsies šeit...';

  @override
  String get emotePacks => 'Emociju pakas istabai';

  @override
  String get emoteSettings => 'Emociju iestatījumi';

  @override
  String get globalChatId => 'Vispārējais tērzēšanas Id';

  @override
  String get accessAndVisibility => 'Piekļuve un redzamība';

  @override
  String get accessAndVisibilityDescription =>
      'Kam ir ļauts pievienoties šai tērzēšanai un kā tērzēšana var tikt atklāta.';

  @override
  String get calls => 'Zvani';

  @override
  String get customEmojisAndStickers => 'Pielāgotas emocijzīmes un uzlīmes';

  @override
  String get customEmojisAndStickersBody =>
      'Pievienot vai kopīgot pielāgotas emocijzīmes vai uzlīmes, kas var tikt izmantotas jebkurā tērzēšanā.';

  @override
  String get emoteShortcode => 'Emocijas īskods';

  @override
  String get emoteWarnNeedToPick =>
      'Nepieciešams izvēlēties emocijas īskodu un attēlu.';

  @override
  String get emptyChat => 'Tukša tērzēšana';

  @override
  String get enableEmotesGlobally => 'Iespējot kā vispārēju emociju paku';

  @override
  String get enableEncryption => 'Iespējot šifrēšanu';

  @override
  String get enableEncryptionWarning =>
      'Vairs nebūs iespējams atspējot šifrēšanu. Vai tiešām to darīt?';

  @override
  String get encrypted => 'Šifrēta';

  @override
  String get encryption => 'Šifrēšana';

  @override
  String get encryptionNotEnabled => 'Šifrēšana nav iespējota';

  @override
  String endedTheCall(String senderName) {
    return '$senderName beidza zvanu';
  }

  @override
  String get enterAnEmailAddress => 'Jāievada e-pasta adrese';

  @override
  String get homeserver => 'Mājasserveris';

  @override
  String get enterYourHomeserver => 'Jāievada mājasserveris';

  @override
  String errorObtainingLocation(String error) {
    return 'Kļūda atrašanās vietas iegūšanā: $error';
  }

  @override
  String get everythingReady => 'Viss ir gatavs!';

  @override
  String get extremeOffensive => 'Īpaši aizskarošs';

  @override
  String get fileName => 'Datnes nosaukums';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Fonta izmērs';

  @override
  String get forward => 'Pārsūtīt';

  @override
  String get fromJoining => 'No pievienošanās';

  @override
  String get fromTheInvitation => 'No uzaicinājuma';

  @override
  String get goToTheNewRoom => 'Doties uz jauno istabu';

  @override
  String get group => 'Kopa';

  @override
  String get chatDescription => 'Tērzēšanas apraksts';

  @override
  String get chatDescriptionHasBeenChanged =>
      'Tērzēšanas apraksts ir mainījies';

  @override
  String get groupIsPublic => 'Kopa ir publiska';

  @override
  String get groups => 'Kopas';

  @override
  String groupWith(String displayname) {
    return 'Kopa ar $displayname';
  }

  @override
  String get guestsAreForbidden => 'Viesi nav ļauti';

  @override
  String get guestsCanJoin => 'Viesi var pievienoties';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username atsauca uzaicinājumu $targetName';
  }

  @override
  String get help => 'Palīdzība';

  @override
  String get hideRedactedEvents => 'Paslēpt labošanas notikumus';

  @override
  String get hideRedactedMessages => 'Paslēpt labošanas ziņas';

  @override
  String get hideRedactedMessagesBody =>
      'Ja kāds labo ziņu, tā vairs nebūs redzama tērzēšanā.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Paslēpt nederīgus vai nezināmus ziņu formātus';

  @override
  String get howOffensiveIsThisContent => 'Cik aizskarošs ir šis saturs?';

  @override
  String get id => 'Id';

  @override
  String get identity => 'Identitāte';

  @override
  String get block => 'Izslēgt';

  @override
  String get blockedUsers => 'Atslēgtie lietotāji';

  @override
  String get blockListDescription =>
      'Ir iespējams atslēgt traucējošus lietotājus. Nebūs iespējams saņem jebkādas ziņas vai uzaicinājumus uz istabām no lietotājiem, kas ir personīgajā izslēgšanas sarakstā.';

  @override
  String get blockUsername => 'Neņemt vērā lietotājvārdu';

  @override
  String get iHaveClickedOnLink => 'Es uzklikšķināju uz saites';

  @override
  String get incorrectPassphraseOrKey =>
      'Nepareiza paroles vārdkopa vai atkopes atslēga';

  @override
  String get inoffensive => 'Nav aizskarošs';

  @override
  String get inviteContact => 'Uzaicināt kontaktpersonu';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Vai vēlies uzaicināt $contact uz tērzēšanu \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Uzaicināt kontaktpersonu $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Tērzēšanas apraksts vēl nav izveidots.';

  @override
  String get tryAgain => 'Jāmēģina vēlreiz';

  @override
  String get invalidServerName => 'Nederīgs servera nosaukums';

  @override
  String get invited => 'Uzaicināts';

  @override
  String get redactMessageDescription =>
      'Ziņa tiks labota visiem šīs sarunas dalībniekiem. To nevar atdarīt.';

  @override
  String get optionalRedactReason => '(Pēc izvēles) Ziņas labošanas iemesls...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username uzaicināja $targetName';
  }

  @override
  String get invitedUsersOnly => 'Tikai uzaicināti lietotāji';

  @override
  String get inviteForMe => 'Uzaicinājums man';

  @override
  String inviteText(String username, String link) {
    return '$username uzaicināja pievienoties FluffyChat.\n1. Jāapmeklē fluffychat.im un jāuzstāda lietotne \n2. Jāizveido konts vai jāpiesakās \n3. Jāatver uzaicinājuma saite: \n $link';
  }

  @override
  String get isTyping => 'raksta…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username pievienojās tērzēšanai';
  }

  @override
  String get joinRoom => 'Pievienoties istabai';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username izmeta $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username izmeta $targetName un liedza piekļuvi';
  }

  @override
  String get kickFromChat => 'Izmest no tērzēšanas';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Pēdējoreiz tiešsaistē: $localizedTimeShort';
  }

  @override
  String get leave => 'Pamest';

  @override
  String get leftTheChat => 'Pameta tērzēšanu';

  @override
  String get license => 'Licence';

  @override
  String get lightTheme => 'Gaišs';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Ielādēt vēl $count dalībniekus';
  }

  @override
  String get dehydrate => 'Izgūt sesiju un iztīrīt ierīci';

  @override
  String get dehydrateWarning =>
      'Šī darbība nav atdarāma. Jānodrošina, ka rezerves kopijas datne tiek droši uzglabāta.';

  @override
  String get dehydrateTor => 'TOR lietotāji: izgūt sesiju';

  @override
  String get dehydrateTorLong =>
      'TOR lietotājiem ir ieteicams izgūt sesiju pirms loga aizvēršanas.';

  @override
  String get hydrateTor => 'TOR lietotāji: ievietot sesijas izguvi';

  @override
  String get hydrateTorLong =>
      'Vai sesija pēdējoreiz tika izgūta TOR? Ātri ievieto to un turpini tērzēšanu!';

  @override
  String get hydrate => 'Atjaunot no rezerves kopijas datnes';

  @override
  String get loadingPleaseWait => 'Ielādē... Lūgums uzgaidīt.';

  @override
  String get loadMore => 'Ielādēt vēl…';

  @override
  String get locationDisabledNotice =>
      'Atrašanās vietas pakalpojumi ir atspējoti. Lūgums tos iespējot, lai būtu iespējams kopīgot savu atrašanās vietu.';

  @override
  String get locationPermissionDeniedNotice =>
      'Atrašanās vietas atļauja noliegta. Lūgums nodrošināt to, lai būtu iespējams kopīgot savu atrašanās vietu.';

  @override
  String get login => 'Pieteikties';

  @override
  String logInTo(String homeserver) {
    return 'PIeteikties $homeserver';
  }

  @override
  String get logout => 'Atteikties';

  @override
  String get memberChanges => 'Dalībnieku izmaiņas';

  @override
  String get mention => 'Pieminēt';

  @override
  String get messages => 'Ziņas';

  @override
  String get messagesStyle => 'Ziņas:';

  @override
  String get moderator => 'Moderators';

  @override
  String get muteChat => 'Apklusināt tērzēšanu';

  @override
  String get needPantalaimonWarning =>
      'Lūgums ņemt vērā, ka pagaidām ir nepieciešams Pantalaimon, lai izmantotu pilnīgu šifrēšanu.';

  @override
  String get newChat => 'Jauna tērzēšana';

  @override
  String get newMessageInFluffyChat => '💬 Jauna ziņa FluffyChat';

  @override
  String get newVerificationRequest => 'Jauns apliecināšanas pieprasījums.';

  @override
  String get next => 'Nākamais';

  @override
  String get no => 'Nē';

  @override
  String get noConnectionToTheServer => 'Nav savienojuma ar serveri';

  @override
  String get noEmotesFound => 'Netika atrasta neviena emocija. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Šifrēšanu var iespējot tikai tad, kad istaba vairs nav publiski pieejama.';

  @override
  String get noGoogleServicesWarning =>
      'Izskatās, ka Firebase mākoņziņojumapmaiņa nav pieejama šajā ierīcē. Lai joprojām saņemtu pašpiegādes paziņojumus, mēs iesakām uzstādīt ntfy. Ar ntfy vai citu Vienotās pašpiegādes nodrošinātāju ir iespējams saņemt pašpiegādes paziņojumus drošā veidā. ntfy var lejupielādēt no PlayStore vai F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 nav Matrix serveris, tā vietā izmantot $server2?';
  }

  @override
  String get shareInviteLink => 'Kopīgot uzaicinājuma saiti';

  @override
  String get scanQrCode => 'Nolasīt kvadrātkodu';

  @override
  String get none => 'Neviens';

  @override
  String get noPasswordRecoveryDescription =>
      'Vēl nav pievienots paroles atjaunošanas veids.';

  @override
  String get noPermission => 'Nav atļaujas';

  @override
  String get noRoomsFound => 'Istabas netika atrastas…';

  @override
  String get notifications => 'Paziņojumi';

  @override
  String get notificationsEnabledForThisAccount =>
      'Paziņojumi iespējoti šim kontam';

  @override
  String numUsersTyping(int count) {
    return '$count lietotāji raksta…';
  }

  @override
  String get obtainingLocation => 'Iegūst atrašanās vietu…';

  @override
  String get offensive => 'Aizskarošs';

  @override
  String get offline => 'Bezsaistē';

  @override
  String get ok => 'Labi';

  @override
  String get online => 'Tiešsaistē';

  @override
  String get onlineKeyBackupEnabled =>
      'Tiešsaistes atslēgas rezerves kopēšana ir iespējota';

  @override
  String get oopsPushError =>
      'Ups! Diemžēl atgadījās kļūda pašpiegādes paziņojumu iestatīšanas laikā.';

  @override
  String get oopsSomethingWentWrong => 'Ups! Kaut kas nogāja greizi…';

  @override
  String get openAppToReadMessages => 'Atvērt lietotni, lai lasītu ziņas';

  @override
  String get openCamera => 'Atvērt kameru';

  @override
  String get openVideoCamera => 'Atvērt kameru video uzņemšanai';

  @override
  String get oneClientLoggedOut => 'Viens no klientiem ir atteicies';

  @override
  String get addAccount => 'Pievienot kontu';

  @override
  String get editBundlesForAccount => 'Labot šī konta komplektus';

  @override
  String get addToBundle => 'Pievienot komplektam';

  @override
  String get removeFromBundle => 'Noņemt no šī komplekta';

  @override
  String get bundleName => 'Komplekta nosaukums';

  @override
  String get enableMultiAccounts =>
      '(BETA) Iespējot vairākus kontus šajā ierīcē';

  @override
  String get openInMaps => 'Atvērt kartēs';

  @override
  String get link => 'Saite';

  @override
  String get serverRequiresEmail =>
      'Šim serverim ir nepieciešams pārbaudīt Tavu e-pasta adresi reģistrācijai.';

  @override
  String get or => 'Vai';

  @override
  String get participant => 'Dalībnieks';

  @override
  String get passphraseOrKey => 'paroles vārdkopa vai atkopes atslēga';

  @override
  String get password => 'Parole';

  @override
  String get downloads => 'Downloads';

  @override
  String get passwordForgotten => 'Aizmirsta parole';

  @override
  String get passwordHasBeenChanged => 'Parole tikai nomainīta';

  @override
  String get hideMemberChangesInPublicChats =>
      'Paslēpt dalībnieku izmaiņas publiskajās tērzēšanās';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Nerādīt tērzēšanas plūsmā, ja kāds pievienojas publiskai tērzēšanai vai pamet to, lai uzlabotu lasāmību.';

  @override
  String get overview => 'Pārskats';

  @override
  String get notifyMeFor => 'Paziņot man par';

  @override
  String get passwordRecoverySettings => 'Paroles atkopes iestatījumi';

  @override
  String get passwordRecovery => 'Paroles atkope';

  @override
  String get people => 'Cilvēki';

  @override
  String get pickImage => 'Izvēlēties attēlu';

  @override
  String get pin => 'PIN';

  @override
  String play(String fileName) {
    return 'Atskaņot $fileName';
  }

  @override
  String get pleaseChoose => 'Lūgums izvēlēties';

  @override
  String get pleaseChooseAPasscode => 'Lūgums izvēlēties piekļuves kodu';

  @override
  String get pleaseClickOnLink =>
      'Lūgums klikšķināt uz saites e-pastā un tad turpināt.';

  @override
  String get pleaseEnter4Digits =>
      'Lūgums ievadīt 4 ciparus vai atstāt tukšu, lai atspējotu lietotnes slēgu.';

  @override
  String get pleaseEnterRecoveryKey => 'Lūgums ievadīt savu atkopes atslēgu:';

  @override
  String get pleaseEnterYourPassword => 'Lūgums ievadīt savu paroli';

  @override
  String get pleaseEnterYourPin => 'Lūgums ievadīt savu PIN';

  @override
  String get pleaseEnterYourUsername => 'Lūgums ievadīt savu lietotājvārdu';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Lūgums sekot norādēm tīmekļvietnē un piesist \"Nākamais\".';

  @override
  String get privacy => 'Privātums';

  @override
  String get publicRooms => 'Publiskas istabas';

  @override
  String get pushRules => 'Pašpiegādes nosacījumi';

  @override
  String get reason => 'Iemesls';

  @override
  String get recording => 'Ieraksta';

  @override
  String redactedBy(String username) {
    return 'Laboja $username';
  }

  @override
  String get directChat => 'Tiešā tērzēšana';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Laboja $username, jo: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username laboja notikumu';
  }

  @override
  String get redactMessage => 'Labot ziņu';

  @override
  String get register => 'Reģistrēties';

  @override
  String get reject => 'Noraidīt';

  @override
  String rejectedTheInvitation(String username) {
    return '$username noraidīja uzaicinājumu';
  }

  @override
  String get rejoin => 'Pievienoties atkārtoti';

  @override
  String get removeAllOtherDevices => 'Noņemt visas pārējās ierīces';

  @override
  String removedBy(String username) {
    return 'Noņēma $username';
  }

  @override
  String get removeDevice => 'Noņemt ierīci';

  @override
  String get unbanFromChat => 'Atcelt liegumu tērzēšanā';

  @override
  String get removeYourAvatar => 'Noņemt savu attēlu';

  @override
  String get replaceRoomWithNewerVersion =>
      'Aizvietot istabu ar jaunāku versiju';

  @override
  String get reply => 'Atbildēt';

  @override
  String get reportMessage => 'Ziņot par ziņu';

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
  String get requestPermission => 'Pieprasīt atļauju';

  @override
  String get roomHasBeenUpgraded => 'Istaba tika atjaunināta';

  @override
  String get roomVersion => 'Istabas versija';

  @override
  String get saveFile => 'Saglabāt datni';

  @override
  String get retry => 'Retry';

  @override
  String get search => 'Meklēt';

  @override
  String get security => 'Drošība';

  @override
  String get recoveryKey => 'Atkopes atslēga';

  @override
  String get recoveryKeyLost => 'Pazaudēta atkopes atslēga?';

  @override
  String seenByUser(String username) {
    return '$username redzēja';
  }

  @override
  String get send => 'Nosūtīt';

  @override
  String get sendAMessage => 'Nosūtīt ziņu';

  @override
  String get sendAsText => 'Nosūtīt kā tekstu';

  @override
  String get sendAudio => 'Nosūtīt skaņu';

  @override
  String get sendFile => 'Nosūtīt datni';

  @override
  String get sendImage => 'Nosūtīt attēlu';

  @override
  String sendImages(int count) {
    return 'Nosūtīt $count attēlu(s)';
  }

  @override
  String get sendMessages => 'Nosūtīt ziņas';

  @override
  String get sendOriginal => 'Nosūtīt sākotnējo';

  @override
  String get sendSticker => 'Nosūtīt uzlīmi';

  @override
  String get sendVideo => 'Nosūtīt video';

  @override
  String sentAFile(String username) {
    return '📁 $username nosūtīja datni';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username nosūtīja skaņu';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username nosūtīja attēlu';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username nosūtīja uzlīmi';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username nosūtīja video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName nosūtīja informāciju par zvanu';
  }

  @override
  String get separateChatTypes => 'Atdalīt tiešās tērzēšanas un kopas';

  @override
  String get setAsCanonicalAlias => 'Iestatīt kā galveno aizstājvārdu';

  @override
  String get setCustomEmotes => 'Iestatīt pielāgotas emocijas';

  @override
  String get setChatDescription => 'Iestatīt tērzēšanas aprakstu';

  @override
  String get setInvitationLink => 'Iestatīt uzaicinājumu saiti';

  @override
  String get setPermissionsLevel => 'Iestatīt atļauju līmeni';

  @override
  String get setStatus => 'Iestatīt stāvokli';

  @override
  String get settings => 'Iestatījumi';

  @override
  String get share => 'Kopīgot';

  @override
  String sharedTheLocation(String username) {
    return '$username kopīgoja savu atrašanās vietu';
  }

  @override
  String get shareLocation => 'Kopīgot atrašanās vietu';

  @override
  String get showPassword => 'Rādīt paroli';

  @override
  String get presenceStyle => 'Klātesamība:';

  @override
  String get hideAvatarsInInvites => 'Hide avatars in invites';

  @override
  String get hideAvatarsInInvitesDescription =>
      'Do not show room avatars in invites';

  @override
  String get presencesToggle => 'Rādīt citu lietotāju stāvokļa ziņas';

  @override
  String get pureBlackToggle => 'Pure Black';

  @override
  String get singlesignon => 'Vienotā pieteikšanās';

  @override
  String get skip => 'Izlaist';

  @override
  String get sourceCode => 'Pirmkods';

  @override
  String get spaceIsPublic => 'Vieta ir publiska';

  @override
  String get spaceName => 'Vietas nosaukums';

  @override
  String startedACall(String senderName) {
    return '$senderName uzsāka zvanu';
  }

  @override
  String get startFirstChat => 'Uzsāc savu pirmo tērzēšanu';

  @override
  String get status => 'Stāvoklis';

  @override
  String get statusExampleMessage => 'Kā Tev šodien klājas?';

  @override
  String get submit => 'Iesniegt';

  @override
  String get synchronizingPleaseWait => 'Sinhronizē... Lūgums uzgaidīt.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Sinhronizē... ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistēmas';

  @override
  String get theyDontMatch => 'Tās nesakrīt';

  @override
  String get theyMatch => 'Tās sakrīt';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Pārslēgt iecienīto';

  @override
  String get toggleMuted => 'Pārslēgt apklusināšanu';

  @override
  String get toggleUnread => 'Atzīmēt kā lasītu/nelasītu';

  @override
  String get tooManyRequestsWarning =>
      'Pārāk daudz pieprasījumu. Lūgums vēlāk mēģināt vēlreiz.';

  @override
  String get transferFromAnotherDevice => 'Pārnest no citas ierīces';

  @override
  String get tryToSendAgain => 'Mēģināt nosūtīt vēlreiz';

  @override
  String get unavailable => 'Nav pieejams';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username atcēla $targetName piekļuves liegumu';
  }

  @override
  String get unblockDevice => 'Atslēgt ierīci';

  @override
  String get unknownDevice => 'Nezināma ierīce';

  @override
  String get unknownEncryptionAlgorithm => 'Nezināms šifrēšanas algoritms';

  @override
  String unknownEvent(String type) {
    return 'Nezināms notikums \'$type\'';
  }

  @override
  String get unmuteChat => 'Atcelt tērzēšanas apklusināšanu';

  @override
  String get unpin => 'Atspraust';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount nelasītas tērzēšanas',
      one: '$unreadCount nelasīta tērzēšana',
      zero: '$unreadCount nelasītu tērzēšanu',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username un $count citi raksta…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username un $username2 raksta…';
  }

  @override
  String userIsTyping(String username) {
    return '$username raksta…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username pameta tērzēšanu';
  }

  @override
  String get username => 'Lietotājvārds';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username nosūtīja notikumu $type';
  }

  @override
  String get unverified => 'Neapliecināta';

  @override
  String get verified => 'Apliecināta';

  @override
  String get verify => 'Apliecināt';

  @override
  String get verifyStart => 'Uzsākt apliecināšanu';

  @override
  String get verifySuccess => 'Apliecināšana bija sekmīga.';

  @override
  String get verifyTitle => 'Apliecina citu kontu';

  @override
  String get videoCall => 'Videozvans';

  @override
  String get visibilityOfTheChatHistory => 'Tērzēšanas vēstures redzamība';

  @override
  String get visibleForAllParticipants => 'Redzama visiem dalībniekiem';

  @override
  String get visibleForEveryone => 'Redzama visiem';

  @override
  String get voiceMessage => 'Balss ziņa';

  @override
  String get waitingPartnerAcceptRequest =>
      'Gaida, līdz biedrs apstiprinās pieprasījumu…';

  @override
  String get waitingPartnerEmoji =>
      'Gaida, līdz biedrs apstiprinās emocijzīmi…';

  @override
  String get waitingPartnerNumbers =>
      'Gaida, līdz biedrs apstiprinās skaitļus…';

  @override
  String get wallpaper => 'Ekrāntapete:';

  @override
  String get warning => 'Uzmanību!';

  @override
  String get weSentYouAnEmail => 'Mēs nosūtīja e-pasta ziņu';

  @override
  String get whoCanPerformWhichAction => 'Kurš var veikt kādas darbības';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Kuram ir ļauts pievienoties šai kopai';

  @override
  String get whyDoYouWantToReportThis => 'Kādēļ vēlies ziņot par šo?';

  @override
  String get wipeChatBackup =>
      'Notīrīt tērzēšanu rezerves kopiju, lai izveidotu jaunu atkopes atslēgu?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Ar šīm adresēm var atjaunot savu paroli.';

  @override
  String get writeAMessage => 'Rakstīt ziņu…';

  @override
  String get yes => 'Jā';

  @override
  String get you => 'Tu';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Tu vairs nepiedalies šajā tērzēšanā';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Tev tika liegta piekļuve šai tērzēšanai';

  @override
  String get yourPublicKey => 'Tava publiskā atslēga';

  @override
  String get messageInfo => 'Informācija par ziņu';

  @override
  String get time => 'Laiks';

  @override
  String get messageType => 'Ziņas veids';

  @override
  String get sender => 'Sūtītājs';

  @override
  String get openGallery => 'Atvērt galeriju';

  @override
  String get removeFromSpace => 'Noņemt no vietas';

  @override
  String get addToSpaceDescription =>
      'Atlasīt vietu, kurai pievienot šo tērzēšanu.';

  @override
  String get start => 'Uzsākt';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Lai atslēgtu savas vecās ziņas, lūgums ievadīt savu atkopes atslēgu, kas tika izveidota iepriekšējā sesijā. Atkopes atslēga NAV parole.';

  @override
  String get publish => 'Publicēt';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Atvērt tērzēšanu';

  @override
  String get markAsRead => 'Atzīmēt kā lasītu';

  @override
  String get reportUser => 'Ziņot par lietotāju';

  @override
  String get dismiss => 'Atmest';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender atsaucās ar $reaction';
  }

  @override
  String get pinMessage => 'Piespraust istabai';

  @override
  String get confirmEventUnpin =>
      'Vai tiešām neatgriezeniski atspraust šo notikumu?';

  @override
  String get emojis => 'Emocijzīmes';

  @override
  String get placeCall => 'Veikt zvanu';

  @override
  String get voiceCall => 'Balss zvans';

  @override
  String get unsupportedAndroidVersion => 'Neatbalstīta Android versija';

  @override
  String get unsupportedAndroidVersionLong =>
      'Šai iespējai ir nepieciešama jaunāka Android versija. Lūgums pārbaudīt atjauninājumus vai Lineage OS atbalstu.';

  @override
  String get videoCallsBetaWarning =>
      'Lūgums ņemt vērā, ka video zvani pašreiz ir beta stāvoklī. Tie visās platformās var nedarboties kā paredzēs vai pat nedarboties vispār.';

  @override
  String get experimentalVideoCalls => 'Izmēģinājuma video zvani';

  @override
  String get emailOrUsername => 'E-pasta adrese vai lietotājvārds';

  @override
  String get indexedDbErrorTitle => 'Privātā režīma nebūšanas';

  @override
  String get indexedDbErrorLong =>
      'Diemžēl ziņu krātuve pēc noklusējuma nav iespējota privātajā režīmā.\nLūgums apmeklēt\n - about:config\n - iestatīt dom.indexedDB.privateBrowsing.enabled kā true\nPretējā gadījumā nav iespējams palaist FluffyChat.';

  @override
  String switchToAccount(String number) {
    return 'Pārslēgties uz kontu $number';
  }

  @override
  String get nextAccount => 'Nākamais konts';

  @override
  String get previousAccount => 'Iepriekšējais konts';

  @override
  String get addWidget => 'Pievienot logrīku';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Teksta piezīme';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Pielāgots';

  @override
  String get widgetName => 'Nosaukums';

  @override
  String get widgetUrlError => 'Tas nav derīgs URL.';

  @override
  String get widgetNameError => 'Lūgums norādīt attēlojamo nosaukumu.';

  @override
  String get errorAddingWidget => 'Kļūda logrīka pievienošanā.';

  @override
  String get youRejectedTheInvitation => 'Tu noraidīji uzaicinājumu';

  @override
  String get youJoinedTheChat => 'Tu pievienojies tērzēšanai';

  @override
  String get youAcceptedTheInvitation => '👍 Tu pieņēmi uzaicinājumu';

  @override
  String youBannedUser(String user) {
    return 'Tu $user liedzi piekļuvi';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Tu atsauci $user uzaicinājumu';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Tu tiki uzaicināts ar saiti:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 $user Tevi uzaicināja';
  }

  @override
  String invitedBy(String user) {
    return '📩 $user uzaicināja';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Tu uzaicināji $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Tu izraidīji $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Izraidīji $user un liedzi piekļuvi';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Tu atcēli $user piekļuves liegumu';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user pieklauvēja';
  }

  @override
  String get usersMustKnock => 'Lietotājiem jāpieklauvē';

  @override
  String get noOneCanJoin => 'Neviens nevar pievienoties';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user vēlas pievienoties tērzēšanai.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Vēl nav izveidota neviena publiska saite';

  @override
  String get knock => 'Pieklauvēt';

  @override
  String get users => 'Lietotāji';

  @override
  String get unlockOldMessages => 'Atslēgt vecās ziņas';

  @override
  String get storeInSecureStorageDescription =>
      'Glabāt atkopes atslēgu šīs ierīces drošajā krātuvē.';

  @override
  String get saveKeyManuallyDescription =>
      'Šo atslēgu var pašrocīgi saglabāt ar sistēmas kopīgošanas dialogloga vai starpliktuves izsaukšanu.';

  @override
  String get storeInAndroidKeystore => 'Glabāt Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Glabāt Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Droši uzglabāt šajā ierīcē';

  @override
  String countFiles(int count) {
    return '$count datnes';
  }

  @override
  String get user => 'Lietotājs';

  @override
  String get custom => 'Pielāgots';

  @override
  String get foregroundServiceRunning =>
      'Šis paziņojums parādās, kad darbojas priekšplāna pakalpojums.';

  @override
  String get screenSharingTitle => 'ekrāna kopīgošana';

  @override
  String get screenSharingDetail => 'Tu kopīgo savu ekrānu FluffyChat';

  @override
  String get callingPermissions => 'Zvanīšanas atļaujas';

  @override
  String get callingAccount => 'Zvanīšanas konts';

  @override
  String get callingAccountDetails =>
      'Ļauj FluffyChat izmantot iebūvēto Android zvanīšanas lietotni.';

  @override
  String get appearOnTop => 'Parādīt virspusē';

  @override
  String get appearOnTopDetails =>
      'Ļauj lietotnei parādīties virspusē (nav nepieciešams, ja FluffyChat jau ir iestatīts kā zvanīšanas konts)';

  @override
  String get otherCallingPermissions =>
      'Mikrofons, kamera un citas FluffyChat atļaujas';

  @override
  String get whyIsThisMessageEncrypted => 'Kādēļ šī ziņa ir nelasāma?';

  @override
  String get noKeyForThisMessage =>
      'Tā var notikt, ja ziņa tika nosūtīta, pirms pieteicies savā kontā šajā ierīcē.\n\nIr arī iespējams, ka sūtītājs noliedza Tavu ierīci vai kaut kas nogāja greizi ar interneta savienojumu.\n\nVai ziņas ir lasāmas citā sesijā? Tad Tu vari pārsūtīt ziņu no tās. Jādodas uz Iestatījumi > Ierīces un jāpārliecinās, ka ierīces viena otru ir apliecinājušas. Kad nākamreiz atvērsi istabu un abas sesijas būs priekšplānā, atslēgas tiks automātiski pārsūtītas.\n\nVai nevēlies zaudēt atslēgas, kad atsakies vai maini ierīces? Jāpārliecinās, ka iestatījumos ir iespējota tērzēšanu rezerves kopija.';

  @override
  String get newGroup => 'Jauna kopa';

  @override
  String get newSpace => 'Jauna vieta';

  @override
  String get enterSpace => 'Ieiet vietā';

  @override
  String get enterRoom => 'Ieiet istabā';

  @override
  String get allSpaces => 'Visas vietas';

  @override
  String numChats(String number) {
    return '$number tērzēšanas';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Paslēpt nebūtiskus stāvokļa notikumus';

  @override
  String get hidePresences => 'Paslēpt stāvokļu sarakstu?';

  @override
  String get doNotShowAgain => 'Vairs nerādīt';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Tukša tērzēšana (bija $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Vietas ļauj apvienot tērzēšanas un būvēt privātas vai publiskas kopienas.';

  @override
  String get encryptThisChat => 'Šifrēt šo tērzēšanu';

  @override
  String get disableEncryptionWarning =>
      'Drošības iemeslu dēļ tērzēšanā nevar atspējot šifrēšanu, ja tā ir pirms tam ir bijusi iespējota.';

  @override
  String get sorryThatsNotPossible => 'Atvaino! Tas nav iespējams';

  @override
  String get deviceKeys => 'Ierīces atslēgas:';

  @override
  String get reopenChat => 'Atkārtoti atvērt tērzēšanu';

  @override
  String get noBackupWarning =>
      'Uzmanību! Bez tērzēšanu rezerves kopiju veidošanas iespējošanas tiks zaudēta piekļuve savām šifrētajām ziņām. Ir ļoti ieteicams iespējot tērzēšanu rezerves kopiju veidošanu pirms atteikšanās.';

  @override
  String get noOtherDevicesFound => 'Netika atrastas citas ierīces';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Nevar nosūtīt. Serveris nodrošina pielikums līdz $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Datne tika saglabāta $path';
  }

  @override
  String get jumpToLastReadMessage => 'Pārlēkt uz pēdējo izlasīto ziņu';

  @override
  String get readUpToHere => 'Izlasīts līdz šejienei';

  @override
  String get jump => 'Pārlēkt';

  @override
  String get openLinkInBrowser => 'Atvērt saiti pārlūkā';

  @override
  String get reportErrorDescription =>
      '😭 Ak nē! Kaut kas nogāja greizi. Ja ir vēlēšanas, par šo nepilnību var ziņot izstrādātājiem.';

  @override
  String get report => 'ziņot';

  @override
  String get signInWithPassword => 'Pieteikties ar paroli';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Lūgums vēlāk mēģināt vēlreiz vai izvēlēties citu serveri.';

  @override
  String signInWith(String provider) {
    return 'Pieteikties ar $provider';
  }

  @override
  String get profileNotFound =>
      'Lietotāju serverī nevarēja atrast. Varbūt ir nebūšanas ar savienojumu vai lietotājs nepastāv.';

  @override
  String get setTheme => 'Iestatīt izskatu:';

  @override
  String get setColorTheme => 'Iestatīt krāsu izskatu:';

  @override
  String get invite => 'Uzaicināt';

  @override
  String get inviteGroupChat => '📨 Uzaicināt kopas tērzēšanu';

  @override
  String get invitePrivateChat => '📨 Uzaicināt privātu tērzēšanu';

  @override
  String get invalidInput => 'Nederīga ievade.';

  @override
  String wrongPinEntered(int seconds) {
    return 'Ievadīts nepareizs PIN. Lūgums mēģināt vēlreiz pēc $seconds sekundēm...';
  }

  @override
  String get pleaseEnterANumber => 'Lūgums ievadīt skaitli lielāku par 0';

  @override
  String get archiveRoomDescription =>
      'Tērzēšana tiks pārvietota uz arhīvu. Citi lietotāji redzēs, ka pameti tērzēšanu.';

  @override
  String get roomUpgradeDescription =>
      'Tērzēšana tad tiks atkārtoti izveidota ar jauno istabas versiju. Visiem dalībniekiem tiks paziņots, ka viņiem ir jāpārslēdzas uz jauno tērzēšanu. Vairāk par istabu versijām var atrast https://spec.matrix.org/latest/rooms/';

  @override
  String get removeDevicesDescription =>
      'Tu tiksi izrakstīts no šīs ierīces un vairs nevarēsi saņemt ziņas.';

  @override
  String get banUserDescription =>
      'Lietotājam tiks liegta piekļuve tērzēšanai, un vairs nevarēs vēlreiz pievienoties tērzēšanai, līdz liegums tiks atcelts.';

  @override
  String get unbanUserDescription =>
      'Lietotājs varēs atkal pievienoties tērzēšanai, ja mēģinās.';

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
      'Lietotājs ir izmests no tērzēšanas, bet piekļuve nav liegta. Publiskās tērzēšanās lietotājs var atkārtoti pievienoties jebkurā laikā.';

  @override
  String get makeAdminDescription =>
      'Tiklīdz šis lietotājs tiks padarīts par pārvaldītāju, to vairs nevarēs atdarīt, jo tad tam būs tādas pašas atļaujas kā Tev.';

  @override
  String get pushNotificationsNotAvailable =>
      'Pašpiegādes paziņojumi nav pieejami';

  @override
  String get learnMore => 'Uzzināt vairāk';

  @override
  String get yourGlobalUserIdIs => 'Vispārējais lietotāja Id ir: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Diemžēl ar \"$query\" netika atrasts neviens lietotājs. Lūgums pārbaudīt, vai ir pieļauta drukas kļūda.';
  }

  @override
  String get knocking => 'Klauvē';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Tērzēšana var tikt atklāta ar meklēšanu $server';
  }

  @override
  String get searchChatsRooms => 'Meklēt #tērzēšanas, @lietotājus...';

  @override
  String get nothingFound => 'Nekas netika atrasts...';

  @override
  String get groupName => 'Kopas nosaukums';

  @override
  String get createGroupAndInviteUsers =>
      'Izveidot kopu un uzaicināt lietotājus';

  @override
  String get groupCanBeFoundViaSearch => 'Kopu var atrast meklēšanā';

  @override
  String get wrongRecoveryKey =>
      'Atvaino... Nešķiet, ka šī būtu pareiza atkopes atslēga.';

  @override
  String get startConversation => 'Uzsākt sarunu';

  @override
  String get commandHint_sendraw => 'Nosūtīt neapstrādātu JSON';

  @override
  String get databaseMigrationTitle => 'Datubāze ir optimizēta';

  @override
  String get databaseMigrationBody =>
      'Lūgums uzgaidīt. Tas var aizņemt kādu brīdi.';

  @override
  String get leaveEmptyToClearStatus =>
      'Atstāt tukšu, lai notīrītu savu stāvokli.';

  @override
  String get select => 'Atlasīt';

  @override
  String get searchForUsers => 'Meklēt @lietotājus...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Lūgums ievadīt savu pašreizējo paroli';

  @override
  String get newPassword => 'Jauna parole';

  @override
  String get pleaseChooseAStrongPassword => 'Lūgums izvēlēties spēcīgu paroli';

  @override
  String get passwordsDoNotMatch => 'Paroles nesakrīt';

  @override
  String get passwordIsWrong => 'Ievadītā parole ir nepareiza';

  @override
  String get publicLink => 'Publiska saite';

  @override
  String get publicChatAddresses => 'Publiskas tērzēšanas adreses';

  @override
  String get createNewAddress => 'Izveidot jaunu adresi';

  @override
  String get joinSpace => 'Pievienoties vietai';

  @override
  String get publicSpaces => 'Publiskas vietas';

  @override
  String get addChatOrSubSpace => 'Pievienot tērzēšanu vai apakšvietu';

  @override
  String get subspace => 'Apakšvieta';

  @override
  String get decline => 'Atteikt';

  @override
  String get thisDevice => 'Šī ierīce:';

  @override
  String get initAppError => 'Atgadījās kļūda lietotnes sāknēšanas laikā';

  @override
  String get userRole => 'Lietotāja loma';

  @override
  String minimumPowerLevel(String level) {
    return '$level ir zemākais spēka līmenis.';
  }

  @override
  String searchIn(String chat) {
    return 'Meklēt tērzēšanā \"$chat\"...';
  }

  @override
  String get searchMore => 'Meklēt vairāk...';

  @override
  String get gallery => 'Galerija';

  @override
  String get files => 'Datnes';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Nebija iespējams izveidot SQlite datubāzi. Lietotne pagaidām mēģina izmantot iepriekšējo datubāzi. Lūgums ziņot par šo kļūdu izstrādātājiem $url. Kļūdas ziņojums ir: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Sesija ir zaudēta. Lūgums ziņot par šo kļūdu izstrādātājiem $url. Kļūdas ziņojums ir: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Lietotne tagad mēģina atjaunot sesiju no rezerves kopijas. Lūgums ziņot par šo kļūdu izstrādātājiem $url. Kļūdas ziņojums ir: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Pārsūtīt ziņu uz $roomName?';
  }

  @override
  String get sendReadReceipts => 'Nosūtīt lasīšanas atskaites';

  @override
  String get sendTypingNotificationsDescription =>
      'Citi tērzēšanas dalībnieki var redzēt, kad raksti jaunu ziņu.';

  @override
  String get sendReadReceiptsDescription =>
      'Citi tērzēšanas dalībnieki var redzēt, kad izlasīji ziņu.';

  @override
  String get formattedMessages => 'Formatētas ziņas';

  @override
  String get formattedMessagesDescription =>
      'Attēlot bagātinātu ziņu saturu, piemēram, ar Markdown iezīmētu treknrakstu.';

  @override
  String get verifyOtherUser => '🔐 Apliecināt otru lietotāju';

  @override
  String get verifyOtherUserDescription =>
      'Ar cita lietotāja apliecināšanu vari pārliecināties, ka zini, kam Tu tiešām raksti. 💪\n\nKad uzsāc apliecināšanu, Tu un otrs lietotājs lietotnē redzēs uznirstošo logu. Tajā jūs redzēsiet dažādas emocijzīmes vai skaitļus, kas ir jāsalīdzina savā starpā.\n\nLabākais veids, kā to izdarīt, ir satikties vai uzsākt videozvanu. 👭';

  @override
  String get verifyOtherDevice => '🔐 Apliecināt otru ierīci';

  @override
  String get verifyOtherDeviceDescription =>
      'Kad apliecini citu ierīci, šīs ierīces var apmainīt atslēgas, palielinot vispārējo drošību. 💪 Pēc apliecināšanas uzsākšanas abās ierīcēs lietotnē parādīsies uznirstošais logs. Tajā būs redzamas dažādas emocijzīmes vai skaitļi, kas jāsalīdzina abās ierīcēs. Vislabāk, ja abas ierīces ir pieejamas, pirms tiek uzsākta apliecināšana. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender apstiprināja atslēgas apliecināšanu';
  }

  @override
  String get customReaction => 'Add reaction';

  @override
  String canceledKeyVerification(String sender) {
    return '$sender atcēla atslēgas apliecināšanu';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender pabeidza atslēgas apliecināšanu';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender ir gatavs atslēgas apliecināšanai';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender pieprasīja atslēgas apliecināšanu';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender uzsāka atslēgas apliecināšanu';
  }

  @override
  String get transparent => 'Caurspīdīgs';

  @override
  String get incomingMessages => 'Ienākošās ziņas';

  @override
  String get stickers => 'Uzlīmes';

  @override
  String get discover => 'Atklāt';

  @override
  String get commandHint_ignore => 'Neņemt vērā norādīto Matrix Id';

  @override
  String get commandHint_unignore => 'Atcelt norādītā Matrix Id neņemšanu vērā';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread nelasītas tērzēšanas';
  }

  @override
  String get noDatabaseEncryption =>
      'Šajā platformā datubāzes šifrēšana netiek nodrošināta';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Šobrīd ir izslēgti $count lietotāji.';
  }

  @override
  String get restricted => 'Ierobežots';

  @override
  String get knockRestricted => 'Pieklauvēt ierobežotajiem';

  @override
  String goToSpace(Object space) {
    return 'Doties uz vietu: $space';
  }

  @override
  String get markAsUnread => 'Atzīmēt kā nelasītu';

  @override
  String userLevel(int level) {
    return '$level - Lietotājs';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderators';
  }

  @override
  String adminLevel(int level) {
    return '$level - Pārvaldītājs';
  }

  @override
  String get changeGeneralChatSettings =>
      'Mainīt vispārējos tērzēšanas iestatījumus';

  @override
  String get inviteOtherUsers => 'Uzaicināt šajā tērzēšanā citus lietotājus';

  @override
  String get changeTheChatPermissions => 'Mainīt tērzēšanas atļaujas';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Mainīt tērzēšanas vēstures redzamību';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Mainīt tērzēšanas galveno publisko adresi';

  @override
  String get sendRoomNotifications => 'Sūtīt @istaba paziņojumus';

  @override
  String get changeTheDescriptionOfTheGroup => 'Mainīt tērzēšanas aprakstu';

  @override
  String get chatPermissionsDescription =>
      'Noteikt, kurš spēka līmenis ir nepieciešams noteiktām darbībām šajā tērzēšanā. Spēka līmeņi 0, 50 un 100 parasti atbilst lietotājiem, moderatoriem un pārvaldītājiem, bet ir iespējams jebkāds iedalījums.';

  @override
  String updateInstalled(String version) {
    return '🎉 Atjauninājums $version uzstādīts.';
  }

  @override
  String get changelog => 'Izmaiņu žurnāls';

  @override
  String get sendCanceled => 'Sūtīšana atcelta';

  @override
  String get loginWithMatrixId => 'Pieteikties ar Matrix-Id';

  @override
  String get discoverHomeservers => 'Atklāt mājasserverus';

  @override
  String get whatIsAHomeserver => 'Kas ir mājasserveris?';

  @override
  String get homeserverDescription =>
      'Visi lietotāja dati tiek glabāti mājasserverī, gluži kā ar e-pasta nodrošinātāju. Ir iespējams izvēlēties, kuru mājasserveri izmantot, saglabājot iespēju sazināties ar ikvienu. Vairāk var uzzināt https://matrix.org.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Neizskatās pēc saderīga mājasservera. Nepareizs URL?';

  @override
  String get calculatingFileSize => 'Aprēķina datnes lielumu...';

  @override
  String get prepareSendingAttachment => 'Sagatavo pielikuma nosūtīšanu...';

  @override
  String get sendingAttachment => 'Nosūta pielikumu...';

  @override
  String get generatingVideoThumbnail => 'Izveido video sīktēlu...';

  @override
  String get compressVideo => 'Saspiež video...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Nosūta $index. pielikumu no $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Sasniegts servera ierobežojums. Gaida $seconds sekundes...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Viena no ierīcēm nav apliecināta';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Piezīme: kad visas ierīces tiek savienotas ar tērzēšanu rezerves kopiju, tās tiek automātiski apliecinātas.';

  @override
  String get continueText => 'Turpināt';

  @override
  String get welcomeText =>
      'Sveicieni! 👋 Šis ir FluffyChat. Tu vari pieteikties jebkurā mājasserverī, kas ir saderīgs ar https://matrix.org. Tad vari tērzēt ar ikvienu. Tas ir milzīgs decentralizētās saziņas tīkls!';

  @override
  String get blur => 'Aizmiglojums:';

  @override
  String get opacity => 'Necaurredzamība:';

  @override
  String get setWallpaper => 'Iestatīt ekrāntapeti';

  @override
  String get manageAccount => 'Pārvaldīt kontu';

  @override
  String get noContactInformationProvided =>
      'Serveris nesniedz nekādu derīgu saziņas informāciju';

  @override
  String get contactServerAdmin => 'Sazināties ar servera pārvaldītāju';

  @override
  String get contactServerSecurity =>
      'Sazināties ar servera drošības uzturētājiem';

  @override
  String get supportPage => 'Atbalsta lapa';

  @override
  String get serverInformation => 'Informācija par serveri:';

  @override
  String get name => 'Nosaukums';

  @override
  String get version => 'Versija';

  @override
  String get website => 'Tīmekļvietne';

  @override
  String get compress => 'Saspiest';

  @override
  String get boldText => 'Teksts treknrakstā';

  @override
  String get italicText => 'Teksts slīprakstā';

  @override
  String get strikeThrough => 'Pārsvītrots';

  @override
  String get pleaseFillOut => 'Lūgums aizpildīt';

  @override
  String get invalidUrl => 'Nederīgs URL';

  @override
  String get addLink => 'Pievienot saiti';

  @override
  String get unableToJoinChat =>
      'Nevarēja pievienoties tērzēšanai. Varbūt otra puse jau ir aizvērusi sarunu.';

  @override
  String get previous => 'Iepriekšējais';

  @override
  String get otherPartyNotLoggedIn =>
      'Otra puse pašlaik nav pieteikusies un tādēļ nevar saņemt ziņas.';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Izmantot \'$server\', lai pieteiktos';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Ar šo tiek ļauts lietotnei un tīmekļvietnei kopīgot informāciju par Tevi.';

  @override
  String get open => 'Atvērt';

  @override
  String get waitingForServer => 'Gaida serveri...';

  @override
  String get appIntroduction =>
      'FluffyChat ļauj tērzēt ar draugiem, kuri izmanto dažādas ziņojumapmaiņas lietotnes. Vairāk var uzzināt https://matrix.org vai vienkārši piesitot *Turpināt*.';

  @override
  String get newChatRequest => '📩 Jauns tērzēšanas pieprasījums';

  @override
  String get contentNotificationSettings => 'Satura paziņojumu iestatījumi';

  @override
  String get generalNotificationSettings => 'Vispārēji paziņojumu iestatījumi';

  @override
  String get roomNotificationSettings => 'Istabu paziņojumu iestatījumi';

  @override
  String get userSpecificNotificationSettings =>
      'Lietotāja paziņojumu iestatījumi';

  @override
  String get otherNotificationSettings => 'Citi paziņojumu iestatījumi';

  @override
  String get notificationRuleContainsUserName => 'Saturs lietotāja vārdu';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Paziņo lietotājam, kad ziņa satur viņa lietotājvārdu.';

  @override
  String get notificationRuleMaster => 'Apklusināt visus paziņojumus';

  @override
  String get notificationRuleMasterDescription =>
      'Pārspēj visas pārējās kārtulas un atspējo visus paziņojumus.';

  @override
  String get notificationRuleSuppressNotices => 'Apspiest automātiskās ziņas';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Apspiež paziņojumus no automatizētiem klientiem, piemēram, robotprogrammatūras.';

  @override
  String get notificationRuleInviteForMe => 'Uzaicinājums man';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Paziņo lietotājam, kad viņš ir uzaicināts pievienoties istabai.';

  @override
  String get notificationRuleMemberEvent => 'Dalībnieka notikums';

  @override
  String get notificationRuleMemberEventDescription =>
      'Apspiež paziņojums par dalības notikumiem.';

  @override
  String get notificationRuleIsUserMention => 'Lietotāja pieminēšana';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Paziņo lietotājam, kad viņš ziņā ir tieši pieminēts.';

  @override
  String get notificationRuleContainsDisplayName => 'Satur attēlojamo vārdu';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Paziņo lietotājam, kad ziņa satur viņa attēlojamo vārdu.';

  @override
  String get notificationRuleIsRoomMention => 'Istabas pieminēšana';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Paziņo lietotājam, kad tiek pieminēta istaba.';

  @override
  String get notificationRuleRoomnotif => 'Istabas paziņojums';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Paziņo lietotājam, kad ziņa satur \"@istaba\".';

  @override
  String get notificationRuleTombstone => 'Kapakmens';

  @override
  String get notificationRuleTombstoneDescription =>
      'Paziņo lietotājam par istabu aizvēršanas ziņām.';

  @override
  String get notificationRuleReaction => 'Reakcija';

  @override
  String get notificationRuleReactionDescription =>
      'Apspiež paziņojums par reakcijām.';

  @override
  String get notificationRuleRoomServerAcl => 'Istabas servera ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Apspiež paziņojumus par istabas servera piekļuves kontroles sarakstiem (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Apspiest labojumus';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Apspiež paziņojumus par labotām ziņām.';

  @override
  String get notificationRuleCall => 'Zvans';

  @override
  String get notificationRuleCallDescription =>
      'Paziņo lietotājam par zvaniem.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Šifrēta viens pret viens istaba';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Paziņo lietotājam par ziņām šifrētās viens pret viens istabās.';

  @override
  String get notificationRuleRoomOneToOne => 'Viens pret viens istaba';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Paziņo lietotājam par ziņām viens pret viens istabās.';

  @override
  String get notificationRuleMessage => 'Ziņa';

  @override
  String get notificationRuleMessageDescription =>
      'Paziņo lietotājam par vispārējām ziņām.';

  @override
  String get notificationRuleEncrypted => 'Šifrēts';

  @override
  String get notificationRuleEncryptedDescription =>
      'Paziņo lietotājam par ziņām šifrētās istabās.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Paziņo lietotājam par Jitsi logrīka notikumiem.';

  @override
  String get notificationRuleServerAcl => 'Apspiest servera ACL notikumus';

  @override
  String get notificationRuleServerAclDescription =>
      'Apspiež notikumus par servera ACL notikumiem.';

  @override
  String unknownPushRule(String rule) {
    return 'Nezināma pašpiegādes kārtula \'$rule\'';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Ja tiek izdzēsts šis paziņojuma iestatījums, to nevar atsaukt.';

  @override
  String get more => 'Vairāk';

  @override
  String get shareKeysWith => 'Kopīgot atslēgas ar...';

  @override
  String get shareKeysWithDescription =>
      'Kurām ierīcēm vajadzētu uzticēties, lai tajās varētu lasīt ziņas šifrētajās tērzēšanās?';

  @override
  String get allDevices => 'Visas ierīces';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Savstarpēji apliecinātas ierīces, ja iespējots';

  @override
  String get crossVerifiedDevices => 'Savstarpēji apliecinātas ierīces';

  @override
  String get verifiedDevicesOnly => 'Tikai apliecinātas ierīces';

  @override
  String get takeAPhoto => 'Uzņemt attēlu';

  @override
  String get recordAVideo => 'Ierakstīt video';

  @override
  String get optionalMessage => '(Pēc izvēles) Ziņojums...';

  @override
  String get notSupportedOnThisDevice => 'Šajā ierīcē nav atbalstīts';

  @override
  String get enterNewChat => 'Ieiet jaunajā tērzēšanā';

  @override
  String get approve => 'Approve';

  @override
  String get youHaveKnocked => 'You have knocked';

  @override
  String get pleaseWaitUntilInvited =>
      'Please wait now, until someone from the room invites you.';
}
