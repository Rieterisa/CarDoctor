// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get tabDiagnose => 'تشخيص';

  @override
  String get tabCommunity => 'المجتمع';

  @override
  String get tabUpload => 'رفع';

  @override
  String get tabProfile => 'الملف الشخصي';

  @override
  String get authTagline =>
      'رقم الهيكل + رمز العطل ← القطعة وخطوات الإصلاح وإرشاد ثلاثي الأبعاد من المجتمع.';

  @override
  String get authDemo => 'المتابعة بالتجربة';

  @override
  String get diagnoseHeadline => 'اعثر على العطل';

  @override
  String get diagnoseSubtitle =>
      'أدخل رقم هيكل ورمز عطل محددين — يتم التشخيص حسب ماركة المركبة.';

  @override
  String get diagnoseVin => 'رقم الهيكل / الشاسيه';

  @override
  String get diagnoseDtc => 'رمز العطل (DTC)';

  @override
  String get diagnoseSubmit => 'تشخيص';

  @override
  String get diagnoseSamples => 'جرّب رمزًا شائعًا';

  @override
  String get legalDisclaimer =>
      'لأغراض معلوماتية فقط. لا يغني عن استشارة خدمة محترفة. اتبع إجراءات السلامة.';

  @override
  String get errorDtcInvalid => 'أدخل رمزًا صالحًا مثل P0300.';

  @override
  String get errorDtcNotFound => 'رمز العطل هذا غير موجود بعد في الكتالوج.';

  @override
  String get resultSteps => 'خطوات الإصلاح';

  @override
  String get resultVideos => 'فيديوهات المجتمع';

  @override
  String get resultVideosEmpty => 'لا توجد فيديوهات بعد — كن أول من يرفع.';

  @override
  String get resultView3d => 'عرض القطعة المعطلة بتقنية ثلاثية الأبعاد';

  @override
  String get scene3dTitle => 'القطعة المميزة';

  @override
  String get scene3dHint =>
      'اسحب للتدوير. العلامة البرتقالية تُظهر المكوّن المحتمل تعطله.';

  @override
  String get scene3dNav => 'مركبة ثلاثية الأبعاد';

  @override
  String get communityFilter => 'تصفية حسب DTC';

  @override
  String get communityComments => 'التعليقات';

  @override
  String get communityCommentPlaceholder => 'شارك إصلاحك…';

  @override
  String get communityCommentSend => 'إرسال';

  @override
  String get uploadDetails => 'التفاصيل';

  @override
  String get uploadTitle => 'العنوان';

  @override
  String get uploadSummary => 'ما الذي أصلحه؟';

  @override
  String get uploadPick => 'اختر فيديو';

  @override
  String get uploadSubmit => 'إرسال للمراجعة';

  @override
  String get uploadSuccess =>
      'تم الرفع. بانتظار المراجعة (ينشر المشرفون فورًا).';

  @override
  String get uploadErrorTitle => 'العنوان مطلوب.';

  @override
  String get profileSubscription => 'الاشتراك';

  @override
  String get profilePlan => 'الخطة';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'مجاني';

  @override
  String get profileUpgrade => 'الترقية إلى Pro';

  @override
  String get profileMyVideos => 'فيديوهاتي';

  @override
  String get profileMyVideosEmpty => 'لا توجد عمليات رفع بعد.';

  @override
  String get profileSignOut => 'تسجيل الخروج';

  @override
  String get paywallSubtitle =>
      'افتح تمييز القطع ثلاثي الأبعاد وحصة فيديو أعلى وسجل الإصلاحات.';

  @override
  String get paywallBenefit3d =>
      'تحديد موقع العطل تفاعليًا بتقنية ثلاثية الأبعاد';

  @override
  String get paywallBenefitVideo => 'حتى 30 رفعًا للمجتمع شهريًا';

  @override
  String get paywallBenefitHistory => 'سجل تشخيص غير محدود';

  @override
  String get paywallDemoUnlock => 'فتح Pro (تجريبي)';

  @override
  String get paywallClose => 'إغلاق';

  @override
  String get authPlayNote =>
      'إصدار Google Play — مصادقة Firebase هي الخطوة التالية.';

  @override
  String get uploadPicked => 'تم اختيار الفيديو';

  @override
  String get uploadQuotaFull => 'الحصة ممتلئة — رقِّ إلى Pro.';

  @override
  String get uploadNavTitle => 'رفع فيديو';

  @override
  String get paywallBillingNote =>
      'سيتم ربط فوترة Play (اشتراك Google Play) لاحقًا.';

  @override
  String commentsCount(int count) {
    return '$count تعليق';
  }

  @override
  String uploadsLeft(int count) {
    return 'يتبقى $count رفعًا هذا الشهر';
  }

  @override
  String get language => 'اللغة';
}
