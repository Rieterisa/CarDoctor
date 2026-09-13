// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnoosi';

  @override
  String get tabCommunity => 'Yhteisö';

  @override
  String get tabUpload => 'Lataa';

  @override
  String get tabProfile => 'Profiili';

  @override
  String get authTagline =>
      'VIN + vikakoodi → osa, korjausvaiheet ja 3D-opastus yhteisöltä.';

  @override
  String get authDemo => 'Jatka demolla';

  @override
  String get diagnoseHeadline => 'Löydä vika';

  @override
  String get diagnoseSubtitle =>
      'Anna tietty VIN ja vikakoodi — diagnoosi ratkaistaan ajoneuvomerkin mukaan.';

  @override
  String get diagnoseVin => 'VIN / Runko';

  @override
  String get diagnoseDtc => 'Vikakoodi (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosoi';

  @override
  String get diagnoseSamples => 'Kokeile yleistä koodia';

  @override
  String get legalDisclaimer =>
      'Vain tiedoksi. Ei korvaa ammattilaisen neuvoa. Noudata turvallisuusohjeita.';

  @override
  String get errorDtcInvalid => 'Anna kelvollinen koodi, esim. P0300.';

  @override
  String get errorDtcNotFound => 'Tätä vikakoodia ei ole vielä luettelossa.';

  @override
  String get resultSteps => 'Korjausvaiheet';

  @override
  String get resultVideos => 'Yhteisön videot';

  @override
  String get resultVideosEmpty =>
      'Ei vielä videoita — ole ensimmäinen lataaja.';

  @override
  String get resultView3d => 'Näytä viallinen osa 3D:nä';

  @override
  String get scene3dTitle => 'Korostettu osa';

  @override
  String get scene3dHint =>
      'Vedä kiertääksesi. Oranssi merkintä näyttää todennäköisesti viallisen osan.';

  @override
  String get scene3dNav => '3D-ajoneuvo';

  @override
  String get communityFilter => 'Suodata DTC:n mukaan';

  @override
  String get communityComments => 'Kommentit';

  @override
  String get communityCommentPlaceholder => 'Jaa korjauksesi…';

  @override
  String get communityCommentSend => 'Lähetä';

  @override
  String get uploadDetails => 'Tiedot';

  @override
  String get uploadTitle => 'Otsikko';

  @override
  String get uploadSummary => 'Mikä korjasi sen?';

  @override
  String get uploadPick => 'Valitse video';

  @override
  String get uploadSubmit => 'Lähetä tarkistettavaksi';

  @override
  String get uploadSuccess =>
      'Ladattu. Odottaa moderointia (ylläpitäjät julkaisevat heti).';

  @override
  String get uploadErrorTitle => 'Otsikko on pakollinen.';

  @override
  String get profileSubscription => 'Tilaus';

  @override
  String get profilePlan => 'Paketti';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Ilmainen';

  @override
  String get profileUpgrade => 'Päivitä Prohon';

  @override
  String get profileMyVideos => 'Omat videot';

  @override
  String get profileMyVideosEmpty => 'Ei vielä latauksia.';

  @override
  String get profileSignOut => 'Kirjaudu ulos';

  @override
  String get paywallSubtitle =>
      'Avaa 3D-osakorostus, suurempi videokiintiö ja korjaushistoria.';

  @override
  String get paywallBenefit3d => 'Interaktiivinen 3D-vian paikannus';

  @override
  String get paywallBenefitVideo => 'Enintään 30 yhteisölatausta / kk';

  @override
  String get paywallBenefitHistory => 'Rajoittamaton diagnoosihistoria';

  @override
  String get paywallDemoUnlock => 'Avaa Pro (Demo)';

  @override
  String get paywallClose => 'Sulje';

  @override
  String get authPlayNote =>
      'Google Play -koontiversio — seuraavaksi Firebase Auth.';

  @override
  String get uploadPicked => 'Video valittu';

  @override
  String get uploadQuotaFull => 'Kiintiö täynnä — päivitä Prohon.';

  @override
  String get uploadNavTitle => 'Lataa video';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play -tilaus) yhdistetään seuraavaksi.';

  @override
  String commentsCount(int count) {
    return '$count kommenttia';
  }

  @override
  String uploadsLeft(int count) {
    return '$count latausta jäljellä tässä kuussa';
  }

  @override
  String get language => 'Kieli';
}
