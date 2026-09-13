// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnos';

  @override
  String get tabCommunity => 'Community';

  @override
  String get tabUpload => 'Ladda upp';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + felkod → del, reparationssteg och 3D‑vägledning från communityn.';

  @override
  String get authDemo => 'Fortsätt med demo';

  @override
  String get diagnoseHeadline => 'Hitta felet';

  @override
  String get diagnoseSubtitle =>
      'Ange ett specifikt VIN och en felkod — diagnosen löses per fordonsmärke.';

  @override
  String get diagnoseVin => 'VIN / Chassi';

  @override
  String get diagnoseDtc => 'Felkod (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnostisera';

  @override
  String get diagnoseSamples => 'Prova en vanlig kod';

  @override
  String get legalDisclaimer =>
      'Endast i informationssyfte. Ersätter inte professionell verkstadsrådgivning. Följ säkerhetsrutiner.';

  @override
  String get errorDtcInvalid => 'Ange en giltig kod som P0300.';

  @override
  String get errorDtcNotFound => 'Denna felkod finns ännu inte i katalogen.';

  @override
  String get resultSteps => 'Reparationssteg';

  @override
  String get resultVideos => 'Communityvideor';

  @override
  String get resultVideosEmpty => 'Inga videor ännu — bli först att ladda upp.';

  @override
  String get resultView3d => 'Visa felaktig del i 3D';

  @override
  String get scene3dTitle => 'Markerad del';

  @override
  String get scene3dHint =>
      'Dra för att rotera. Orange markering visar den troligt felaktiga komponenten.';

  @override
  String get scene3dNav => '3D-fordon';

  @override
  String get communityFilter => 'Filtrera efter DTC';

  @override
  String get communityComments => 'Kommentarer';

  @override
  String get communityCommentPlaceholder => 'Dela din lösning…';

  @override
  String get communityCommentSend => 'Skicka';

  @override
  String get uploadDetails => 'Detaljer';

  @override
  String get uploadTitle => 'Titel';

  @override
  String get uploadSummary => 'Vad löste det?';

  @override
  String get uploadPick => 'Välj en video';

  @override
  String get uploadSubmit => 'Skicka för granskning';

  @override
  String get uploadSuccess =>
      'Uppladdat. Väntar på moderering (admins publicerar direkt).';

  @override
  String get uploadErrorTitle => 'Titel krävs.';

  @override
  String get profileSubscription => 'Prenumeration';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratis';

  @override
  String get profileUpgrade => 'Uppgradera till Pro';

  @override
  String get profileMyVideos => 'Mina videor';

  @override
  String get profileMyVideosEmpty => 'Inga uppladdningar ännu.';

  @override
  String get profileSignOut => 'Logga ut';

  @override
  String get paywallSubtitle =>
      'Lås upp 3D-markering, högre videokvot och reparationshistorik.';

  @override
  String get paywallBenefit3d => 'Interaktiv 3D-fellokalisering';

  @override
  String get paywallBenefitVideo =>
      'Upp till 30 communityuppladdningar / månad';

  @override
  String get paywallBenefitHistory => 'Obegränsad diagnoshistorik';

  @override
  String get paywallDemoUnlock => 'Lås upp Pro (Demo)';

  @override
  String get paywallClose => 'Stäng';

  @override
  String get authPlayNote =>
      'Google Play-build — Firebase Auth kommer härnäst.';

  @override
  String get uploadPicked => 'Video vald';

  @override
  String get uploadQuotaFull => 'Kvoten är full — uppgradera till Pro.';

  @override
  String get uploadNavTitle => 'Ladda upp video';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play-prenumeration) kopplas nästa steg.';

  @override
  String commentsCount(int count) {
    return '$count kommentarer';
  }

  @override
  String uploadsLeft(int count) {
    return '$count uppladdningar kvar den här månaden';
  }

  @override
  String get language => 'Språk';
}
