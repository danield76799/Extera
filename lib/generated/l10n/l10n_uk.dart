// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class L10nUk extends L10n {
  L10nUk([String locale = 'uk']) : super(locale);

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
  String get alwaysUse24HourFormat => 'ні';

  @override
  String get cleanExif => 'Clean EXIF metadata';

  @override
  String get cleanExifDescription =>
      'Remove EXIF metadata (camera model, geolocation, time) when sending a photo.';

  @override
  String get repeatPassword => 'Повторіть пароль';

  @override
  String get notAnImage => 'Не файл зображення.';

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
  String get remove => 'Вилучити';

  @override
  String get importNow => 'Імпортувати зараз';

  @override
  String get importEmojis => 'Імпорт емодзі';

  @override
  String get importFromZipFile => 'Імпорт з файлу .zip';

  @override
  String get exportEmotePack => 'Експортувати набір смайликів у форматі .zip';

  @override
  String get replace => 'Замінити';

  @override
  String get about => 'Про застосунок';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Про $homeserver';
  }

  @override
  String get accept => 'Прийняти';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username приймає запрошення';
  }

  @override
  String get account => 'Обліковий запис';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username активує наскрізне шифрування';
  }

  @override
  String get addEmail => 'Додати е-пошту';

  @override
  String get confirmMatrixId =>
      'Підтвердьте свій Matrix ID, щоб видалити свій обліковий запис.';

  @override
  String supposedMxid(String mxid) {
    return 'Це має бути $mxid';
  }

  @override
  String get addChatDescription => 'Додати опис бесіди...';

  @override
  String get addToSpace => 'Додати простір';

  @override
  String get admin => 'Адміністратор';

  @override
  String get alias => 'псевдонім';

  @override
  String get all => 'Усі';

  @override
  String get allChats => 'Усі бесіди';

  @override
  String get commandHint_roomupgrade =>
      'Оновити цю кімнату до версії даної кімнати';

  @override
  String get commandHint_googly => 'Надіслати кілька гугл-очей';

  @override
  String get commandHint_cuddle => 'Надіслати пригортайку';

  @override
  String get commandHint_hug => 'Надіслати обійми';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName надсилає вам гугл-очі';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName пригортається до вас';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName обіймає вас';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName відповідає на виклик';
  }

  @override
  String get anyoneCanJoin => 'Будь-хто може приєднатись';

  @override
  String get appLock => 'Блокування застосунку';

  @override
  String get appLockDescription =>
      'Блокувати застосунок, коли не використовується ПІН-код';

  @override
  String get archive => 'Архів';

  @override
  String get areGuestsAllowedToJoin => 'Чи дозволено гостям приєднуватись';

  @override
  String get areYouSure => 'Ви впевнені?';

  @override
  String get areYouSureYouWantToLogout => 'Ви впевнені, що хочете вийти?';

  @override
  String get askSSSSSign =>
      'Для підпису ключа іншого користувача введіть свою парольну фразу або ключ відновлення.';

  @override
  String askVerificationRequest(String username) {
    return 'Прийняти цей запит на підтвердження від $username?';
  }

  @override
  String get autoplayImages =>
      'Автоматично відтворювати анімовані наліпки та емоджі';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Домашній сервер підтримує такі типи входу:\n$serverVersions\nАле цей застосунок підтримує лише:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Надсилати сповіщення про ввід тексту';

  @override
  String get swipeRightToLeftToReply =>
      'Посунути праворуч або ліворуч, щоб відповісти';

  @override
  String get sendOnEnter => 'Надсилати натисканням Enter';

  @override
  String badServerVersionsException(String serverVersions,
      String supportedVersions, Object serverVerions, Object suportedVersions) {
    return 'Домашній сервер підтримує такі версії специфікацій:\n$serverVersions\nАле цей застосунок підтримує лише $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats чати та $participants учасників';
  }

  @override
  String get noMoreChatsFound => 'Більше чатів не знайдено...';

  @override
  String get noChatsFoundHere =>
      'Бесід ще немає. Розпочніть спілкування натиснувши кнопку нижче. ⤵️';

  @override
  String get joinedChats => 'Приєднані чати';

  @override
  String get unread => 'Непрочитані';

  @override
  String get space => 'Простір';

  @override
  String get spaces => 'Простори';

  @override
  String get banFromChat => 'Заблокувати в бесіді';

  @override
  String get banned => 'Заблоковано';

  @override
  String bannedUser(String username, String targetName) {
    return '$username блокує $targetName';
  }

  @override
  String get blockDevice => 'Заблокувати пристрій';

  @override
  String get blocked => 'Заблоковано';

  @override
  String get botMessages => 'Повідомлення ботів';

  @override
  String get cancel => 'Скасувати';

  @override
  String cantOpenUri(String uri) {
    return 'Не вдалося відкрити URI $uri';
  }

  @override
  String get changeDeviceName => 'Змінити назву пристрою';

  @override
  String changedTheChatAvatar(String username) {
    return '$username змінює аватар бесіди';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username змінює опис бесіди на: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username змінює назву бесіди на: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username змінює права доступу бесіди';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username змінює показуване ім\'я на: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username змінює правила гостьового доступу';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username змінює правила гостьового доступу на: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username змінює видимість історії';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username змінює видимість історії на: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username змінює правила приєднання';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username змінює правила приєднання на: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username змінює аватар';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username змінює псевдоніми кімнати';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username змінює посилання для запрошення';
  }

  @override
  String get changePassword => 'Змінити пароль';

  @override
  String get changeTheHomeserver => 'Змінити домашній сервер';

  @override
  String get changeTheme => 'Змінити стиль';

  @override
  String get changeTheNameOfTheGroup => 'Змінити назву групи';

  @override
  String get changeYourAvatar => 'Змінити аватар';

  @override
  String get channelCorruptedDecryptError => 'Шифрування було пошкоджено';

  @override
  String get chat => 'Бесіда';

  @override
  String get yourChatBackupHasBeenSetUp => 'Рез. копію чату налаштовано.';

  @override
  String get chatBackup => 'Резервне копіювання бесіди';

  @override
  String get chatBackupDescription =>
      'Ваші старі повідомлення захищені ключем відновлення. Переконайтеся, що ви не втратите його.';

  @override
  String get chatDetails => 'Подробиці бесіди';

  @override
  String get chatHasBeenAddedToThisSpace => 'Бесіду додано до цього простору';

  @override
  String get chats => 'Бесіди';

  @override
  String get chooseAStrongPassword => 'Виберіть надійний пароль';

  @override
  String get clearArchive => 'Очистити архів';

  @override
  String get close => 'Закрити';

  @override
  String get commandHint_markasdm =>
      'Позначити кімнатою особистого спілкування для надання Matrix ID';

  @override
  String get commandHint_markasgroup => 'Позначити групою';

  @override
  String get commandHint_ban => 'Заблокувати цього користувача кімнати';

  @override
  String get commandHint_clearcache => 'Очистити кеш';

  @override
  String get commandHint_create =>
      'Створіть порожню групову бесіду\nВикористовуйте --no-encryption, щоб вимкнути шифрування';

  @override
  String get commandHint_discardsession => 'Відкинути сеанс';

  @override
  String get commandHint_dm =>
      'Початок особистої бесіди\nВикористовуйте --no-encryption, що вимкнути шифрування';

  @override
  String get commandHint_html => 'Надіслати текст у форматі HTML';

  @override
  String get commandHint_invite =>
      'Запросіть цього користувача до цієї кімнати';

  @override
  String get commandHint_join => 'Приєднатися до цієї кімнати';

  @override
  String get commandHint_kick => 'Вилучити цього користувача з цієї кімнати';

  @override
  String get commandHint_leave => 'Вийти з цієї кімнати';

  @override
  String get commandHint_me => 'Опишіть себе';

  @override
  String get commandHint_myroomavatar =>
      'Встановіть зображення для цієї кімнати (від mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Укажіть показуване ім\'я для цієї кімнати';

  @override
  String get commandHint_op =>
      'Укажіть рівень повноважень цього користувача (типово: 50)';

  @override
  String get commandHint_plain => 'Надіслати неформатований текст';

  @override
  String get commandHint_react => 'Надіслати відповідь як реакцію';

  @override
  String get commandHint_send => 'Надіслати текст';

  @override
  String get commandHint_unban =>
      'Розблокувати цього користувача у цій кімнаті';

  @override
  String get commandInvalid => 'Неприпустима команда';

  @override
  String commandMissing(String command) {
    return '$command не є командою.';
  }

  @override
  String get compareEmojiMatch => 'Порівняйте емодзі';

  @override
  String get compareNumbersMatch => 'Порівняйте цифри';

  @override
  String get configureChat => 'Налаштувати бесіду';

  @override
  String get confirm => 'Підтвердити';

  @override
  String get connect => 'Під\'єднатись';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Контакт був запрошений в групу';

  @override
  String get containsDisplayName => 'Містить показуване ім’я';

  @override
  String get containsUserName => 'Містить ім’я користувача';

  @override
  String get contentHasBeenReported =>
      'Скаргу на вміст надіслано адміністраторам сервера';

  @override
  String get copiedToClipboard => 'Скопійовано в буфер обміну';

  @override
  String get copy => 'Копіювати';

  @override
  String get copyToClipboard => 'Копіювати до буфера обміну';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Помилка розшифрування повідомлення: $error';
  }

  @override
  String countParticipants(int count) {
    return 'Учасників: $count';
  }

  @override
  String get create => 'Створити';

  @override
  String createdTheChat(String username) {
    return '💬 $username створює бесіду';
  }

  @override
  String get createGroup => 'Створити групу';

  @override
  String get createNewSpace => 'Новий простір';

  @override
  String get currentlyActive => 'Зараз у мережі';

  @override
  String get darkTheme => 'Темний';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$timeOfDay, $date';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day-$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day-$month-$year';
  }

  @override
  String get deactivateAccountWarning =>
      'Це деактивує ваш обліковий запис. Це неможливо скасувати! Ви впевнені?';

  @override
  String get defaultPermissionLevel =>
      'Типовий рівень дозволів для нових користувачів';

  @override
  String get delete => 'Видалити';

  @override
  String get deleteAccount => 'Видалити обліковий запис';

  @override
  String get deleteMessage => 'Видалити повідомлення';

  @override
  String get device => 'Пристрій';

  @override
  String get deviceId => 'ID пристрою';

  @override
  String get devices => 'Пристрої';

  @override
  String get directChats => 'Особисті бесіди';

  @override
  String get allRooms => 'Усі групові бесіди';

  @override
  String get displaynameHasBeenChanged => 'Показуване ім\'я було змінено';

  @override
  String get downloadFile => 'Завантажити файл';

  @override
  String get edit => 'Редагувати';

  @override
  String get editBlockedServers => 'Редагувати заблоковані сервери';

  @override
  String get chatPermissions => 'Дозволи бесіди';

  @override
  String get chatThreads => 'Threads';

  @override
  String get chatThreadsDescription => 'See all threads in this room';

  @override
  String get editDisplayname => 'Змінити показуване ім\'я';

  @override
  String get editRoomAliases => 'Змінити псевдоніми кімнати';

  @override
  String get editRoomAvatar => 'Змінити аватар кімнати';

  @override
  String get emoteExists => 'Емодзі вже існує!';

  @override
  String get emoteInvalid => 'Неприпустимий короткий код емодзі!';

  @override
  String get emoteKeyboardNoRecents =>
      'Тут з\'являться нещодавно використані смайлики...';

  @override
  String get emotePacks => 'Набори емоджі для кімнати';

  @override
  String get emoteSettings => 'Налаштування емодзі';

  @override
  String get globalChatId => 'Глобальний ID бесіди';

  @override
  String get accessAndVisibility => 'Доступ і видимість';

  @override
  String get accessAndVisibilityDescription =>
      'Хто може приєднатися до цієї бесіди і як її можна знайти.';

  @override
  String get calls => 'Виклики';

  @override
  String get customEmojisAndStickers => 'Власні емоджі та наліпки';

  @override
  String get customEmojisAndStickersBody =>
      'Додавайте або діліться власними емоджі або наліпками, які можна використовувати в будь-якій бесіді.';

  @override
  String get emoteShortcode => 'Короткий код для емодзі';

  @override
  String get emoteWarnNeedToPick =>
      'Укажіть короткий код емодзі та зображення!';

  @override
  String get emptyChat => 'Порожня бесіда';

  @override
  String get enableEmotesGlobally => 'Увімкнути пакунок емоджі глобально';

  @override
  String get enableEncryption => 'Увімкнути шифрування';

  @override
  String get enableEncryptionWarning =>
      'Ви більше не зможете вимкнути шифрування. Ви впевнені?';

  @override
  String get encrypted => 'Зашифровано';

  @override
  String get encryption => 'Шифрування';

  @override
  String get encryptionNotEnabled => 'Шифрування вимкнено';

  @override
  String endedTheCall(String senderName) {
    return '$senderName завершує виклик';
  }

  @override
  String get enterAnEmailAddress => 'Введіть адресу е-пошти';

  @override
  String get homeserver => 'Домашній сервер';

  @override
  String get enterYourHomeserver => 'Введіть адресу домашнього сервера';

  @override
  String errorObtainingLocation(String error) {
    return 'Помилка під час отримання розташування: $error';
  }

  @override
  String get everythingReady => 'Усе готово!';

  @override
  String get extremeOffensive => 'Украй образливий';

  @override
  String get fileName => 'Назва файлу';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Розмір шрифту';

  @override
  String get forward => 'Переслати';

  @override
  String get fromJoining => 'З моменту приєднання';

  @override
  String get fromTheInvitation => 'З моменту запрошення';

  @override
  String get goToTheNewRoom => 'Перейти до нової кімнати';

  @override
  String get group => 'Група';

  @override
  String get chatDescription => 'Опис бесіди';

  @override
  String get chatDescriptionHasBeenChanged => 'Опис бесіди змінено';

  @override
  String get groupIsPublic => 'Загальнодоступна група';

  @override
  String get groups => 'Групи';

  @override
  String groupWith(String displayname) {
    return 'Група з $displayname';
  }

  @override
  String get guestsAreForbidden => 'Гості не можуть приєднуватись';

  @override
  String get guestsCanJoin => 'Гості можуть приєднуватись';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username відкликає запрошення для $targetName';
  }

  @override
  String get help => 'Довідка';

  @override
  String get hideRedactedEvents => 'Сховати змінені події';

  @override
  String get hideRedactedMessages => 'Сховати змінені повідомлення';

  @override
  String get hideRedactedMessagesBody =>
      'Якщо хтось змінить повідомлення, його більше не буде видно в бесіді.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Сховати недійсні або невідомі формати повідомлень';

  @override
  String get howOffensiveIsThisContent => 'Наскільки образливий цей вміст?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Ідентифікація';

  @override
  String get block => 'Заблокувати';

  @override
  String get blockedUsers => 'Заблоковані користувачі';

  @override
  String get blockListDescription =>
      'Ви можете заблокувати користувачів, які вас турбують. Ви не зможете отримувати жодних повідомлень або запрошень до кімнати від користувачів з вашого персонального списку блокування.';

  @override
  String get blockUsername => 'Ігнорувати ім\'я користувача';

  @override
  String get iHaveClickedOnLink => 'Мною виконано перехід за посиланням';

  @override
  String get incorrectPassphraseOrKey =>
      'Неправильна парольна фраза або ключ відновлення';

  @override
  String get inoffensive => 'Необразливий';

  @override
  String get inviteContact => 'Запросити контакт';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Хочете запросити $contact до бесіди \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Запросити контакт до $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Опис бесіди ще не створено.';

  @override
  String get tryAgain => 'Повторіть спробу';

  @override
  String get invalidServerName => 'Недійсна назва сервера';

  @override
  String get invited => 'Запрошено';

  @override
  String get redactMessageDescription =>
      'Повідомлення буде відредаговано для всіх учасників цієї розмови. Це не можна скасувати.';

  @override
  String get optionalRedactReason =>
      '(Необов\'язково) Причина редагування цього повідомлення...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username запрошує $targetName';
  }

  @override
  String get invitedUsersOnly => 'Лише запрошені користувачі';

  @override
  String get inviteForMe => 'Запрошення для мене';

  @override
  String inviteText(String username, String link) {
    return '$username запрошує вас у FluffyChat. \n1. Перейдіть на fluffychat.im й установіть застосунок \n2. Зареєструйтесь або ввійдіть \n3. Відкрийте запрошувальне посилання:\n $link';
  }

  @override
  String get isTyping => 'пише…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username приєднується до бесіди';
  }

  @override
  String get joinRoom => 'Приєднатися до кімнати';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username вилучає $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username вилучає та блокує $targetName';
  }

  @override
  String get kickFromChat => 'Вилучити з бесіди';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Остання активність: $localizedTimeShort';
  }

  @override
  String get leave => 'Вийти';

  @override
  String get leftTheChat => 'Виходить з бесіди';

  @override
  String get license => 'Ліцензія';

  @override
  String get lightTheme => 'Світлий';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Завантажити ще $count учасників';
  }

  @override
  String get dehydrate => 'Експортувати сеанс та очистити пристрій';

  @override
  String get dehydrateWarning =>
      'Цю дію не можна скасувати. Переконайтеся, що ви безпечно зберігаєте файл резервної копії.';

  @override
  String get dehydrateTor => 'Користувачі TOR: експорт сеансу';

  @override
  String get dehydrateTorLong =>
      'Для користувачів TOR рекомендується експортувати сеанс перед закриттям вікна.';

  @override
  String get hydrateTor => 'Користувачі TOR: імпорт експортованого сеансу';

  @override
  String get hydrateTorLong =>
      'Минулого разу ви експортували свій сеанс із TOR? Швидко імпортуйте його та продовжуйте спілкування.';

  @override
  String get hydrate => 'Відновлення з файлу резервної копії';

  @override
  String get loadingPleaseWait => 'Завантаження… Будь ласка, зачекайте.';

  @override
  String get loadMore => 'Завантажити ще…';

  @override
  String get locationDisabledNotice =>
      'Служби визначення розташування вимкнені. Увімкніть їх, щоб мати змогу ділитися своїм розташуванням.';

  @override
  String get locationPermissionDeniedNotice =>
      'Дозвіл на розташування відхилено. Надайте можливість ділитися своїм розташуванням.';

  @override
  String get login => 'Увійти';

  @override
  String logInTo(String homeserver) {
    return 'Увійти до $homeserver';
  }

  @override
  String get logout => 'Вийти';

  @override
  String get memberChanges => 'Зміни учасників';

  @override
  String get mention => 'Згадати';

  @override
  String get messages => 'Повідомлення';

  @override
  String get messagesStyle => 'Повідомлення:';

  @override
  String get moderator => 'Модератор';

  @override
  String get muteChat => 'Вимкнути сповіщення';

  @override
  String get needPantalaimonWarning =>
      'Майте на увазі, що на цей час вам потрібен Pantalaimon, щоб використовувати наскрізне шифрування.';

  @override
  String get newChat => 'Нова бесіда';

  @override
  String get newMessageInFluffyChat => '💬 Нове повідомлення у FluffyChat';

  @override
  String get newVerificationRequest => 'Новий запит перевірки!';

  @override
  String get next => 'Далі';

  @override
  String get no => 'Ні';

  @override
  String get noConnectionToTheServer => 'Немає з\'єднання з сервером';

  @override
  String get noEmotesFound => 'Емоджі не знайдено. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Активувати шифрування можна лише тоді, коли кімната більше не буде загальнодоступною.';

  @override
  String get noGoogleServicesWarning =>
      'Схоже, Firebase Cloud Messaging недоступна на вашому пристрої. Щоб отримувати push-сповіщення, радимо встановити ntfy. За допомогою ntfy або іншого постачальника Unified Push ви можете отримувати push-сповіщення у безпечний спосіб. Ви можете завантажити ntfy з PlayStore або з F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 не є сервером matrix, використовувати $server2 натомість?';
  }

  @override
  String get shareInviteLink => 'Надіслати запрошувальне посилання';

  @override
  String get scanQrCode => 'Сканувати QR-код';

  @override
  String get none => 'Нічого';

  @override
  String get noPasswordRecoveryDescription =>
      'Ви ще не додали спосіб відновлення пароля.';

  @override
  String get noPermission => 'Немає прав доступу';

  @override
  String get noRoomsFound => 'Кімнат не знайдено…';

  @override
  String get notifications => 'Сповіщення';

  @override
  String get notificationsEnabledForThisAccount =>
      'Сповіщення ввімкнені для цього облікового запису';

  @override
  String numUsersTyping(int count) {
    return '$count користувачів пишуть…';
  }

  @override
  String get obtainingLocation => 'Отримання розташування…';

  @override
  String get offensive => 'Образливий';

  @override
  String get offline => 'Офлайн';

  @override
  String get ok => 'Гаразд';

  @override
  String get online => 'Онлайн';

  @override
  String get onlineKeyBackupEnabled =>
      'Резервне онлайн-копіювання ключів увімкнено';

  @override
  String get oopsPushError =>
      'Дідько! На жаль, сталася помилка під час налаштування push-сповіщень.';

  @override
  String get oopsSomethingWentWrong => 'Халепа, щось пішло не так…';

  @override
  String get openAppToReadMessages =>
      'Відкрийте застосунок читання повідомлень';

  @override
  String get openCamera => 'Відкрити камеру';

  @override
  String get openVideoCamera => 'Відкрити камеру для відео';

  @override
  String get oneClientLoggedOut =>
      'На одному з ваших клієнтів виконано вихід із системи';

  @override
  String get addAccount => 'Додати обліковий запис';

  @override
  String get editBundlesForAccount =>
      'Змінити вузол для цього облікового запису';

  @override
  String get addToBundle => 'Додати до вузлів';

  @override
  String get removeFromBundle => 'Вилучити з цього вузла';

  @override
  String get bundleName => 'Назва вузла';

  @override
  String get enableMultiAccounts =>
      '(БЕТА) Увімкнути кілька облікових записів на цьому пристрої';

  @override
  String get openInMaps => 'Відкрити в картах';

  @override
  String get link => 'Посилання';

  @override
  String get serverRequiresEmail =>
      'Цей сервер потребує перевірки вашої адресу е-пошти для реєстрації.';

  @override
  String get or => 'Або';

  @override
  String get participant => 'Учасник';

  @override
  String get passphraseOrKey => 'парольна фраза або ключ відновлення';

  @override
  String get password => 'Пароль';

  @override
  String get downloads => 'Downloads';

  @override
  String get passwordForgotten => 'Забули пароль';

  @override
  String get passwordHasBeenChanged => 'Пароль змінено';

  @override
  String get hideMemberChangesInPublicChats =>
      'Сховати зміни користувачів у загальнодоступних бесідах';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Не показувати в хронології бесіди, якщо хтось приєднується до загальнодоступної бесіди або виходить з неї, щоб покращити її читабельність.';

  @override
  String get overview => 'Огляд';

  @override
  String get notifyMeFor => 'Сповіщати мене про';

  @override
  String get passwordRecoverySettings => 'Налаштування відновлення пароля';

  @override
  String get passwordRecovery => 'Відновлення пароля';

  @override
  String get people => 'Люди';

  @override
  String get pickImage => 'Вибрати зображення';

  @override
  String get pin => 'Закріпити';

  @override
  String play(String fileName) {
    return 'Відтворити $fileName';
  }

  @override
  String get pleaseChoose => 'Виберіть';

  @override
  String get pleaseChooseAPasscode => 'Виберіть код доступу';

  @override
  String get pleaseClickOnLink =>
      'Натисніть на посилання в електронному листі, а потім продовжуйте.';

  @override
  String get pleaseEnter4Digits =>
      'Введіть 4 цифри або залиште порожнім, щоб вимкнути блокування застосунку.';

  @override
  String get pleaseEnterRecoveryKey => 'Введіть ключ відновлення:';

  @override
  String get pleaseEnterYourPassword => 'Введіть свій пароль';

  @override
  String get pleaseEnterYourPin => 'Введіть свій PIN-код';

  @override
  String get pleaseEnterYourUsername => 'Введіть своє ім\'я користувача';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Виконайте вказівки вебсайту та торкніться далі.';

  @override
  String get privacy => 'Приватність';

  @override
  String get publicRooms => 'Загальнодоступні кімнати';

  @override
  String get pushRules => 'Правила сповіщень';

  @override
  String get reason => 'Причина';

  @override
  String get recording => 'Запис';

  @override
  String redactedBy(String username) {
    return 'Відредаговано $username';
  }

  @override
  String get directChat => 'Особисте повідомлення';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Відредаговано $username, тому що: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username змінює подію';
  }

  @override
  String get redactMessage => 'Редагувати повідомлення';

  @override
  String get register => 'Зареєструватися';

  @override
  String get reject => 'Відхилити';

  @override
  String rejectedTheInvitation(String username) {
    return '$username відхиляє запрошення';
  }

  @override
  String get rejoin => 'Приєднатися знову';

  @override
  String get removeAllOtherDevices => 'Вилучити всі інші пристрої';

  @override
  String removedBy(String username) {
    return 'Вилучено користувачем $username';
  }

  @override
  String get removeDevice => 'Вилучити пристрій';

  @override
  String get unbanFromChat => 'Розблокувати у бесіді';

  @override
  String get removeYourAvatar => 'Вилучити свій аватар';

  @override
  String get replaceRoomWithNewerVersion => 'Замінити кімнату новішою версією';

  @override
  String get reply => 'Відповісти';

  @override
  String get reportMessage => 'Поскаржитися на повідомлення';

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
  String get requestPermission => 'Запит дозволу';

  @override
  String get roomHasBeenUpgraded => 'Кімнату було оновлено';

  @override
  String get roomVersion => 'Версія кімнати';

  @override
  String get saveFile => 'Зберегти файл';

  @override
  String get retry => 'Retry';

  @override
  String get search => 'Пошук';

  @override
  String get security => 'Безпека';

  @override
  String get recoveryKey => 'Ключ відновлення';

  @override
  String get recoveryKeyLost => 'Ключ відновлення втрачено?';

  @override
  String seenByUser(String username) {
    return 'Переглянуто $username';
  }

  @override
  String get send => 'Надіслати';

  @override
  String get sendAMessage => 'Надіслати повідомлення';

  @override
  String get sendAsText => 'Надіслати як текст';

  @override
  String get sendAudio => 'Надіслати аудіо';

  @override
  String get sendFile => 'Надіслати файл';

  @override
  String get sendImage => 'Надіслати зображення';

  @override
  String sendImages(int count) {
    return 'Надіслати $count зображення';
  }

  @override
  String get sendMessages => 'Надсилати повідомлення';

  @override
  String get sendOriginal => 'Надіслати оригінал';

  @override
  String get sendSticker => 'Надіслати наліпку';

  @override
  String get sendVideo => 'Надіслати відео';

  @override
  String sentAFile(String username) {
    return '📁 $username надсилає файл';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username надсилає аудіо';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username надсилає зображення';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username надсилає наліпку';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username надсилає відео';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName надсилає відомості про виклик';
  }

  @override
  String get separateChatTypes => 'Розділіть особисті бесіди та групи';

  @override
  String get setAsCanonicalAlias => 'Установити основним псевдонімом';

  @override
  String get setCustomEmotes => 'Установити користувацькі емоджі';

  @override
  String get setChatDescription => 'Налаштувати опис бесіди';

  @override
  String get setInvitationLink => 'Указати посилання для запрошення';

  @override
  String get setPermissionsLevel => 'Указати рівні дозволів';

  @override
  String get setStatus => 'Указати статус';

  @override
  String get settings => 'Налаштування';

  @override
  String get share => 'Поділитися';

  @override
  String sharedTheLocation(String username) {
    return '$username ділиться своїм місцеперебуванням';
  }

  @override
  String get shareLocation => 'Поділитися місцеперебуванням';

  @override
  String get showPassword => 'Показати пароль';

  @override
  String get presenceStyle => 'Присутність:';

  @override
  String get hideAvatarsInInvites => 'Hide avatars in invites';

  @override
  String get hideAvatarsInInvitesDescription =>
      'Do not show room avatars in invites';

  @override
  String get presencesToggle =>
      'Показувати повідомлення про стан від інших користувачів';

  @override
  String get pureBlackToggle => 'Pure Black';

  @override
  String get singlesignon => 'Єдиний вхід';

  @override
  String get skip => 'Пропустити';

  @override
  String get sourceCode => 'Джерельний код';

  @override
  String get spaceIsPublic => 'Простір загальнодоступний';

  @override
  String get spaceName => 'Назва простору';

  @override
  String startedACall(String senderName) {
    return '$senderName розпочинає виклик';
  }

  @override
  String get startFirstChat => 'Розпочніть свою першу бесіду';

  @override
  String get status => 'Статус';

  @override
  String get statusExampleMessage => 'Як справи сьогодні?';

  @override
  String get submit => 'Надіслати';

  @override
  String get synchronizingPleaseWait => 'Синхронізація… Будь ласка, зачекайте.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Синхронізація… ($percentage%)';
  }

  @override
  String get systemTheme => 'Системна';

  @override
  String get theyDontMatch => 'Вони відрізняються';

  @override
  String get theyMatch => 'Вони збігаються';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Перемикнути вибране';

  @override
  String get toggleMuted => 'Увімкнути/вимкнути звук';

  @override
  String get toggleUnread => 'Позначити прочитаним/непрочитаним';

  @override
  String get tooManyRequestsWarning => 'Забагато запитів. Спробуйте пізніше!';

  @override
  String get transferFromAnotherDevice => 'Перенесення з іншого пристрою';

  @override
  String get tryToSendAgain => 'Спробуйте надіслати ще раз';

  @override
  String get unavailable => 'Недоступний';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username розблоковує $targetName';
  }

  @override
  String get unblockDevice => 'Розблокувати пристрій';

  @override
  String get unknownDevice => 'Невідомий пристрій';

  @override
  String get unknownEncryptionAlgorithm => 'Невідомий алгоритм шифрування';

  @override
  String unknownEvent(String type) {
    return 'Невідома подія \'$type\'';
  }

  @override
  String get unmuteChat => 'Увімкнути сповіщення';

  @override
  String get unpin => 'Відкріпити';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount непрочитані бесіди',
      many: '$unreadCount непрочитаних бесід',
      few: '$unreadCount непрочитані бесіди',
      one: '1 непрочитана бесіда',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username та $count інших пишуть…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username і $username2 пишуть…';
  }

  @override
  String userIsTyping(String username) {
    return '$username пише…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username виходить з бесіди';
  }

  @override
  String get username => 'Ім\'я користувача';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username надсилає подію $type';
  }

  @override
  String get unverified => 'Неперевірений';

  @override
  String get verified => 'Перевірений';

  @override
  String get verify => 'Перевірити';

  @override
  String get verifyStart => 'Почати перевірку';

  @override
  String get verifySuccess => 'Ви успішно перевірені!';

  @override
  String get verifyTitle => 'Перевірка іншого облікового запису';

  @override
  String get videoCall => 'Відеовиклик';

  @override
  String get visibilityOfTheChatHistory => 'Видимість історії бесіди';

  @override
  String get visibleForAllParticipants => 'Видима для всіх учасників';

  @override
  String get visibleForEveryone => 'Видима для всіх';

  @override
  String get voiceMessage => 'Голосове повідомлення';

  @override
  String get waitingPartnerAcceptRequest =>
      'Очікування прийняття запиту партнером…';

  @override
  String get waitingPartnerEmoji => 'Очікування прийняття емоджі партнером…';

  @override
  String get waitingPartnerNumbers => 'Очікування прийняття чисел партнером…';

  @override
  String get wallpaper => 'Шпалери:';

  @override
  String get warning => 'Попередження!';

  @override
  String get weSentYouAnEmail => 'Ми надіслали вам електронний лист';

  @override
  String get whoCanPerformWhichAction => 'Хто і яку дію може виконувати';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Кому дозволено приєднуватися до цієї групи';

  @override
  String get whyDoYouWantToReportThis => 'Чому ви хочете поскаржитися?';

  @override
  String get wipeChatBackup =>
      'Стерти резервну копію бесіди, щоб створити новий ключ відновлення?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'За допомогою цих адрес ви можете відновити свій пароль.';

  @override
  String get writeAMessage => 'Написати повідомлення…';

  @override
  String get yes => 'Так';

  @override
  String get you => 'Ви';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Ви більше не берете участь у цій бесіді';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Ви були заблоковані у цій бесіді';

  @override
  String get yourPublicKey => 'Ваш відкритий ключ';

  @override
  String get messageInfo => 'Відомості про повідомлення';

  @override
  String get time => 'Час';

  @override
  String get messageType => 'Тип повідомлення';

  @override
  String get sender => 'Відправник';

  @override
  String get openGallery => 'Відкрити галерею';

  @override
  String get removeFromSpace => 'Вилучити з простору';

  @override
  String get addToSpaceDescription =>
      'Виберіть простір, щоб додати до нього цю бесіду.';

  @override
  String get start => 'Почати';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Щоб розблокувати старі повідомлення, введіть ключ відновлення, згенерований у попередньому сеансі. Ваш ключ відновлення це НЕ ваш пароль.';

  @override
  String get publish => 'Опублікувати';

  @override
  String videoWithSize(String size) {
    return 'Відео ($size)';
  }

  @override
  String get openChat => 'Відкрити бесіду';

  @override
  String get markAsRead => 'Позначити прочитаним';

  @override
  String get reportUser => 'Поскаржився на користувача';

  @override
  String get dismiss => 'Відхилити';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender реагує з $reaction';
  }

  @override
  String get pinMessage => 'Прикріпити в кімнаті';

  @override
  String get confirmEventUnpin =>
      'Ви впевнені, що бажаєте назавжди відкріпите подію?';

  @override
  String get emojis => 'Емоджі';

  @override
  String get placeCall => 'Здійснити виклик';

  @override
  String get voiceCall => 'Голосовий виклик';

  @override
  String get unsupportedAndroidVersion => 'Непідтримувана версія Android';

  @override
  String get unsupportedAndroidVersionLong =>
      'Для цієї функції потрібна новіша версія Android. Перевірте наявність оновлень або підтримку Lineage OS.';

  @override
  String get videoCallsBetaWarning =>
      'Зауважте, що відеовиклики на ранньому етапі розробки. Вони можуть працювати не так, як очікувалося, або взагалі не працювати на всіх платформах.';

  @override
  String get experimentalVideoCalls => 'Експериментальні відеовиклики';

  @override
  String get emailOrUsername => 'Електронна адреса або ім’я користувача';

  @override
  String get indexedDbErrorTitle => 'Проблеми приватного режиму';

  @override
  String get indexedDbErrorLong =>
      'На жаль, сховище повідомлень не ввімкнуто у приватному режимі типово.\nВідкрийте\n - about:config\n - установіть для dom.indexedDB.privateBrowsing.enabled значення true\nІнакше запустити FluffyChat буде неможливо.';

  @override
  String switchToAccount(String number) {
    return 'Перемкнутися на обліковий запис $number';
  }

  @override
  String get nextAccount => 'Наступний обліковий запис';

  @override
  String get previousAccount => 'Попередній обліковий запис';

  @override
  String get addWidget => 'Додати віджет';

  @override
  String get widgetVideo => 'Відео';

  @override
  String get widgetEtherpad => 'Текстова примітка';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Користувацький';

  @override
  String get widgetName => 'Назва';

  @override
  String get widgetUrlError => 'Це недійсна URL-адреса.';

  @override
  String get widgetNameError => 'Укажіть коротку назву.';

  @override
  String get errorAddingWidget => 'Помилка додавання віджета.';

  @override
  String get youRejectedTheInvitation => 'Ви відхилили запрошення';

  @override
  String get youJoinedTheChat => 'Ви приєдналися до бесіди';

  @override
  String get youAcceptedTheInvitation => '👍 Ви погодилися на запрошення';

  @override
  String youBannedUser(String user) {
    return 'Ви заблокували $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Ви відкликали запрошення для $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Вас запрошено за посиланням на:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Ви були запрошені $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Запрошений $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Ви запросили $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Ви вилучили $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Ви вилучили й заблокували $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Ви розблокували $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪$user стукає до вас';
  }

  @override
  String get usersMustKnock => 'Користувачі повинні постукатись';

  @override
  String get noOneCanJoin => 'Ніхто не може приєднатись';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user хоче приєднатися до бесіди.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Загальнодоступне посилання ще не створено';

  @override
  String get knock => 'Постукатись';

  @override
  String get users => 'Користувачі';

  @override
  String get unlockOldMessages => 'Розблокувати старі повідомлення';

  @override
  String get storeInSecureStorageDescription =>
      'Збережіть ключ відновлення в безпечному сховищі цього пристрою.';

  @override
  String get saveKeyManuallyDescription =>
      'Збережіть цей ключ вручну, запустивши діалогове вікно спільного доступу до системи або буфер обміну.';

  @override
  String get storeInAndroidKeystore => 'Зберегти в Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Зберегти в Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Зберегти безпечно на цей пристрій';

  @override
  String countFiles(int count) {
    return '$count файлів';
  }

  @override
  String get user => 'Користувач';

  @override
  String get custom => 'Користувацький';

  @override
  String get foregroundServiceRunning =>
      'Це сповіщення з\'являється під час роботи основної служби.';

  @override
  String get screenSharingTitle => 'спільний доступ до екрана';

  @override
  String get screenSharingDetail => 'Ви ділитеся своїм екраном FuffyChat';

  @override
  String get callingPermissions => 'Дозволи на виклик';

  @override
  String get callingAccount => 'Обліковий запис для виклику';

  @override
  String get callingAccountDetails =>
      'Дозволяє FluffyChat використовувати основний застосунок Android для набору номера.';

  @override
  String get appearOnTop => 'З\'являтися зверху';

  @override
  String get appearOnTopDetails =>
      'Дозволяє застосунку показуватися зверху (не потрібно, якщо Fluffychat вже налаштований обліковим записом для викликів)';

  @override
  String get otherCallingPermissions =>
      'Мікрофон, камера та інші дозволи FluffyChat';

  @override
  String get whyIsThisMessageEncrypted => 'Чому це повідомлення нечитабельне?';

  @override
  String get noKeyForThisMessage =>
      'Це може статися, якщо повідомлення було надіслано до того, як ви ввійшли у свій обліковий запис на цьому пристрої.\n\nТакож можливо, що відправник заблокував ваш пристрій або щось пішло не так з під\'єднанням до інтернету.\n\nЧи можете ви прочитати повідомлення на іншому сеансі? Тоді ви зможете перенести повідомлення з нього! Перейдіть до Налаштування > Пристрої та переконайтеся, що ваші пристрої перевірили один одного. Коли ви відкриєте кімнату наступного разу й обидва сеанси будуть на активні, ключі будуть передані автоматично.\n\nВи ж не хочете втрачати ключі після виходу або зміни пристроїв? Переконайтеся, що ви ввімкнули резервне копіювання бесід у налаштуваннях.';

  @override
  String get newGroup => 'Нова група';

  @override
  String get newSpace => 'Новий простір';

  @override
  String get enterSpace => 'Увійти в простір';

  @override
  String get enterRoom => 'Увійти в кімнату';

  @override
  String get allSpaces => 'Усі простори';

  @override
  String numChats(String number) {
    return '$number бесід';
  }

  @override
  String get hideUnimportantStateEvents => 'Сховати неважливі державні свята';

  @override
  String get hidePresences => 'Сховати список станів?';

  @override
  String get doNotShowAgain => 'Не показувати знову';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Порожня бесіда (раніше $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Простори дозволяють об\'єднувати ваші бесіди та створювати приватні або загальнодоступні спільноти.';

  @override
  String get encryptThisChat => 'Зашифрувати цю бесіду';

  @override
  String get disableEncryptionWarning =>
      'З міркувань безпеки ви не можете вимкнути шифрування в бесіді, ув якій воно було ввімкнене раніше.';

  @override
  String get sorryThatsNotPossible => 'Вибачте... це неможливо';

  @override
  String get deviceKeys => 'Ключі пристрою:';

  @override
  String get reopenChat => 'Відновити бесіду';

  @override
  String get noBackupWarning =>
      'Увага! Якщо ви не ввімкнете резервне копіювання бесіди, ви втратите доступ до своїх зашифрованих повідомлень. Наполегливо радимо ввімкнути резервне копіювання бесіди перед виходом.';

  @override
  String get noOtherDevicesFound => 'Інших пристроїв не знайдено';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Не вдалося надіслати! Сервер підтримує вкладення розміром до $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Файл збережено в $path';
  }

  @override
  String get jumpToLastReadMessage =>
      'Перейти до останнього прочитаного повідомлення';

  @override
  String get readUpToHere => 'Читати тут';

  @override
  String get jump => 'Перейти';

  @override
  String get openLinkInBrowser => 'Відкрити посилання у браузері';

  @override
  String get reportErrorDescription =>
      'О, ні. Щось пішло не так. Якщо хочете, можете повідомити про помилку розробникам.';

  @override
  String get report => 'повідомити';

  @override
  String get signInWithPassword => 'Увійти за допомогою пароля';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Спробуйте пізніше або виберіть інший сервер.';

  @override
  String signInWith(String provider) {
    return 'Увійти через $provider';
  }

  @override
  String get profileNotFound =>
      'Не вдалося знайти користувача на сервері. Можливо, проблема зі з\'єднанням або користувач не існує.';

  @override
  String get setTheme => 'Налаштувати тему:';

  @override
  String get setColorTheme => 'Налаштувати колірну тему:';

  @override
  String get invite => 'Запросити';

  @override
  String get inviteGroupChat => '📨 Запросити до групової бесіди';

  @override
  String get invitePrivateChat => '📨 Запросити до приватної бесіди';

  @override
  String get invalidInput => 'Недійсний ввід!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Введено неправильний PIN! Повторіть спробу за $seconds секунд...';
  }

  @override
  String get pleaseEnterANumber => 'Введіть число більше ніж 0';

  @override
  String get archiveRoomDescription =>
      'Бесіду буде переміщено до архіву. Інші користувачі зможуть побачити, що ви вийшли з неї.';

  @override
  String get roomUpgradeDescription =>
      'Після цього бесіду буде відтворено з новою версією кімнати. Усі учасники отримають сповіщення, що їм потрібно перейти до нової бесіди. Ви можете дізнатися більше про версії кімнат на https://spec.matrix.org/latest/rooms/';

  @override
  String get removeDevicesDescription =>
      'Ви вийдете з цього пристрою і більше не зможете отримувати повідомлення.';

  @override
  String get banUserDescription =>
      'Користувача буде заблоковано в бесіді, і він не зможе знову увійти в неї, поки його не буде розблоковано.';

  @override
  String get unbanUserDescription =>
      'Користувач зможе знову увійти в бесіду, якщо спробує.';

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
      'Користувача вигнали з бесіди, але не заблокували. До загальнодоступних бесід користувач може приєднатися будь-коли.';

  @override
  String get makeAdminDescription =>
      'Після того, як ви зробите цього користувача адміністратором, ви, можливо, не зможете це скасувати, оскільки він матиме ті самі права, що й ви.';

  @override
  String get pushNotificationsNotAvailable => 'Push-сповіщення недоступні';

  @override
  String get learnMore => 'Докладніше';

  @override
  String get yourGlobalUserIdIs => 'Ваш глобальний ID користувача: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'На жаль, не знайдено жодного користувача з запитом \"$query\".Перевірте, чи не було допущено помилки.';
  }

  @override
  String get knocking => 'Стукаються';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Бесіду можна знайти за допомогою пошуку на $server';
  }

  @override
  String get searchChatsRooms => 'Пошук для #chats, @users...';

  @override
  String get nothingFound => 'Нічого не знайдено...';

  @override
  String get groupName => 'Назва групи';

  @override
  String get createGroupAndInviteUsers =>
      'Створити групу та запросити користувачів';

  @override
  String get groupCanBeFoundViaSearch => 'Групу можна знайти через пошук';

  @override
  String get wrongRecoveryKey =>
      'Вибачте... схоже, це неправильний ключ відновлення.';

  @override
  String get startConversation => 'Розпочати розмову';

  @override
  String get commandHint_sendraw => 'Надіслати необроблений json';

  @override
  String get databaseMigrationTitle => 'Базу даних оптимізовано';

  @override
  String get databaseMigrationBody =>
      'Зачекайте, будь ласка. Це може тривати деякий час.';

  @override
  String get leaveEmptyToClearStatus => 'Лишіть порожнім, щоб оновити статус.';

  @override
  String get select => 'Вибрати';

  @override
  String get searchForUsers => 'Пошук @користувачів...';

  @override
  String get pleaseEnterYourCurrentPassword => 'Введіть поточний пароль';

  @override
  String get newPassword => 'Новий пароль';

  @override
  String get pleaseChooseAStrongPassword => 'Виберіть надійний пароль';

  @override
  String get passwordsDoNotMatch => 'Паролі відрізняються';

  @override
  String get passwordIsWrong => 'Введений пароль неправильний';

  @override
  String get publicLink => 'Загальнодоступне посилання';

  @override
  String get publicChatAddresses => 'Адреси загальнодоступної бесіди';

  @override
  String get createNewAddress => 'Створити нову адресу';

  @override
  String get joinSpace => 'Приєднатися до простору';

  @override
  String get publicSpaces => 'Загальнодоступний простір';

  @override
  String get addChatOrSubSpace => 'Додати бесіду або підпростір';

  @override
  String get subspace => 'Підпростір';

  @override
  String get decline => 'Відхилити';

  @override
  String get thisDevice => 'Цей пристрій:';

  @override
  String get initAppError => 'Виникла помилка під час запуску застосунку';

  @override
  String get userRole => 'Роль користувача';

  @override
  String minimumPowerLevel(String level) {
    return '$level — це найнижчий рівень повноважень.';
  }

  @override
  String searchIn(String chat) {
    return 'Пошук у бесіді \"$chat\"...';
  }

  @override
  String get searchMore => 'Шукати ще...';

  @override
  String get gallery => 'Галерея';

  @override
  String get files => 'Файли';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Не вдалося створити базу даних SQlite. Застосунок намагається використовувати стару базу даних. Будь ласка, повідомте про цю помилку розробникам за адресою $url. Текст помилки: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Ваш сеанс втрачено. Будь ласка, повідомте про цю помилку розробникам за адресою $url. Текст помилки: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Наразі застосунок намагається відновити ваш сеанс з резервної копії. Будь ласка, повідомте про цю помилку розробникам за адресою $url. Текст помилки: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Переслати повідомлення до $roomName?';
  }

  @override
  String get sendReadReceipts => 'Надіслати підтвердження прочитання';

  @override
  String get sendTypingNotificationsDescription =>
      'Інші учасники бесіди бачитимуть, коли ви набираєте нове повідомлення.';

  @override
  String get sendReadReceiptsDescription =>
      'Інші учасники бесіди бачитимуть, що ви прочитали повідомлення.';

  @override
  String get formattedMessages => 'Форматовані повідомлення';

  @override
  String get formattedMessagesDescription =>
      'Показувати розширений вміст повідомлень, наприклад, жирний текст, використовуючи markdown.';

  @override
  String get verifyOtherUser => '🔐 Звірити іншого користувача';

  @override
  String get verifyOtherUserDescription =>
      'Якщо ви звіряєте іншого користувача, ви можете бути впевнені, що знаєте, кому ви насправді пишете. 💪\n\nКоли ви почнете звірення, ви та інший користувач побачите спливне вікно в застосунку. Там ви побачите набір смайликів або чисел, які вам потрібно буде порівняти між собою.\n\nНайкращий спосіб зробити це — зустрітися або розпочати відеовиклик. 👭';

  @override
  String get verifyOtherDevice => '🔐 Звірити інший пристрій';

  @override
  String get verifyOtherDeviceDescription =>
      'Коли ви звіряєте інший пристрій, ці пристрої можуть обмінюватися ключами, підвищуючи вашу загальну безпеку. 💪 Коли ви розпочнете звірення, в застосунку на обох пристроях з\'явиться спливне вікно. Там ви побачите набір смайликів або чисел, які вам потрібно буде порівняти між собою. Найкраще мати обидва пристрої під рукою перед початком звірення. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender погоджується звірити ключі';
  }

  @override
  String get customReaction => 'Add reaction';

  @override
  String canceledKeyVerification(String sender) {
    return '$sender скасовує звірення ключів';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender завершує звірення ключів';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender готовий до звірення ключів';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender просить звірити ключі';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender розпочинає звірення ключів';
  }

  @override
  String get transparent => 'Прозорий';

  @override
  String get incomingMessages => 'Вхідні повідомлення';

  @override
  String get stickers => 'Наліпки';

  @override
  String get discover => 'Огляд';

  @override
  String get commandHint_ignore => 'Ігнорувати цей Matrix ID';

  @override
  String get commandHint_unignore => 'Не ігнорувати цей Matrix ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread непрочитаних бесід';
  }

  @override
  String get noDatabaseEncryption =>
      'Шифрування бази даних не підтримується на цій платформі';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Наразі заблоковано $count користувачів.';
  }

  @override
  String get restricted => 'Обмежено';

  @override
  String get knockRestricted => 'Стук обмежено';

  @override
  String goToSpace(Object space) {
    return 'Перейти до простору: $space';
  }

  @override
  String get markAsUnread => 'Позначити непрочитаним';

  @override
  String userLevel(int level) {
    return '$level - Користувач';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Модератор';
  }

  @override
  String adminLevel(int level) {
    return '$level - Адміністратор';
  }

  @override
  String get changeGeneralChatSettings => 'Змінити загальні налаштування чату';

  @override
  String get inviteOtherUsers => 'Запросити інших користувачів до цього чату';

  @override
  String get changeTheChatPermissions => 'Змінити права доступу до чату';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Змінити видимість історії чату';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Змінити основну адресу загальнодоступного чату';

  @override
  String get sendRoomNotifications => 'Надсилати сповіщення @room';

  @override
  String get changeTheDescriptionOfTheGroup => 'Змінити опис чату';

  @override
  String get chatPermissionsDescription =>
      'Визначте, який рівень повноважень необхідний для певних дій у цьому чаті. Рівні повноважень 0, 50 і 100 зазвичай представляють користувачів, модераторів та адміністраторів, але можливі будь-які градації.';

  @override
  String updateInstalled(String version) {
    return '🎉 Оновлення $version встановлено!';
  }

  @override
  String get changelog => 'Зміни';

  @override
  String get sendCanceled => 'Надсилання скасовано';

  @override
  String get loginWithMatrixId => 'Увійти за допомогою Matrix-ID';

  @override
  String get discoverHomeservers => 'Знайти домашні сервери';

  @override
  String get whatIsAHomeserver => 'Що таке домашній сервер?';

  @override
  String get homeserverDescription =>
      'Усі ваші дані зберігаються на домашньому сервері, так само як у постачальника послуг електронної пошти. Ви можете вибрати, який домашній сервер ви хочете використовувати, водночас ви можете спілкуватися з усіма. Докладніше на https://matrix.org.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Здається, це несумісний домашній сервер. Неправильна URL-адреса?';

  @override
  String get calculatingFileSize => 'Обчислення розміру файлу...';

  @override
  String get prepareSendingAttachment =>
      'Підготовка до надсилання вкладення...';

  @override
  String get sendingAttachment => 'Надсилання вкладення...';

  @override
  String get generatingVideoThumbnail => 'Генерування мініатюри відео...';

  @override
  String get compressVideo => 'Стиснення відео...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Надсилання вкладення $index з $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Досягнуто ліміту сервера! Очікування $seconds секунд...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Один із ваших пристроїв не верифікований';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Примітка: Коли ви під\'єднуєте всі свої пристрої до резервної копії бесіди, вони автоматично верифікуються.';

  @override
  String get continueText => 'Продовжити';

  @override
  String get welcomeText =>
      'Привіт-привіт 👋 Це FluffyChat. Ви можете увійти на будь-який сервер, сумісний із https://matrix.org. А потім спілкуватися з будь-ким. Це величезна децентралізована мережа для обміну повідомленнями!';

  @override
  String get blur => 'Розмиття:';

  @override
  String get opacity => 'Прозорість:';

  @override
  String get setWallpaper => 'Встановити шпалери';

  @override
  String get manageAccount => 'Керувати обліковим записом';

  @override
  String get noContactInformationProvided =>
      'Сервер не надає жодної дійсної контактної інформації';

  @override
  String get contactServerAdmin => 'Зв’язатися з адміністратором сервера';

  @override
  String get contactServerSecurity => 'Зв’язатися з відділом безпеки сервера';

  @override
  String get supportPage => 'Сторінка підтримки';

  @override
  String get serverInformation => 'Інформація про сервер:';

  @override
  String get name => 'Ім\'я';

  @override
  String get version => 'Версія';

  @override
  String get website => 'Вебсайт';

  @override
  String get compress => 'Стиснути';

  @override
  String get boldText => 'Жирний текст';

  @override
  String get italicText => 'Курсивний текст';

  @override
  String get strikeThrough => 'Перекреслений текст';

  @override
  String get pleaseFillOut => 'Будь ласка, заповніть';

  @override
  String get invalidUrl => 'Недійсний URL';

  @override
  String get addLink => 'Додати посилання';

  @override
  String get unableToJoinChat =>
      'Неможливо приєднатися до бесіди. Можливо, інша сторона вже закрила розмову.';

  @override
  String get previous => 'Попередній';

  @override
  String get otherPartyNotLoggedIn =>
      'Інша сторона наразі не увійшла в систему, тому не може отримувати повідомлення!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Використати \'$server\', щоб увійти';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Цим ви дозволяєте застосунку та вебсайту ділитися інформацією про вас.';

  @override
  String get open => 'Відкрити';

  @override
  String get waitingForServer => 'Очікування сервера...';

  @override
  String get appIntroduction =>
      'FluffyChat дає змогу спілкуватися з друзями у різних месенджерах. Дізнайтеся більше на https://matrix.org або просто натисніть *Продовжити*.';

  @override
  String get newChatRequest => '📩 Новий запит на спілкування';

  @override
  String get contentNotificationSettings => 'Налаштування сповіщень про вміст';

  @override
  String get generalNotificationSettings => 'Загальні налаштування сповіщень';

  @override
  String get roomNotificationSettings => 'Налаштування сповіщень кімнати';

  @override
  String get userSpecificNotificationSettings =>
      'Налаштування сповіщень для користувача';

  @override
  String get otherNotificationSettings => 'Інші налаштування сповіщень';

  @override
  String get notificationRuleContainsUserName => 'Містить ім\'я користувача';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Сповіщає користувача, коли повідомлення містить його ім\'я користувача.';

  @override
  String get notificationRuleMaster => 'Вимкнути всі сповіщення';

  @override
  String get notificationRuleMasterDescription =>
      'Перевизначає всі інші правила і вимикає всі сповіщення.';

  @override
  String get notificationRuleSuppressNotices =>
      'Заборонити автоматичні повідомлення';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Забороняє сповіщення від автоматизованих клієнтів, таких як боти.';

  @override
  String get notificationRuleInviteForMe => 'Запрошення мене';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Сповіщає користувача, коли його запрошують до кімнати.';

  @override
  String get notificationRuleMemberEvent => 'Події участі';

  @override
  String get notificationRuleMemberEventDescription =>
      'Забороняє сповіщення про події учасників.';

  @override
  String get notificationRuleIsUserMention => 'Згадки користувачів';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Сповіщає користувачів, коли безпосередньо їх згадують у повідомленні.';

  @override
  String get notificationRuleContainsDisplayName => 'Містить показуване ім’я';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Сповіщає користувача, коли повідомлення містить показуване ім\'я.';

  @override
  String get notificationRuleIsRoomMention => 'Згадки кімнати';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Сповіщає користувача, коли є згадка всієї кімнати.';

  @override
  String get notificationRuleRoomnotif => 'Сповіщення кімнати';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Сповіщає користувача, коли повідомлення містить \'@room\'.';

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
      'Яким пристроям довіряти, щоб вони могли читати ваші повідомлення в зашифрованих бесідах?';

  @override
  String get allDevices => 'Усім пристроям';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'З перехресною верифікацією пристроїв, якщо ввімкнено';

  @override
  String get crossVerifiedDevices => 'З перехресною верифікацією пристроїв';

  @override
  String get verifiedDevicesOnly => 'Лише верифіковані пристрої';

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
