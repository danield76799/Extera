// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class L10nTr extends L10n {
  L10nTr([String locale = 'tr']) : super(locale);

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
  String get repeatPassword => 'Parolayı tekrarlayın';

  @override
  String get notAnImage => 'Bir resim dosyası değil.';

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
  String get remove => 'Kaldır';

  @override
  String get importNow => 'Şimdi içe aktar';

  @override
  String get importEmojis => 'İfadeleri İçe Aktar';

  @override
  String get importFromZipFile => '.zip dosyasından içe aktar';

  @override
  String get exportEmotePack => 'İfade paketini .zip olarak dışa aktar';

  @override
  String get replace => 'Değiştir';

  @override
  String get about => 'Hakkında';

  @override
  String aboutHomeserver(String homeserver) {
    return '$homeserver Hakkında';
  }

  @override
  String get accept => 'Kabul et';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username katılma davetini kabul etti';
  }

  @override
  String get account => 'Hesap';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username uçtan uca şifrelemeyi etkinleştirdi';
  }

  @override
  String get addEmail => 'E-posta ekle';

  @override
  String get confirmMatrixId =>
      'Hesabınızı silmek için lütfen Matrix kimliğinizi doğrulayın.';

  @override
  String supposedMxid(String mxid) {
    return 'Bu $mxid olmalıdır';
  }

  @override
  String get addChatDescription => 'Sohbet açıklaması ekle...';

  @override
  String get addToSpace => 'Alana ekle';

  @override
  String get admin => 'Yönetici';

  @override
  String get alias => 'takma ad';

  @override
  String get all => 'Tümü';

  @override
  String get allChats => 'Tüm sohbetler';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'Şaşkın gözler gönder';

  @override
  String get commandHint_cuddle => 'Kucaklama gönder';

  @override
  String get commandHint_hug => 'Sarılma gönder';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName size şaşkın gözler gönderiyor';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName sizi kucaklıyor';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName size sarılıyor';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName aramayı yanıtladı';
  }

  @override
  String get anyoneCanJoin => 'Herkes katılabilir';

  @override
  String get appLock => 'Uygulama kilidi';

  @override
  String get appLockDescription =>
      'Kullanılmadığında PIN kodu ile uygulamayı kilitle';

  @override
  String get archive => 'Arşiv';

  @override
  String get areGuestsAllowedToJoin =>
      'Misafir kullanıcıların katılmasına izin veriliyor mu';

  @override
  String get areYouSure => 'Emin misiniz?';

  @override
  String get areYouSureYouWantToLogout =>
      'Oturumu açmak istediğinizden emin misiniz?';

  @override
  String get askSSSSSign =>
      'Diğer kişiyi imzalayabilmek için lütfen güvenli depolama parolanızı veya kurtarma anahtarınızı girin.';

  @override
  String askVerificationRequest(String username) {
    return '$username kişisinden gelen bu doğrulama isteği kabul edilsin mi?';
  }

  @override
  String get autoplayImages =>
      'Canlandırmalı çıkartmaları ve ifadeleri otomatik olarak oynat';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Ana sunucu aşağıdaki oturum açma türlerini destekliyor:\n$serverVersions\nAncak bu uygulama yalnızca aşağıdakileri destekliyor:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Yazma bildirimleri gönder';

  @override
  String get swipeRightToLeftToReply => 'Yanıtlamak için sağdan sola kaydır';

  @override
  String get sendOnEnter => 'Enter tuşu ile gönder';

  @override
  String badServerVersionsException(String serverVersions,
      String supportedVersions, Object serverVerions, Object suportedVersions) {
    return 'Ana sunucu aşağıdaki Spec sürümlerini destekliyor:\n$serverVersions\nAncak bu uygulama yalnızca $supportedVersions destekliyor';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats sohbet ve $participants katılımcı';
  }

  @override
  String get noMoreChatsFound => 'Başka sohbet bulunamadı...';

  @override
  String get noChatsFoundHere =>
      'Burada henüz sohbet bulunamadı. Aşağıdaki düğmeyi kullanarak biriyle yeni bir sohbet başlatın. ⤵️';

  @override
  String get joinedChats => 'Katılınan sohbetler';

  @override
  String get unread => 'Okunmadı';

  @override
  String get space => 'Alan';

  @override
  String get spaces => 'Alanlar';

  @override
  String get banFromChat => 'Sohbetten engelle';

  @override
  String get banned => 'Engellendi';

  @override
  String bannedUser(String username, String targetName) {
    return '$username, $targetName kişisini engelledi';
  }

  @override
  String get blockDevice => 'Aygıtı Engelle';

  @override
  String get blocked => 'Engellendi';

  @override
  String get botMessages => 'Bot mesajları';

  @override
  String get cancel => 'İptal';

  @override
  String cantOpenUri(String uri) {
    return '$uri URI\'si açılamıyor';
  }

  @override
  String get changeDeviceName => 'Aygıt adını değiştir';

  @override
  String changedTheChatAvatar(String username) {
    return '$username sohbet avatarını değiştirdi';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username sohbet açıklamasını değiştirdi: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username sohbet adını değiştirdi: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username sohbet izinlerini değiştirdi';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username görünen adını \'$displayname\' olarak değiştirdi';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username misafir erişim kurallarını değiştirdi';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username misafir erişim kurallarını değiştirdi: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username geçmiş görünürlüğünü değiştirdi';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username geçmiş görünürlüğünü değiştirdi: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username katılım kurallarını değiştirdi';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username katılım kurallarını değiştirdi: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username avatarını değiştirdi';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username oda takma adlarını değiştirdi';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username davet bağlantısını değiştirdi';
  }

  @override
  String get changePassword => 'Parolayı değiştir';

  @override
  String get changeTheHomeserver => 'Ana sunucuyu değiştir';

  @override
  String get changeTheme => 'Tarzınızı değiştirin';

  @override
  String get changeTheNameOfTheGroup => 'Grubun adını değiştir';

  @override
  String get changeYourAvatar => 'Avatarınızı değiştirin';

  @override
  String get channelCorruptedDecryptError => 'Şifreleme bozuldu';

  @override
  String get chat => 'Sohbet';

  @override
  String get yourChatBackupHasBeenSetUp => 'Sohbet yedeklemeniz ayarlandı.';

  @override
  String get chatBackup => 'Sohbet yedekleme';

  @override
  String get chatBackupDescription =>
      'Eski mesajlarınız bir kurtarma anahtarı ile güvence altına alındı. Lütfen kaybetmediğinizden emin olun.';

  @override
  String get chatDetails => 'Sohbet ayrıntıları';

  @override
  String get chatHasBeenAddedToThisSpace => 'Sohbet bu alana eklendi';

  @override
  String get chats => 'Sohbetler';

  @override
  String get chooseAStrongPassword => 'Güçlü bir parola seçin';

  @override
  String get clearArchive => 'Arşivi temizle';

  @override
  String get close => 'Kapat';

  @override
  String get commandHint_markasdm =>
      'Verilen Matrix kimliği için doğrudan mesaj odası olarak işaretle';

  @override
  String get commandHint_markasgroup => 'Grup olarak işaretle';

  @override
  String get commandHint_ban => 'Verilen kullanıcıyı bu odadan yasaklayın';

  @override
  String get commandHint_clearcache => 'Önbelleği temizleyin';

  @override
  String get commandHint_create =>
      'Boş bir grup sohbeti oluşturun\nŞifrelemeyi devre dışı bırakmak için --no-encryption kullanın';

  @override
  String get commandHint_discardsession => 'Oturumu silin';

  @override
  String get commandHint_dm =>
      'Doğrudan sohbet başlatın\nŞifrelemeyi devre dışı bırakmak için --no-encryption kullanın';

  @override
  String get commandHint_html => 'HTML biçimli metin gönderin';

  @override
  String get commandHint_invite => 'Verilen kullanıcıyı bu odaya davet edin';

  @override
  String get commandHint_join => 'Verilen odaya katılın';

  @override
  String get commandHint_kick => 'Verilen kullanıcıyı bu odadan kaldırın';

  @override
  String get commandHint_leave => 'Bu odadan ayrılın';

  @override
  String get commandHint_me => 'Kendinizi tanımlayın';

  @override
  String get commandHint_myroomavatar =>
      'Bu oda için resminizi ayarlayın (mxc-uri ile)';

  @override
  String get commandHint_myroomnick => 'Bu oda için görünen adınızı ayarlayın';

  @override
  String get commandHint_op =>
      'Verilen kullanıcının güç seviyesini ayarlayın (öntanımlı: 50)';

  @override
  String get commandHint_plain => 'Biçimlendirilmemiş metin gönderin';

  @override
  String get commandHint_react => 'Tepki olarak yanıt gönderin';

  @override
  String get commandHint_send => 'Metin gönderin';

  @override
  String get commandHint_unban =>
      'Verilen kullanıcının bu odadaki yasağını kaldırın';

  @override
  String get commandInvalid => 'Komut geçersiz';

  @override
  String commandMissing(String command) {
    return '$command bir komut değil.';
  }

  @override
  String get compareEmojiMatch => 'Lütfen emojileri karşılaştırın';

  @override
  String get compareNumbersMatch => 'Lütfen sayıları karşılaştırın';

  @override
  String get configureChat => 'Sohbeti yapılandır';

  @override
  String get confirm => 'Onayla';

  @override
  String get connect => 'Bağlan';

  @override
  String get contactHasBeenInvitedToTheGroup => 'Kişi gruba davet edildi';

  @override
  String get containsDisplayName => 'Görünen ad içerir';

  @override
  String get containsUserName => 'Kullanıcı adı içerir';

  @override
  String get contentHasBeenReported =>
      'İçerik, sunucu yöneticilerine bildirildi';

  @override
  String get copiedToClipboard => 'Panoya kopyalandı';

  @override
  String get copy => 'Kopyala';

  @override
  String get copyToClipboard => 'Panoya kopyala';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Mesajın şifresi çözülemedi: $error';
  }

  @override
  String countParticipants(int count) {
    return '$count katılımcı';
  }

  @override
  String get create => 'Oluştur';

  @override
  String createdTheChat(String username) {
    return '💬 $username sohbeti oluşturdu';
  }

  @override
  String get createGroup => 'Grup oluştur';

  @override
  String get createNewSpace => 'Yeni alan';

  @override
  String get currentlyActive => 'Şu anda etkin';

  @override
  String get darkTheme => 'Koyu';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day $month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day/$month/$year';
  }

  @override
  String get deactivateAccountWarning =>
      'Bu, kullanıcı hesabınızı devre dışı bırakacak. Bu geri alınamaz! Emin misiniz?';

  @override
  String get defaultPermissionLevel =>
      'Yeni kullanıcılar içi öntanımlı izin seviyesi';

  @override
  String get delete => 'Sil';

  @override
  String get deleteAccount => 'Hesabı sil';

  @override
  String get deleteMessage => 'Mesajı sil';

  @override
  String get device => 'Aygıt';

  @override
  String get deviceId => 'Aygıt kimliği';

  @override
  String get devices => 'Aygıtlar';

  @override
  String get directChats => 'Doğrudan Sohbetler';

  @override
  String get allRooms => 'Tüm Grup Sohbetleri';

  @override
  String get displaynameHasBeenChanged => 'Görünen ad değiştirildi';

  @override
  String get downloadFile => 'Dosyayı indir';

  @override
  String get edit => 'Düzenle';

  @override
  String get editBlockedServers => 'Engellenen sunucuları düzenle';

  @override
  String get chatPermissions => 'Sohbet izinleri';

  @override
  String get chatThreads => 'Threads';

  @override
  String get chatThreadsDescription => 'See all threads in this room';

  @override
  String get editDisplayname => 'Görünen adı düzenle';

  @override
  String get editRoomAliases => 'Oda takma adlarını düzenle';

  @override
  String get editRoomAvatar => 'Oda avatarını düzenle';

  @override
  String get emoteExists => 'İfade zaten var!';

  @override
  String get emoteInvalid => 'Geçersiz ifade kısa kodu!';

  @override
  String get emoteKeyboardNoRecents =>
      'Son kullanılan ifadeler burada görünecek...';

  @override
  String get emotePacks => 'Oda için ifade paketleri';

  @override
  String get emoteSettings => 'İfade Ayarları';

  @override
  String get globalChatId => 'Genel sohbet kimliği';

  @override
  String get accessAndVisibility => 'Erişim ve görünürlük';

  @override
  String get accessAndVisibilityDescription =>
      'Bu sohbete kimlerin katılmasına izin verilir ve sohbet nasıl keşfedilebilir.';

  @override
  String get calls => 'Aramalar';

  @override
  String get customEmojisAndStickers => 'Özel emojiler ve çıkartmalar';

  @override
  String get customEmojisAndStickersBody =>
      'Herhangi bir sohbette kullanılabilecek özel emojiler veya çıkartmalar ekleyin veya paylaşın.';

  @override
  String get emoteShortcode => 'İfade kısa kodu';

  @override
  String get emoteWarnNeedToPick =>
      'Bir ifade kısa kodu ve bir resim seçmeniz gerekiyor!';

  @override
  String get emptyChat => 'Boş sohbet';

  @override
  String get enableEmotesGlobally =>
      'İfade paketini küresel olarak etkinleştir';

  @override
  String get enableEncryption => 'Şifrelemeyi etkinleştir';

  @override
  String get enableEncryptionWarning =>
      'Artık şifrelemeyi devre dışı bırakamayacaksınız. Emin misiniz?';

  @override
  String get encrypted => 'Şifreli';

  @override
  String get encryption => 'Şifreleme';

  @override
  String get encryptionNotEnabled => 'Şifreleme etkinleştirilmedi';

  @override
  String endedTheCall(String senderName) {
    return '$senderName aramayı sonlandırdı';
  }

  @override
  String get enterAnEmailAddress => 'Bir e-posta adresi girin';

  @override
  String get homeserver => 'Ana sunucu';

  @override
  String get enterYourHomeserver => 'Ana sunucunuzu girin';

  @override
  String errorObtainingLocation(String error) {
    return 'Konum alınırken hata oluştu: $error';
  }

  @override
  String get everythingReady => 'Herşey hazır!';

  @override
  String get extremeOffensive => 'Aşırı rahatsız edici';

  @override
  String get fileName => 'Dosya adı';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Yazı tipi boyutu';

  @override
  String get forward => 'İlet';

  @override
  String get fromJoining => 'Katılmadan';

  @override
  String get fromTheInvitation => 'Davetten';

  @override
  String get goToTheNewRoom => 'Yeni odaya git';

  @override
  String get group => 'Grup';

  @override
  String get chatDescription => 'Sohbet açıklaması';

  @override
  String get chatDescriptionHasBeenChanged => 'Sohbet açıklaması değişti';

  @override
  String get groupIsPublic => 'Grup herkese açık';

  @override
  String get groups => 'Gruplar';

  @override
  String groupWith(String displayname) {
    return '$displayname ile grup';
  }

  @override
  String get guestsAreForbidden => 'Misafirlere izin verilmiyor';

  @override
  String get guestsCanJoin => 'Misafirler katılabilir';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username, $targetName için daveti geri çekti';
  }

  @override
  String get help => 'Yardım';

  @override
  String get hideRedactedEvents => 'Düzenlenmiş etkinlikleri gizle';

  @override
  String get hideRedactedMessages => 'Düzenlenen mesajları gizle';

  @override
  String get hideRedactedMessagesBody =>
      'Birisi bir mesajı düzenlerse, bu mesaj artık sohbette görünmeyecektir.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Geçersiz veya bilinmeyen mesaj biçimlerini gizle';

  @override
  String get howOffensiveIsThisContent => 'Bu içerik ne kadar rahatsız edici?';

  @override
  String get id => 'Kimlik';

  @override
  String get identity => 'Kimlik';

  @override
  String get block => 'Engelle';

  @override
  String get blockedUsers => 'Engellenen kullanıcılar';

  @override
  String get blockListDescription =>
      'Sizi rahatsız eden kullanıcıları engelleyebilirsiniz. Kişisel engelleme listenizdeki kullanıcılardan herhangi bir mesaj veya oda daveti alamazsınız.';

  @override
  String get blockUsername => 'Kullanıcı adını görmezden gel';

  @override
  String get iHaveClickedOnLink => 'Bağlantıya tıkladım';

  @override
  String get incorrectPassphraseOrKey => 'Yanlış parola veya kurtarma anahtarı';

  @override
  String get inoffensive => 'Rahatsız edici değil';

  @override
  String get inviteContact => 'Kişi davet et';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return '$contact kişisini \"$groupName\" sohbetine davet etmek istiyor musunuz?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Kişiyi $groupName grubuna davet et';
  }

  @override
  String get noChatDescriptionYet => 'Daha sohbet açıklaması oluşturulmadı.';

  @override
  String get tryAgain => 'Tekrar deneyin';

  @override
  String get invalidServerName => 'Geçersiz sunucu adı';

  @override
  String get invited => 'Davet edildi';

  @override
  String get redactMessageDescription =>
      'Bu mesaj bu görüşmedeki herkes için düzenlenecek. Bu işlem geri alınamaz.';

  @override
  String get optionalRedactReason =>
      '(İsteğe bağlı) Bu mesajı düzenleme nedeni…';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username, $targetName kişisini davet etti';
  }

  @override
  String get invitedUsersOnly => 'Sadece davet edilen kullanıcılar';

  @override
  String get inviteForMe => 'Benim için davet et';

  @override
  String inviteText(String username, String link) {
    return '$username sizi FluffyChat\'e davet etti.\n1. fluffychat.im adresini ziyaret edin ve uygulamayı kurun \n2. Kaydolun veya oturum açın \n3. Davet bağlantısını açın: \n $link';
  }

  @override
  String get isTyping => 'yazıyor…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username sohbete katıldı';
  }

  @override
  String get joinRoom => 'Odaya katıl';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username, $targetName kişisini attı';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username, $targetName kişisini attı ve engelledi';
  }

  @override
  String get kickFromChat => 'Sohbetten at';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Son görülen: $localizedTimeShort';
  }

  @override
  String get leave => 'Ayrıl';

  @override
  String get leftTheChat => 'Sohbetten ayrıldı';

  @override
  String get license => 'Lisans';

  @override
  String get lightTheme => 'Açık';

  @override
  String loadCountMoreParticipants(int count) {
    return '$count katılımcı daha yükle';
  }

  @override
  String get dehydrate => 'Oturumu dışa aktar ve aygıtı sil';

  @override
  String get dehydrateWarning =>
      'Bu eylem geri alınamaz. Yedekleme dosyasını güvenli bir şekilde sakladığınızdan emin olun.';

  @override
  String get dehydrateTor => 'TOR Kullanıcıları: Oturumu dışa aktar';

  @override
  String get dehydrateTorLong =>
      'TOR kullanıcıları için, pencereyi kapatmadan önce oturumu dışa aktarmaları tavsiye edilir.';

  @override
  String get hydrateTor =>
      'TOR Kullanıcıları: Dışa aktarılan oturumu içe aktar';

  @override
  String get hydrateTorLong =>
      'TOR\'da en son oturumunuzu dışa aktardınız mı? Hızlıca içe aktarın ve sohbete devam edin.';

  @override
  String get hydrate => 'Yedekleme dosyasından geri yükle';

  @override
  String get loadingPleaseWait => 'Yükleniyor… Lütfen bekleyin.';

  @override
  String get loadMore => 'Daha fazla yükle…';

  @override
  String get locationDisabledNotice =>
      'Konum hizmetleri devre dışı. Lütfen konumunuzu paylaşabilmek için etkinleştirin.';

  @override
  String get locationPermissionDeniedNotice =>
      'Konum izni reddedildi. Lütfen konumunuzu paylaşabilmek için izin verin.';

  @override
  String get login => 'Oturum aç';

  @override
  String logInTo(String homeserver) {
    return '$homeserver üzerinde oturum aç';
  }

  @override
  String get logout => 'Oturumu kapat';

  @override
  String get memberChanges => 'Üye değişiklikleri';

  @override
  String get mention => 'Bahset';

  @override
  String get messages => 'Mesajlar';

  @override
  String get messagesStyle => 'Mesajlar:';

  @override
  String get moderator => 'Moderatör';

  @override
  String get muteChat => 'Sohbeti sessize al';

  @override
  String get needPantalaimonWarning =>
      'Uçtan uca şifreleme kullanmak için şimdilik Pantalaimon\'a ihtiyacınız olduğunu lütfen unutmayın.';

  @override
  String get newChat => 'Yeni sohbet';

  @override
  String get newMessageInFluffyChat => '💬 FluffyChat\'te yeni mesaj';

  @override
  String get newVerificationRequest => 'Yeni doğrulama isteği!';

  @override
  String get next => 'İleri';

  @override
  String get no => 'Hayır';

  @override
  String get noConnectionToTheServer => 'Sunucuyla bağlantı yok';

  @override
  String get noEmotesFound => 'İfade bulunamadı. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Şifrelemeyi yalnızca oda artık herkese açık olmadığında etkinleştirebilirsiniz.';

  @override
  String get noGoogleServicesWarning =>
      'Görünüşe göre cihazınızda Firebase Cloud Messaging yok. Buna rağmen bildirim almaya devam etmek için ntfy yüklemenizi öneriyoruz. ntfy veya başka bir Unified Push sağlayıcısı ile anlık bildirimlerinizi güvenli bir şekilde alabilirsiniz. ntfy\'ı PlayStore veya F-Droid\'den indirebilirsiniz.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 matrix sunucusu değil, onun yerine $server2 kullanılsın mı?';
  }

  @override
  String get shareInviteLink => 'Davet bağlantısını paylaş';

  @override
  String get scanQrCode => 'QR kodunu tarayın';

  @override
  String get none => 'Yok';

  @override
  String get noPasswordRecoveryDescription =>
      'Henüz parolanızı kurtarmak için bir yol eklemediniz.';

  @override
  String get noPermission => 'İzin yok';

  @override
  String get noRoomsFound => 'Oda bulunamadı…';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get notificationsEnabledForThisAccount =>
      'Bu hesap için bildirimler etkinleştirildi';

  @override
  String numUsersTyping(int count) {
    return '$count kullanıcı yazıyor…';
  }

  @override
  String get obtainingLocation => 'Konum alınıyor…';

  @override
  String get offensive => 'Rahatsız edici';

  @override
  String get offline => 'Çevrim dışı';

  @override
  String get ok => 'Tamam';

  @override
  String get online => 'Çevrim içi';

  @override
  String get onlineKeyBackupEnabled =>
      'Çevrim içi anahtar yedekleme etkinleştirildi';

  @override
  String get oopsPushError =>
      'Tüh! Maalesef anlık bildirimlerini ayarlarken bir hata oluştu.';

  @override
  String get oopsSomethingWentWrong => 'Tüh, bir şeyler yanlış gitti…';

  @override
  String get openAppToReadMessages => 'Mesajları okumak için uygulamayı aç';

  @override
  String get openCamera => 'Kamerayı aç';

  @override
  String get openVideoCamera => 'Bir video için kamerayı aç';

  @override
  String get oneClientLoggedOut =>
      'İstemcilerinizden birinin oturumu kapatıldı';

  @override
  String get addAccount => 'Hesap ekle';

  @override
  String get editBundlesForAccount => 'Bu hesap için paketleri düzenle';

  @override
  String get addToBundle => 'Pakete ekle';

  @override
  String get removeFromBundle => 'Bu paketten kaldır';

  @override
  String get bundleName => 'Paket adı';

  @override
  String get enableMultiAccounts =>
      '(BETA) Bu aygıtta çoklu hesapları etkinleştir';

  @override
  String get openInMaps => 'Haritalarda aç';

  @override
  String get link => 'Bağlantı';

  @override
  String get serverRequiresEmail =>
      'Bu sunucunun kayıt için e-posta adresinizi doğrulaması gerekiyor.';

  @override
  String get or => 'Veya';

  @override
  String get participant => 'Katılımcı';

  @override
  String get passphraseOrKey => 'parola veya kurtarma anahtarı';

  @override
  String get password => 'Parola';

  @override
  String get downloads => 'Downloads';

  @override
  String get passwordForgotten => 'Parola unutuldu';

  @override
  String get passwordHasBeenChanged => 'Parola değiştirildi';

  @override
  String get hideMemberChangesInPublicChats =>
      'Herkese açık sohbetlerde üye değişikliklerini gizle';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Okunabilirliği artırmak için birisi herkese açık bir sohbete katıldığında veya sohbetten ayrıldığında sohbet zaman çizelgesinde gösterme.';

  @override
  String get overview => 'Genel görünüm';

  @override
  String get notifyMeFor => 'Beni bilgilendir';

  @override
  String get passwordRecoverySettings => 'Parola kurtarma ayarları';

  @override
  String get passwordRecovery => 'Parola kurtarma';

  @override
  String get people => 'İnsanlar';

  @override
  String get pickImage => 'Bir resim seç';

  @override
  String get pin => 'Sabitle';

  @override
  String play(String fileName) {
    return '$fileName dosyasını oynat';
  }

  @override
  String get pleaseChoose => 'Lütfen seçin';

  @override
  String get pleaseChooseAPasscode => 'Lütfen bir geçiş kodu seçin';

  @override
  String get pleaseClickOnLink =>
      'Lütfen e-postadaki bağlantıya tıklayın ve devam edin.';

  @override
  String get pleaseEnter4Digits =>
      'Lütfen 4 basamak girin veya uygulama kilidini devre dışı bırakmak için boş bırakın.';

  @override
  String get pleaseEnterRecoveryKey => 'Lütfen kurtarma anahtarınızı girin:';

  @override
  String get pleaseEnterYourPassword => 'Lütfen parolanızı girin';

  @override
  String get pleaseEnterYourPin => 'Lütfen PIN kodunuzu girin';

  @override
  String get pleaseEnterYourUsername => 'Lütfen kullanıcı adınızı girin';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Lütfen web sitesindeki talimatları izleyin ve \"İleri\" düğmesine dokunun.';

  @override
  String get privacy => 'Gizlilik';

  @override
  String get publicRooms => 'Herkese Açık Odalar';

  @override
  String get pushRules => 'Gönderme kuralları';

  @override
  String get reason => 'Neden';

  @override
  String get recording => 'Kaydediliyor';

  @override
  String redactedBy(String username) {
    return '$username tarafından düzenlendi';
  }

  @override
  String get directChat => 'Doğrudan sohbet';

  @override
  String redactedByBecause(String username, String reason) {
    return '$username tarafından \"$reason\" nedeniyle düzenlendi';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username bir etkinliği düzenledi';
  }

  @override
  String get redactMessage => 'Mesajı düzenle';

  @override
  String get register => 'Kaydol';

  @override
  String get reject => 'Reddet';

  @override
  String rejectedTheInvitation(String username) {
    return '$username daveti reddetti';
  }

  @override
  String get rejoin => 'Yeniden katıl';

  @override
  String get removeAllOtherDevices => 'Diğer tüm aygıtları kaldır';

  @override
  String removedBy(String username) {
    return '$username tarafından kaldırıldı';
  }

  @override
  String get removeDevice => 'Aygıtı kaldır';

  @override
  String get unbanFromChat => 'Sohbet engelini kaldır';

  @override
  String get removeYourAvatar => 'Avatarınızı kaldırın';

  @override
  String get replaceRoomWithNewerVersion => 'Odayı yeni sürümle değiştir';

  @override
  String get reply => 'Yanıtla';

  @override
  String get reportMessage => 'Mesajı bildir';

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
  String get requestPermission => 'İzin iste';

  @override
  String get roomHasBeenUpgraded => 'Oda yükseltildi';

  @override
  String get roomVersion => 'Oda sürümü';

  @override
  String get saveFile => 'Dosyayı kaydet';

  @override
  String get retry => 'Retry';

  @override
  String get search => 'Ara';

  @override
  String get security => 'Güvenlik';

  @override
  String get recoveryKey => 'Kurtarma anahtarı';

  @override
  String get recoveryKeyLost => 'Kurtarma anahtarı kayıp mı?';

  @override
  String seenByUser(String username) {
    return '$username tarafından görüldü';
  }

  @override
  String get send => 'Gönder';

  @override
  String get sendAMessage => 'Bir mesaj gönder';

  @override
  String get sendAsText => 'Metin olarak gönder';

  @override
  String get sendAudio => 'Ses gönder';

  @override
  String get sendFile => 'Dosya gönder';

  @override
  String get sendImage => 'Resim gönder';

  @override
  String sendImages(int count) {
    return '$count görsel gönder';
  }

  @override
  String get sendMessages => 'Mesajları gönder';

  @override
  String get sendOriginal => 'Orijinali gönder';

  @override
  String get sendSticker => 'Çıkartma gönder';

  @override
  String get sendVideo => 'Video gönder';

  @override
  String sentAFile(String username) {
    return '📁 $username bir dosya gönderdi';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username bir ses gönderdi';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username bir resim gönderdi';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username bir çıkartma gönderdi';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username bir video gönderdi';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName arama bilgilerini gönderdi';
  }

  @override
  String get separateChatTypes => 'Doğrudan Sohbetleri ve Grupları Ayır';

  @override
  String get setAsCanonicalAlias => 'Ana takma ad olarak ayarla';

  @override
  String get setCustomEmotes => 'Özel ifadeler ayarla';

  @override
  String get setChatDescription => 'Sohbet açıklamasını ayarla';

  @override
  String get setInvitationLink => 'Davet bağlantısı ayarla';

  @override
  String get setPermissionsLevel => 'İzin seviyesini ayarla';

  @override
  String get setStatus => 'Durumu ayarla';

  @override
  String get settings => 'Ayarlar';

  @override
  String get share => 'Paylaş';

  @override
  String sharedTheLocation(String username) {
    return '$username konumunu paylaştı';
  }

  @override
  String get shareLocation => 'Konumu paylaş';

  @override
  String get showPassword => 'Parolayı göster';

  @override
  String get presenceStyle => 'Bulunma:';

  @override
  String get hideAvatarsInInvites => 'Hide avatars in invites';

  @override
  String get hideAvatarsInInvitesDescription =>
      'Do not show room avatars in invites';

  @override
  String get presencesToggle => 'Diğer kullanıcıların durum mesajlarını göster';

  @override
  String get pureBlackToggle => 'Pure Black';

  @override
  String get singlesignon => 'Tek oturum açma';

  @override
  String get skip => 'Atla';

  @override
  String get sourceCode => 'Kaynak kodları';

  @override
  String get spaceIsPublic => 'Alan herkese açık';

  @override
  String get spaceName => 'Alan adı';

  @override
  String startedACall(String senderName) {
    return '$senderName bir arama başlattı';
  }

  @override
  String get startFirstChat => 'İlk sohbetinizi başlatın';

  @override
  String get status => 'Durum';

  @override
  String get statusExampleMessage => 'Bugün nasılsınız?';

  @override
  String get submit => 'Gönder';

  @override
  String get synchronizingPleaseWait => 'Eşzamanlanıyor… Lütfen bekleyin.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistem';

  @override
  String get theyDontMatch => 'Eşleşmediler';

  @override
  String get theyMatch => 'Eşleştiler';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Sık Kullanılanlara Ekle/Çıkar';

  @override
  String get toggleMuted => 'Sessize Al/Sessizden Çıkar';

  @override
  String get toggleUnread => 'Okundu/Okunmadı Olarak İşaretle';

  @override
  String get tooManyRequestsWarning =>
      'Çok fazla istek. Lütfen daha sonra tekrar deneyin!';

  @override
  String get transferFromAnotherDevice => 'Başka bir aygıttan aktar';

  @override
  String get tryToSendAgain => 'Tekrar göndermeyi deneyin';

  @override
  String get unavailable => 'Yok';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username, $targetName kişisinin engelini kaldırdı';
  }

  @override
  String get unblockDevice => 'Aygıtın Engellemesini Kaldır';

  @override
  String get unknownDevice => 'Bilinmeyen aygıt';

  @override
  String get unknownEncryptionAlgorithm => 'Bilinmeyen şifreleme algoritması';

  @override
  String unknownEvent(String type) {
    return 'Bilinmeyen etkinlik \'$type\'';
  }

  @override
  String get unmuteChat => 'Sohbeti sessizden çıkar';

  @override
  String get unpin => 'Sabitlemeyi kaldır';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount okunmamış sohbet',
      one: '1 okunmamış sohbet',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username ve $count diğer kişi yazıyor…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username ve $username2 yazıyor…';
  }

  @override
  String userIsTyping(String username) {
    return '$username yazıyor…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username sohbetten ayrıldı';
  }

  @override
  String get username => 'Kullanıcı adı';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username bir $type etkinliği gönderdi';
  }

  @override
  String get unverified => 'Doğrulanmadı';

  @override
  String get verified => 'Doğrulandı';

  @override
  String get verify => 'Doğrula';

  @override
  String get verifyStart => 'Doğrulamayı Başlat';

  @override
  String get verifySuccess => 'Başarıyla doğrulandı!';

  @override
  String get verifyTitle => 'Diğer hesap doğrulanıyor';

  @override
  String get videoCall => 'Görüntülü arama';

  @override
  String get visibilityOfTheChatHistory => 'Sohbet geçmişi görünürlüğü';

  @override
  String get visibleForAllParticipants => 'Tüm katılımcılar için görünür';

  @override
  String get visibleForEveryone => 'Herkes için görünür';

  @override
  String get voiceMessage => 'Sesli mesaj';

  @override
  String get waitingPartnerAcceptRequest =>
      'Ortağın isteği kabul etmesi bekleniyor…';

  @override
  String get waitingPartnerEmoji => 'Ortağın emojiyi kabul etmesi bekleniyor…';

  @override
  String get waitingPartnerNumbers =>
      'Ortağın numaraları kabul etmesi bekleniyor…';

  @override
  String get wallpaper => 'Duvar kağıdı:';

  @override
  String get warning => 'Uyarı!';

  @override
  String get weSentYouAnEmail => 'Size bir e-posta gönderdik';

  @override
  String get whoCanPerformWhichAction => 'Kim hangi eylemi gerçekleştirebilir';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Bu gruba kimler katılabilir';

  @override
  String get whyDoYouWantToReportThis => 'Bunu neden bildirmek istiyorsunuz?';

  @override
  String get wipeChatBackup =>
      'Yeni bir kurtarma anahtarı oluşturmak için sohbet yedeğiniz silinsin mi?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Bu adresler ile parolanızı kurtarabilirsiniz.';

  @override
  String get writeAMessage => 'Bir mesaj yaz…';

  @override
  String get yes => 'Evet';

  @override
  String get you => 'Sen';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Artık bu sohbette katılımcı değilsiniz';

  @override
  String get youHaveBeenBannedFromThisChat => 'Bu sohbetten engellendiniz';

  @override
  String get yourPublicKey => 'Ortak anahtarınız';

  @override
  String get messageInfo => 'Mesaj bilgileri';

  @override
  String get time => 'Zaman';

  @override
  String get messageType => 'Mesaj Türü';

  @override
  String get sender => 'Gönderen';

  @override
  String get openGallery => 'Galeriyi aç';

  @override
  String get removeFromSpace => 'Alandan kaldır';

  @override
  String get addToSpaceDescription => 'Bu sohbeti eklemek için bir alan seçin.';

  @override
  String get start => 'Başla';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Eski mesajlarınızın kilidini açmak için lütfen önceki bir oturumda oluşturulan kurtarma anahtarınızı girin. Kurtarma anahtarınız parolanız DEĞİLDİR.';

  @override
  String get publish => 'Yayınla';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Sohbeti Aç';

  @override
  String get markAsRead => 'Okundu olarak işaretle';

  @override
  String get reportUser => 'Kullanıcıyı bildir';

  @override
  String get dismiss => 'Kapat';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender, $reaction ile tepki verdi';
  }

  @override
  String get pinMessage => 'Odaya sabitle';

  @override
  String get confirmEventUnpin =>
      'Etkinliğin sabitlemesini kalıcı olarak kaldırmak istediğinizden emin misiniz?';

  @override
  String get emojis => 'Emojiler';

  @override
  String get placeCall => 'Arama yap';

  @override
  String get voiceCall => 'Sesli arama';

  @override
  String get unsupportedAndroidVersion => 'Desteklenmeyen Android sürümü';

  @override
  String get unsupportedAndroidVersionLong =>
      'Bu özellik daha yeni bir Android sürümü gerektiriyor. Lütfen güncellemelere veya LineageOS desteğine bakın.';

  @override
  String get videoCallsBetaWarning =>
      'Görüntülü aramaların şu anda beta aşamasında olduğunu lütfen unutmayın. Tüm platformlarda beklendiği gibi veya hiç çalışmayabilirler.';

  @override
  String get experimentalVideoCalls => 'Deneysel görüntülü aramalar';

  @override
  String get emailOrUsername => 'E-posta veya kullanıcı adı';

  @override
  String get indexedDbErrorTitle => 'Gizli mod sorunları';

  @override
  String get indexedDbErrorLong =>
      'Mesaj saklama özelliği ne yazık ki öntanımlı olarak gizli modda etkin değildir.\nLütfen\n - about:config sayfasına gidin ve\n - dom.indexedDB.privateBrowsing.enabled seçeneğini true olarak ayarlayın\nAksi takdirde FluffyChat çalıştırılamaz.';

  @override
  String switchToAccount(String number) {
    return '$number. hesaba geç';
  }

  @override
  String get nextAccount => 'Sonraki hesap';

  @override
  String get previousAccount => 'Önceki hesap';

  @override
  String get addWidget => 'Widget ekle';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Metin notu';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Özel';

  @override
  String get widgetName => 'Ad';

  @override
  String get widgetUrlError => 'Bu geçerli bir URL değil.';

  @override
  String get widgetNameError => 'Lütfen görünecek bir ad girin.';

  @override
  String get errorAddingWidget => 'Widget eklenirken hata oluştu.';

  @override
  String get youRejectedTheInvitation => 'Daveti reddettiniz';

  @override
  String get youJoinedTheChat => 'Sohbete katıldınız';

  @override
  String get youAcceptedTheInvitation => '👍 Daveti kabul ettiniz';

  @override
  String youBannedUser(String user) {
    return '$user kullanıcısını yasakladınız';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return '$user için daveti geri çektiniz';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Bağlantı aracılığıyla davet edildiniz:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 $user tarafından davet edildiniz';
  }

  @override
  String invitedBy(String user) {
    return '📩 $user davet etti';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 $user kullanıcısını davet ettiniz';
  }

  @override
  String youKicked(String user) {
    return '👞 $user kullanıcısını attınız';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 $user kullanıcısını attınız ve yasakladınız';
  }

  @override
  String youUnbannedUser(String user) {
    return '$user kullanıcısının yasağını kaldırdınız';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user tıklattı';
  }

  @override
  String get usersMustKnock => 'Kullanıcılar tıklatmalı';

  @override
  String get noOneCanJoin => 'Kimse katılamaz';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user sohbete katılmak istiyor.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Henüz herkese açık bir bağlantı oluşturulmadı';

  @override
  String get knock => 'Tıklat';

  @override
  String get users => 'Kullanıcılar';

  @override
  String get unlockOldMessages => 'Eski mesajların kilidini aç';

  @override
  String get storeInSecureStorageDescription =>
      'Kurtarma anahtarını bu aygıtın güvenli deposunda saklayın.';

  @override
  String get saveKeyManuallyDescription =>
      'Sistem paylaşımı iletişim kutusunu veya panoyu tetikleyerek bu anahtarı elle kaydedin.';

  @override
  String get storeInAndroidKeystore => 'Android KeyStore\'da sakla';

  @override
  String get storeInAppleKeyChain => 'Apple KeyChain\'de sakla';

  @override
  String get storeSecurlyOnThisDevice => 'Bu aygıtta güvenli bir şekilde sakla';

  @override
  String countFiles(int count) {
    return '$count dosya';
  }

  @override
  String get user => 'Kullanıcı';

  @override
  String get custom => 'Özel';

  @override
  String get foregroundServiceRunning =>
      'Bu bildirim, ön plan hizmeti çalışırken görünür.';

  @override
  String get screenSharingTitle => 'ekran paylaşımı';

  @override
  String get screenSharingDetail => 'Ekranınızı FuffyChat\'te paylaşıyorsunuz';

  @override
  String get callingPermissions => 'Arama izinleri';

  @override
  String get callingAccount => 'Arama hesabı';

  @override
  String get callingAccountDetails =>
      'FluffyChat\'in yerel android telefon uygulamasını kullanmasına izin verir.';

  @override
  String get appearOnTop => 'Üstte görün';

  @override
  String get appearOnTopDetails =>
      'Uygulamanın üstte görünmesine izin verir (Fluffychat\'ı zaten bir arama hesabı olarak ayarladıysanız gerekli değildir)';

  @override
  String get otherCallingPermissions =>
      'Mikrofon, kamera ve diğer FluffyChat izinleri';

  @override
  String get whyIsThisMessageEncrypted => 'Bu mesaj neden okunamıyor?';

  @override
  String get noKeyForThisMessage =>
      'Bu durum, mesaj siz bu aygıtta hesabınızda oturum açmadan önce gönderildiyse meydana gelebilir.\n\nGönderenin aygıtınızı engellemiş olması veya internet bağlantısında bir sorun olması da mümkündür.\n\nMesajı başka bir oturumda okuyabiliyor musunuz? O zaman mesajı oradan aktarabilirsiniz! Ayarlar > Aygıtlar bölümüne gidin ve aygıtlarınızın birbirini doğruladığından emin olun. Odayı bir sonraki sefer açtığınızda ve her iki oturum da ön planda olduğunda, anahtarlar otomatik olarak iletilecektir.\n\nOturumu kapatırken veya aygıt değiştirirken anahtarları kaybetmek istemiyor musunuz? Ayarlarda sohbet yedeklemesini etkinleştirdiğinizden emin olun.';

  @override
  String get newGroup => 'Yeni grup';

  @override
  String get newSpace => 'Yeni alan';

  @override
  String get enterSpace => 'Alana gir';

  @override
  String get enterRoom => 'Odaya gir';

  @override
  String get allSpaces => 'Tüm alanlar';

  @override
  String numChats(String number) {
    return '$number sohbet';
  }

  @override
  String get hideUnimportantStateEvents => 'Önemsiz durum etkinliklerini gizle';

  @override
  String get hidePresences => 'Durum listesi gizlensin mi?';

  @override
  String get doNotShowAgain => 'Tekrar gösterme';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Boş sohbet ($oldDisplayName idi)';
  }

  @override
  String get newSpaceDescription =>
      'Alanlar, sohbetlerinizi birleştirmenize ve özel veya genel topluluklar oluşturmanıza olanak tanır.';

  @override
  String get encryptThisChat => 'Bu sohbeti şifrele';

  @override
  String get disableEncryptionWarning =>
      'Güvenlik nedeniyle, daha önce etkinleştirildiği bir sohbette şifrelemeyi devre dışı bırakamazsınız.';

  @override
  String get sorryThatsNotPossible => 'Üzgünüm... bu mümkün değil';

  @override
  String get deviceKeys => 'Aygıt anahtarları:';

  @override
  String get reopenChat => 'Sohbeti yeniden aç';

  @override
  String get noBackupWarning =>
      'Uyarı! Sohbet yedeklemesini etkinleştirmezseniz, şifrelenen mesajlarınıza erişiminizi kaybedersiniz. Oturumu kapatmadan önce sohbet yedeklemesini etkinleştirmeniz önemle tavsiye edilir.';

  @override
  String get noOtherDevicesFound => 'Başka aygıt bulunamadı';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Gönderilemiyor! Sunucu yalnızca $max değerine kadar olan ekleri destekliyor.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Dosya $path konumuna kaydedildi';
  }

  @override
  String get jumpToLastReadMessage => 'Son okunan mesaja atla';

  @override
  String get readUpToHere => 'Buraya kadar oku';

  @override
  String get jump => 'Atla';

  @override
  String get openLinkInBrowser => 'Bağlantıyı tarayıcıda aç';

  @override
  String get reportErrorDescription =>
      '😭 Olamaz. Bir şeyler yanlış gitti. İsterseniz bu hatayı geliştiricilere bildirebilirsiniz.';

  @override
  String get report => 'bildir';

  @override
  String get signInWithPassword => 'Parola ile oturum aç';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Lütfen daha sonra tekrar deneyin veya farklı bir sunucu seçin.';

  @override
  String signInWith(String provider) {
    return '$provider ile oturum aç';
  }

  @override
  String get profileNotFound =>
      'Kullanıcı sunucuda bulunamadı. Belki bir bağlantı sorunu vardır veya kullanıcı mevcut değildir.';

  @override
  String get setTheme => 'Temayı ayarla:';

  @override
  String get setColorTheme => 'Renk temasını ayarla:';

  @override
  String get invite => 'Davet et';

  @override
  String get inviteGroupChat => '📨 Grup sohbetine davet et';

  @override
  String get invitePrivateChat => '📨 Gizli sohbete davet et';

  @override
  String get invalidInput => 'Geçersiz giriş!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Yanlış PIN girildi! $seconds saniye sonra tekrar deneyin...';
  }

  @override
  String get pleaseEnterANumber => 'Lütfen 0\'dan büyük bir sayı girin';

  @override
  String get archiveRoomDescription =>
      'Sohbet arşive taşınacak. Diğer kullanıcıları sohbeti terk ettiğinizi görebilecek.';

  @override
  String get roomUpgradeDescription =>
      'Sohbet daha sonra yeni oda sürümüyle yeniden oluşturulacaktır. Tüm katılımcılara yeni sohbete geçmeleri gerektiği bildirilecektir. Oda sürümleri hakkında daha fazla bilgiyi https://spec.matrix.org/latest/rooms/ adresinde bulabilirsiniz.';

  @override
  String get removeDevicesDescription =>
      'Bu aygıttan çıkış yapacaksınız ve artık mesaj alamayacaksınız.';

  @override
  String get banUserDescription =>
      'Kullanıcı sohbetten yasaklanacak ve yasağı kaldırılana kadar sohbete tekrar giremeyecek.';

  @override
  String get unbanUserDescription =>
      'Kullanıcı denerse sohbete tekrar girebilecektir.';

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
      'Kullanıcı sohbetten atılır ancak yasaklanmaz. Herkese açık sohbetlerde kullanıcı istediği zaman yeniden katılabilir.';

  @override
  String get makeAdminDescription =>
      'Bu kullanıcıyı yönetici yaptıktan sonra, sizinle aynı izinlere sahip olacağı için bunu geri alamayabilirsiniz.';

  @override
  String get pushNotificationsNotAvailable =>
      'Anlık bildirimler kullanılamıyor';

  @override
  String get learnMore => 'Daha fazla bilgi';

  @override
  String get yourGlobalUserIdIs => 'Genel kullanıcı kimliğiniz: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Ne yazık ki \"$query\" ile kullanıcı bulunamadı. Lütfen bir yazım hatası yapıp yapmadığınızı kontrol edin.';
  }

  @override
  String get knocking => 'Tıklat';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Sohbet $server üzerinde aranarak keşfedilebilir';
  }

  @override
  String get searchChatsRooms =>
      '#sohbetler, @kullanıcılar... için arama yapın';

  @override
  String get nothingFound => 'Hiçbir şey bulunamadı...';

  @override
  String get groupName => 'Grup ismi';

  @override
  String get createGroupAndInviteUsers =>
      'Bir grup oluşturun ve kullanıcıları davet edin';

  @override
  String get groupCanBeFoundViaSearch => 'Grup, arama ile bulunabilir';

  @override
  String get wrongRecoveryKey =>
      'Üzgünüm... bu doğru kurtarma anahtarı gibi görünmüyor.';

  @override
  String get startConversation => 'Görüşme başlat';

  @override
  String get commandHint_sendraw => 'Ham JSON gönder';

  @override
  String get databaseMigrationTitle => 'Veri tabanı iyileştirildi';

  @override
  String get databaseMigrationBody =>
      'Lütfen bekleyin. Bu biraz zaman alabilir.';

  @override
  String get leaveEmptyToClearStatus =>
      'Durumunuzu temizlemek için boş bırakın.';

  @override
  String get select => 'Seç';

  @override
  String get searchForUsers => '@kullanıcıları ara...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Lütfen geçerli parolanızı girin';

  @override
  String get newPassword => 'Yeni parola';

  @override
  String get pleaseChooseAStrongPassword => 'Lütfen güçlü bir parola seçin';

  @override
  String get passwordsDoNotMatch => 'Parolalar eşleşmiyor';

  @override
  String get passwordIsWrong => 'Girdiğiniz parola yanlış';

  @override
  String get publicLink => 'Herkese açık bağlantı';

  @override
  String get publicChatAddresses => 'Herkese açık sohbet adresleri';

  @override
  String get createNewAddress => 'Yeni adres oluştur';

  @override
  String get joinSpace => 'Alana katıl';

  @override
  String get publicSpaces => 'Herkese açık alanlar';

  @override
  String get addChatOrSubSpace => 'Sohbet veya alt alan ekle';

  @override
  String get subspace => 'Alt alan';

  @override
  String get decline => 'Reddet';

  @override
  String get thisDevice => 'Bu aygıt:';

  @override
  String get initAppError => 'Uygulama başlatılırken bir hata oluştu';

  @override
  String get userRole => 'Kullanıcı rolü';

  @override
  String minimumPowerLevel(String level) {
    return '$level en düşük güç seviyesidir.';
  }

  @override
  String searchIn(String chat) {
    return '\"$chat\" sohbeti içinde ara...';
  }

  @override
  String get searchMore => 'Daha fazla ara...';

  @override
  String get gallery => 'Galeri';

  @override
  String get files => 'Dosyalar';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'SQlite veri tabanı oluşturulamadı. Uygulama şimdilik eski veri tabanını kullanmaya çalışıyor. Lütfen bu hatayı $url adresinde geliştiricilere bildirin. Hata mesajı: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Oturumunuz kayboldu. Lütfen bu hatayı $url adresinde geliştiricilere bildirin. Hata mesajı: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Uygulama şimdi oturumunuzu yedekten geri yüklemeye çalışıyor. Lütfen bu hatayı $url adresinde geliştiricilere bildirin. Hata mesajı: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Mesajlar $roomName kişisine iletilsin mi?';
  }

  @override
  String get sendReadReceipts => 'Okundu bilgisi gönder';

  @override
  String get sendTypingNotificationsDescription =>
      'Sohbetteki diğer katılımcılar yeni bir mesaj yazdığınızı görebilir.';

  @override
  String get sendReadReceiptsDescription =>
      'Sohbetteki diğer katılımcılar bir mesajı okuduğunuzu görebilir.';

  @override
  String get formattedMessages => 'Biçimlendirilen mesajlar';

  @override
  String get formattedMessagesDescription =>
      'Markdown kullanarak kalın metin gibi zengin mesaj içeriğini görüntüle.';

  @override
  String get verifyOtherUser => '🔐 Diğer kullanıcıyı doğrula';

  @override
  String get verifyOtherUserDescription =>
      'Başka bir kullanıcıyı doğrularsanız, gerçekten kime yazdığınızı bildiğinizden emin olabilirsiniz. 💪\n\nBir doğrulama başlattığınızda, siz ve diğer kullanıcı uygulamada bir açılır pencere görecektir. Orada birbirinizle karşılaştırmanız gereken bir dizi emoji veya sayı göreceksiniz.\n\nBunu yapmanın en iyi yolu buluşmak veya bir görüntülü arama başlatmaktır. 👭';

  @override
  String get verifyOtherDevice => '🔐 Diğer aygıtı doğrula';

  @override
  String get verifyOtherDeviceDescription =>
      'Başka bir aygıtı doğruladığınızda, bu aygıtlar anahtarları değiş tokuş ederek genel güvenliğinizi artırır. 💪 Bir doğrulama başlattığınızda, her iki aygıttaki uygulamada bir açılır pencere görünecektir. Orada birbirleriyle karşılaştırmanız gereken bir dizi emoji veya sayı göreceksiniz. Doğrulamaya başlamadan önce her iki aygıtın da elinizin altında olması en iyisidir. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender anahtar doğrulamayı kabul etti';
  }

  @override
  String get customReaction => 'Add reaction';

  @override
  String canceledKeyVerification(String sender) {
    return '$sender anahtar doğrulamayı iptal etti';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender anahtar doğrulamayı tamamladı';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender anahtar doğrulama için hazır';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender anahtar doğrulama istedi';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender anahtar doğrulama başlattı';
  }

  @override
  String get transparent => 'Şeffaf';

  @override
  String get incomingMessages => 'Gelen mesajlar';

  @override
  String get stickers => 'Çıkartmalar';

  @override
  String get discover => 'Keşfet';

  @override
  String get commandHint_ignore => 'Verilen matrix kimliğini görmezden gel';

  @override
  String get commandHint_unignore =>
      'Verilen matrix kimliğini görmezden gelmeyi iptal et';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread okunmayan sohbet';
  }

  @override
  String get noDatabaseEncryption =>
      'Veri tabanı şifrelemesi bu platformda desteklenmiyor';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Şu anda $count engellenen kullanıcı var.';
  }

  @override
  String get restricted => 'Kısıtlı';

  @override
  String get knockRestricted => 'Tıklatma kısıtlı';

  @override
  String goToSpace(Object space) {
    return 'Alana git: $space';
  }

  @override
  String get markAsUnread => 'Okunmadı olarak işaretle';

  @override
  String userLevel(int level) {
    return '$level - Kullanıcı';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderatör';
  }

  @override
  String adminLevel(int level) {
    return '$level - Yönetici';
  }

  @override
  String get changeGeneralChatSettings => 'Genel sohbet ayarlarını değiştir';

  @override
  String get inviteOtherUsers => 'Diğer kullanıcıları bu sohbete davet et';

  @override
  String get changeTheChatPermissions => 'Sohbet izinlerini değiştir';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Sohbet geçmişinin görünürlüğünü değiştir';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Ana herkese açık sohbet adresini değiştir';

  @override
  String get sendRoomNotifications => '@oda bildirimleri gönder';

  @override
  String get changeTheDescriptionOfTheGroup => 'Sohbetin açıklamasını değiştir';

  @override
  String get chatPermissionsDescription =>
      'Bu sohbette belirli eylemler için hangi güç düzeyinin gerekli olduğunu tanımlayın. 0, 50 ve 100 güç düzeyleri genellikle kullanıcıları, moderatörleri ve yöneticileri temsil eder, ancak herhangi bir derecelendirme mümkündür.';

  @override
  String updateInstalled(String version) {
    return '🎉 Güncelleme $version kuruldu!';
  }

  @override
  String get changelog => 'Değişiklik günlüğü';

  @override
  String get sendCanceled => 'Gönderme iptal edildi';

  @override
  String get loginWithMatrixId => 'Matrix kimliği ile oturum aç';

  @override
  String get discoverHomeservers => 'Ana sunucuları keşfet';

  @override
  String get whatIsAHomeserver => 'Ana sunucu nedir?';

  @override
  String get homeserverDescription =>
      'Tüm verileriniz tıpkı bir e-posta sağlayıcısı gibi ana sunucuda saklanır. Hangi ana sunucuyu kullanmak istediğinizi seçebilir ve herkesle iletişim kurmaya devam edebilirsiniz. https://matrix.org adresinden daha fazla bilgi edinin.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Uyumlu bir ana sunucu gibi görünmüyor. Yanlış URL mi?';

  @override
  String get calculatingFileSize => 'Dosya boyutu hesaplanıyor...';

  @override
  String get prepareSendingAttachment => 'Ek gönderilmeye hazırlanıyor...';

  @override
  String get sendingAttachment => 'Ek gönderiliyor...';

  @override
  String get generatingVideoThumbnail => 'Video küçük resmi oluşturuluyor...';

  @override
  String get compressVideo => 'Video sıkıştırılıyor...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Ek $index / $length gönderiliyor...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Sunucu sınırına ulaşıldı! $seconds saniye bekleniyor...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Aygıtlarınızdan biri doğrulanmadı';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Not: Tüm aygıtlarınızı sohbet yedeklemesine bağladığınızda, otomatik olarak doğrulanırlar.';

  @override
  String get continueText => 'Devam et';

  @override
  String get welcomeText =>
      'Hey Hey 👋 Karşınızda FluffyChat. https://matrix.org ile uyumlu herhangi bir homeserver\'a giriş yapabilirsiniz. Ve herkesle konuşabilirsiniz. Bu koca bir merkeziyetsiz mesajlaşma ağı!';

  @override
  String get blur => 'Blur:';

  @override
  String get opacity => 'Şeffaflık:';

  @override
  String get setWallpaper => 'Duvar kağıdı seç';

  @override
  String get manageAccount => 'Hesabı yönet';

  @override
  String get noContactInformationProvided =>
      'Sunucu geçerli bir iletişim bilgisi sunmadı';

  @override
  String get contactServerAdmin => 'Sunucu yöneticisiyle iletişime geçin';

  @override
  String get contactServerSecurity => 'Sunucu güvenliğiyle iletişime geçin';

  @override
  String get supportPage => 'Destek sayfası';

  @override
  String get serverInformation => 'Sunucu bilgisi:';

  @override
  String get name => 'İsim';

  @override
  String get version => 'Versiyon';

  @override
  String get website => 'Web sitesi';

  @override
  String get compress => 'Sıkıştırma';

  @override
  String get boldText => 'Kalın metin';

  @override
  String get italicText => 'İtalik metin';

  @override
  String get strikeThrough => 'Üstü çizili';

  @override
  String get pleaseFillOut => 'Lütfen doldurun';

  @override
  String get invalidUrl => 'Geçersiz url';

  @override
  String get addLink => 'Link ekle';

  @override
  String get unableToJoinChat =>
      'Sohbete girilemiyor. Belki başka birileri konuşmayı kapatmış olabilir.';

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
