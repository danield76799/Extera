// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

  @override
  String get noSendPermission => 'Вы не можете отправлять сообщения';

  @override
  String get noMessagesYet => 'Нет сообщений';

  @override
  String get longPressToRecordVoiceMessage =>
      'Зажмите, чтобы записать голосовое сообщение.';

  @override
  String get pause => 'Пауза';

  @override
  String get resume => 'Продолжить';

  @override
  String get endPoll => 'Завершить опрос';

  @override
  String get anonymousPoll => 'Анонимный';

  @override
  String get publicPoll => 'Открытый';

  @override
  String get endedPoll => 'Окончен';

  @override
  String get activePoll => 'Активный';

  @override
  String get singleChoice => 'Один ответ';

  @override
  String get multipleChoice => 'Несколько ответов';

  @override
  String get vote => 'Голосовать';

  @override
  String get changeVote => 'Изменить ответ';

  @override
  String choicesSelected(int selected, int max) {
    return 'Выбрано $selected из $max';
  }

  @override
  String get discuss => 'Обсудить';

  @override
  String get pollType => 'Тип опроса';

  @override
  String get question => 'Вопрос';

  @override
  String get answer => 'Ответ';

  @override
  String get addAnswer => 'Добавить ответ';

  @override
  String get pleaseEnterQuestion => 'Введите вопрос';

  @override
  String get atLeastTwoAnswersRequired => 'Требуется хотя бы 2 ответа';

  @override
  String get maxSelections => 'Количество ответов';

  @override
  String get createPoll => 'Создать опрос';

  @override
  String get alwaysUse24HourFormat => 'нет';

  @override
  String get cleanExif => 'Очищать EXIF';

  @override
  String get cleanExifDescription =>
      'Удалять метаданные EXIF (модель камеры, геолокация, время) из изображений еред отправкой.';

  @override
  String get repeatPassword => 'Повторите пароль';

  @override
  String get notAnImage => 'Это не картинка.';

  @override
  String get setCustomPermissionLevel => 'Установить другой уровень прав';

  @override
  String get setPermissionsLevelDescription =>
      'Выберите роль из списка ниже или укажите другой уровень прав.';

  @override
  String get ignoreUser => 'Игнорировать';

  @override
  String get normalUser => 'Участник';

  @override
  String get pinCode => 'PIN-код';

  @override
  String get displayNavigationRail => 'Всегда показывать боковую панель';

  @override
  String get enableGradient => 'Фоновый градиент для сообщений';

  @override
  String get translationDisabledInE2e =>
      'Облачные переводы недоступны в зашифрованных комнатах для защиты конфиденциальности. Выбирайте отдельные слова и переводите их через другие приложения.';

  @override
  String get remove => 'Удалить';

  @override
  String get importNow => 'Импортировать сейчас';

  @override
  String get importEmojis => 'Импортировать эмодзи';

  @override
  String get importFromZipFile => 'Импортировать из ZIP-файла';

  @override
  String get exportEmotePack => 'Экспортировать набор эмодзи как ZIP';

  @override
  String get replace => 'Заменить';

  @override
  String get about => 'О проекте';

  @override
  String aboutHomeserver(String homeserver) {
    return 'О сервере $homeserver';
  }

  @override
  String get accept => 'Принять';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username принял(а) приглашение';
  }

  @override
  String get account => 'Учётная запись';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username активировал(а) сквозное шифрование';
  }

  @override
  String get addEmail => 'Добавить электронную почту';

  @override
  String get confirmMatrixId =>
      'Пожалуйста, подтвердите Matrix ID, чтобы удалить свою учётную запись.';

  @override
  String supposedMxid(String mxid) {
    return 'Это должно быть $mxid';
  }

  @override
  String get addChatDescription => 'Добавить описание чата...';

  @override
  String get addToSpace => 'Добавить в пространство';

  @override
  String get admin => 'Администратор';

  @override
  String get alias => 'псевдоним';

  @override
  String get all => 'Все';

  @override
  String get allChats => 'Все чаты';

  @override
  String get commandHint_roomupgrade => 'Обновить эту комнату';

  @override
  String get commandHint_googly => 'Отправить выпученные глаза';

  @override
  String get commandHint_cuddle => 'Отправить улыбку';

  @override
  String get commandHint_hug => 'Отправить обнимашки';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName выпучил(а) глаза';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName улыбнулся(-ась) Вам';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName обнял(а) Вас';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName ответил(а) на звонок';
  }

  @override
  String get anyoneCanJoin => 'Каждый может присоединиться';

  @override
  String get appLock => 'Блокировка приложения';

  @override
  String get appLockDescription =>
      'Заблокировать приложение, когда не используется пин-код';

  @override
  String get archive => 'Архив';

  @override
  String get areGuestsAllowedToJoin => 'Разрешено ли гостям присоединяться';

  @override
  String get areYouSure => 'Вы уверены?';

  @override
  String get areYouSureYouWantToLogout => 'Вы действительно хотите выйти?';

  @override
  String get askSSSSSign =>
      'Для подписи ключа другого пользователя, пожалуйста, введите вашу парольную фразу или ключ восстановления.';

  @override
  String askVerificationRequest(String username) {
    return 'Принять этот запрос подтверждения от $username?';
  }

  @override
  String get autoplayImages =>
      'Автоматически воспроизводить анимированные стикеры и эмодзи';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Домашний сервер поддерживает следующие типы входа в систему:\n$serverVersions\nНо это приложение поддерживает только:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications =>
      'Отправлять уведомления о наборе текста';

  @override
  String get swipeRightToLeftToReply => 'Для ответа проведите справа на лево';

  @override
  String get sendOnEnter => 'Отправлять на Enter';

  @override
  String badServerVersionsException(String serverVersions,
      String supportedVersions, Object serverVerions, Object suportedVersions) {
    return 'Домашний сервер поддерживает следующие версии спецификации:\n$serverVersions\nНо это приложение поддерживает только $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats чатов и $participants участников';
  }

  @override
  String get noMoreChatsFound => 'Больше чатов не обнаружено...';

  @override
  String get noChatsFoundHere =>
      'Не было найдено ни одного чата. Начните новый чат, нажав кнопку ниже. ⤵️';

  @override
  String get joinedChats => 'Чаты';

  @override
  String get unread => 'Непрочитанные';

  @override
  String get space => 'Пространство';

  @override
  String get spaces => 'Пространства';

  @override
  String get banFromChat => 'Забанить';

  @override
  String get banned => 'Забанен(а)';

  @override
  String bannedUser(String username, String targetName) {
    return '$username забанил(а) $targetName';
  }

  @override
  String get blockDevice => 'Заблокировать устройство';

  @override
  String get blocked => 'Заблокировано';

  @override
  String get botMessages => 'Сообщения от ботов';

  @override
  String get cancel => 'Отмена';

  @override
  String cantOpenUri(String uri) {
    return 'Не удается открыть URI $uri';
  }

  @override
  String get changeDeviceName => 'Изменить имя устройства';

  @override
  String changedTheChatAvatar(String username) {
    return '$username изменил(а) аватар чата';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username изменил(а) описание чата на: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username изменил(а) имя чата на: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username изменил(а) права доступа к чату';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username изменил(а) отображаемое имя на: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username изменил(а) правила гостевого доступа';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username изменил(а) правила гостевого доступа на: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username изменил(а) видимость истории';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username изменил(а) видимость истории на: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username изменил(а) правила присоединения';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username изменил(а) правила присоединения на: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username изменил(а) аватар';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username изменил(а) псевдонимы комнаты';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username изменил(а) ссылку для приглашения';
  }

  @override
  String get changePassword => 'Изменить пароль';

  @override
  String get changeTheHomeserver => 'Изменить домашний сервер';

  @override
  String get changeTheme => 'Персонализация';

  @override
  String get changeTheNameOfTheGroup => 'Изменить название группы';

  @override
  String get changeYourAvatar => 'Изменить свой аватар';

  @override
  String get channelCorruptedDecryptError => 'Шифрование было повреждено';

  @override
  String get chat => 'Чат';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Настроено резервное копирование чатов.';

  @override
  String get chatBackup => 'Резервное копирование чатов';

  @override
  String get chatBackupDescription =>
      'Резервная копия сообщений защищена ключом восстановления. Сохраните его в надёжном месте.';

  @override
  String get chatDetails => 'Настройки чата';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'Чат был добавлен в это пространство';

  @override
  String get chats => 'Чаты';

  @override
  String get chooseAStrongPassword => 'Выберите надёжный пароль';

  @override
  String get clearArchive => 'Очистить архив';

  @override
  String get close => 'Закрыть';

  @override
  String get commandHint_markasdm => 'Пометить как комнату личных сообщений';

  @override
  String get commandHint_markasgroup => 'Пометить как группу';

  @override
  String get commandHint_ban => 'Забанить пользователя в этой комнате';

  @override
  String get commandHint_clearcache => 'Очистить кэш';

  @override
  String get commandHint_create =>
      'Создайте пустой групповой чат\nИспользуйте --no-encryption, чтобы отключить шифрование';

  @override
  String get commandHint_discardsession => 'Удалить сеанс';

  @override
  String get commandHint_dm =>
      'Начните личный чат\nИспользуйте --no-encryption, чтобы отключить шифрование';

  @override
  String get commandHint_html => 'Отправить текст формата HTML';

  @override
  String get commandHint_invite =>
      'Пригласить данного пользователя в эту комнату';

  @override
  String get commandHint_join => 'Присоединиться к данной комнате';

  @override
  String get commandHint_kick => 'Удалить данного пользователя из этой комнаты';

  @override
  String get commandHint_leave => 'Покинуть эту комнату';

  @override
  String get commandHint_me => 'Опишите действие';

  @override
  String get commandHint_myroomavatar =>
      'Установите свою фотографию для этой комнаты (аватар: mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Задайте отображаемое имя для этой комнаты';

  @override
  String get commandHint_op =>
      'Установить уровень прав для пользователя (по умолчанию: 50)';

  @override
  String get commandHint_plain => 'Отправить неотформатированный текст';

  @override
  String get commandHint_react => 'Отправить ответ как реакцию';

  @override
  String get commandHint_send => 'Отправить текст';

  @override
  String get commandHint_unban => 'Разбанить пользователя в этой комнате';

  @override
  String get commandInvalid => 'Недопустимая команда';

  @override
  String commandMissing(String command) {
    return '$command не является командой.';
  }

  @override
  String get compareEmojiMatch => 'Сравните эмодзи';

  @override
  String get compareNumbersMatch => 'Сравните числа';

  @override
  String get configureChat => 'Настроить чат';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get connect => 'Присоединиться';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Контакт был приглашен в группу';

  @override
  String get containsDisplayName => 'Содержит отображаемое имя';

  @override
  String get containsUserName => 'Содержит имя пользователя';

  @override
  String get contentHasBeenReported => 'Жалоба отправлена';

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';

  @override
  String get copy => 'Копировать';

  @override
  String get copyToClipboard => 'Скопировать в буфер обмена';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Не удалось расшифровать сообщение: $error';
  }

  @override
  String countParticipants(int count) {
    return '$count участника(-ов)';
  }

  @override
  String get create => 'Создать';

  @override
  String createdTheChat(String username) {
    return '💬 $username создал(а) чат';
  }

  @override
  String get createGroup => 'Создать группу';

  @override
  String get createNewSpace => 'Новое пространство';

  @override
  String get currentlyActive => 'Сейчас активен(-а)';

  @override
  String get darkTheme => 'Тёмная';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$timeOfDay, $date';
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
      'Это деактивирует ваш аккаунт. Пути назад не будет! Вы уверены?';

  @override
  String get defaultPermissionLevel =>
      'Уровень разрешений по умолчанию для новых пользователей';

  @override
  String get delete => 'Удалить';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get deleteMessage => 'Удалить сообщение';

  @override
  String get device => 'Устройство';

  @override
  String get deviceId => 'Идентификатор устройства';

  @override
  String get devices => 'Устройства';

  @override
  String get directChats => 'Личные чаты';

  @override
  String get allRooms => 'Все группы';

  @override
  String get displaynameHasBeenChanged => 'Отображаемое имя было изменено';

  @override
  String get downloadFile => 'Скачать файл';

  @override
  String get edit => 'Редактировать';

  @override
  String get editBlockedServers => 'Редактировать заблокированные серверы';

  @override
  String get chatPermissions => 'Права в чате';

  @override
  String get chatThreads => 'Обсуждения';

  @override
  String get chatThreadsDescription => 'Список всех обсуждений в этой комнате';

  @override
  String get editDisplayname => 'Отображаемое имя';

  @override
  String get editRoomAliases => 'Редактировать псевдонимы комнаты';

  @override
  String get editRoomAvatar => 'Изменить аватар комнаты';

  @override
  String get emoteExists => 'Эмодзи уже существует!';

  @override
  String get emoteInvalid => 'Недопустимый код эмодзи!';

  @override
  String get emoteKeyboardNoRecents =>
      'Недавно использованные эмодзи появятся здесь...';

  @override
  String get emotePacks => 'Наборы эмодзи для комнаты';

  @override
  String get emoteSettings => 'Настройки эмодзи';

  @override
  String get globalChatId => 'ID глобального чата';

  @override
  String get accessAndVisibility => 'Доступность и видимость';

  @override
  String get accessAndVisibilityDescription =>
      'Кто может зайти и как найти этот чат';

  @override
  String get calls => 'Звонки';

  @override
  String get customEmojisAndStickers => 'Пользовательские эмодзи и стикеры';

  @override
  String get customEmojisAndStickersBody =>
      'Добавить или поделиться пользовательскими эмодзи или стикерами, которые могут быть применены в любом чате.';

  @override
  String get emoteShortcode => 'Код эмодзи';

  @override
  String get emoteWarnNeedToPick =>
      'Вам нужно задать код эмодзи и изображение!';

  @override
  String get emptyChat => 'Пустой чат';

  @override
  String get enableEmotesGlobally => 'Включить набор эмодзи глобально';

  @override
  String get enableEncryption => 'Включить шифрование';

  @override
  String get enableEncryptionWarning =>
      'Вы не сможете отключить шифрование. Вы уверены?';

  @override
  String get encrypted => 'Зашифровано';

  @override
  String get encryption => 'Шифрование';

  @override
  String get encryptionNotEnabled => 'Шифрование не включено';

  @override
  String endedTheCall(String senderName) {
    return '$senderName завершил(а) звонок';
  }

  @override
  String get enterAnEmailAddress => 'Введите адрес электронной почты';

  @override
  String get homeserver => 'Домашний сервер';

  @override
  String get enterYourHomeserver => 'Введите адрес вашего домашнего сервера';

  @override
  String errorObtainingLocation(String error) {
    return 'Ошибка получения местоположения: $error';
  }

  @override
  String get everythingReady => 'Всё готово!';

  @override
  String get extremeOffensive => 'Крайне оскорбительный';

  @override
  String get fileName => 'Имя файла';

  @override
  String get fluffychat => 'Extera';

  @override
  String get fontSize => 'Размер шрифта';

  @override
  String get forward => 'Переслать';

  @override
  String get fromJoining => 'С момента присоединения';

  @override
  String get fromTheInvitation => 'С момента приглашения';

  @override
  String get goToTheNewRoom => 'В новую комнату';

  @override
  String get group => 'Группа';

  @override
  String get chatDescription => 'Описание чата';

  @override
  String get chatDescriptionHasBeenChanged => 'Описание чата изменено';

  @override
  String get groupIsPublic => 'Публичная группа';

  @override
  String get groups => 'Группы';

  @override
  String groupWith(String displayname) {
    return 'Группа с $displayname';
  }

  @override
  String get guestsAreForbidden => 'Гости не могут присоединиться';

  @override
  String get guestsCanJoin => 'Гости могут присоединиться';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username отозвал(а) приглашение $targetName';
  }

  @override
  String get help => 'Помощь';

  @override
  String get hideRedactedEvents => 'Скрыть удалённые события';

  @override
  String get hideRedactedMessages => 'Скрыть удалённые сообщения';

  @override
  String get hideRedactedMessagesBody =>
      'Если кто-то удаляет сообщение, оно будет скрыто в чате.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Скрыть неверные или неизвестные форматы сообщений';

  @override
  String get howOffensiveIsThisContent =>
      'Насколько оскорбительным является этот контент?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Идентификация';

  @override
  String get block => 'Заглушить';

  @override
  String get blockedUsers => 'Заглушённые пользователи';

  @override
  String get blockListDescription =>
      'Вы можете игнорировать пользователей на свой вкус: Вы не увидите их сообщения и не получите от них приглашений.';

  @override
  String get blockUsername => 'Игнорировать имя пользователя';

  @override
  String get iHaveClickedOnLink => 'Я перешёл по ссылке';

  @override
  String get incorrectPassphraseOrKey =>
      'Неверный пароль или ключ восстановления';

  @override
  String get inoffensive => 'Безобидный';

  @override
  String get inviteContact => 'Пригласить контакт';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Вы уверены, что хотите пригласить $contact в чат \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Пригласить контакт в $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Описание чата не создано.';

  @override
  String get tryAgain => 'Повторите попытку';

  @override
  String get invalidServerName => 'Недопустимое имя сервера';

  @override
  String get invited => 'Приглашён';

  @override
  String get redactMessageDescription =>
      'Сообщение будет удалено для всех участников. Это необратимо.';

  @override
  String get optionalRedactReason => 'Причина... (Необязательно)';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username пригласил(а) $targetName';
  }

  @override
  String get invitedUsersOnly => 'Только приглашённым пользователям';

  @override
  String get inviteForMe => 'Приглашение для меня';

  @override
  String inviteText(String username, String link) {
    return '$username пригласил(а) вас в Extera. \n1. Посетите https://extera.xyz/next/next.apk?_invite и установите приложение \n2. Зарегистрируйтесь или войдите \n3. Откройте ссылку приглашения: \n $link';
  }

  @override
  String get isTyping => 'печатает…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username присоединился(-ась) к чату';
  }

  @override
  String get joinRoom => 'Присоединиться к комнате';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username выгнал(а) $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username забанил(а) $targetName';
  }

  @override
  String get kickFromChat => 'Выгнать';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Последнее посещение: $localizedTimeShort';
  }

  @override
  String get leave => 'Покинуть';

  @override
  String get leftTheChat => 'Покинуть чат';

  @override
  String get license => 'Лицензия';

  @override
  String get lightTheme => 'Светлая';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Загрузить еще $count участника(-ов)';
  }

  @override
  String get dehydrate => 'Экспорт сеанса и очистка устройства';

  @override
  String get dehydrateWarning =>
      'Это действие не может быть отменено. Убедитесь, что вы безопасно сохранили файл резервной копии.';

  @override
  String get dehydrateTor => 'Пользователи TOR: Экспорт сеанса';

  @override
  String get dehydrateTorLong =>
      'Для пользователей TOR рекомендуется экспортировать сессию перед закрытием окна.';

  @override
  String get hydrateTor => 'Пользователи TOR: Импорт экспорта сессии';

  @override
  String get hydrateTorLong =>
      'В прошлый раз вы экспортировали свою сессию в TOR? Быстро импортируйте его и продолжайте общение.';

  @override
  String get hydrate => 'Восстановить из файла резервной копии';

  @override
  String get loadingPleaseWait => 'Загрузка... Пожалуйста, подождите.';

  @override
  String get loadMore => 'Загрузить больше…';

  @override
  String get locationDisabledNotice =>
      'Службы определения местоположения отключены. Включите их для отправки местоположения.';

  @override
  String get locationPermissionDeniedNotice =>
      'Разрешение на определение местоположения отклонено. Это необходимо для отправки местоположения.';

  @override
  String get login => 'Войти';

  @override
  String logInTo(String homeserver) {
    return 'Войти в $homeserver';
  }

  @override
  String get logout => 'Выйти';

  @override
  String get memberChanges => 'Изменения участников';

  @override
  String get mention => 'Упомянуть';

  @override
  String get messages => 'Сообщения';

  @override
  String get messagesStyle => 'Сообщения:';

  @override
  String get moderator => 'Модератор';

  @override
  String get muteChat => 'Отключить уведомления';

  @override
  String get needPantalaimonWarning =>
      'Помните, что вам нужен Pantalaimon для использования сквозного шифрования.';

  @override
  String get newChat => 'Новый чат';

  @override
  String get newMessageInFluffyChat => '💬 Новое сообщение в Extera';

  @override
  String get newVerificationRequest => 'Новый запрос на подтверждение!';

  @override
  String get next => 'Далее';

  @override
  String get no => 'Нет';

  @override
  String get noConnectionToTheServer => 'Нет соединения с сервером';

  @override
  String get noEmotesFound => 'Эмодзи не найдены 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Вы не можете активировать шифрование в общедоступных комнатах.';

  @override
  String get noGoogleServicesWarning =>
      'На Вашем устройстве не установлены сервисы Google Play. Классное решение! Для получения push-уведомлений, скачайте ntfy из F-Droid. Вы также можете использовать Aurora Store и microG вместо Google Play Services, если Ваш телефон не поддерживает GMS (например, Huawei).';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 не является matrix-сервером, использовать $server2 вместо него?';
  }

  @override
  String get shareInviteLink => 'Поделиться приглашением';

  @override
  String get scanQrCode => 'Сканировать QR-код';

  @override
  String get none => 'Ничего';

  @override
  String get noPasswordRecoveryDescription =>
      'Вы ещё не добавили способ восстановления пароля.';

  @override
  String get noPermission => 'Нет прав доступа';

  @override
  String get noRoomsFound => 'Комнаты не найдены…';

  @override
  String get notifications => 'Уведомления';

  @override
  String get notificationsEnabledForThisAccount =>
      'Уведомления включены для этого аккаунта';

  @override
  String numUsersTyping(int count) {
    return '$count пользователей печатают…';
  }

  @override
  String get obtainingLocation => 'Получение местоположения…';

  @override
  String get offensive => 'Оскорбительный';

  @override
  String get offline => 'Не в сети';

  @override
  String get ok => 'Ок';

  @override
  String get online => 'В сети';

  @override
  String get onlineKeyBackupEnabled => 'Резервное копирование ключей включено';

  @override
  String get oopsPushError =>
      'Ой! К сожалению, при настройке push-уведомлений произошла ошибка.';

  @override
  String get oopsSomethingWentWrong => 'Ой, что-то пошло не так…';

  @override
  String get openAppToReadMessages =>
      'Откройте приложение чтобы прочитать сообщения';

  @override
  String get openCamera => 'Открыть камеру';

  @override
  String get openVideoCamera => 'Открыть камеру для видео';

  @override
  String get oneClientLoggedOut => 'Один из ваших аккаунтов был отключен';

  @override
  String get addAccount => 'Добавить учетную запись';

  @override
  String get editBundlesForAccount => 'Изменить пакеты для этой учетной записи';

  @override
  String get addToBundle => 'Добавить в пакет';

  @override
  String get removeFromBundle => 'Удалить из этого пакета';

  @override
  String get bundleName => 'Название пакета';

  @override
  String get enableMultiAccounts =>
      '(БЕТА) Включить несколько учетных записей на этом устройстве';

  @override
  String get openInMaps => 'Открыть на картах';

  @override
  String get link => 'Ссылка';

  @override
  String get serverRequiresEmail =>
      'Этот сервер должен подтвердить ваш адрес электронной почты для регистрации.';

  @override
  String get or => 'Или';

  @override
  String get participant => 'Участник';

  @override
  String get passphraseOrKey => 'Пароль или ключ восстановления';

  @override
  String get password => 'Пароль';

  @override
  String get downloads => 'Загрузки';

  @override
  String get passwordForgotten => 'Забыли пароль';

  @override
  String get passwordHasBeenChanged => 'Пароль был изменён';

  @override
  String get hideMemberChangesInPublicChats =>
      'Скрыть изменения участников в общедоступных чатах';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Не показывать входы и выходы, изменения отображаемых имён или аватаров в общедоступных чатах.';

  @override
  String get overview => 'Обзор';

  @override
  String get notifyMeFor => 'Уведомлять меня о';

  @override
  String get passwordRecoverySettings => 'Настройки восстановления пароля';

  @override
  String get passwordRecovery => 'Восстановление пароля';

  @override
  String get people => 'Люди';

  @override
  String get pickImage => 'Выбрать изображение';

  @override
  String get pin => 'Закрепить';

  @override
  String play(String fileName) {
    return 'Проиграть $fileName';
  }

  @override
  String get pleaseChoose => 'Пожалуйста, выберите';

  @override
  String get pleaseChooseAPasscode => 'Пожалуйста, выберите код доступа';

  @override
  String get pleaseClickOnLink =>
      'Пожалуйста, откройте ссылку в электронной почте для того чтобы продолжить.';

  @override
  String get pleaseEnter4Digits =>
      'Введите PIN-код. Оставьте поле пустым, чтобы отключить блокировку приложения.';

  @override
  String get pleaseEnterRecoveryKey => 'Введите ключ восстановления:';

  @override
  String get pleaseEnterYourPassword => 'Пожалуйста, введите ваш пароль';

  @override
  String get pleaseEnterYourPin => 'Пожалуйста, введите свой пин-код';

  @override
  String get pleaseEnterYourUsername => 'Пожалуйста, введите имя пользователя';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Следуйте инструкциям на веб-сайте и нажмите «Далее».';

  @override
  String get privacy => 'Конфиденциальность';

  @override
  String get publicRooms => 'Публичные комнаты';

  @override
  String get pushRules => 'Правила push';

  @override
  String get reason => 'Причина';

  @override
  String get recording => 'Запись';

  @override
  String redactedBy(String username) {
    return '$username удалил(а) это сообщение';
  }

  @override
  String get directChat => 'Личный чат';

  @override
  String redactedByBecause(String username, String reason) {
    return '$username удалил(а) это сообщение. Причина: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username удалил(а) сообщение';
  }

  @override
  String get redactMessage => 'Удалить сообщение';

  @override
  String get register => 'Зарегистрироваться';

  @override
  String get reject => 'Отказать';

  @override
  String rejectedTheInvitation(String username) {
    return '$username отклонил(а) приглашение';
  }

  @override
  String get rejoin => 'Зайти повторно';

  @override
  String get removeAllOtherDevices => 'Удалить все другие устройства';

  @override
  String removedBy(String username) {
    return 'Удалено пользователем $username';
  }

  @override
  String get removeDevice => 'Удалить устройство';

  @override
  String get unbanFromChat => 'Разбанить';

  @override
  String get removeYourAvatar => 'Удалить свой аватар';

  @override
  String get replaceRoomWithNewerVersion =>
      'Заменить комнату более новой версией';

  @override
  String get reply => 'Ответить';

  @override
  String get reportMessage => 'Пожаловаться';

  @override
  String get translateMessage => 'Перевести сообщение';

  @override
  String get translatedMessage => 'Переведённое сообщение';

  @override
  String get errorTranslatingMessage => 'Не удалось перевести сообщение.';

  @override
  String get recoverMessage => 'Восстановить';

  @override
  String get recoveredMessage => 'Восстановленное сообщение';

  @override
  String get errorRecoveringMessage => 'Не удалось восстановить сообщение.';

  @override
  String get errorRecoveringMessageNoAdmin =>
      'Эта возможность доступна только администраторам на серверах Synapse.';

  @override
  String get requestPermission => 'Запросить разрешение';

  @override
  String get roomHasBeenUpgraded => 'Комната обновлена';

  @override
  String get roomVersion => 'Версия комнаты';

  @override
  String get saveFile => 'Сохранить файл';

  @override
  String get retry => 'Повторить';

  @override
  String get search => 'Поиск';

  @override
  String get security => 'Безопасность';

  @override
  String get recoveryKey => 'Ключ восстановления';

  @override
  String get recoveryKeyLost => 'Ключ восстановления утерян?';

  @override
  String seenByUser(String username) {
    return 'Просмотрено пользователем $username';
  }

  @override
  String get send => 'Прислать';

  @override
  String get sendAMessage => 'Отправить сообщение';

  @override
  String get sendAsText => 'Отправить как текст';

  @override
  String get sendAudio => 'Отправить аудио';

  @override
  String get sendFile => 'Отправить файл';

  @override
  String get sendImage => 'Отправить изображение';

  @override
  String sendImages(int count) {
    return 'Отправить $count изображений';
  }

  @override
  String get sendMessages => 'Отправить сообщения';

  @override
  String get sendOriginal => 'Отправить оригинал';

  @override
  String get sendSticker => 'Отправить стикер';

  @override
  String get sendVideo => 'Отправить видео';

  @override
  String sentAFile(String username) {
    return '📁 $username отправил(а) файл';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username отправил(а) аудио';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username отправил(а) изображение';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username отправил(а) стикер';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username отправил(а) видео';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName отправил(а) информацию о звонке';
  }

  @override
  String get separateChatTypes => 'Разделять личные чаты и группы';

  @override
  String get setAsCanonicalAlias => 'Установить как основной псевдоним';

  @override
  String get setCustomEmotes => 'Установить пользовательские эмодзи';

  @override
  String get setChatDescription => 'Установить описание чата';

  @override
  String get setInvitationLink => 'Установить ссылку для приглашения';

  @override
  String get setPermissionsLevel => 'Установить уровень прав';

  @override
  String get setStatus => 'Задать статус';

  @override
  String get settings => 'Настройки';

  @override
  String get share => 'Поделиться';

  @override
  String sharedTheLocation(String username) {
    return '$username поделился(-ась) местоположением';
  }

  @override
  String get shareLocation => 'Поделиться местоположением';

  @override
  String get showPassword => 'Показать пароль';

  @override
  String get presenceStyle => 'Представление:';

  @override
  String get hideAvatarsInInvites => 'Скрывать аватары в приглашениях';

  @override
  String get hideAvatarsInInvitesDescription =>
      'Не показывать аватары комнат в приглашениях';

  @override
  String get presencesToggle =>
      'Показывать сообщения в статусах других пользователей';

  @override
  String get pureBlackToggle => 'Чёрный фон (AMOLED)';

  @override
  String get singlesignon => 'Единая система авторизации';

  @override
  String get skip => 'Пропустить';

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get spaceIsPublic => 'Публичное пространство';

  @override
  String get spaceName => 'Название пространства';

  @override
  String startedACall(String senderName) {
    return '$senderName начал(а) звонок';
  }

  @override
  String get startFirstChat => 'Начните Ваш первый чат';

  @override
  String get status => 'Статус';

  @override
  String get statusExampleMessage => 'Как у вас сегодня дела?';

  @override
  String get submit => 'Отправить';

  @override
  String get synchronizingPleaseWait => 'Синхронизация… Пожалуйста, подождите.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Синхронизация… ($percentage%)';
  }

  @override
  String get systemTheme => 'Системная';

  @override
  String get theyDontMatch => 'Они не совпадают';

  @override
  String get theyMatch => 'Они совпадают';

  @override
  String get title => 'Extera';

  @override
  String get toggleFavorite => 'Переключить избранное';

  @override
  String get toggleMuted => 'Переключить без звука';

  @override
  String get toggleUnread => 'Отметить как прочитанное/непрочитанное';

  @override
  String get tooManyRequestsWarning =>
      'Слишком много запросов. Пожалуйста, повторите попытку позже!';

  @override
  String get transferFromAnotherDevice => 'Перенос с другого устройства';

  @override
  String get tryToSendAgain => 'Попробуйте отправить ещё раз';

  @override
  String get unavailable => 'Недоступен';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username разбанил(а) $targetName';
  }

  @override
  String get unblockDevice => 'Разблокировать устройство';

  @override
  String get unknownDevice => 'Неизвестное устройство';

  @override
  String get unknownEncryptionAlgorithm => 'Неизвестный алгоритм шифрования';

  @override
  String unknownEvent(String type) {
    return 'Неизвестное событие \'$type\'';
  }

  @override
  String get unmuteChat => 'Включить уведомления';

  @override
  String get unpin => 'Открепить';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount непрочитанных чата(ов)',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username и $count других участников печатают…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username и $username2 печатают…';
  }

  @override
  String userIsTyping(String username) {
    return '$username печатает…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username покинул(а) чат';
  }

  @override
  String get username => 'Имя пользователя';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username отправил(а) событие типа \"$type\"';
  }

  @override
  String get unverified => 'Не проверено';

  @override
  String get verified => 'Проверено';

  @override
  String get verify => 'Проверить';

  @override
  String get verifyStart => 'Начать проверку';

  @override
  String get verifySuccess => 'Вы успешно проверены!';

  @override
  String get verifyTitle => 'Проверка другой учётной записи';

  @override
  String get videoCall => 'Видеозвонок';

  @override
  String get visibilityOfTheChatHistory => 'Видимость истории чата';

  @override
  String get visibleForAllParticipants => 'Видима для всех участников';

  @override
  String get visibleForEveryone => 'Видна всем';

  @override
  String get voiceMessage => 'Отправить голосовое сообщение';

  @override
  String get waitingPartnerAcceptRequest =>
      'Ждём, пока другая сторона примет запрос…';

  @override
  String get waitingPartnerEmoji => 'Ждём, пока другая сторона примет эмодзи…';

  @override
  String get waitingPartnerNumbers =>
      'В ожидании другой стороны, чтобы принять числа…';

  @override
  String get wallpaper => 'Обои:';

  @override
  String get warning => 'Предупреждение!';

  @override
  String get weSentYouAnEmail => 'Мы отправили вам электронное письмо';

  @override
  String get whoCanPerformWhichAction => 'Кто и какое действие может выполнять';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Кому разрешено вступать в эту группу';

  @override
  String get whyDoYouWantToReportThis => 'Почему вы хотите сообщить об этом?';

  @override
  String get wipeChatBackup =>
      'Удалить резервную копию чата, чтобы создать новый ключ восстановления?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'По этим адресам вы можете восстановить свой пароль.';

  @override
  String get writeAMessage => 'Напишите сообщение…';

  @override
  String get yes => 'Да';

  @override
  String get you => 'Вы';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Вы больше не участвуете в этом чате';

  @override
  String get youHaveBeenBannedFromThisChat => 'Вы были забанены в этом чате';

  @override
  String get yourPublicKey => 'Ваш открытый ключ';

  @override
  String get messageInfo => 'Информация о сообщении';

  @override
  String get time => 'Время';

  @override
  String get messageType => 'Тип сообщения';

  @override
  String get sender => 'Отправитель';

  @override
  String get openGallery => 'Открыть галерею';

  @override
  String get removeFromSpace => 'Удалить из пространства';

  @override
  String get addToSpaceDescription =>
      'Выберите пространство, чтобы добавить к нему этот чат.';

  @override
  String get start => 'Начать';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Чтобы разблокировать старые сообщения, введите ключ восстановления, сгенерированный в предыдущем сеансе. Ваш ключ восстановления НЕ является вашим паролем.';

  @override
  String get publish => 'Опубликовать';

  @override
  String videoWithSize(String size) {
    return 'Видео ($size)';
  }

  @override
  String get openChat => 'Открыть чат';

  @override
  String get markAsRead => 'Отметить как прочитанное';

  @override
  String get reportUser => 'Сообщить о пользователе';

  @override
  String get dismiss => 'Отклонить';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender отправил реакцию: $reaction';
  }

  @override
  String get pinMessage => 'Прикрепить к комнате';

  @override
  String get confirmEventUnpin => 'Вы уверены, что хотите открепить событие?';

  @override
  String get emojis => 'Эмодзи';

  @override
  String get placeCall => 'Совершить звонок';

  @override
  String get voiceCall => 'Голосовой звонок';

  @override
  String get unsupportedAndroidVersion => 'Неподдерживаемая версия Android';

  @override
  String get unsupportedAndroidVersionLong =>
      'Для этой функции требуется более новая версия Android. Проверьте наличие обновлений или поддержку сторонних прошивок.';

  @override
  String get videoCallsBetaWarning =>
      'Обратите внимание, что видеозвонки в настоящее время находятся в бета-версии. Они могут работать не так, как ожидалось, или вообще не работать на всех платформах.';

  @override
  String get experimentalVideoCalls => 'Экспериментальные видеозвонки';

  @override
  String get emailOrUsername => 'Адрес электронной почты или имя пользователя';

  @override
  String get indexedDbErrorTitle => 'Проблемы с приватным режимом';

  @override
  String get indexedDbErrorLong =>
      'К сожалению, по умолчанию хранилище сообщений не включено в приватном режиме.\nПожалуйста, посетите\n- about:config\n- установите для dom.indexedDB.privateBrowsing.enabled значение true\nВ противном случае запуск Extera будет невозможен.';

  @override
  String switchToAccount(String number) {
    return 'Переключиться на учётную запись $number';
  }

  @override
  String get nextAccount => 'Следующая учётная запись';

  @override
  String get previousAccount => 'Предыдущая учётная запись';

  @override
  String get addWidget => 'Добавить виджет';

  @override
  String get widgetVideo => 'Видео';

  @override
  String get widgetEtherpad => 'Текстовая записка';

  @override
  String get widgetJitsi => 'Видеозвонок Jitsi';

  @override
  String get widgetCustom => 'Пользовательский';

  @override
  String get widgetName => 'Имя';

  @override
  String get widgetUrlError => 'Этот URL не действителен.';

  @override
  String get widgetNameError => 'Пожалуйста, укажите отображаемое имя.';

  @override
  String get errorAddingWidget => 'Ошибка при добавлении виджета.';

  @override
  String get youRejectedTheInvitation => 'Вы отклонили приглашение';

  @override
  String get youJoinedTheChat => 'Вы присоединились к чату';

  @override
  String get youAcceptedTheInvitation => '👍 Вы приняли приглашение';

  @override
  String youBannedUser(String user) {
    return 'Вы забанили $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Вы отозвали приглашение для $user.';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Вы были приглашены по ссылке в:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Вы были приглашены $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Приглашен(а) $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Вы пригласили $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Вы выгнали $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Вы забанили $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Вы разбанили $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user подал(а) заявку на вступление';
  }

  @override
  String get usersMustKnock => 'По заявке на вступление';

  @override
  String get noOneCanJoin => 'Никто не может присоединиться';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user желает присоединиться к чату.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Публичная ссылка еще не была создана';

  @override
  String get knock => 'Подать заявку';

  @override
  String get users => 'Пользователи';

  @override
  String get unlockOldMessages => 'Разблокировать старые сообщения';

  @override
  String get storeInSecureStorageDescription =>
      'Сохраните ключ восстановления в безопасном хранилище этого устройства.';

  @override
  String get saveKeyManuallyDescription =>
      'Сохраните этот ключ вручную, вызвав диалог общего доступа системы или буфера обмена.';

  @override
  String get storeInAndroidKeystore => 'Сохранить в Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Сохранить в Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Сохранить на этом устройстве';

  @override
  String countFiles(int count) {
    return '$count файлов';
  }

  @override
  String get user => 'Пользователь';

  @override
  String get custom => 'Пользовательское';

  @override
  String get foregroundServiceRunning =>
      'Это уведомление появляется, когда запущена основная служба.';

  @override
  String get screenSharingTitle => 'общий доступ к экрану';

  @override
  String get screenSharingDetail => 'Вы делитесь своим экраном в Extera';

  @override
  String get callingPermissions => 'Разрешения на звонки';

  @override
  String get callingAccount => 'Аккаунт для звонков';

  @override
  String get callingAccountDetails =>
      'Позволяет Extera использовать системное приложение для звонков.';

  @override
  String get appearOnTop => 'Появляться сверху';

  @override
  String get appearOnTopDetails =>
      'Позволяет приложению отображаться сверху (не требуется, если у Вас уже настроена Extera как аккаунт для звонков)';

  @override
  String get otherCallingPermissions =>
      'Микрофон, камера и другие разрешения Extera';

  @override
  String get whyIsThisMessageEncrypted => 'Почему это сообщение нечитаемо?';

  @override
  String get noKeyForThisMessage =>
      'Это может произойти, если сообщение было отправлено до того, как вы вошли в свою учетную запись на данном устройстве.\n\nТакже возможно, что отправитель заблокировал ваше устройство или что-то пошло не так с интернет-соединением.\n\nВы можете прочитать сообщение на другой сессии? Тогда вы можете перенести сообщение с неё! Перейдите в Настройки > Устройства и убедитесь, что ваши устройства проверили друг друга. Когда вы откроете комнату в следующий раз и обе сессии будут открыты, ключи будут переданы автоматически.\n\nВы не хотите потерять ключи при выходе из системы или переключении устройств? Убедитесь, что вы включили резервное копирование чата в настройках.';

  @override
  String get newGroup => 'Новая группа';

  @override
  String get newSpace => 'Новое пространство';

  @override
  String get enterSpace => 'Войти в пространство';

  @override
  String get enterRoom => 'Войти в комнату';

  @override
  String get allSpaces => 'Все пространства';

  @override
  String numChats(String number) {
    return '$number чатов';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Скрыть необязательные события статуса';

  @override
  String get hidePresences => 'Скрыть список статусов?';

  @override
  String get doNotShowAgain => 'Не показывать снова';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Пустой чат (был $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Пространства позволяют объединять Ваши чаты и создавать частные или общедоступные сообщества.';

  @override
  String get encryptThisChat => 'Зашифровать этот чат';

  @override
  String get disableEncryptionWarning =>
      'В целях безопасности Вы не можете отключить шифрование в чате, где оно было включено.';

  @override
  String get sorryThatsNotPossible => 'Извините... это невозможно';

  @override
  String get deviceKeys => 'Ключи устройств:';

  @override
  String get reopenChat => 'Открыть чат заново';

  @override
  String get noBackupWarning =>
      'Внимание! Без резервного копиирования, Вы потеряете доступ к своим зашифрованным сообщениям. Крайне рекомендуется включить резервное копирование перед выходом.';

  @override
  String get noOtherDevicesFound => 'Другие устройства не найдены';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Отправка не удалась! Сервер поддерживает только вложения размером до $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Файл сохранён в $path';
  }

  @override
  String get jumpToLastReadMessage => 'Последнее прочитанное сообщение';

  @override
  String get readUpToHere => 'Непрочитанное';

  @override
  String get jump => 'Перейти';

  @override
  String get openLinkInBrowser => 'Открыть ссылку в браузере';

  @override
  String get reportErrorDescription =>
      '😭 О, нет. Что-то пошло не так. При желании вы можете сообщить об этой ошибке разработчикам.';

  @override
  String get report => 'пожаловаться';

  @override
  String get signInWithPassword => 'Войти с помощью пароля';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Повторите попытку позже или выберите другой сервер.';

  @override
  String signInWith(String provider) {
    return 'Войти с $provider';
  }

  @override
  String get profileNotFound =>
      'Пользователь не найден на сервере. Это может быть проблемой подключения или пользователь не существует.';

  @override
  String get setTheme => 'Тема:';

  @override
  String get setColorTheme => 'Цветовая тема:';

  @override
  String get invite => 'Пригласить';

  @override
  String get inviteGroupChat => '📨 Приглашение в групповой чат';

  @override
  String get invitePrivateChat => '📨 Приглашение в приватный чат';

  @override
  String get invalidInput => 'Недопустимый ввод!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Введён неверный пин-код! Повторите попытку через $seconds секунд...';
  }

  @override
  String get pleaseEnterANumber => 'Пожалуйста, введите число больше 0';

  @override
  String get archiveRoomDescription =>
      'Чат переместится в архив. Другим пользователям будет видно, что вы вышли из чата.';

  @override
  String get roomUpgradeDescription =>
      'Затем чат будет воссоздан с новой версией комнаты. Все участники будут уведомлены о необходимости перейти в новый чат. Вы можете узнать больше о версиях комнат на https://spec.matrix.org/latest/rooms/';

  @override
  String get removeDevicesDescription =>
      'Вы выйдете с этого устройства и больше не будете получать сообщения.';

  @override
  String get banUserDescription =>
      'Вы уверены что хотите забанить этого пользователя? Они больше не смогут войти в этот чат. Вы также можете указать причину.';

  @override
  String get unbanUserDescription => 'Пользователь сможет зайти в чат снова.';

  @override
  String doYouWantToKick(String user) {
    return 'Выгнать $user';
  }

  @override
  String doYouWantToBan(String user) {
    return 'Забанить $user';
  }

  @override
  String get kickUserDescription =>
      'Вы уверены что хотите выгнать этого пользователя? Если чат общедоступный, они смогут перезайти. Вы также можете указать причину.';

  @override
  String get makeAdminDescription =>
      'Как только вы назначите этого пользователя администратором, пути назад не будет, так как их права доступа и ваши будут одинаковы.';

  @override
  String get pushNotificationsNotAvailable => 'Push-уведомления недоступны';

  @override
  String get learnMore => 'Узнать больше';

  @override
  String get yourGlobalUserIdIs => 'Ваш глобальный идентификатор - ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'К сожалению, пользователей по запросу \"$query\" не найдено. Убедитесь, что вы не совершили опечатку.';
  }

  @override
  String get knocking => 'Подали заявку';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Чат может быть обнаружен через поиск в $server';
  }

  @override
  String get searchChatsRooms => 'Поиск #чатов, @людей...';

  @override
  String get nothingFound => 'Ничего не найдено...';

  @override
  String get groupName => 'Название группы';

  @override
  String get createGroupAndInviteUsers => 'Создать и пригласить';

  @override
  String get groupCanBeFoundViaSearch => 'Группа может быть найдена поиском';

  @override
  String get wrongRecoveryKey =>
      'Простите... судя по всему, это неверный ключ восстановления.';

  @override
  String get startConversation => 'Начать общение';

  @override
  String get commandHint_sendraw => 'Отправить необработанный json';

  @override
  String get databaseMigrationTitle => 'База данных оптимизирована';

  @override
  String get databaseMigrationBody =>
      'Пожалуйста, подождите. Это может занять некоторое время.';

  @override
  String get leaveEmptyToClearStatus =>
      'Чтобы очистить статус, оставьте поле пустым.';

  @override
  String get select => 'Выбрать';

  @override
  String get searchForUsers => 'Поиск @пользователей...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Пожалуйста, введите свой текущий пароль';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get pleaseChooseAStrongPassword =>
      'Пожалуйста, выберите более надёжный пароль';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get passwordIsWrong => 'Вы ввели неверный пароль';

  @override
  String get publicLink => 'Общедоступная ссылка';

  @override
  String get publicChatAddresses => 'Адреса общедоступного чата';

  @override
  String get createNewAddress => 'Создать новый адрес';

  @override
  String get joinSpace => 'Присоединиться к пространству';

  @override
  String get publicSpaces => 'Общедоступные пространства';

  @override
  String get addChatOrSubSpace => 'Добавить чат или подпространство';

  @override
  String get subspace => 'Подпространство';

  @override
  String get decline => 'Отклонить';

  @override
  String get thisDevice => 'Данное устройство:';

  @override
  String get initAppError => 'Произошла ошибка при запуске приложения';

  @override
  String get userRole => 'Роль пользователя';

  @override
  String minimumPowerLevel(String level) {
    return '$level является минимальным уровнем прав.';
  }

  @override
  String searchIn(String chat) {
    return 'Поиск в чате \"$chat\"...';
  }

  @override
  String get searchMore => 'Найти еще...';

  @override
  String get gallery => 'Галерея';

  @override
  String get files => 'Файлы';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Невозможно собрать базу данных SQlite. Приложение пытается использовать старую базу данных. Пожалуйста, сообщите об этой ошибке разработчикам по адресу $url. Сообщение об ошибке: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Ваш сеанс утерян. Пожалуйста, сообщите об этой ошибке разработчикам по адресу $url. Сообщение об ошибке: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Приложение пытается восстановить сеанс из резервной копии. Пожалуйста, сообщите об этой ошибке разработчикам по адресу $url. Сообщение об ошибке: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Переслать сообщение в $roomName?';
  }

  @override
  String get sendReadReceipts => 'Отправлять отчёты о прочтении';

  @override
  String get sendTypingNotificationsDescription =>
      'Другие участники чата будут видеть, когда Вы набираете новое сообщение.';

  @override
  String get sendReadReceiptsDescription =>
      'Другие участники чата увидят, когда Вы прочитали сообщение.';

  @override
  String get formattedMessages => 'Форматированные сообщения';

  @override
  String get formattedMessagesDescription =>
      'Отображать формат Markdown в сообщениях, например, жирный текст.';

  @override
  String get verifyOtherUser => '🔐 Подтвердить другого пользователя';

  @override
  String get verifyOtherUserDescription =>
      'Если вы подтвердите другого пользователя, то вы можете быть уверены, зная, кому Вы действительно пишете. 💪\n\nКогда Вы начинаете подтверждение, Вы и другой пользователь увидите всплывающее окно в приложении. Там Вы увидите ряд чисел или эмодзи, которые Вы должны сравнить друг с другом.\n\nЛучший способ сделать это - встретиться в реальной жизни или по видео звонку. Если Вы читаете это в далёком будущем, где технологии Deepfake сильно развились, то лучше не стоит доверять видеозвонкам. 👭';

  @override
  String get verifyOtherDevice => '🔐 Подтвердить другое устройство';

  @override
  String get verifyOtherDeviceDescription =>
      'При подтверждении другого устройства эти устройства могут обмениваться ключами, повышая общую безопасность. 💪 При запуске подтверждения в приложении на обоих устройствах появится всплывающее окно. Там вы увидите ряд чисел или эмодзи, которые вы должны сравнить друг с другом. Лучше иметь оба устройства под рукой перед началом проверки. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender принял(а) подтверждение ключей';
  }

  @override
  String get customReaction => 'Добавить реакцию';

  @override
  String canceledKeyVerification(String sender) {
    return '$sender отклонил(а) подтверждение ключей';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender завершил(а) подтверждение ключей';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender готов(а) к подтверждению ключей';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender запросил(а) подтверждение ключей';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender начал(а) подтверждение ключей';
  }

  @override
  String get transparent => 'Прозрачный';

  @override
  String get incomingMessages => 'Входящие сообщения';

  @override
  String get stickers => 'Стикеры';

  @override
  String get discover => 'Исследовать';

  @override
  String get commandHint_ignore => 'Игнорировать данный Matrix ID';

  @override
  String get commandHint_unignore => 'Перестать игнорировать данный Matrix ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread непрочитанных чатов';
  }

  @override
  String get noDatabaseEncryption =>
      'Шифрование базы данных не поддерживается на этой платформе';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Заблокировано $count пользователей.';
  }

  @override
  String get restricted => 'Ограничено';

  @override
  String get knockRestricted => 'Ограничено + по запросу';

  @override
  String goToSpace(Object space) {
    return 'Перейти к пространству: $space';
  }

  @override
  String get markAsUnread => 'Отметить как непрочитанное';

  @override
  String userLevel(int level) {
    return '$level - Пользователь';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Модератор';
  }

  @override
  String adminLevel(int level) {
    return '$level - Администратор';
  }

  @override
  String get changeGeneralChatSettings => 'Изменить общие настройки чата';

  @override
  String get inviteOtherUsers => 'Пригласить других пользователей в этот чат';

  @override
  String get changeTheChatPermissions => 'Изменить права доступа к чату';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Изменить видимость истории чата';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Изменить основной общедоступный адрес чата';

  @override
  String get sendRoomNotifications => 'Упоминать @room';

  @override
  String get changeTheDescriptionOfTheGroup => 'Изменить описание чата';

  @override
  String get chatPermissionsDescription =>
      'Задайте уровень власти, необходимый для совершения определённых действий в этом чате. Уровни прав 0, 50 и 100 обычно обозначают пользователей, модераторов и администраторов соответственно, но другие уровни также возможны.';

  @override
  String updateInstalled(String version) {
    return '🎉 Обновление $version успешно установлено!';
  }

  @override
  String get changelog => 'Список изменений';

  @override
  String get sendCanceled => 'Отправка отменена';

  @override
  String get loginWithMatrixId => 'Войти через Matrix ID';

  @override
  String get discoverHomeservers => 'Список домашних серверов';

  @override
  String get whatIsAHomeserver => 'Для чего нужен домашний сервер?';

  @override
  String get homeserverDescription =>
      'Все ваши данные хранятся на домашнем сервере, прямо как у вашего провайдера электронной почты. Вы можете выбрать, какому серверу вы их доверите, при этом сохраняя возможность общаться со всеми. Узнайте больше на https://matrix.org.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Кажется, это не домашний сервер. Нет ли в ссылке опечаток?';

  @override
  String get calculatingFileSize => 'Вычисление размера файла...';

  @override
  String get prepareSendingAttachment => 'Подготовка к отправке вложения...';

  @override
  String get sendingAttachment => 'Отправка вложения...';

  @override
  String get generatingVideoThumbnail => 'Создание превью видео...';

  @override
  String get compressVideo => 'Сжатие видео...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Отправка... $index $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Слишком много запросов. Повторите попытку через $seconds секунд...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Одно из ваших устройств не подтверждено';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Примечание: Если вы подключите все свои устройства к резервному копированию чатов, то они автоматически станут подтверждёнными.';

  @override
  String get continueText => 'Продолжить';

  @override
  String get welcomeText =>
      'Добро пожаловать в Extera - приложение для Matrix, огромной децентрализованной сети обмена сообщениями!';

  @override
  String get blur => 'Размытие:';

  @override
  String get opacity => 'Прозрачность:';

  @override
  String get setWallpaper => 'Установить обои';

  @override
  String get manageAccount => 'Управление аккаунтом';

  @override
  String get noContactInformationProvided =>
      'Сервер не предоставляет никакой контактной информации';

  @override
  String get contactServerAdmin => 'Админ сервера';

  @override
  String get contactServerSecurity => 'Безопасность контактов сервера';

  @override
  String get supportPage => 'Поддержка';

  @override
  String get serverInformation => 'Информация о сервере:';

  @override
  String get name => 'Имя';

  @override
  String get version => 'Версия';

  @override
  String get website => 'Сайт';

  @override
  String get compress => 'Сжатие';

  @override
  String get boldText => 'Жирный шрифт';

  @override
  String get italicText => 'Italic';

  @override
  String get strikeThrough => 'Перечёркнутый';

  @override
  String get pleaseFillOut => 'Пожалуйста, заполните';

  @override
  String get invalidUrl => 'Не верный URL';

  @override
  String get addLink => 'Добавить ссылку';

  @override
  String get unableToJoinChat =>
      'Невозможно присоединиться к чату. Возможно, другая сторона уже завершила разговор.';

  @override
  String get previous => 'Предыдущий';

  @override
  String get otherPartyNotLoggedIn =>
      'Другая сторона не может получать сообщения.';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Использовать \'$server\' для входа';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Вы позволяете приложению и веб-сайту делиться информацией о Вас.';

  @override
  String get open => 'Открыть';

  @override
  String get waitingForServer => 'Ожидание сервера...';

  @override
  String get appIntroduction =>
      'Extera позволяет Вам присоединяться к другим мессенджерам. Узнайте больше на https://matrix.org или просто нажмите *Продолжить*.';

  @override
  String get newChatRequest => '📩 Запрос нового чата';

  @override
  String get contentNotificationSettings => 'Настройки уведомлений по тексту';

  @override
  String get generalNotificationSettings => 'Общие настройки уведомлений';

  @override
  String get roomNotificationSettings => 'Настройки уведомлений комнаты';

  @override
  String get userSpecificNotificationSettings =>
      'Настроки уведомлений пользователя';

  @override
  String get otherNotificationSettings => 'Другие настройки уведомлений';

  @override
  String get notificationRuleContainsUserName => 'Содержит имя пользователя';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Уведомляет пользователя когда сообщение содержит его имя пользователя.';

  @override
  String get notificationRuleMaster => 'Отключить все уведомления';

  @override
  String get notificationRuleMasterDescription =>
      'Перекрывает все другие правила и отключает все уведомления.';

  @override
  String get notificationRuleSuppressNotices =>
      'Отключить автоматические сообщения';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Отключить уведомления от ботов.';

  @override
  String get notificationRuleInviteForMe => 'Приглашение для меня';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Уведомляет о приглашениях.';

  @override
  String get notificationRuleMemberEvent => 'Изменение участника';

  @override
  String get notificationRuleMemberEventDescription =>
      'Отключить уведомления об изменениях имён, аватаров.';

  @override
  String get notificationRuleIsUserMention => 'Упоминание пользователя';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Отправлять уведомление, когда Вы @упомянуты.';

  @override
  String get notificationRuleContainsDisplayName => 'Содержит отображаемое имя';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Отправлять уведомление, если сообщение содержит Ваше отображаемое имя.';

  @override
  String get notificationRuleIsRoomMention => 'Упоминание комнаты';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Отправлять уведомление, когда в сообщении есть \'@room\'.';

  @override
  String get notificationRuleRoomnotif => 'Упоминание комнаты';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Отправлять уведомление, когда в сообщении есть \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Завершение чата';

  @override
  String get notificationRuleTombstoneDescription =>
      'Отправлять уведомление при завершении чата.';

  @override
  String get notificationRuleReaction => 'Реакция';

  @override
  String get notificationRuleReactionDescription =>
      'Отключить уведомления о реакциях.';

  @override
  String get notificationRuleRoomServerAcl => 'Заглушить уведомления о ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Не отправлять уведомления при изменении ACL комнаты.';

  @override
  String get notificationRuleSuppressEdits => 'Заглушить изменения';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Отключить уведомления об изменённых сообщениях.';

  @override
  String get notificationRuleCall => 'Звонок';

  @override
  String get notificationRuleCallDescription =>
      'Отправлять уведомления о звонках.';

  @override
  String get notificationRuleEncryptedRoomOneToOne => 'Зашифрованные ЛС';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Отправлять уведомления из зашифрованных личных сообщений.';

  @override
  String get notificationRuleRoomOneToOne => 'Личные сообщения';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Отправлять уведомления из незашифрованных личных сообщений.';

  @override
  String get notificationRuleMessage => 'Сообщения';

  @override
  String get notificationRuleMessageDescription =>
      'Отправлять уведомления из обычных чатов.';

  @override
  String get notificationRuleEncrypted => 'Зашифрованные сообщения';

  @override
  String get notificationRuleEncryptedDescription =>
      'Отправлять уведомления из зашифрованных чатов.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Отправлять уведомления о видеозвонках Jitsi.';

  @override
  String get notificationRuleServerAcl => 'Заглушить события ACL';

  @override
  String get notificationRuleServerAclDescription =>
      'Не отправлять уведомления об изменениях ACL.';

  @override
  String unknownPushRule(String rule) {
    return 'Неизвестное правило push-уведомлений \'$rule\'';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Удаление правила push-уведомлений необратимо.';

  @override
  String get more => 'Больше';

  @override
  String get shareKeysWith => 'Делиться ключами...';

  @override
  String get shareKeysWithDescription =>
      'Какие устройства доверены и смогут читать Ваши зашифрованные сообщения?';

  @override
  String get allDevices => 'Со всеми устройствами';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'С устройствами, заверенными перекрёстной подписью, если включено';

  @override
  String get crossVerifiedDevices =>
      'С устройствами, заверенными перекрёстной подписью';

  @override
  String get verifiedDevicesOnly => 'Только с подтверждёнными устройствами';

  @override
  String get takeAPhoto => 'Сделать фото';

  @override
  String get recordAVideo => 'Записать видео';

  @override
  String get optionalMessage => 'Подпись (необязательно)...';

  @override
  String get notSupportedOnThisDevice => 'Не поддерживается на этом устройстве';

  @override
  String get enterNewChat => 'Перейти в новый чат';

  @override
  String get approve => 'Принять';

  @override
  String get youHaveKnocked => 'Вы отправили запрос на вступление';

  @override
  String get pleaseWaitUntilInvited =>
      'Пожалуйста, подождите когда администраторы примут Ваш запрос.';
}
