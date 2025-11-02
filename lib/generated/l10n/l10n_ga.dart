// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class L10nGa extends L10n {
  L10nGa([String locale = 'ga']) : super(locale);

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
  String get alwaysUse24HourFormat => 'bréagach';

  @override
  String get cleanExif => 'Clean EXIF metadata';

  @override
  String get cleanExifDescription =>
      'Remove EXIF metadata (camera model, geolocation, time) when sending a photo.';

  @override
  String get repeatPassword => 'Scríobh an pasfhocal arís';

  @override
  String get notAnImage => 'Ní comhad íomhá é.';

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
  String get remove => 'Bain';

  @override
  String get importNow => 'Iompórtáil anois';

  @override
  String get importEmojis => 'Iompórtáil Emoji';

  @override
  String get importFromZipFile => 'Iompórtáil ó chomhad .zip';

  @override
  String get exportEmotePack => 'Easpórtáil Emote pacáiste mar .zip';

  @override
  String get replace => 'Ionadaigh';

  @override
  String get about => 'Faoi';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Maidir le $homeserver';
  }

  @override
  String get accept => 'Glac';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 Ghlac $username leis an gcuireadh';
  }

  @override
  String get account => 'Cuntas';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username criptithe deireadh go deireadh gníomhachtaithe';
  }

  @override
  String get addEmail => 'Cuir ríomhphoist';

  @override
  String get confirmMatrixId =>
      'Deimhnigh d’ID Maitrís chun do chuntas a scriosadh.';

  @override
  String supposedMxid(String mxid) {
    return 'Ba cheart go mbeadh sé seo $mxid';
  }

  @override
  String get addChatDescription => 'Cuir cur síos ar an gcomhrá leis...';

  @override
  String get addToSpace => 'Cuir go spás';

  @override
  String get admin => 'Riarthóir';

  @override
  String get alias => 'ailias';

  @override
  String get all => 'Gach';

  @override
  String get allChats => 'Gach comhrá';

  @override
  String get commandHint_roomupgrade =>
      'Uasghrádaigh an seomra seo go dtí an leagan seomra a thugtar';

  @override
  String get commandHint_googly => 'Seol roinnt súile googly';

  @override
  String get commandHint_cuddle => 'Seol cuddle';

  @override
  String get commandHint_hug => 'Seol barróg';

  @override
  String googlyEyesContent(String senderName) {
    return 'Seolann $senderName súile googly chugat';
  }

  @override
  String cuddleContent(String senderName) {
    return 'Cuireann $senderName do chudacht';
  }

  @override
  String hugContent(String senderName) {
    return 'Tugann $senderName barróg duit';
  }

  @override
  String answeredTheCall(String senderName) {
    return 'D\'fhreagair $senderName an glao';
  }

  @override
  String get anyoneCanJoin => 'Is féidir le aon duine dul isteach';

  @override
  String get appLock => 'Bac aip';

  @override
  String get appLockDescription =>
      'Cuir glas ar an aip nuair nach bhfuil sé in úsáid le cód bioráin';

  @override
  String get archive => 'Cartlann';

  @override
  String get areGuestsAllowedToJoin =>
      'An bhfuil cead ag aoi-úsáideoirí a bheith páirteach';

  @override
  String get areYouSure => 'An bhfuil tú cinnte?';

  @override
  String get areYouSureYouWantToLogout =>
      'An bhfuil tú cinnte gur mhaith leat logáil amach?';

  @override
  String get askSSSSSign =>
      'Chun a bheith in ann an duine eile a shíniú, cuir isteach do phasfhrása stóir sábháilte nó d\'eochair téarnaimh.';

  @override
  String askVerificationRequest(String username) {
    return 'Glac leis an iarratas fíoraithe seo ó $username?';
  }

  @override
  String get autoplayImages =>
      'Seinn greamáin agus straoiseog beoite go huathoibríoch';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Tá na cineálacha logála isteach seo ar fáil faoin freastalaí baile:\n$serverVersions\nAch níl ach na ceann seo ar fáil faoin aip seo:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Seol fógraí clóscríofa';

  @override
  String get swipeRightToLeftToReply =>
      'Svaidhpeáil ar dheis ar chlé chun freagra a thabhairt';

  @override
  String get sendOnEnter => 'Seol ar iontráil';

  @override
  String badServerVersionsException(String serverVersions,
      String supportedVersions, Object serverVerions, Object suportedVersions) {
    return 'Tá na leaganacha sonraíochta seo ar fáil faoin freastalaí baile:\n$serverVersions\nAch níl ach na ceann seo ar fáil faoin aip seo $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats comhrá agus $participants rannpháirtí';
  }

  @override
  String get noMoreChatsFound => 'Níor aimsíodh a thuilleadh comhráite...';

  @override
  String get noChatsFoundHere =>
      'Níor aimsíodh aon chomhrá anseo fós. Cuir tús le comhrá nua le duine éigin tríd an gcnaipe thíos a úsáid. ⤵️';

  @override
  String get joinedChats => 'Glacadh páirt i gcomhráite';

  @override
  String get unread => 'Neamhléite';

  @override
  String get space => 'Spás';

  @override
  String get spaces => 'Spásanna';

  @override
  String get banFromChat => 'Toirmisc ón gcomhrá';

  @override
  String get banned => 'Coiscthe';

  @override
  String bannedUser(String username, String targetName) {
    return 'Chuir $username cosc ar $targetName';
  }

  @override
  String get blockDevice => 'Bac Gléas';

  @override
  String get blocked => 'Bactha';

  @override
  String get botMessages => 'Teachtaireachtaí bota';

  @override
  String get cancel => 'Cealaigh';

  @override
  String cantOpenUri(String uri) {
    return 'Ní féidir an URI $uri a oscailt';
  }

  @override
  String get changeDeviceName => 'Athraigh ainm an ghléis';

  @override
  String changedTheChatAvatar(String username) {
    return 'D\'athraigh $username abhatár an chomhrá';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return 'D\'athraigh $username an cur síos comhrá go: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return 'D\'athraigh $username an t-ainm comhrá go: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return 'D\'athraigh $username na ceadanna comhrá';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return 'D\'athraigh $username a n-ainm taispeána go: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return 'D\'athraigh $username na rialacha rochtana aoi';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return 'D\'athraigh $username na rialacha maidir le rochtain aoi chuig: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return 'D\'athraigh $username infheictheacht na staire';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return 'D\'athraigh $username infheictheacht na staire go: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return 'D\'athraigh $username na rialacha ceangail';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return 'D\'athraigh $username na rialacha ceangail go: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return 'D\'athraigh $username a n-abhatár';
  }

  @override
  String changedTheRoomAliases(String username) {
    return 'D\'athraigh $username ailiasanna an tseomra';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return 'D\'athraigh $username nasc an chuiridh';
  }

  @override
  String get changePassword => 'Athraigh an pasfhocal';

  @override
  String get changeTheHomeserver => 'Athraigh an freastalaí baile';

  @override
  String get changeTheme => 'Athraigh do stíl';

  @override
  String get changeTheNameOfTheGroup => 'Athraigh ainm an ghrúpa';

  @override
  String get changeYourAvatar => 'Athraigh do abhatár';

  @override
  String get channelCorruptedDecryptError => 'Truaillíodh an criptiú';

  @override
  String get chat => 'Comhrá';

  @override
  String get yourChatBackupHasBeenSetUp => 'Bunaíodh do chúltaca comhrá.';

  @override
  String get chatBackup => 'Cúltaca comhrá';

  @override
  String get chatBackupDescription =>
      'Tá do sheanteachtaireachtaí slán le eochair athshlánaithe. Le do thoil déan cinnte nach gcaillfidh tú é.';

  @override
  String get chatDetails => 'Sonraí comhrá';

  @override
  String get chatHasBeenAddedToThisSpace => 'Cuireadh comhrá leis an spás seo';

  @override
  String get chats => 'Comhráite';

  @override
  String get chooseAStrongPassword => 'Roghnaigh pasfhocal láidir';

  @override
  String get clearArchive => 'Glan an cartlann';

  @override
  String get close => 'Dún';

  @override
  String get commandHint_markasdm =>
      'Marcáil mar sheomra teachtaireachta dírí don ID Maitrís tugtha';

  @override
  String get commandHint_markasgroup => 'Marcáil mar ghrúpa';

  @override
  String get commandHint_ban =>
      'Cuir cosc ar an úsáideoir áirithe ón seomra seo';

  @override
  String get commandHint_clearcache => 'Glan an taisce';

  @override
  String get commandHint_create =>
      'Cruthaigh comhrá grúpa folamh\nÚsáid --no-encryption chun criptiúchán a dhíchumasú';

  @override
  String get commandHint_discardsession => 'Scrios an seisiún';

  @override
  String get commandHint_dm =>
      'Cuir tús le comhrá díreach\nÚsáid --no-cription chun criptiúchán a dhíchumasú';

  @override
  String get commandHint_html => 'Seol téacs HTML-formáidithe';

  @override
  String get commandHint_invite =>
      'Cuir cosc ar an úsáideoir áirithe ón seomra seo';

  @override
  String get commandHint_join => 'Téigh isteach sa seomra áirithe';

  @override
  String get commandHint_kick => 'Bain an t-úsáideoir áirithe den seomra seo';

  @override
  String get commandHint_leave => 'Fág an seomra seo';

  @override
  String get commandHint_me => 'Déan cur síos ort féin';

  @override
  String get commandHint_myroomavatar =>
      'Cuir do phictiúr don seomra seo (le mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Socraigh d\'ainm taispeána don seomra seo';

  @override
  String get commandHint_op =>
      'Socraigh leibhéal cumhachta an úsáideora áirithe (réamhshocrú: 50)';

  @override
  String get commandHint_plain => 'Seol téacs neamhfhoirmithe';

  @override
  String get commandHint_react => 'Seol freagra mar fhreagairt';

  @override
  String get commandHint_send => 'Seol téacs';

  @override
  String get commandHint_unban =>
      'Cuir deireadh an cosc den úsáideoir áirithe ón seomra seo';

  @override
  String get commandInvalid => 'Ordú neamhbhailí';

  @override
  String commandMissing(String command) {
    return 'Ní ordú é $command.';
  }

  @override
  String get compareEmojiMatch => 'Cuir na emojis i gcomparáid le do thoil';

  @override
  String get compareNumbersMatch =>
      'Cuir na huimhreacha i gcomparáid le do thoil';

  @override
  String get configureChat => 'Cumraigh comhrá';

  @override
  String get confirm => 'Deimhnigh';

  @override
  String get connect => 'Ceangail';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Tugadh cuireadh don theagmháil a thar isteach sa grúpa';

  @override
  String get containsDisplayName => 'Coinníonn sé ainm taispeána';

  @override
  String get containsUserName => 'Coinníonn sé ainm úsáideora';

  @override
  String get contentHasBeenReported =>
      'Tuairiscíodh an t-ábhar do lucht riaracháin an fhreastalaí';

  @override
  String get copiedToClipboard => 'Cóipeáilte ar an ghearrthaisce';

  @override
  String get copy => 'Cóipeáil';

  @override
  String get copyToClipboard => 'Cóipeáil ar an ghearrthaisce';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Níorbh fhéidir teachtaireacht a dhíchriptiú: $error';
  }

  @override
  String countParticipants(int count) {
    return '$count rannpháirtithe';
  }

  @override
  String get create => 'Cruthaigh';

  @override
  String createdTheChat(String username) {
    return '💬 chruthaigh $username an comhrá';
  }

  @override
  String get createGroup => 'Cruthaigh grúpa';

  @override
  String get createNewSpace => 'Spás nua';

  @override
  String get currentlyActive => 'Gníomhach faoi láthair';

  @override
  String get darkTheme => 'Dorcha';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day/$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day/$month/$year';
  }

  @override
  String get deactivateAccountWarning =>
      'Díghníomhachtaeoidh sé seo do chuntas úsáideora. Ní féidir é seo a chealú! An bhfuil tú cinnte?';

  @override
  String get defaultPermissionLevel =>
      'Leibhéal ceada réamhshocraithe d\'úsáideoirí nua';

  @override
  String get delete => 'Scrios';

  @override
  String get deleteAccount => 'Scrios an cuntas';

  @override
  String get deleteMessage => 'Scrios an teachtaireacht';

  @override
  String get device => 'Gléas';

  @override
  String get deviceId => 'ID gléis';

  @override
  String get devices => 'Gléasanna';

  @override
  String get directChats => 'Comhráite Díreacha';

  @override
  String get allRooms => 'Gach Comhrá Grúpa';

  @override
  String get displaynameHasBeenChanged => 'Athraíodh an t-ainm taispeána';

  @override
  String get downloadFile => 'Íoslódáil comhad';

  @override
  String get edit => 'Cuir in eagar';

  @override
  String get editBlockedServers => 'Cuir freastalaí blocáilte in eagar';

  @override
  String get chatPermissions => 'Ceadanna comhrá';

  @override
  String get chatThreads => 'Threads';

  @override
  String get chatThreadsDescription => 'See all threads in this room';

  @override
  String get editDisplayname => 'Cuir ainm taispeána in eagar';

  @override
  String get editRoomAliases => 'Cuir ailiasanna an tseomra in eagar';

  @override
  String get editRoomAvatar => 'Cuir in eagar abhatár an tseomra';

  @override
  String get emoteExists => 'Tá iomaite ann cheana féin!';

  @override
  String get emoteInvalid => 'Gearrchód emote neamhbhailí!';

  @override
  String get emoteKeyboardNoRecents =>
      'Beidh mothúcháin a úsáideadh le déanaí le feiceáil anseo ...';

  @override
  String get emotePacks => 'Pacáistí straoiseoige don seomra';

  @override
  String get emoteSettings => 'Socruithe straoiseoige';

  @override
  String get globalChatId => 'Aitheantas comhrá domhanda';

  @override
  String get accessAndVisibility => 'Rochtain agus infheictheacht';

  @override
  String get accessAndVisibilityDescription =>
      'Cé a bhfuil cead aige páirt a ghlacadh sa chomhrá seo agus conas is féidir an comhrá a aimsiú.';

  @override
  String get calls => 'Glaonna';

  @override
  String get customEmojisAndStickers => 'Emojis agus greamáin saincheaptha';

  @override
  String get customEmojisAndStickersBody =>
      'Cuir leis nó roinn emojis nó greamáin saincheaptha is féidir a úsáid in aon chomhrá.';

  @override
  String get emoteShortcode => 'Gearrchód straoiseoige';

  @override
  String get emoteWarnNeedToPick =>
      'Caithfidh tú gearrchód straoiseoige agus íomhá a roghnú!';

  @override
  String get emptyChat => 'Comhrá folamh';

  @override
  String get enableEmotesGlobally =>
      'Cumasaigh pacáiste straoiseoige go huilíoch';

  @override
  String get enableEncryption => 'Tosaigh criptiú';

  @override
  String get enableEncryptionWarning =>
      'Ní bheidh in ann an criptiú a dhíchumasú níos mó. An bhfuil tú cinnte?';

  @override
  String get encrypted => 'Criptithe';

  @override
  String get encryption => 'Criptiúchán';

  @override
  String get encryptionNotEnabled => 'Ní chumasaítear criptiú';

  @override
  String endedTheCall(String senderName) {
    return 'Chuir $senderName deireadh leis an nglao';
  }

  @override
  String get enterAnEmailAddress => 'Cuir isteach seoladh ríomhphoist';

  @override
  String get homeserver => 'Freastalaí baile';

  @override
  String get enterYourHomeserver => 'Cuir isteach do fhreastalaí baile';

  @override
  String errorObtainingLocation(String error) {
    return 'Earráid maidir le suíomh a fháil: $error';
  }

  @override
  String get everythingReady => 'Gach rud réidh!';

  @override
  String get extremeOffensive => 'Fíor-maslach';

  @override
  String get fileName => 'Ainm an chomhaid';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Méid cló';

  @override
  String get forward => 'Seol ar aghaidh';

  @override
  String get fromJoining => 'Ó tar isteach';

  @override
  String get fromTheInvitation => 'Ón gcuireadh';

  @override
  String get goToTheNewRoom => 'Téigh go dtí an seomra nua';

  @override
  String get group => 'Grúpa';

  @override
  String get chatDescription => 'Cur síos ar an gcomhrá';

  @override
  String get chatDescriptionHasBeenChanged =>
      'Athraíodh cur síos ar an gcomhrá';

  @override
  String get groupIsPublic => 'Tá an grúpa poiblí';

  @override
  String get groups => 'Grúpaí';

  @override
  String groupWith(String displayname) {
    return 'Grúpa le $displayname';
  }

  @override
  String get guestsAreForbidden => 'Tá cosc ar aíonna';

  @override
  String get guestsCanJoin => 'Is féidir le haíonna páirt a ghlacadh';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return 'Tharraing $username an cuireadh do $targetName siar';
  }

  @override
  String get help => 'Cabhair';

  @override
  String get hideRedactedEvents => 'Folaigh imeachtaí athdhéanta';

  @override
  String get hideRedactedMessages => 'Folaigh teachtaireachtaí curtha in eagar';

  @override
  String get hideRedactedMessagesBody =>
      'Má athghníomhaíonn duine éigin teachtaireacht, ní bheidh an teachtaireacht seo le feiceáil sa chomhrá a thuilleadh.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Folaigh formáidí teachtaireachta neamhbhailí nó anaithnid';

  @override
  String get howOffensiveIsThisContent =>
      'Cé chomh maslach atá an t-ábhar seo?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Aitheantas';

  @override
  String get block => 'Bloc';

  @override
  String get blockedUsers => 'Úsáideoirí bactha';

  @override
  String get blockListDescription =>
      'Is féidir leat bac a chur ar úsáideoirí atá ag cur isteach ort. Ní bheidh tú in ann teachtaireachtaí nó cuireadh seomra ar bith a fháil ó na húsáideoirí ar do liosta bloc pearsanta.';

  @override
  String get blockUsername => 'Déan neamhaird de ainm úsáideora';

  @override
  String get iHaveClickedOnLink => 'Chliceáil mé ar an nasc';

  @override
  String get incorrectPassphraseOrKey =>
      'Pasfhrása nó eochair téarnaimh mícheart';

  @override
  String get inoffensive => 'Neamhurchóideach';

  @override
  String get inviteContact => 'Tabhair cuireadh do theagmháil';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Ar mhaith leat cuireadh a thabhairt do $contact chuig an gcomhrá \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Tabhair cuireadh do theagmháil chuig $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'Níl aon chur síos ar an gcomhrá cruthaithe fós.';

  @override
  String get tryAgain => 'Bain triail eile as';

  @override
  String get invalidServerName => 'Ainm freastalaí neamhbhailí';

  @override
  String get invited => 'Le cuireadh';

  @override
  String get redactMessageDescription =>
      'Athrófar an teachtaireacht do gach rannpháirtí sa chomhrá seo. Ní féidir é seo a chealú.';

  @override
  String get optionalRedactReason =>
      '(Roghnach) An chúis leis an teachtaireacht seo a chur in eagar...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 thug $username cuireadh do $targetName';
  }

  @override
  String get invitedUsersOnly => 'Úsáideoirí le cuireadh amháin';

  @override
  String get inviteForMe => 'Tabhair cuireadh dom';

  @override
  String inviteText(String username, String link) {
    return 'Thug $username cuireadh duit chuig FluffyChat.\n1. Tabhair cuairt ar fluffychat.im agus a shuiteáil an app\n2. Cláraigh nó sínigh isteach\n3. Oscail an nasc cuirí:\n $link';
  }

  @override
  String get isTyping => 'ag clóscríobh…';

  @override
  String joinedTheChat(String username) {
    return 'Tháinig 👋 $username isteach sa chomhrá';
  }

  @override
  String get joinRoom => 'Téigh isteach sa seomra';

  @override
  String kicked(String username, String targetName) {
    return '👞 chiceáil $username $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 chiceáil $username agus chuir sé cosc ar $targetName';
  }

  @override
  String get kickFromChat => 'Caith é amach as an comhrá';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Gníomhach deireanach: $localizedTimeShort';
  }

  @override
  String get leave => 'Fág';

  @override
  String get leftTheChat => 'Fágadh an comhrá';

  @override
  String get license => 'Ceadúnas';

  @override
  String get lightTheme => 'Solas';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Lódáil $count níos mó rannpháirtithe';
  }

  @override
  String get dehydrate => 'Easpórtáil seisiún agus gléas wipe';

  @override
  String get dehydrateWarning =>
      'Ní féidir an gníomh seo a chealú. Cinntigh go stórálann tú an comhad cúltaca go sábháilte.';

  @override
  String get dehydrateTor => 'Úsáideoirí TOR: Seisiún easpórtála';

  @override
  String get dehydrateTorLong =>
      'Maidir le húsáideoirí TOR, moltar an seisiún a onnmhairiú roimh dhúnadh an fhuinneog.';

  @override
  String get hydrateTor => 'Úsáideoirí TOR: Iompórtáil easpórtáil seisiún';

  @override
  String get hydrateTorLong =>
      'An ndearna tú do sheisiún a easpórtáil an uair dheireanach ar TOR? Iompórtáil go tapa é agus leanúint ar aghaidh ag comhrá.';

  @override
  String get hydrate => 'Athchóirigh ó chomhad cúltaca';

  @override
  String get loadingPleaseWait => 'Ag lódáil… Fan, le do thoil.';

  @override
  String get loadMore => 'Lódáil níos mó…';

  @override
  String get locationDisabledNotice =>
      'Tá seirbhísí suímh díchumasaithe. Cuir ar a gcumas le do thoil a bheith in ann do shuíomh a roinnt.';

  @override
  String get locationPermissionDeniedNotice =>
      'Diúltaíodh cead suímh. Deonaigh dóibh le do thoil go mbeidh tú in ann do shuíomh a roinnt.';

  @override
  String get login => 'Logáil isteach';

  @override
  String logInTo(String homeserver) {
    return 'Logáil isteach chuig $homeserver';
  }

  @override
  String get logout => 'Logáil amach';

  @override
  String get memberChanges => 'Athruithe ball';

  @override
  String get mention => 'Luaigh';

  @override
  String get messages => 'Teachtaireachtaí';

  @override
  String get messagesStyle => 'Teachtaireachtaí:';

  @override
  String get moderator => 'Modhnóir';

  @override
  String get muteChat => 'Ciúnaigh comhrá';

  @override
  String get needPantalaimonWarning =>
      'Bí ar an eolas go dteastaíonn Pantalaimon uait chun criptiú ó cheann go ceann a úsáid anois.';

  @override
  String get newChat => 'Comhrá nua';

  @override
  String get newMessageInFluffyChat => '💬 Teachtaireacht nua in FluffyChat';

  @override
  String get newVerificationRequest => 'Iarratas fíoraithe nua!';

  @override
  String get next => 'Ar Aghaidh';

  @override
  String get no => 'Níl';

  @override
  String get noConnectionToTheServer => 'Gan aon nasc leis an bhfreastalaí';

  @override
  String get noEmotesFound => 'Níor aimsíodh aon straoiseoga. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Ní féidir leat criptiú a ghníomhachtú ach a luaithe nach bhfuil an seomra inrochtana go poiblí a thuilleadh.';

  @override
  String get noGoogleServicesWarning =>
      'Is cosúil nach bhfuil Firebase Cloud Messaging ar fáil ar do ghléas. Chun fógraí brú a fháil fós, molaimid ntfy a shuiteáil. Le ntfy nó soláthraí Unified Push eile is féidir leat fógraí brú a fháil ar bhealach atá slán ó thaobh sonraí. Is féidir leat ntfy a íoslódáil ón PlayStore nó ó F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return 'Níl $server1 freastalaí Matrix. Úsáid $server2 ina áit sin?';
  }

  @override
  String get shareInviteLink => 'Roinn an nasc cuireadh';

  @override
  String get scanQrCode => 'Scan cód QR';

  @override
  String get none => 'Aon cheann';

  @override
  String get noPasswordRecoveryDescription =>
      'Níor chuir tú bealach leis do phasfhocal a aisghabháil fós.';

  @override
  String get noPermission => 'Gan cead';

  @override
  String get noRoomsFound => 'Níor aimsíodh aon seomraí…';

  @override
  String get notifications => 'Fógraí';

  @override
  String get notificationsEnabledForThisAccount =>
      'Fógraí cumasaithe don chuntas seo';

  @override
  String numUsersTyping(int count) {
    return 'Tá $count úsáideoirí ag clóscríobh…';
  }

  @override
  String get obtainingLocation => 'ag Aimsiú an suíomh…';

  @override
  String get offensive => 'Maslach';

  @override
  String get offline => 'As líne';

  @override
  String get ok => 'Ceart go leor';

  @override
  String get online => 'Ar líne';

  @override
  String get onlineKeyBackupEnabled => 'Tá Cúltaca Eochair Ar Líne cumasaithe';

  @override
  String get oopsPushError =>
      'Hoips! Ar an drochuair, tharla earráid nuair a bhí na fógraí brú á mbunú.';

  @override
  String get oopsSomethingWentWrong => 'Úps, chuaigh rud éigin mícheart …';

  @override
  String get openAppToReadMessages =>
      'Oscail an aip chun teachtaireachtaí a léamh';

  @override
  String get openCamera => 'Oscail ceamara';

  @override
  String get openVideoCamera => 'Oscail físcheamara';

  @override
  String get oneClientLoggedOut => 'Tá duine de do chliaint logáilte amach';

  @override
  String get addAccount => 'Breisigh cuntas';

  @override
  String get editBundlesForAccount => 'Cuir cuachta in eagar don chuntas seo';

  @override
  String get addToBundle => 'Cuir le bundle';

  @override
  String get removeFromBundle => 'Bain as an mbeart seo';

  @override
  String get bundleName => 'Ainm an bheartáin';

  @override
  String get enableMultiAccounts =>
      '(BÉITE) Cumasaigh cuntais iomadúla ar an gléas seo';

  @override
  String get openInMaps => 'Oscail i léarscáileanna';

  @override
  String get link => 'Nasc';

  @override
  String get serverRequiresEmail =>
      'Ní mór don fhreastalaí seo do sheoladh ríomhphoist a bhailíochtú le haghaidh clárúcháin.';

  @override
  String get or => 'Nó';

  @override
  String get participant => 'Rannpháirtí';

  @override
  String get passphraseOrKey => 'pasfhrása nó eochair téarnaimh';

  @override
  String get password => 'Pasfhocal';

  @override
  String get downloads => 'Downloads';

  @override
  String get passwordForgotten => 'Pasfhocal dearmadta';

  @override
  String get passwordHasBeenChanged => 'Athraíodh an pasfhocal';

  @override
  String get hideMemberChangesInPublicChats =>
      'Cuir athruithe ball i gcomhráite poiblí i bhfolach';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Ná taispeáin san amlíne comhrá má théann duine isteach i gcomhrá poiblí nó má fhágann sé nó sí é chun inléiteacht a fheabhsú.';

  @override
  String get overview => 'Forbhreathnú';

  @override
  String get notifyMeFor => 'Cuir in iúl dom le haghaidh';

  @override
  String get passwordRecoverySettings => 'Socruithe athshlánaithe pasfhocal';

  @override
  String get passwordRecovery => 'Aisfháil pasfhocail';

  @override
  String get people => 'Daoine';

  @override
  String get pickImage => 'Roghnaigh íomhá';

  @override
  String get pin => 'Biorán';

  @override
  String play(String fileName) {
    return 'Seinn $fileName';
  }

  @override
  String get pleaseChoose => 'Roghnaigh le do thoil';

  @override
  String get pleaseChooseAPasscode => 'Roghnaigh paschód le do thoil';

  @override
  String get pleaseClickOnLink =>
      'Cliceáil ar an nasc sa ríomhphost agus ansin lean ar aghaidh.';

  @override
  String get pleaseEnter4Digits =>
      'Iontráil 4 dhigit le do thoil nó fág folamh chun glas aipe a dhíchumasú.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Cuir isteach d\'eochair athshlánaithe le do thoil:';

  @override
  String get pleaseEnterYourPassword => 'Iontráil do phasfhocal le do thoil';

  @override
  String get pleaseEnterYourPin => 'Cuir isteach d\'uimhir PIN le do thoil';

  @override
  String get pleaseEnterYourUsername =>
      'Cuir isteach d\'ainm úsáideora le do thoil';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Lean na treoracha ar an suíomh gréasáin agus tapáil \"ar aghaidh\".';

  @override
  String get privacy => 'Príobháideacht';

  @override
  String get publicRooms => 'Seomraí Poiblí';

  @override
  String get pushRules => 'Rialacha na bhfógraí';

  @override
  String get reason => 'Fáth';

  @override
  String get recording => 'Ag Taifeadadh';

  @override
  String redactedBy(String username) {
    return 'Arna chur in eagar ag $username';
  }

  @override
  String get directChat => 'Comhrá díreach';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Athbhreithnithe ag $username mar: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return 'Rinne $username cinsire imeacht';
  }

  @override
  String get redactMessage => 'Bain teachtaireacht amach';

  @override
  String get register => 'Cláraigh';

  @override
  String get reject => 'Diúltaigh';

  @override
  String rejectedTheInvitation(String username) {
    return 'Dhiúltaigh $username don chuireadh';
  }

  @override
  String get rejoin => 'Téigh ar ais isteach';

  @override
  String get removeAllOtherDevices => 'Bain gach gléas eile';

  @override
  String removedBy(String username) {
    return 'Bainte de ag $username';
  }

  @override
  String get removeDevice => 'Bain gléas';

  @override
  String get unbanFromChat => 'Cuir deireadh an cosc ón gcomhrá';

  @override
  String get removeYourAvatar => 'Bain d\'abhatár';

  @override
  String get replaceRoomWithNewerVersion =>
      'Cuir leagan seomra níos nuaí in ionad an tseomra';

  @override
  String get reply => 'Freagair';

  @override
  String get reportMessage => 'Tuairiscigh teachtaireacht';

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
  String get requestPermission => 'Iarr cead';

  @override
  String get roomHasBeenUpgraded => 'Uasghrádaíodh an seomra';

  @override
  String get roomVersion => 'Leagan seomra';

  @override
  String get saveFile => 'Sábháil comhad';

  @override
  String get retry => 'Retry';

  @override
  String get search => 'Cuardaigh';

  @override
  String get security => 'Slándáil';

  @override
  String get recoveryKey => 'Eochair athshlánaithe';

  @override
  String get recoveryKeyLost => 'Eochair athshlánaithe caillte?';

  @override
  String seenByUser(String username) {
    return 'Le feiceáil ag $username';
  }

  @override
  String get send => 'Seol';

  @override
  String get sendAMessage => 'Seol teachtaireacht';

  @override
  String get sendAsText => 'Seol mar théacs';

  @override
  String get sendAudio => 'Seol fuaim';

  @override
  String get sendFile => 'Seol comhad';

  @override
  String get sendImage => 'Seol íomhá';

  @override
  String sendImages(int count) {
    return 'Seol $count íomhá';
  }

  @override
  String get sendMessages => 'Seol teachtaireachtaí';

  @override
  String get sendOriginal => 'Seol an bunchóip';

  @override
  String get sendSticker => 'Seol greamán';

  @override
  String get sendVideo => 'Seol físeán';

  @override
  String sentAFile(String username) {
    return '📁 sheol $username comhad';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 sheol $username fuaim';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ sheol $username pictiúr';
  }

  @override
  String sentASticker(String username) {
    return '😊 sheol $username greamán';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 sheol $username físeán';
  }

  @override
  String sentCallInformations(String senderName) {
    return 'Sheol $senderName faisnéis maidir le glaonna';
  }

  @override
  String get separateChatTypes => 'Comhráite Díreacha agus Grúpaí ar Leith';

  @override
  String get setAsCanonicalAlias => 'Socraigh mar phríomh-ailias';

  @override
  String get setCustomEmotes => 'Socraigh straoiseoga saincheaptha';

  @override
  String get setChatDescription => 'Socraigh cur síos ar an gcomhrá';

  @override
  String get setInvitationLink => 'Socraigh nasc cuiridh';

  @override
  String get setPermissionsLevel => 'Socraigh leibhéal ceadanna';

  @override
  String get setStatus => 'Cuir stádas';

  @override
  String get settings => 'Socruithe';

  @override
  String get share => 'Roinn';

  @override
  String sharedTheLocation(String username) {
    return 'Roinn $username a suíomh';
  }

  @override
  String get shareLocation => 'Roinn suíomh';

  @override
  String get showPassword => 'Taispeáin pasfhocal';

  @override
  String get presenceStyle => 'Láithreacht:';

  @override
  String get hideAvatarsInInvites => 'Hide avatars in invites';

  @override
  String get hideAvatarsInInvitesDescription =>
      'Do not show room avatars in invites';

  @override
  String get presencesToggle =>
      'Taispeáin teachtaireachtaí stádais ó úsáideoirí eile';

  @override
  String get pureBlackToggle => 'Pure Black';

  @override
  String get singlesignon => 'Sínigh Aonair ar';

  @override
  String get skip => 'Léim';

  @override
  String get sourceCode => 'Cód foinseach';

  @override
  String get spaceIsPublic => 'Tá an spás poiblí';

  @override
  String get spaceName => 'Ainm an spáis';

  @override
  String startedACall(String senderName) {
    return 'Thosaigh $senderName glao';
  }

  @override
  String get startFirstChat => 'Cuir tús le do chéad chomhrá';

  @override
  String get status => 'Staid';

  @override
  String get statusExampleMessage => 'Conas atá tú inniu?';

  @override
  String get submit => 'Cuir isteach';

  @override
  String get synchronizingPleaseWait => 'Ag sioncrónú... Fan, le do thoil.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Ag sioncronú… ($percentage%)';
  }

  @override
  String get systemTheme => 'Córas';

  @override
  String get theyDontMatch => 'Níl siad céanna';

  @override
  String get theyMatch => 'Tá siad céanna';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Scoránaigh mar ceann is fearr leat';

  @override
  String get toggleMuted => 'Scoránaigh mar ciúnaithe';

  @override
  String get toggleUnread => 'Marcáil Léite/Neamhléite';

  @override
  String get tooManyRequestsWarning =>
      'An iomarca iarratas. Bain triail eile as níos déanaí!';

  @override
  String get transferFromAnotherDevice => 'Aistriú ó ghléas eile';

  @override
  String get tryToSendAgain => 'Déan iarracht a sheoladh arís';

  @override
  String get unavailable => 'Níl ar fáil';

  @override
  String unbannedUser(String username, String targetName) {
    return 'Chuir $username deireadh an cosc $targetName';
  }

  @override
  String get unblockDevice => 'Díbhlocáil Gléas';

  @override
  String get unknownDevice => 'Gléas anaithnid';

  @override
  String get unknownEncryptionAlgorithm => 'Algartam criptithe anaithnid';

  @override
  String unknownEvent(String type) {
    return 'Imeacht anaithnid \'$type\'';
  }

  @override
  String get unmuteChat => 'Neamhciúnaigh comhrá';

  @override
  String get unpin => 'Bain biorán';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount comhráite neamhléite',
      one: '1 comhrá neamhléite',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return 'tá $username agus $count daoine eile ag clóscríobh…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return 'Tá $username agus $username2 ag clóscríobh…';
  }

  @override
  String userIsTyping(String username) {
    return 'Tá $username ag clóscríobh…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 D\'fhág $username an comhrá';
  }

  @override
  String get username => 'Ainm úsáideora';

  @override
  String userSentUnknownEvent(String username, String type) {
    return 'Sheol $username imeacht $type';
  }

  @override
  String get unverified => 'Neamhfhíoraithe';

  @override
  String get verified => 'Deimhnithe';

  @override
  String get verify => 'Deimhnigh';

  @override
  String get verifyStart => 'Tosaigh Fíorú';

  @override
  String get verifySuccess => 'D\'fhíoraigh tú go rathúil!';

  @override
  String get verifyTitle => 'Ag fíorú cuntas eile';

  @override
  String get videoCall => 'Físghlao';

  @override
  String get visibilityOfTheChatHistory => 'Infheictheacht stair na comhrá';

  @override
  String get visibleForAllParticipants =>
      'Infheicthe do na rannpháirtithe go léir';

  @override
  String get visibleForEveryone => 'Infheicthe do gach duine';

  @override
  String get voiceMessage => 'Glórphost';

  @override
  String get waitingPartnerAcceptRequest =>
      'Ag fanacht le comhpháirtí glacadh leis an iarratas…';

  @override
  String get waitingPartnerEmoji =>
      'Ag fanacht le comhpháirtí glacadh leis na straoiseoga…';

  @override
  String get waitingPartnerNumbers =>
      'Ag fanacht le comhpháirtí glacadh leis na huimhreacha …';

  @override
  String get wallpaper => 'Cúlbhrat:';

  @override
  String get warning => 'Rabhadh!';

  @override
  String get weSentYouAnEmail => 'Sheolamar ríomhphost chugat';

  @override
  String get whoCanPerformWhichAction => 'Cé atá in ann an gníomh a dhéanamh';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Cé a bhfuil cead aige/aici dul isteach sa ghrúpa seo';

  @override
  String get whyDoYouWantToReportThis =>
      'Cén fáth ar mhaith leat é seo a thuairisciú?';

  @override
  String get wipeChatBackup =>
      'An bhfuil fonn ort cúltaca do chomhrá a scriosadh chun eochair athshlánaithe nua a chruthú?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Leis na seoltaí seo is féidir leat do phasfhocal a athshlánú.';

  @override
  String get writeAMessage => 'Scríobh teachtaireacht…';

  @override
  String get yes => 'Tá';

  @override
  String get you => 'Tú';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Níl tú ag glacadh páirte sa chomhrá seo a thuilleadh';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Cuireadh cosc ort ón gcomhrá seo';

  @override
  String get yourPublicKey => 'D\'eochair phoiblí';

  @override
  String get messageInfo => 'Eolas teachtaireachta';

  @override
  String get time => 'Am';

  @override
  String get messageType => 'Cineál Teachtaireachta';

  @override
  String get sender => 'Seoltóir';

  @override
  String get openGallery => 'Oscail gailearaí';

  @override
  String get removeFromSpace => 'Bain as spás';

  @override
  String get addToSpaceDescription =>
      'Roghnaigh spás chun an comhrá seo a chur leis.';

  @override
  String get start => 'Tosaigh';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Chun do sheanteachtaireachtaí a dhíghlasáil, cuir isteach d\'eochair athshlánaithe a gineadh i seisiún eile. NÍ do phasfhocal í d\'eochair athshlánaithe.';

  @override
  String get publish => 'Foilsigh';

  @override
  String videoWithSize(String size) {
    return 'Físeán ($size)';
  }

  @override
  String get openChat => 'Oscail Comhrá';

  @override
  String get markAsRead => 'Marcáil mar léite';

  @override
  String get reportUser => 'Déan tuairisc ar úsáideoir';

  @override
  String get dismiss => 'Díbhe';

  @override
  String reactedWith(String sender, String reaction) {
    return 'D\'fhreagair $sender le $reaction';
  }

  @override
  String get pinMessage => 'PIN go seomra';

  @override
  String get confirmEventUnpin =>
      'An bhfuil tú cinnte an t-imeacht a dhíphionnáil go buan?';

  @override
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Cuir glaoch';

  @override
  String get voiceCall => 'Glao gutha';

  @override
  String get unsupportedAndroidVersion => 'Leagan Android gan tacaíocht';

  @override
  String get unsupportedAndroidVersionLong =>
      'Éilíonn an ghné seo leagan Android níos nuaí. Seiceáil le haghaidh nuashonruithe nó tacaíocht Lineage OS.';

  @override
  String get videoCallsBetaWarning =>
      'Tabhair faoi deara go bhfuil físglaonna i béite. B\'fhéidir nach bhfeidhmíonn siad ar gach ardán chomh atá súil aige ná ar bith.';

  @override
  String get experimentalVideoCalls => 'Glaonna físe turgnamhacha';

  @override
  String get emailOrUsername => 'Ríomhphost nó ainm úsáideora';

  @override
  String get indexedDbErrorTitle => 'Saincheisteanna mód príobháideach';

  @override
  String get indexedDbErrorLong =>
      'Ar an drochuair níl an stóráil teachtaireachta cumasaithe sa mhód príobháideach de réir réamhshocraithe.\nTabhair cuairt le do thoil\n - faoi: config\n - socraithe dom.indexedDB.privateBrowsing.enabled go fíor\nSeachas sin, ní féidir FluffyChat a rith.';

  @override
  String switchToAccount(String number) {
    return 'Athraigh go cuntas $number';
  }

  @override
  String get nextAccount => 'An chéad chuntas eile';

  @override
  String get previousAccount => 'Cuntas roimhe seo';

  @override
  String get addWidget => 'Cuir giuirléid leis';

  @override
  String get widgetVideo => 'Físeán';

  @override
  String get widgetEtherpad => 'Nóta téacs';

  @override
  String get widgetJitsi => 'Jitsi le chéile';

  @override
  String get widgetCustom => 'Saincheaptha';

  @override
  String get widgetName => 'Ainm';

  @override
  String get widgetUrlError => 'Ní URL bailí é seo.';

  @override
  String get widgetNameError => 'Tabhair ainm taispeána, le do thoil.';

  @override
  String get errorAddingWidget => 'Earráid agus an ghiuirléid á cur leis.';

  @override
  String get youRejectedTheInvitation => 'Dhiúltaigh tú don chuireadh';

  @override
  String get youJoinedTheChat => 'Chuaigh tú isteach sa chomhrá';

  @override
  String get youAcceptedTheInvitation => '👍 Ghlac tú leis an gcuireadh';

  @override
  String youBannedUser(String user) {
    return 'Chuir tú cosc ar $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Tharraing tú siar an cuireadh do $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Tugadh cuireadh duit trí nasc chuig:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Thug $user cuireadh duit';
  }

  @override
  String invitedBy(String user) {
    return '📩 Cuireadh ó $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Thug tú cuireadh do $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Chiceáil tú $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Chiceáil tú agus chuir tú cosc ar $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Unbanned tú $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 Tá $user tar éis cnagadh';
  }

  @override
  String get usersMustKnock => 'Ní mór d\'úsáideoirí cnag a chur ar';

  @override
  String get noOneCanJoin => 'Ní féidir le duine ar bith páirt a ghlacadh';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return 'Ba mhaith le $user páirt a ghlacadh sa chomhrá.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Níor cruthaíodh aon nasc poiblí go fóill';

  @override
  String get knock => 'Cnoc Mhuire';

  @override
  String get users => 'Úsáideoirí';

  @override
  String get unlockOldMessages => 'Díghlasáil seanteachtaireachtaí';

  @override
  String get storeInSecureStorageDescription =>
      'Stóráil an eochair aisghabhála i stóráil slán an ghléis seo.';

  @override
  String get saveKeyManuallyDescription =>
      'Sábháil an eochair seo de láimh trí dialóg nó gearrthaisce comhroinnte an chórais a spreagadh.';

  @override
  String get storeInAndroidKeystore => 'Stóráil i Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Stóráil i Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Stóráil go daingean ar an ngléas seo';

  @override
  String countFiles(int count) {
    return 'Comhaid $count';
  }

  @override
  String get user => 'Úsáideoir';

  @override
  String get custom => 'Saincheaptha';

  @override
  String get foregroundServiceRunning =>
      'Tá an fógra seo le feiceáil nuair atá an tseirbhís tulra ag rith.';

  @override
  String get screenSharingTitle => 'comhroinnt scáileáin';

  @override
  String get screenSharingDetail => 'Tá do scáileán á roinnt agat i FuffyChat';

  @override
  String get callingPermissions => 'Ceadanna a ghlaoch';

  @override
  String get callingAccount => 'Cuntas ag glaoch';

  @override
  String get callingAccountDetails =>
      'Ceadaíonn FluffyChat an aip dhiailiú android dúchais a úsáid.';

  @override
  String get appearOnTop => 'Le feiceáil ar an mbarr';

  @override
  String get appearOnTopDetails =>
      'Ceadaíonn sé don aip a bheith ar bharr (ní gá má tá socrú Fluffychat agat cheana féin mar chuntas glao)';

  @override
  String get otherCallingPermissions =>
      'Micreafón, ceamara agus ceadanna FluffyChat eile';

  @override
  String get whyIsThisMessageEncrypted =>
      'Cén fáth nach féidir an teachtaireacht seo a léamh?';

  @override
  String get noKeyForThisMessage =>
      'Féadfaidh sé seo tarlú má seoladh an teachtaireacht sular shínigh tú isteach ar do chuntas ag an ngléas seo.\n\nIs féidir freisin gur chuir an seoltóir bac ar do ghléas nó go ndeachaigh rud éigin mícheart leis an nasc idirlín.\n\nAn bhfuil tú in ann an teachtaireacht a léamh ar sheisiún eile? Ansin is féidir leat an teachtaireacht a aistriú uaidh! Téigh go Socruithe > Gléasanna agus cinntigh go bhfuil do ghléasanna fíoraithe a chéile. Nuair a osclaíonn tú an seomra an chéad uair eile agus an dá sheisiún sa tulra, déanfar na heochracha a tharchur go huathoibríoch.\n\nNár mhaith leat na heochracha a chailleadh agus tú ag logáil amach nó ag aistriú gléasanna? Déan cinnte go bhfuil an cúltaca comhrá cumasaithe agat sna socruithe.';

  @override
  String get newGroup => 'Grúpa nua';

  @override
  String get newSpace => 'Spás nua';

  @override
  String get enterSpace => 'Iontráil spás';

  @override
  String get enterRoom => 'Iontráil seomra';

  @override
  String get allSpaces => 'Gach spás';

  @override
  String numChats(String number) {
    return 'Comhráite $number';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Folaigh imeachtaí stáit gan tábhacht';

  @override
  String get hidePresences => 'Folaigh Liosta Stádais?';

  @override
  String get doNotShowAgain => 'Ná taispeáin arís';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Comhrá folamh (bhí $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Ligeann spásanna duit do chomhráite a chomhdhlúthú agus pobail phríobháideacha nó phoiblí a thógáil.';

  @override
  String get encryptThisChat => 'Criptigh an comhrá seo';

  @override
  String get disableEncryptionWarning =>
      'Ar chúiseanna slándála ní féidir leat criptiú a dhíchumasú i gcomhrá, áit ar cumasaíodh é roimhe seo.';

  @override
  String get sorryThatsNotPossible => 'Tá brón orm... nach féidir a dhéanamh';

  @override
  String get deviceKeys => 'Eochracha gléis:';

  @override
  String get reopenChat => 'Comhrá a athoscailt';

  @override
  String get noBackupWarning =>
      'Rabhadh! Gan cúltaca comhrá a chumasú, caillfidh tú rochtain ar do theachtaireachtaí criptithe. Moltar go mór an cúltaca comhrá a chumasú ar dtús sula logálann tú amach.';

  @override
  String get noOtherDevicesFound => 'Níor aimsíodh aon ghléas eile';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Ní féidir seol! Ní thacaíonn an freastalaí ach le ceangaltáin suas le $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Sábháladh an comhad ag $path';
  }

  @override
  String get jumpToLastReadMessage =>
      'Léim go dtí an teachtaireacht léite is déanaí';

  @override
  String get readUpToHere => 'Léigh suas go dtí seo';

  @override
  String get jump => 'Léim';

  @override
  String get openLinkInBrowser => 'Oscail nasc sa bhrabhsálaí';

  @override
  String get reportErrorDescription =>
      '😭 Ó, a mhac go deo. Chuaigh rud éigin mícheart. Más mian leat, is féidir leat an fabht seo a thuairisciú do na forbróirí.';

  @override
  String get report => 'tuairisc';

  @override
  String get signInWithPassword => 'Sínigh isteach le pasfhocal';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Bain triail eile as níos déanaí nó roghnaigh freastalaí eile.';

  @override
  String signInWith(String provider) {
    return 'Sínigh isteach le $provider';
  }

  @override
  String get profileNotFound =>
      'Níorbh fhéidir an t-úsáideoir a aimsiú ar an bhfreastalaí. B\'fhéidir go bhfuil fadhb nasctha ann nó nach bhfuil an t-úsáideoir ann.';

  @override
  String get setTheme => 'Socraigh téama:';

  @override
  String get setColorTheme => 'Socraigh téama datha:';

  @override
  String get invite => 'Tabhair cuireadh';

  @override
  String get inviteGroupChat => '📨 Tabhair cuireadh comhrá grúpa';

  @override
  String get invitePrivateChat => '📨 Tabhair cuireadh comhrá príobháideach';

  @override
  String get invalidInput => 'Ionchur neamhbhailí!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Tháinig biorán mícheart isteach! Bain triail eile as i $seconds soicind...';
  }

  @override
  String get pleaseEnterANumber => 'Iontráil uimhir níos mó ná 0';

  @override
  String get archiveRoomDescription =>
      'Bogfar an comhrá go dtí an chartlann. Beidh úsáideoirí eile in ann a fheiceáil gur fhág tú an comhrá.';

  @override
  String get roomUpgradeDescription =>
      'Déanfar an comhrá a athchruthú ansin leis an leagan seomra nua. Cuirfear in iúl do gach rannpháirtí go gcaithfidh siad aistriú chuig an gcomhrá nua. Is féidir leat tuilleadh eolais a fháil faoi leaganacha seomra ag https://spec.matrix.org/latest/rooms/';

  @override
  String get removeDevicesDescription =>
      'Beidh tú logáilte amach as an ngléas seo agus ní bheidh tú in ann teachtaireachtaí a fháil a thuilleadh.';

  @override
  String get banUserDescription =>
      'Beidh cosc ar an úsáideoir ón gcomhrá agus ní bheidh sé in ann dul isteach sa chomhrá arís go dtí go mbeidh siad gan chosc.';

  @override
  String get unbanUserDescription =>
      'Beidh an t-úsáideoir in ann dul isteach sa chomhrá arís má dhéanann siad iarracht.';

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
      'Ciceáiltear an t-úsáideoir as an gcomhrá ach níl cosc air. I gcomhráite poiblí, is féidir leis an úsáideoir teacht ar ais ag am ar bith.';

  @override
  String get makeAdminDescription =>
      'Nuair a dhéanann tú an riarachán úsáideora seo, b\'fhéidir nach mbeidh tú in ann é seo a chealú mar go mbeidh na ceadanna céanna acu agus atá agat.';

  @override
  String get pushNotificationsNotAvailable => 'Níl fógraí brú ar fáil';

  @override
  String get learnMore => 'Faigh tuilleadh eolais';

  @override
  String get yourGlobalUserIdIs => 'Is é d\'aitheantas úsáideora domhanda: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Ar an drochuair ní fhéadfaí aon úsáideoir a aimsiú le \"$query\". Seiceáil le do thoil an ndearna tú typo.';
  }

  @override
  String get knocking => 'Cnagadh';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Is féidir comhrá a aimsiú tríd an gcuardach ar $server';
  }

  @override
  String get searchChatsRooms => 'Cuardaigh #chats, @users...';

  @override
  String get nothingFound => 'Níor aimsíodh aon rud...';

  @override
  String get groupName => 'Ainm an ghrúpa';

  @override
  String get createGroupAndInviteUsers =>
      'Cruthaigh grúpa agus tabhair cuireadh d\'úsáideoirí';

  @override
  String get groupCanBeFoundViaSearch =>
      'Is féidir teacht ar ghrúpa trí chuardach';

  @override
  String get wrongRecoveryKey =>
      'Tá brón orm... Ní cosúil gurb é seo an eochair aisghabhála ceart.';

  @override
  String get startConversation => 'Tosaigh comhrá';

  @override
  String get commandHint_sendraw => 'Seol json amh';

  @override
  String get databaseMigrationTitle => 'Tá an bunachar sonraí optamaithe';

  @override
  String get databaseMigrationBody =>
      'Fan, le do thoil. B\'fhéidir go dtógfaidh sé seo nóiméad.';

  @override
  String get leaveEmptyToClearStatus => 'Fág folamh chun do stádas a ghlanadh.';

  @override
  String get select => 'Roghnaigh';

  @override
  String get searchForUsers => 'Cuardaigh @users...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Iontráil do phasfhocal reatha le do thoil';

  @override
  String get newPassword => 'Pasfhocal nua';

  @override
  String get pleaseChooseAStrongPassword => 'Roghnaigh pasfhocal láidir';

  @override
  String get passwordsDoNotMatch => 'Ní mheaitseálann pasfhocail';

  @override
  String get passwordIsWrong => 'Tá do phasfhocal iontrála mícheart';

  @override
  String get publicLink => 'Nasc poiblí';

  @override
  String get publicChatAddresses => 'Seoltaí comhrá poiblí';

  @override
  String get createNewAddress => 'Cruthaigh seoladh nua';

  @override
  String get joinSpace => 'Glac páirt sa spás';

  @override
  String get publicSpaces => 'Spásanna poiblí';

  @override
  String get addChatOrSubSpace => 'Cuir comhrá nó fo-spás leis';

  @override
  String get subspace => 'Fospás';

  @override
  String get decline => 'Meath';

  @override
  String get thisDevice => 'An gléas seo:';

  @override
  String get initAppError => 'Tharla earráid agus an feidhmchlár á thosú';

  @override
  String get userRole => 'Ról an úsáideora';

  @override
  String minimumPowerLevel(String level) {
    return 'Is é $level an t-íosleibhéal cumhachta.';
  }

  @override
  String searchIn(String chat) {
    return 'Cuardaigh i gcomhrá \"$chat\"...';
  }

  @override
  String get searchMore => 'Cuardaigh tuilleadh...';

  @override
  String get gallery => 'Gailearaí';

  @override
  String get files => 'Comhaid';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Ní féidir bunachar sonraí SQlite a thógáil. Déanann an aip iarracht an bunachar sonraí oidhreachta a úsáid anois. Tuairiscigh an earráid seo do na forbróirí ag $url. Is í an teachtaireacht earráide: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Cailltear do sheisiún. Tuairiscigh an earráid seo do na forbróirí ag $url. Is í an teachtaireacht earráide: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Déanann an aip iarracht anois do sheisiún a chur ar ais ón gcúltaca. Tuairiscigh an earráid seo do na forbróirí ag $url. Is í an teachtaireacht earráide: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Seol teachtaireacht ar aghaidh chuig $roomName?';
  }

  @override
  String get sendReadReceipts => 'Seol admhálacha léite';

  @override
  String get sendTypingNotificationsDescription =>
      'Is féidir le rannpháirtithe eile i gcomhrá a fheiceáil nuair atá teachtaireacht nua á clóscríobh agat.';

  @override
  String get sendReadReceiptsDescription =>
      'Is féidir le rannpháirtithe eile i gcomhrá a fheiceáil nuair a bhíonn teachtaireacht léite agat.';

  @override
  String get formattedMessages => 'Teachtaireachtaí formáidithe';

  @override
  String get formattedMessagesDescription =>
      'Taispeáin ábhar saibhir teachtaireachta cosúil le téacs trom ag baint úsáide as marcáil síos.';

  @override
  String get verifyOtherUser => '🔐 Fíoraigh úsáideoir eile';

  @override
  String get verifyOtherUserDescription =>
      'Má fhíoraíonn tú úsáideoir eile, is féidir leat a bheith cinnte go bhfuil a fhios agat cé leis a bhfuil tú ag scríobh i ndáiríre. 💪\n\nNuair a thosaíonn tú fíorú, feicfidh tú féin agus an t-úsáideoir eile aníos san aip. Ansin feicfidh tú sraith emojis nó uimhreacha a chaithfidh tú a chur i gcomparáid lena chéile.\n\nIs é an bealach is fearr chun é seo a dhéanamh ná bualadh le chéile nó glao físe a thosú. 👭';

  @override
  String get verifyOtherDevice => '🔐 Fíoraigh gléas eile';

  @override
  String get verifyOtherDeviceDescription =>
      'Nuair a fhíoraíonn tú gléas eile, is féidir leis na gléasanna sin eochracha a mhalartú, do shlándáil fhoriomlán a mhéadú. 💪 Nuair a thosaíonn tú fíorú, beidh preabfhuinneog le feiceáil san aip ar an dá ghléas. Ansin feicfidh tú sraith emojis nó uimhreacha a chaithfidh tú a chur i gcomparáid lena chéile. Is fearr an dá ghléas a bheith áisiúil sula dtosaíonn tú ar an bhfíorú. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender glacadh le fíorú eochair';
  }

  @override
  String get customReaction => 'Add reaction';

  @override
  String canceledKeyVerification(String sender) {
    return '$sender cealaithe fíorú eochrach';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender fíorú eochair críochnaithe';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return 'Tá $sender réidh le haghaidh fíorú eochair';
  }

  @override
  String requestedKeyVerification(String sender) {
    return 'D\'iarr $sender fíorú eochrach';
  }

  @override
  String startedKeyVerification(String sender) {
    return 'Thosaigh $sender fíorú eochrach';
  }

  @override
  String get transparent => 'Trédhearcach';

  @override
  String get incomingMessages => 'Teachtaireachtaí isteach';

  @override
  String get stickers => 'Greamáin';

  @override
  String get discover => 'Faigh amach';

  @override
  String get commandHint_ignore =>
      'Déan neamhaird d\'aitheantas na maitríse sonraithe';

  @override
  String get commandHint_unignore => 'Unignore an ID maitrís tugtha';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread comhráite gan léamh';
  }

  @override
  String get noDatabaseEncryption =>
      'Ní thacaítear le criptiú bunachar sonraí ar an ardán seo';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Faoi láthair tá bac curtha ar úsáideoirí $count.';
  }

  @override
  String get restricted => 'Srianta';

  @override
  String get knockRestricted => 'Cnoc Mhuire srianta';

  @override
  String goToSpace(Object space) {
    return 'Téigh go dtí an spás: $space';
  }

  @override
  String get markAsUnread => 'Marcáil mar gan léamh';

  @override
  String userLevel(int level) {
    return '$level - Úsáideoir';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Modhnóir';
  }

  @override
  String adminLevel(int level) {
    return '$level - Riarachán';
  }

  @override
  String get changeGeneralChatSettings =>
      'Athraigh socruithe ginearálta comhrá';

  @override
  String get inviteOtherUsers =>
      'Tabhair cuireadh d\'úsáideoirí eile chuig an gcomhrá seo';

  @override
  String get changeTheChatPermissions => 'Athraigh na ceadanna comhrá';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Athraigh infheictheacht stair an chomhrá';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Athraigh an príomhsheoladh comhrá poiblí';

  @override
  String get sendRoomNotifications => 'Seol fógraí @room';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Athraigh an cur síos ar an gcomhrá';

  @override
  String get chatPermissionsDescription =>
      'Sainmhínigh cén leibhéal cumhachta is gá le haghaidh gníomhartha áirithe sa chomhrá seo. De ghnáth bíonn na leibhéil chumhachta 0, 50 agus 100 ag déanamh ionadaíochta d\'úsáideoirí, do mhodhnóirí agus do riarthóirí, ach is féidir aon ghrádú a dhéanamh.';

  @override
  String updateInstalled(String version) {
    return '🎉 Nuashonraigh $version suiteáilte!';
  }

  @override
  String get changelog => 'ChangelogName';

  @override
  String get sendCanceled => 'Cealaíodh seoladh';

  @override
  String get loginWithMatrixId => 'Logáil isteach le Matrix-ID';

  @override
  String get discoverHomeservers => 'Faigh amach faoi fhreastalaithe baile';

  @override
  String get whatIsAHomeserver => 'Cad is freastalaí baile ann?';

  @override
  String get homeserverDescription =>
      'Stóráiltear do chuid sonraí go léir ar an bhfreastalaí baile, díreach cosúil le soláthraí ríomhphoist. Is féidir leat an freastalaí baile is mian leat a úsáid a roghnú, agus is féidir leat cumarsáid a dhéanamh le gach duine fós. Foghlaim níos mó ag https://matrix.org.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Ní cosúil gur freastalaí baile comhoiriúnach é. URL mícheart?';

  @override
  String get calculatingFileSize => 'Méid an chomhaid á ríomh...';

  @override
  String get prepareSendingAttachment => 'Ullmhaigh an t- iatán á sheoladh...';

  @override
  String get sendingAttachment => 'Iatán á sheoladh...';

  @override
  String get generatingVideoThumbnail => 'Mionsamhail físe á cruthú...';

  @override
  String get compressVideo => 'Físeán á chomhbhrú...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Ceangaltán $index de $length á sheoladh...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Sroicheadh teorainn an fhreastalaí! Ag fanacht $seconds soicind...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Ní fhíoraítear ceann de do ghléasanna';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Nóta: Nuair a nascann tú do ghléasanna go léir leis an gcúltaca comhrá, déantar iad a fhíorú go huathoibríoch.';

  @override
  String get continueText => 'Lean ar aghaidh';

  @override
  String get welcomeText =>
      'Hey Hey 👋 Is é seo FluffyChat. Is féidir leat síniú isteach in aon fhreastalaí baile, atá comhoiriúnach leis https://matrix.org. Agus ansin comhrá a dhéanamh le duine ar bith. Is líonra teachtaireachtaí díláraithe ollmhór é!';

  @override
  String get blur => 'Doiléirigh:';

  @override
  String get opacity => 'Teimhneacht:';

  @override
  String get setWallpaper => 'Socraigh cúlbhrat';

  @override
  String get manageAccount => 'Bainistigh cuntas';

  @override
  String get noContactInformationProvided =>
      'Ní sholáthraíonn an freastalaí aon fhaisnéis teagmhála bhailí';

  @override
  String get contactServerAdmin => 'Déan teagmháil le admin an fhreastalaí';

  @override
  String get contactServerSecurity =>
      'Déan teagmháil le slándáil an fhreastalaí';

  @override
  String get supportPage => 'Leathanach tacaíochta';

  @override
  String get serverInformation => 'Eolas freastalaí:';

  @override
  String get name => 'Ainm';

  @override
  String get version => 'Leagan';

  @override
  String get website => 'Suíomh Gréasáin';

  @override
  String get compress => 'Comhbhrúigh';

  @override
  String get boldText => 'Téacs trom';

  @override
  String get italicText => 'Téacs iodálach';

  @override
  String get strikeThrough => 'Stailc tríd';

  @override
  String get pleaseFillOut => 'Líon amach le do thoil';

  @override
  String get invalidUrl => 'URL neamhbhailí';

  @override
  String get addLink => 'Cuir nasc leis';

  @override
  String get unableToJoinChat =>
      'Ní féidir páirt a ghlacadh sa chomhrá. B’fhéidir go bhfuil an comhrá dúnta cheana féin ag an bpáirtí eile.';

  @override
  String get previous => 'Roimhe Seo';

  @override
  String get otherPartyNotLoggedIn =>
      'Níl an páirtí eile logáilte isteach faoi láthair agus mar sin ní féidir leo teachtaireachtaí a fháil!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Úsáid \'$server\' chun logáil isteach';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Ligeann tú leis seo don aip agus don suíomh Gréasáin faisnéis a roinnt fút.';

  @override
  String get open => 'Oscail';

  @override
  String get waitingForServer => 'Ag fanacht leis an bhfreastalaí...';

  @override
  String get appIntroduction =>
      'Ligeann FluffyChat duit comhrá a dhéanamh le do chairde thar theachtairí éagsúla. Foghlaim tuilleadh ag https://matrix.org nó tapáil *Ar aghaidh*.';

  @override
  String get newChatRequest => '📩 Iarratas comhrá nua';

  @override
  String get contentNotificationSettings => 'Socruithe fógra inneachair';

  @override
  String get generalNotificationSettings => 'Socruithe ginearálta fógra';

  @override
  String get roomNotificationSettings => 'Socruithe fógra seomra';

  @override
  String get userSpecificNotificationSettings =>
      'Socruithe fógra sainiúla don úsáideoir';

  @override
  String get otherNotificationSettings => 'Socruithe fógra eile';

  @override
  String get notificationRuleContainsUserName => 'Tá Ainm Úsáideora ann';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Cuireann sé sin in iúl don úsáideoir nuair a bhíonn a ainm úsáideora i dteachtaireacht.';

  @override
  String get notificationRuleMaster => 'Balbhaigh gach fógra';

  @override
  String get notificationRuleMasterDescription =>
      'Sáraíonn sé gach riail eile agus díchumasaítear gach fógra.';

  @override
  String get notificationRuleSuppressNotices =>
      'Bain Teachtaireachtaí Uathoibrithe';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Sochtann sé fógraí ó chliaint uathoibrithe amhail róbónna.';

  @override
  String get notificationRuleInviteForMe => 'Tabhair cuireadh Do Mhise';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Cuireann sé seo ar an eolas don úsáideoir nuair a thugtar cuireadh dó/di go seomra.';

  @override
  String get notificationRuleMemberEvent => 'Imeacht Ball';

  @override
  String get notificationRuleMemberEventDescription =>
      'Sochtann fógraí le haghaidh imeachtaí ballraíochta.';

  @override
  String get notificationRuleIsUserMention => 'Luaigh Úsáideoir';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Cuireann sé sin in iúl don úsáideoir nuair a luaitear go díreach iad i dteachtaireacht.';

  @override
  String get notificationRuleContainsDisplayName => 'Tá Ainm Taispeána ann';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Cuireann sé sin in iúl don úsáideoir nuair a bhíonn a ainm taispeána i dteachtaireacht.';

  @override
  String get notificationRuleIsRoomMention => 'Luaigh Seomra';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Cuireann sé sin in iúl don úsáideoir nuair a luaitear seomra.';

  @override
  String get notificationRuleRoomnotif => 'Fógra Seomra';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Cuireann sé seo in iúl don úsáideoir nuair a bhíonn \'@room\' i dteachtaireacht.';

  @override
  String get notificationRuleTombstone => 'Leac uaighe';

  @override
  String get notificationRuleTombstoneDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí díghníomhaithe seomra.';

  @override
  String get notificationRuleReaction => 'Imoibriú';

  @override
  String get notificationRuleReactionDescription =>
      'Sochtann fógraí le haghaidh frithghníomhartha.';

  @override
  String get notificationRuleRoomServerAcl => 'Freastalaí Seomra ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Sochtann sé fógraí do liostaí rialaithe rochtana freastalaí seomra (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Cuir na hEagarthóirí ar ceal';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Sochtann fógraí le haghaidh teachtaireachtaí curtha in eagar.';

  @override
  String get notificationRuleCall => 'Glaoigh';

  @override
  String get notificationRuleCallDescription =>
      'Cuireann sé an t-úsáideoir ar an eolas faoi ghlaonna.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Seomra Duine le Duine Criptithe';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí i seomraí duine le duine criptithe.';

  @override
  String get notificationRuleRoomOneToOne => 'Seomra duine le duine';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí i seomraí duine le duine.';

  @override
  String get notificationRuleMessage => 'Teachtaireacht';

  @override
  String get notificationRuleMessageDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí ginearálta.';

  @override
  String get notificationRuleEncrypted => 'Criptithe';

  @override
  String get notificationRuleEncryptedDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí i seomraí criptithe.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi imeachtaí giuirléidí Jitsi.';

  @override
  String get notificationRuleServerAcl => 'Seachtaigh Freastalaí ACL Imeachtaí';

  @override
  String get notificationRuleServerAclDescription =>
      'Sochtann fógraí le haghaidh imeachtaí Freastalaí ACL.';

  @override
  String unknownPushRule(String rule) {
    return 'Riail bhrú anaithnid \'$rule\'';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Má scriosann tú an socrú fógra seo, ní féidir é seo a chealú.';

  @override
  String get more => 'Tuilleadh';

  @override
  String get shareKeysWith => 'Roinn na heochracha le...';

  @override
  String get shareKeysWithDescription =>
      'Cad iad na gléasanna ar cheart muinín a chur iontu ionas gur féidir leo do chuid teachtaireachtaí a léamh i gcomhráite criptithe?';

  @override
  String get allDevices => 'Gach gléasanna';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Gléasanna trasfhíoraithe má tá siad cumasaithe';

  @override
  String get crossVerifiedDevices => 'Feistí trasfhíoraithe';

  @override
  String get verifiedDevicesOnly => 'Gléasanna fíoraithe amháin';

  @override
  String get takeAPhoto => 'Glac grianghraf';

  @override
  String get recordAVideo => 'Taifead físeán';

  @override
  String get optionalMessage => 'Teachtaireacht (Roghnach)…';

  @override
  String get notSupportedOnThisDevice => 'Ní thacaítear leis ar an ngléas seo';

  @override
  String get enterNewChat => 'Cuir isteach comhrá nua';

  @override
  String get approve => 'Approve';

  @override
  String get youHaveKnocked => 'You have knocked';

  @override
  String get pleaseWaitUntilInvited =>
      'Please wait now, until someone from the room invites you.';
}
