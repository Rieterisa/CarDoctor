// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get tabDiagnose => 'Діагностика';

  @override
  String get tabCommunity => 'Спільнота';

  @override
  String get tabUpload => 'Завантажити';

  @override
  String get tabProfile => 'Профіль';

  @override
  String get authTagline =>
      'VIN + код несправності → деталь, кроки ремонту та 3D‑підказки від спільноти.';

  @override
  String get authDemo => 'Продовжити в демо';

  @override
  String get diagnoseHeadline => 'Знайдіть несправність';

  @override
  String get diagnoseSubtitle =>
      'Введіть конкретний VIN і код несправності — діагностика залежить від марки авто.';

  @override
  String get diagnoseVin => 'VIN / Шасі';

  @override
  String get diagnoseDtc => 'Код несправності (DTC)';

  @override
  String get diagnoseSubmit => 'Діагностувати';

  @override
  String get diagnoseSamples => 'Спробуйте поширений код';

  @override
  String get legalDisclaimer =>
      'Лише для інформації. Не замінює пораду професійного сервісу. Дотримуйтесь правил безпеки.';

  @override
  String get errorDtcInvalid => 'Введіть коректний код, наприклад P0300.';

  @override
  String get errorDtcNotFound => 'Цього коду несправності ще немає в каталозі.';

  @override
  String get resultSteps => 'Кроки ремонту';

  @override
  String get resultVideos => 'Відео спільноти';

  @override
  String get resultVideosEmpty => 'Поки немає відео — завантажте першим.';

  @override
  String get resultView3d => 'Переглянути несправну деталь у 3D';

  @override
  String get scene3dTitle => 'Виділена деталь';

  @override
  String get scene3dHint =>
      'Перетягніть, щоб обернути. Помаранчева позначка показує ймовірно несправний вузол.';

  @override
  String get scene3dNav => '3D‑автомобіль';

  @override
  String get communityFilter => 'Фільтр за DTC';

  @override
  String get communityComments => 'Коментарі';

  @override
  String get communityCommentPlaceholder => 'Поділіться своїм рішенням…';

  @override
  String get communityCommentSend => 'Надіслати';

  @override
  String get uploadDetails => 'Деталі';

  @override
  String get uploadTitle => 'Заголовок';

  @override
  String get uploadSummary => 'Що допомогло?';

  @override
  String get uploadPick => 'Виберіть відео';

  @override
  String get uploadSubmit => 'Надіслати на перевірку';

  @override
  String get uploadSuccess =>
      'Завантажено. Очікує модерації (адміни публікують одразу).';

  @override
  String get uploadErrorTitle => 'Заголовок обов’язковий.';

  @override
  String get profileSubscription => 'Підписка';

  @override
  String get profilePlan => 'Тариф';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Безкоштовно';

  @override
  String get profileUpgrade => 'Перейти на Pro';

  @override
  String get profileMyVideos => 'Мої відео';

  @override
  String get profileMyVideosEmpty => 'Поки немає завантажень.';

  @override
  String get profileSignOut => 'Вийти';

  @override
  String get paywallSubtitle =>
      'Відкрийте 3D‑підсвічування деталей, більший ліміт відео та історію ремонтів.';

  @override
  String get paywallBenefit3d => 'Інтерактивна 3D‑локалізація несправності';

  @override
  String get paywallBenefitVideo => 'До 30 завантажень у спільноту / місяць';

  @override
  String get paywallBenefitHistory => 'Необмежена історія діагностик';

  @override
  String get paywallDemoUnlock => 'Відкрити Pro (демо)';

  @override
  String get paywallClose => 'Закрити';

  @override
  String get authPlayNote => 'Збірка Google Play — далі Firebase Auth.';

  @override
  String get uploadPicked => 'Відео вибрано';

  @override
  String get uploadQuotaFull => 'Ліміт вичерпано — перейдіть на Pro.';

  @override
  String get uploadNavTitle => 'Завантажити відео';

  @override
  String get paywallBillingNote =>
      'Play Billing (підписка Google Play) буде підключено далі.';

  @override
  String commentsCount(int count) {
    return '$count коментарів';
  }

  @override
  String uploadsLeft(int count) {
    return 'Залишилось $count завантажень цього місяця';
  }

  @override
  String get language => 'Мова';
}
