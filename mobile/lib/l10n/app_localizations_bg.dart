// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get tabDiagnose => 'Диагностика';

  @override
  String get tabCommunity => 'Общност';

  @override
  String get tabUpload => 'Качване';

  @override
  String get tabProfile => 'Профил';

  @override
  String get authTagline =>
      'VIN + код на грешка → част, стъпки за ремонт и 3D насоки от общността.';

  @override
  String get authDemo => 'Продължи с демо';

  @override
  String get diagnoseHeadline => 'Открийте повредата';

  @override
  String get diagnoseSubtitle =>
      'Въведете конкретен VIN и код на грешка — диагностиката е по марка на автомобила.';

  @override
  String get diagnoseVin => 'VIN / Шаси';

  @override
  String get diagnoseDtc => 'Код на грешка (DTC)';

  @override
  String get diagnoseSubmit => 'Диагностицирай';

  @override
  String get diagnoseSamples => 'Опитайте често срещан код';

  @override
  String get legalDisclaimer =>
      'Само за информация. Не замества професионален съвет. Спазвайте мерките за безопасност.';

  @override
  String get errorDtcInvalid => 'Въведете валиден код като P0300.';

  @override
  String get errorDtcNotFound => 'Този код на грешка все още не е в каталога.';

  @override
  String get resultSteps => 'Стъпки за ремонт';

  @override
  String get resultVideos => 'Видеа от общността';

  @override
  String get resultVideosEmpty =>
      'Все още няма видеа — бъдете първият, който качи.';

  @override
  String get resultView3d => 'Вижте повредената част в 3D';

  @override
  String get scene3dTitle => 'Маркирана част';

  @override
  String get scene3dHint =>
      'Плъзнете за завъртане. Оранжевият маркер показва вероятния повреден компонент.';

  @override
  String get scene3dNav => '3D автомобил';

  @override
  String get communityFilter => 'Филтър по DTC';

  @override
  String get communityComments => 'Коментари';

  @override
  String get communityCommentPlaceholder => 'Споделете поправката си…';

  @override
  String get communityCommentSend => 'Изпрати';

  @override
  String get uploadDetails => 'Подробности';

  @override
  String get uploadTitle => 'Заглавие';

  @override
  String get uploadSummary => 'Какво го оправи?';

  @override
  String get uploadPick => 'Изберете видео';

  @override
  String get uploadSubmit => 'Изпрати за преглед';

  @override
  String get uploadSuccess =>
      'Качено. Чака модерация (админите публикуват веднага).';

  @override
  String get uploadErrorTitle => 'Заглавието е задължително.';

  @override
  String get profileSubscription => 'Абонамент';

  @override
  String get profilePlan => 'План';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Безплатно';

  @override
  String get profileUpgrade => 'Надградете до Pro';

  @override
  String get profileMyVideos => 'Моите видеа';

  @override
  String get profileMyVideosEmpty => 'Все още няма качвания.';

  @override
  String get profileSignOut => 'Изход';

  @override
  String get paywallSubtitle =>
      'Отключете 3D маркиране на части, по-голяма видео квота и история на ремонти.';

  @override
  String get paywallBenefit3d => 'Интерактивна 3D локализация на повредата';

  @override
  String get paywallBenefitVideo => 'До 30 качвания в общността / месец';

  @override
  String get paywallBenefitHistory => 'Неограничена история на диагностиките';

  @override
  String get paywallDemoUnlock => 'Отключи Pro (Демо)';

  @override
  String get paywallClose => 'Затвори';

  @override
  String get authPlayNote => 'Google Play версия — следва Firebase Auth.';

  @override
  String get uploadPicked => 'Видеото е избрано';

  @override
  String get uploadQuotaFull => 'Квотата е изчерпана — надградете до Pro.';

  @override
  String get uploadNavTitle => 'Качване на видео';

  @override
  String get paywallBillingNote =>
      'Play Billing (абонамент Google Play) ще бъде свързан след това.';

  @override
  String commentsCount(int count) {
    return '$count коментара';
  }

  @override
  String uploadsLeft(int count) {
    return 'Остават $count качвания този месец';
  }

  @override
  String get language => 'Език';
}
