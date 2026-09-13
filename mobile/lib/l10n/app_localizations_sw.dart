// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get tabDiagnose => 'Tambua';

  @override
  String get tabCommunity => 'Jumuiya';

  @override
  String get tabUpload => 'Pakia';

  @override
  String get tabProfile => 'Wasifu';

  @override
  String get authTagline =>
      'VIN + msimbo wa hitilafu → sehemu, hatua za ukarabati na mwongozo wa 3D kutoka jumuiya.';

  @override
  String get authDemo => 'Endelea na Demo';

  @override
  String get diagnoseHeadline => 'Tafuta hitilafu';

  @override
  String get diagnoseSubtitle =>
      'Weka VIN na msimbo wa hitilafu mahususi — utambuzi unatatuliwa kwa chapa ya gari.';

  @override
  String get diagnoseVin => 'VIN / Chasi';

  @override
  String get diagnoseDtc => 'Msimbo wa hitilafu (DTC)';

  @override
  String get diagnoseSubmit => 'Tambua';

  @override
  String get diagnoseSamples => 'Jaribu msimbo wa kawaida';

  @override
  String get legalDisclaimer =>
      'Kwa taarifa tu. Sio mbadala wa ushauri wa kitaalamu. Fuata taratibu za usalama.';

  @override
  String get errorDtcInvalid => 'Weka msimbo halali kama P0300.';

  @override
  String get errorDtcNotFound =>
      'Msimbo huu wa hitilafu bado haupo kwenye katalogi.';

  @override
  String get resultSteps => 'Hatua za ukarabati';

  @override
  String get resultVideos => 'Video za jumuiya';

  @override
  String get resultVideosEmpty => 'Bado hakuna video — kuwa wa kwanza kupakia.';

  @override
  String get resultView3d => 'Angalia sehemu yenye hitilafu kwa 3D';

  @override
  String get scene3dTitle => 'Sehemu iliyoangaziwa';

  @override
  String get scene3dHint =>
      'Buruta ili kuzungusha. Alama ya chungwa inaonyesha sehemu inayoweza kuwa na hitilafu.';

  @override
  String get scene3dNav => 'Gari la 3D';

  @override
  String get communityFilter => 'Chuja kwa DTC';

  @override
  String get communityComments => 'Maoni';

  @override
  String get communityCommentPlaceholder => 'Shiriki suluhisho lako…';

  @override
  String get communityCommentSend => 'Tuma';

  @override
  String get uploadDetails => 'Maelezo';

  @override
  String get uploadTitle => 'Kichwa';

  @override
  String get uploadSummary => 'Nini kilichokitengeneza?';

  @override
  String get uploadPick => 'Chagua video';

  @override
  String get uploadSubmit => 'Wasilisha kwa ukaguzi';

  @override
  String get uploadSuccess =>
      'Imepakuliwa. Inasubiri ukaguzi (wasimamizi huchapisha mara moja).';

  @override
  String get uploadErrorTitle => 'Kichwa kinahitajika.';

  @override
  String get profileSubscription => 'Usajili';

  @override
  String get profilePlan => 'Mpango';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Bure';

  @override
  String get profileUpgrade => 'Boresha hadi Pro';

  @override
  String get profileMyVideos => 'Video zangu';

  @override
  String get profileMyVideosEmpty => 'Bado hakuna upakiaji.';

  @override
  String get profileSignOut => 'Toka';

  @override
  String get paywallSubtitle =>
      'Fungua kuangazia sehemu kwa 3D, kiasi kikubwa cha video, na historia ya ukarabati.';

  @override
  String get paywallBenefit3d =>
      'Upataji wa mahali pa hitilafu kwa 3D ya kuingiliana';

  @override
  String get paywallBenefitVideo => 'Hadi upakiaji 30 wa jumuiya / mwezi';

  @override
  String get paywallBenefitHistory => 'Historia ya utambuzi isiyo na kikomo';

  @override
  String get paywallDemoUnlock => 'Fungua Pro (Demo)';

  @override
  String get paywallClose => 'Funga';

  @override
  String get authPlayNote => 'Toleo la Google Play — Firebase Auth inafuata.';

  @override
  String get uploadPicked => 'Video imechaguliwa';

  @override
  String get uploadQuotaFull => 'Kiasi kimejaa — boresha hadi Pro.';

  @override
  String get uploadNavTitle => 'Pakia video';

  @override
  String get paywallBillingNote =>
      'Play Billing (usajili wa Google Play) itaunganishwa baadaye.';

  @override
  String commentsCount(int count) {
    return 'Maoni $count';
  }

  @override
  String uploadsLeft(int count) {
    return 'Upakiaji $count umebaki mwezi huu';
  }

  @override
  String get language => 'Lugha';
}
