// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get tabDiagnose => 'تشخیص';

  @override
  String get tabCommunity => 'انجمن';

  @override
  String get tabUpload => 'آپلود';

  @override
  String get tabProfile => 'پروفایل';

  @override
  String get authTagline =>
      'VIN + کد خطا ← قطعه، مراحل تعمیر و راهنمای سه‌بعدی از جامعه.';

  @override
  String get authDemo => 'ادامه با نسخه آزمایشی';

  @override
  String get diagnoseHeadline => 'عیب را پیدا کنید';

  @override
  String get diagnoseSubtitle =>
      'VIN و کد خطای مشخص وارد کنید — تشخیص بر اساس برند خودرو انجام می‌شود.';

  @override
  String get diagnoseVin => 'VIN / شاسی';

  @override
  String get diagnoseDtc => 'کد خطا (DTC)';

  @override
  String get diagnoseSubmit => 'تشخیص بده';

  @override
  String get diagnoseSamples => 'یک کد رایج را امتحان کنید';

  @override
  String get legalDisclaimer =>
      'فقط برای اطلاع‌رسانی. جایگزین مشاوره تخصصی نیست. رویه‌های ایمنی را رعایت کنید.';

  @override
  String get errorDtcInvalid => 'کد معتبری مانند P0300 وارد کنید.';

  @override
  String get errorDtcNotFound => 'این کد خطا هنوز در کاتالوگ نیست.';

  @override
  String get resultSteps => 'مراحل تعمیر';

  @override
  String get resultVideos => 'ویدیوهای انجمن';

  @override
  String get resultVideosEmpty =>
      'هنوز ویدیویی نیست — اولین نفر باشید که آپلود می‌کند.';

  @override
  String get resultView3d => 'قطعه معیوب را سه‌بعدی ببینید';

  @override
  String get scene3dTitle => 'قطعه برجسته‌شده';

  @override
  String get scene3dHint =>
      'برای چرخاندن بکشید. علامت نارنجی قطعه احتمالاً معیوب را نشان می‌دهد.';

  @override
  String get scene3dNav => 'خودروی سه‌بعدی';

  @override
  String get communityFilter => 'فیلتر بر اساس DTC';

  @override
  String get communityComments => 'نظرات';

  @override
  String get communityCommentPlaceholder => 'راه‌حل خود را به اشتراک بگذارید…';

  @override
  String get communityCommentSend => 'ارسال';

  @override
  String get uploadDetails => 'جزئیات';

  @override
  String get uploadTitle => 'عنوان';

  @override
  String get uploadSummary => 'چه چیزی درستش کرد؟';

  @override
  String get uploadPick => 'یک ویدیو انتخاب کنید';

  @override
  String get uploadSubmit => 'ارسال برای بررسی';

  @override
  String get uploadSuccess =>
      'آپلود شد. در انتظار بررسی (مدیران فوری منتشر می‌کنند).';

  @override
  String get uploadErrorTitle => 'عنوان الزامی است.';

  @override
  String get profileSubscription => 'اشتراک';

  @override
  String get profilePlan => 'طرح';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'رایگان';

  @override
  String get profileUpgrade => 'ارتقاء به Pro';

  @override
  String get profileMyVideos => 'ویدیوهای من';

  @override
  String get profileMyVideosEmpty => 'هنوز آپلودی نیست.';

  @override
  String get profileSignOut => 'خروج';

  @override
  String get paywallSubtitle =>
      'برجسته‌سازی سه‌بعدی قطعه، سهمیه ویدیوی بیشتر و تاریخچه تعمیر را باز کنید.';

  @override
  String get paywallBenefit3d => 'جانمایی تعاملی خطای سه‌بعدی';

  @override
  String get paywallBenefitVideo => 'تا ۳۰ آپلود انجمن در ماه';

  @override
  String get paywallBenefitHistory => 'تاریخچه تشخیص نامحدود';

  @override
  String get paywallDemoUnlock => 'باز کردن Pro (آزمایشی)';

  @override
  String get paywallClose => 'بستن';

  @override
  String get authPlayNote => 'نسخه Google Play — مرحله بعد Firebase Auth است.';

  @override
  String get uploadPicked => 'ویدیو انتخاب شد';

  @override
  String get uploadQuotaFull => 'سهمیه پر شد — به Pro ارتقا دهید.';

  @override
  String get uploadNavTitle => 'آپلود ویدیو';

  @override
  String get paywallBillingNote =>
      'Play Billing (اشتراک Google Play) در مرحله بعد متصل می‌شود.';

  @override
  String commentsCount(int count) {
    return '$count نظر';
  }

  @override
  String uploadsLeft(int count) {
    return '$count آپلود باقی‌مانده در این ماه';
  }

  @override
  String get language => 'زبان';
}
