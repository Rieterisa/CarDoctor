// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnose';

  @override
  String get tabCommunity => 'Fællesskab';

  @override
  String get tabUpload => 'Upload';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + fejlkode → del, reparationstrin og 3D-vejledning fra fællesskabet.';

  @override
  String get authDemo => 'Fortsæt med demo';

  @override
  String get diagnoseHeadline => 'Find fejlen';

  @override
  String get diagnoseSubtitle =>
      'Indtast et specifikt VIN og en fejlkode — diagnosen løses pr. bilmærke.';

  @override
  String get diagnoseVin => 'VIN / Chassis';

  @override
  String get diagnoseDtc => 'Fejlkode (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosticer';

  @override
  String get diagnoseSamples => 'Prøv en almindelig kode';

  @override
  String get legalDisclaimer =>
      'Kun til information. Erstatter ikke professionel værkstedsrådgivning. Følg sikkerhedsprocedurer.';

  @override
  String get errorDtcInvalid => 'Indtast en gyldig kode som P0300.';

  @override
  String get errorDtcNotFound => 'Denne fejlkode er endnu ikke i kataloget.';

  @override
  String get resultSteps => 'Reparationstrin';

  @override
  String get resultVideos => 'Fællesskabsvideoer';

  @override
  String get resultVideosEmpty =>
      'Ingen videoer endnu — vær den første til at uploade.';

  @override
  String get resultView3d => 'Se den defekte del i 3D';

  @override
  String get scene3dTitle => 'Fremhævet del';

  @override
  String get scene3dHint =>
      'Træk for at dreje. Orange markering viser den sandsynligt defekte komponent.';

  @override
  String get scene3dNav => '3D-køretøj';

  @override
  String get communityFilter => 'Filtrer efter DTC';

  @override
  String get communityComments => 'Kommentarer';

  @override
  String get communityCommentPlaceholder => 'Del din løsning…';

  @override
  String get communityCommentSend => 'Send';

  @override
  String get uploadDetails => 'Detaljer';

  @override
  String get uploadTitle => 'Titel';

  @override
  String get uploadSummary => 'Hvad løste det?';

  @override
  String get uploadPick => 'Vælg en video';

  @override
  String get uploadSubmit => 'Send til gennemgang';

  @override
  String get uploadSuccess =>
      'Uploadet. Afventer moderation (admins udgiver med det samme).';

  @override
  String get uploadErrorTitle => 'Titel er påkrævet.';

  @override
  String get profileSubscription => 'Abonnement';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratis';

  @override
  String get profileUpgrade => 'Opgrader til Pro';

  @override
  String get profileMyVideos => 'Mine videoer';

  @override
  String get profileMyVideosEmpty => 'Ingen uploads endnu.';

  @override
  String get profileSignOut => 'Log ud';

  @override
  String get paywallSubtitle =>
      'Lås 3D-delmarkering, højere videokvote og reparationshistorik op.';

  @override
  String get paywallBenefit3d => 'Interaktiv 3D-fejlplacering';

  @override
  String get paywallBenefitVideo => 'Op til 30 fællesskabuploads / måned';

  @override
  String get paywallBenefitHistory => 'Ubegrænset diagnosehistorik';

  @override
  String get paywallDemoUnlock => 'Lås Pro op (Demo)';

  @override
  String get paywallClose => 'Luk';

  @override
  String get authPlayNote => 'Google Play-build — Firebase Auth kommer næste.';

  @override
  String get uploadPicked => 'Video valgt';

  @override
  String get uploadQuotaFull => 'Kvoten er fuld — opgrader til Pro.';

  @override
  String get uploadNavTitle => 'Upload video';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play-abonnement) tilsluttes næste gang.';

  @override
  String commentsCount(int count) {
    return '$count kommentarer';
  }

  @override
  String uploadsLeft(int count) {
    return '$count uploads tilbage denne måned';
  }

  @override
  String get language => 'Sprog';
}
