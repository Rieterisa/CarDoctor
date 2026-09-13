// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnose';

  @override
  String get tabCommunity => 'Komunidad';

  @override
  String get tabUpload => 'I-upload';

  @override
  String get tabProfile => 'Profile';

  @override
  String get authTagline =>
      'VIN + fault code → parte, hakbang sa pagkumpuni, at 3D gabay mula sa komunidad.';

  @override
  String get authDemo => 'Magpatuloy sa Demo';

  @override
  String get diagnoseHeadline => 'Hanapin ang sira';

  @override
  String get diagnoseSubtitle =>
      'Ilagay ang partikular na VIN at fault code — ang diagnosis ay ayon sa brand ng sasakyan.';

  @override
  String get diagnoseVin => 'VIN / Chassis';

  @override
  String get diagnoseDtc => 'Fault code (DTC)';

  @override
  String get diagnoseSubmit => 'I-diagnose';

  @override
  String get diagnoseSamples => 'Subukan ang karaniwang code';

  @override
  String get legalDisclaimer =>
      'Para sa impormasyon lamang. Hindi kapalit ng propesyonal na payo. Sundin ang mga safety procedure.';

  @override
  String get errorDtcInvalid => 'Maglagay ng wastong code gaya ng P0300.';

  @override
  String get errorDtcNotFound => 'Wala pa ang fault code na ito sa katalogo.';

  @override
  String get resultSteps => 'Mga hakbang sa pagkumpuni';

  @override
  String get resultVideos => 'Mga video ng komunidad';

  @override
  String get resultVideosEmpty => 'Wala pang video — maging una sa pag-upload.';

  @override
  String get resultView3d => 'Tingnan ang sira na parte sa 3D';

  @override
  String get scene3dTitle => 'Naka-highlight na parte';

  @override
  String get scene3dHint =>
      'I-drag para i-rotate. Ipinapakita ng orange mark ang posibleng sira na bahagi.';

  @override
  String get scene3dNav => 'Sasakyang 3D';

  @override
  String get communityFilter => 'I-filter ayon sa DTC';

  @override
  String get communityComments => 'Mga komento';

  @override
  String get communityCommentPlaceholder => 'Ibahagi ang ayos mo…';

  @override
  String get communityCommentSend => 'Ipadala';

  @override
  String get uploadDetails => 'Mga detalye';

  @override
  String get uploadTitle => 'Pamagat';

  @override
  String get uploadSummary => 'Ano ang nag-ayos?';

  @override
  String get uploadPick => 'Pumili ng video';

  @override
  String get uploadSubmit => 'Isumite para sa review';

  @override
  String get uploadSuccess =>
      'Na-upload. Nakabinbin ang moderation (agad magpo-publish ang admin).';

  @override
  String get uploadErrorTitle => 'Kailangan ang pamagat.';

  @override
  String get profileSubscription => 'Subscription';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Libre';

  @override
  String get profileUpgrade => 'Mag-upgrade sa Pro';

  @override
  String get profileMyVideos => 'Mga video ko';

  @override
  String get profileMyVideosEmpty => 'Wala pang upload.';

  @override
  String get profileSignOut => 'Mag-sign out';

  @override
  String get paywallSubtitle =>
      'I-unlock ang 3D part highlight, mas mataas na video quota, at repair history.';

  @override
  String get paywallBenefit3d => 'Interactive na 3D fault localization';

  @override
  String get paywallBenefitVideo => 'Hanggang 30 community upload / buwan';

  @override
  String get paywallBenefitHistory => 'Walang limitasyong diagnosis history';

  @override
  String get paywallDemoUnlock => 'I-unlock ang Pro (Demo)';

  @override
  String get paywallClose => 'Isara';

  @override
  String get authPlayNote => 'Google Play build — susunod ang Firebase Auth.';

  @override
  String get uploadPicked => 'Napili ang video';

  @override
  String get uploadQuotaFull => 'Puno na ang quota — mag-upgrade sa Pro.';

  @override
  String get uploadNavTitle => 'Mag-upload ng video';

  @override
  String get paywallBillingNote =>
      'Ikokonekta ang Play Billing (Google Play subscription) sa susunod.';

  @override
  String commentsCount(int count) {
    return '$count komento';
  }

  @override
  String uploadsLeft(int count) {
    return '$count upload pa ang natitira ngayong buwan';
  }

  @override
  String get language => 'Wika';
}
