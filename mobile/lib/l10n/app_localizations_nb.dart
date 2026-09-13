// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnose';

  @override
  String get tabCommunity => 'Fellesskap';

  @override
  String get tabUpload => 'Last opp';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + feilkode → del, reparasjonstrinn og 3D-veiledning fra fellesskapet.';

  @override
  String get authDemo => 'Fortsett med demo';

  @override
  String get diagnoseHeadline => 'Finn feilen';

  @override
  String get diagnoseSubtitle =>
      'Skriv inn et spesifikt VIN og en feilkode — diagnosen løses per bilmerke.';

  @override
  String get diagnoseVin => 'VIN / Chassis';

  @override
  String get diagnoseDtc => 'Feilkode (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnostiser';

  @override
  String get diagnoseSamples => 'Prøv en vanlig kode';

  @override
  String get legalDisclaimer =>
      'Kun til informasjon. Erstatter ikke profesjonell verkstedsrådgivning. Følg sikkerhetsprosedyrer.';

  @override
  String get errorDtcInvalid => 'Skriv inn en gyldig kode som P0300.';

  @override
  String get errorDtcNotFound => 'Denne feilkoden er ikke i katalogen ennå.';

  @override
  String get resultSteps => 'Reparasjonstrinn';

  @override
  String get resultVideos => 'Fellesskapsvideoer';

  @override
  String get resultVideosEmpty =>
      'Ingen videoer ennå — vær først til å laste opp.';

  @override
  String get resultView3d => 'Vis defekt del i 3D';

  @override
  String get scene3dTitle => 'Uthevet del';

  @override
  String get scene3dHint =>
      'Dra for å rotere. Oransje merke viser den trolig defekte komponenten.';

  @override
  String get scene3dNav => '3D-bil';

  @override
  String get communityFilter => 'Filtrer etter DTC';

  @override
  String get communityComments => 'Kommentarer';

  @override
  String get communityCommentPlaceholder => 'Del løsningen din…';

  @override
  String get communityCommentSend => 'Send';

  @override
  String get uploadDetails => 'Detaljer';

  @override
  String get uploadTitle => 'Tittel';

  @override
  String get uploadSummary => 'Hva fikset det?';

  @override
  String get uploadPick => 'Velg en video';

  @override
  String get uploadSubmit => 'Send inn til gjennomgang';

  @override
  String get uploadSuccess =>
      'Lastet opp. Venter på moderering (admin publiserer med en gang).';

  @override
  String get uploadErrorTitle => 'Tittel er påkrevd.';

  @override
  String get profileSubscription => 'Abonnement';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratis';

  @override
  String get profileUpgrade => 'Oppgrader til Pro';

  @override
  String get profileMyVideos => 'Mine videoer';

  @override
  String get profileMyVideosEmpty => 'Ingen opplastinger ennå.';

  @override
  String get profileSignOut => 'Logg ut';

  @override
  String get paywallSubtitle =>
      'Lås opp 3D-delmarkering, høyere videokvote og reparasjonshistorikk.';

  @override
  String get paywallBenefit3d => 'Interaktiv 3D-feillokalisering';

  @override
  String get paywallBenefitVideo => 'Opptil 30 fellesskapsopplastinger / måned';

  @override
  String get paywallBenefitHistory => 'Ubegrenset diagnosehistorikk';

  @override
  String get paywallDemoUnlock => 'Lås opp Pro (Demo)';

  @override
  String get paywallClose => 'Lukk';

  @override
  String get authPlayNote => 'Google Play-bygg — Firebase Auth kommer neste.';

  @override
  String get uploadPicked => 'Video valgt';

  @override
  String get uploadQuotaFull => 'Kvoten er full — oppgrader til Pro.';

  @override
  String get uploadNavTitle => 'Last opp video';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play-abonnement) kobles til neste.';

  @override
  String commentsCount(int count) {
    return '$count kommentarer';
  }

  @override
  String uploadsLeft(int count) {
    return '$count opplastinger igjen denne måneden';
  }

  @override
  String get language => 'Språk';
}
