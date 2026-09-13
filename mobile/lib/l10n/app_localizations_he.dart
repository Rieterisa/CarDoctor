// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get tabDiagnose => 'אבחון';

  @override
  String get tabCommunity => 'קהילה';

  @override
  String get tabUpload => 'העלאה';

  @override
  String get tabProfile => 'פרופיל';

  @override
  String get authTagline =>
      'מספר שלדה + קוד תקלה ← חלק, שלבי תיקון והכוונה תלת־ממדית מהקהילה.';

  @override
  String get authDemo => 'המשך עם הדגמה';

  @override
  String get diagnoseHeadline => 'מצא את התקלה';

  @override
  String get diagnoseSubtitle =>
      'הזן מספר שלדה וקוד תקלה ספציפיים — האבחון נפתר לפי מותג הרכב.';

  @override
  String get diagnoseVin => 'מספר שלדה';

  @override
  String get diagnoseDtc => 'קוד תקלה (DTC)';

  @override
  String get diagnoseSubmit => 'אבחן';

  @override
  String get diagnoseSamples => 'נסה קוד נפוץ';

  @override
  String get legalDisclaimer =>
      'למידע בלבד. אינו מחליף ייעוץ מקצועי. יש לפעול לפי נהלי בטיחות.';

  @override
  String get errorDtcInvalid => 'הזן קוד תקין כמו P0300.';

  @override
  String get errorDtcNotFound => 'קוד התקלה הזה עדיין לא בקטלוג.';

  @override
  String get resultSteps => 'שלבי תיקון';

  @override
  String get resultVideos => 'סרטוני קהילה';

  @override
  String get resultVideosEmpty => 'עדיין אין סרטונים — היו הראשונים להעלות.';

  @override
  String get resultView3d => 'הצג חלק פגום בתלת־ממד';

  @override
  String get scene3dTitle => 'חלק מודגש';

  @override
  String get scene3dHint =>
      'גררו לסיבוב. הסימון הכתום מציג את הרכיב שככל הנראה פגום.';

  @override
  String get scene3dNav => 'רכב תלת־ממדי';

  @override
  String get communityFilter => 'סינון לפי DTC';

  @override
  String get communityComments => 'תגובות';

  @override
  String get communityCommentPlaceholder => 'שתפו את התיקון שלכם…';

  @override
  String get communityCommentSend => 'שלח';

  @override
  String get uploadDetails => 'פרטים';

  @override
  String get uploadTitle => 'כותרת';

  @override
  String get uploadSummary => 'מה תיקן את זה?';

  @override
  String get uploadPick => 'בחרו סרטון';

  @override
  String get uploadSubmit => 'שלח לבדיקה';

  @override
  String get uploadSuccess => 'הועלה. ממתין לאישור (מנהלים מפרסמים מיד).';

  @override
  String get uploadErrorTitle => 'נדרשת כותרת.';

  @override
  String get profileSubscription => 'מנוי';

  @override
  String get profilePlan => 'תוכנית';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'חינם';

  @override
  String get profileUpgrade => 'שדרוג ל‑Pro';

  @override
  String get profileMyVideos => 'הסרטונים שלי';

  @override
  String get profileMyVideosEmpty => 'עדיין אין העלאות.';

  @override
  String get profileSignOut => 'התנתקות';

  @override
  String get paywallSubtitle =>
      'פתחו הדגשת חלקים בתלת־ממד, מכסת סרטונים גבוהה יותר והיסטוריית תיקונים.';

  @override
  String get paywallBenefit3d => 'איתור תקלות אינטראקטיבי בתלת־ממד';

  @override
  String get paywallBenefitVideo => 'עד 30 העלאות לקהילה בחודש';

  @override
  String get paywallBenefitHistory => 'היסטוריית אבחון ללא הגבלה';

  @override
  String get paywallDemoUnlock => 'פתיחת Pro (הדגמה)';

  @override
  String get paywallClose => 'סגור';

  @override
  String get authPlayNote => 'גרסת Google Play — Firebase Auth הוא השלב הבא.';

  @override
  String get uploadPicked => 'הסרטון נבחר';

  @override
  String get uploadQuotaFull => 'המכסה מלאה — שדרגו ל‑Pro.';

  @override
  String get uploadNavTitle => 'העלאת סרטון';

  @override
  String get paywallBillingNote =>
      'Play Billing (מנוי Google Play) יחובר בשלב הבא.';

  @override
  String commentsCount(int count) {
    return '$count תגובות';
  }

  @override
  String uploadsLeft(int count) {
    return 'נותרו $count העלאות החודש';
  }

  @override
  String get language => 'שפה';
}
