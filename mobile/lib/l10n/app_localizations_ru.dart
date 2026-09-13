// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get tabDiagnose => 'Диагностика';

  @override
  String get tabCommunity => 'Сообщество';

  @override
  String get tabUpload => 'Загрузить';

  @override
  String get tabProfile => 'Профиль';

  @override
  String get authTagline =>
      'VIN + код ошибки → деталь, шаги ремонта и 3D‑подсказки от сообщества.';

  @override
  String get authDemo => 'Продолжить в демо';

  @override
  String get diagnoseHeadline => 'Найдите неисправность';

  @override
  String get diagnoseSubtitle =>
      'Введите конкретный VIN и код ошибки — диагностика зависит от марки автомобиля.';

  @override
  String get diagnoseVin => 'VIN / Шасси';

  @override
  String get diagnoseDtc => 'Код ошибки (DTC)';

  @override
  String get diagnoseSubmit => 'Диагностировать';

  @override
  String get diagnoseSamples => 'Попробуйте распространённый код';

  @override
  String get legalDisclaimer =>
      'Только для информации. Не заменяет совет профессионального сервиса. Соблюдайте технику безопасности.';

  @override
  String get errorDtcInvalid => 'Введите корректный код, например P0300.';

  @override
  String get errorDtcNotFound => 'Этого кода ошибки ещё нет в каталоге.';

  @override
  String get resultSteps => 'Шаги ремонта';

  @override
  String get resultVideos => 'Видео сообщества';

  @override
  String get resultVideosEmpty => 'Пока нет видео — загрузите первым.';

  @override
  String get resultView3d => 'Посмотреть неисправную деталь в 3D';

  @override
  String get scene3dTitle => 'Выделенная деталь';

  @override
  String get scene3dHint =>
      'Перетащите для вращения. Оранжевая метка показывает вероятную неисправную деталь.';

  @override
  String get scene3dNav => '3D‑автомобиль';

  @override
  String get communityFilter => 'Фильтр по DTC';

  @override
  String get communityComments => 'Комментарии';

  @override
  String get communityCommentPlaceholder => 'Поделитесь своим решением…';

  @override
  String get communityCommentSend => 'Отправить';

  @override
  String get uploadDetails => 'Подробности';

  @override
  String get uploadTitle => 'Заголовок';

  @override
  String get uploadSummary => 'Что помогло?';

  @override
  String get uploadPick => 'Выберите видео';

  @override
  String get uploadSubmit => 'Отправить на проверку';

  @override
  String get uploadSuccess =>
      'Загружено. Ожидает модерации (админы публикуют сразу).';

  @override
  String get uploadErrorTitle => 'Заголовок обязателен.';

  @override
  String get profileSubscription => 'Подписка';

  @override
  String get profilePlan => 'Тариф';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Бесплатно';

  @override
  String get profileUpgrade => 'Перейти на Pro';

  @override
  String get profileMyVideos => 'Мои видео';

  @override
  String get profileMyVideosEmpty => 'Пока нет загрузок.';

  @override
  String get profileSignOut => 'Выйти';

  @override
  String get paywallSubtitle =>
      'Откройте 3D‑подсветку деталей, больший лимит видео и историю ремонтов.';

  @override
  String get paywallBenefit3d => 'Интерактивная 3D‑локализация неисправности';

  @override
  String get paywallBenefitVideo => 'До 30 загрузок в сообщество / месяц';

  @override
  String get paywallBenefitHistory => 'Неограниченная история диагностик';

  @override
  String get paywallDemoUnlock => 'Открыть Pro (демо)';

  @override
  String get paywallClose => 'Закрыть';

  @override
  String get authPlayNote =>
      'Сборка Google Play — Firebase Auth будет следующим шагом.';

  @override
  String get uploadPicked => 'Видео выбрано';

  @override
  String get uploadQuotaFull => 'Лимит исчерпан — перейдите на Pro.';

  @override
  String get uploadNavTitle => 'Загрузить видео';

  @override
  String get paywallBillingNote =>
      'Play Billing (подписка Google Play) будет подключена далее.';

  @override
  String commentsCount(int count) {
    return '$count комментариев';
  }

  @override
  String uploadsLeft(int count) {
    return 'Осталось $count загрузок в этом месяце';
  }

  @override
  String get language => 'Язык';
}
