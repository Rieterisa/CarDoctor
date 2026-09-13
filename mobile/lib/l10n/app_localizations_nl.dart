// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnose';

  @override
  String get tabCommunity => 'Community';

  @override
  String get tabUpload => 'Uploaden';

  @override
  String get tabProfile => 'Profiel';

  @override
  String get authTagline =>
      'VIN + storingscode → onderdeel, reparatiestappen en 3D-hulp van de community.';

  @override
  String get authDemo => 'Doorgaan met demo';

  @override
  String get diagnoseHeadline => 'Vind de storing';

  @override
  String get diagnoseSubtitle =>
      'Voer een specifiek VIN en een storingscode in — diagnose per voertuigmerk.';

  @override
  String get diagnoseVin => 'VIN / Chassis';

  @override
  String get diagnoseDtc => 'Storingscode (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnoseer';

  @override
  String get diagnoseSamples => 'Probeer een veelvoorkomende code';

  @override
  String get legalDisclaimer =>
      'Alleen ter informatie. Geen vervanging van professioneel advies. Volg veiligheidsprocedures.';

  @override
  String get errorDtcInvalid => 'Voer een geldige code in, zoals P0300.';

  @override
  String get errorDtcNotFound =>
      'Deze storingscode staat nog niet in de catalogus.';

  @override
  String get resultSteps => 'Reparatiestappen';

  @override
  String get resultVideos => 'Communityvideo’s';

  @override
  String get resultVideosEmpty =>
      'Nog geen video’s — wees de eerste die uploadt.';

  @override
  String get resultView3d => 'Bekijk het defecte onderdeel in 3D';

  @override
  String get scene3dTitle => 'Gemarkeerd onderdeel';

  @override
  String get scene3dHint =>
      'Sleep om te draaien. Oranje markering toont het waarschijnlijk defecte onderdeel.';

  @override
  String get scene3dNav => '3D-voertuig';

  @override
  String get communityFilter => 'Filteren op DTC';

  @override
  String get communityComments => 'Reacties';

  @override
  String get communityCommentPlaceholder => 'Deel je oplossing…';

  @override
  String get communityCommentSend => 'Versturen';

  @override
  String get uploadDetails => 'Details';

  @override
  String get uploadTitle => 'Titel';

  @override
  String get uploadSummary => 'Wat heeft het opgelost?';

  @override
  String get uploadPick => 'Kies een video';

  @override
  String get uploadSubmit => 'Indienen ter beoordeling';

  @override
  String get uploadSuccess =>
      'Geüpload. Wacht op moderatie (admins publiceren direct).';

  @override
  String get uploadErrorTitle => 'Titel is verplicht.';

  @override
  String get profileSubscription => 'Abonnement';

  @override
  String get profilePlan => 'Abonnement';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratis';

  @override
  String get profileUpgrade => 'Upgraden naar Pro';

  @override
  String get profileMyVideos => 'Mijn video’s';

  @override
  String get profileMyVideosEmpty => 'Nog geen uploads.';

  @override
  String get profileSignOut => 'Afmelden';

  @override
  String get paywallSubtitle =>
      'Ontgrendel 3D-onderdeelmarkering, hogere videocota en reparatiegeschiedenis.';

  @override
  String get paywallBenefit3d => 'Interactieve 3D-storingslokalisatie';

  @override
  String get paywallBenefitVideo => 'Tot 30 community-uploads / maand';

  @override
  String get paywallBenefitHistory => 'Onbeperkte diagnose-geschiedenis';

  @override
  String get paywallDemoUnlock => 'Pro ontgrendelen (Demo)';

  @override
  String get paywallClose => 'Sluiten';

  @override
  String get authPlayNote => 'Google Play-build — Firebase Auth volgt hierna.';

  @override
  String get uploadPicked => 'Video geselecteerd';

  @override
  String get uploadQuotaFull => 'Quota vol — upgrade naar Pro.';

  @override
  String get uploadNavTitle => 'Video uploaden';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play-abonnement) wordt hierna gekoppeld.';

  @override
  String commentsCount(int count) {
    return '$count reacties';
  }

  @override
  String uploadsLeft(int count) {
    return 'Nog $count uploads deze maand';
  }

  @override
  String get language => 'Taal';
}
