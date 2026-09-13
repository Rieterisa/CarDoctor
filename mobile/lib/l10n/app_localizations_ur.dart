// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get tabDiagnose => 'تشخیص';

  @override
  String get tabCommunity => 'کمیونٹی';

  @override
  String get tabUpload => 'اپ لوڈ';

  @override
  String get tabProfile => 'پروفائل';

  @override
  String get authTagline =>
      'VIN + خرابی کوڈ → پرزہ، مرمت کے مراحل اور کمیونٹی سے 3D رہنمائی۔';

  @override
  String get authDemo => 'ڈیمو کے ساتھ جاری رکھیں';

  @override
  String get diagnoseHeadline => 'خرابی تلاش کریں';

  @override
  String get diagnoseSubtitle =>
      'مخصوص VIN اور خرابی کوڈ درج کریں — تشخیص گاڑی کے برانڈ کے مطابق ہوتی ہے۔';

  @override
  String get diagnoseVin => 'VIN / شاسی';

  @override
  String get diagnoseDtc => 'خرابی کوڈ (DTC)';

  @override
  String get diagnoseSubmit => 'تشخیص کریں';

  @override
  String get diagnoseSamples => 'عام کوڈ آزمائیں';

  @override
  String get legalDisclaimer =>
      'صرف معلومات کے لیے۔ پیشہ ورانہ سروس مشورے کا متبادل نہیں۔ حفاظتی طریقہ کار پر عمل کریں۔';

  @override
  String get errorDtcInvalid => 'P0300 جیسا درست کوڈ درج کریں۔';

  @override
  String get errorDtcNotFound => 'یہ خرابی کوڈ ابھی کیٹلاگ میں نہیں ہے۔';

  @override
  String get resultSteps => 'مرمت کے مراحل';

  @override
  String get resultVideos => 'کمیونٹی ویڈیوز';

  @override
  String get resultVideosEmpty =>
      'ابھی کوئی ویڈیو نہیں — سب سے پہلے اپ لوڈ کریں۔';

  @override
  String get resultView3d => 'خراب پرزہ 3D میں دیکھیں';

  @override
  String get scene3dTitle => 'نمایاں پرزہ';

  @override
  String get scene3dHint =>
      'گھمانے کے لیے کھینچیں۔ نارنجی نشان ممکنہ خراب جزو دکھاتا ہے۔';

  @override
  String get scene3dNav => '3D گاڑی';

  @override
  String get communityFilter => 'DTC سے فلٹر کریں';

  @override
  String get communityComments => 'تبصرے';

  @override
  String get communityCommentPlaceholder => 'اپنا حل شیئر کریں…';

  @override
  String get communityCommentSend => 'بھیجیں';

  @override
  String get uploadDetails => 'تفصیلات';

  @override
  String get uploadTitle => 'عنوان';

  @override
  String get uploadSummary => 'کیا چیز ٹھیک ہوئی؟';

  @override
  String get uploadPick => 'ویڈیو منتخب کریں';

  @override
  String get uploadSubmit => 'جائزے کے لیے بھیجیں';

  @override
  String get uploadSuccess =>
      'اپ لوڈ ہو گیا۔ ماڈریشن زیر التوا (ایڈمنز فوری شائع کرتے ہیں)۔';

  @override
  String get uploadErrorTitle => 'عنوان ضروری ہے۔';

  @override
  String get profileSubscription => 'سبسکرپشن';

  @override
  String get profilePlan => 'پلان';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'مفت';

  @override
  String get profileUpgrade => 'Pro میں اپ گریڈ کریں';

  @override
  String get profileMyVideos => 'میری ویڈیوز';

  @override
  String get profileMyVideosEmpty => 'ابھی کوئی اپ لوڈ نہیں۔';

  @override
  String get profileSignOut => 'سائن آؤٹ';

  @override
  String get paywallSubtitle =>
      '3D پرزہ ہائی لائٹ، زیادہ ویڈیو کوٹہ اور مرمت کی تاریخ ان لاک کریں۔';

  @override
  String get paywallBenefit3d => 'انٹرایکٹو 3D خرابی مقام تعین';

  @override
  String get paywallBenefitVideo => 'ماہانہ 30 تک کمیونٹی اپ لوڈ';

  @override
  String get paywallBenefitHistory => 'لامحدود تشخیص کی تاریخ';

  @override
  String get paywallDemoUnlock => 'Pro ان لاک کریں (ڈیمو)';

  @override
  String get paywallClose => 'بند کریں';

  @override
  String get authPlayNote => 'Google Play بلڈ — اگلا مرحلہ Firebase Auth ہے۔';

  @override
  String get uploadPicked => 'ویڈیو منتخب ہو گئی';

  @override
  String get uploadQuotaFull => 'کوٹہ بھرت گیا — Pro میں اپ گریڈ کریں۔';

  @override
  String get uploadNavTitle => 'ویڈیو اپ لوڈ کریں';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play سبسکرپشن) اگلے مرحلے میں منسلک ہوگی۔';

  @override
  String commentsCount(int count) {
    return '$count تبصرے';
  }

  @override
  String uploadsLeft(int count) {
    return 'اس مہینے $count اپ لوڈ باقی';
  }

  @override
  String get language => 'زبان';
}
