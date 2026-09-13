// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnosi';

  @override
  String get tabCommunity => 'Community';

  @override
  String get tabUpload => 'Carica';

  @override
  String get tabProfile => 'Profilo';

  @override
  String get authTagline =>
      'VIN + codice guasto → pezzo, passaggi di riparazione e guida 3D dalla community.';

  @override
  String get authDemo => 'Continua con Demo';

  @override
  String get diagnoseHeadline => 'Trova il guasto';

  @override
  String get diagnoseSubtitle =>
      'Inserisci un VIN e un codice guasto specifici — la diagnosi è per marca del veicolo.';

  @override
  String get diagnoseVin => 'VIN / Telaio';

  @override
  String get diagnoseDtc => 'Codice guasto (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnostica';

  @override
  String get diagnoseSamples => 'Prova un codice comune';

  @override
  String get legalDisclaimer =>
      'Solo a scopo informativo. Non sostituisce il consiglio di un’officina. Seguire le procedure di sicurezza.';

  @override
  String get errorDtcInvalid => 'Inserisci un codice valido come P0300.';

  @override
  String get errorDtcNotFound =>
      'Questo codice guasto non è ancora nel catalogo.';

  @override
  String get resultSteps => 'Passaggi di riparazione';

  @override
  String get resultVideos => 'Video della community';

  @override
  String get resultVideosEmpty =>
      'Nessun video ancora — sii il primo a caricarne uno.';

  @override
  String get resultView3d => 'Visualizza il pezzo difettoso in 3D';

  @override
  String get scene3dTitle => 'Pezzo evidenziato';

  @override
  String get scene3dHint =>
      'Trascina per ruotare. Il segno arancione indica il componente probabilmente difettoso.';

  @override
  String get scene3dNav => 'Veicolo 3D';

  @override
  String get communityFilter => 'Filtra per DTC';

  @override
  String get communityComments => 'Commenti';

  @override
  String get communityCommentPlaceholder => 'Condividi la tua soluzione…';

  @override
  String get communityCommentSend => 'Invia';

  @override
  String get uploadDetails => 'Dettagli';

  @override
  String get uploadTitle => 'Titolo';

  @override
  String get uploadSummary => 'Cosa l’ha risolto?';

  @override
  String get uploadPick => 'Scegli un video';

  @override
  String get uploadSubmit => 'Invia per revisione';

  @override
  String get uploadSuccess =>
      'Caricato. In attesa di moderazione (gli admin pubblicano subito).';

  @override
  String get uploadErrorTitle => 'Il titolo è obbligatorio.';

  @override
  String get profileSubscription => 'Abbonamento';

  @override
  String get profilePlan => 'Piano';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratis';

  @override
  String get profileUpgrade => 'Passa a Pro';

  @override
  String get profileMyVideos => 'I miei video';

  @override
  String get profileMyVideosEmpty => 'Nessun caricamento ancora.';

  @override
  String get profileSignOut => 'Esci';

  @override
  String get paywallSubtitle =>
      'Sblocca evidenziazione 3D, quota video maggiore e cronologia riparazioni.';

  @override
  String get paywallBenefit3d => 'Localizzazione interattiva dei guasti in 3D';

  @override
  String get paywallBenefitVideo => 'Fino a 30 caricamenti community / mese';

  @override
  String get paywallBenefitHistory => 'Cronologia diagnosi illimitata';

  @override
  String get paywallDemoUnlock => 'Sblocca Pro (Demo)';

  @override
  String get paywallClose => 'Chiudi';

  @override
  String get authPlayNote => 'Build Google Play — Firebase Auth arriverà dopo.';

  @override
  String get uploadPicked => 'Video selezionato';

  @override
  String get uploadQuotaFull => 'Quota esaurita — passa a Pro.';

  @override
  String get uploadNavTitle => 'Carica video';

  @override
  String get paywallBillingNote =>
      'Play Billing (abbonamento Google Play) sarà collegato dopo.';

  @override
  String commentsCount(int count) {
    return '$count commenti';
  }

  @override
  String uploadsLeft(int count) {
    return '$count caricamenti rimasti questo mese';
  }

  @override
  String get language => 'Lingua';
}
