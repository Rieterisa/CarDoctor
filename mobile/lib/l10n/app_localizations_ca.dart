// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnosticar';

  @override
  String get tabCommunity => 'Comunitat';

  @override
  String get tabUpload => 'Puja';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get authTagline =>
      'VIN + codi d’avaria → peça, passos de reparació i guia 3D de la comunitat.';

  @override
  String get authDemo => 'Continua amb la demostració';

  @override
  String get diagnoseHeadline => 'Troba l’avaria';

  @override
  String get diagnoseSubtitle =>
      'Introdueix un VIN i un codi d’avaria concrets — el diagnòstic es resol per marca.';

  @override
  String get diagnoseVin => 'VIN / Xassís';

  @override
  String get diagnoseDtc => 'Codi d’avaria (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosticar';

  @override
  String get diagnoseSamples => 'Prova un codi habitual';

  @override
  String get legalDisclaimer =>
      'Només amb finalitats informatives. No substitueix el consell professional. Seguiu els procediments de seguretat.';

  @override
  String get errorDtcInvalid => 'Introdueix un codi vàlid com P0300.';

  @override
  String get errorDtcNotFound =>
      'Aquest codi d’avaria encara no és al catàleg.';

  @override
  String get resultSteps => 'Passos de reparació';

  @override
  String get resultVideos => 'Vídeos de la comunitat';

  @override
  String get resultVideosEmpty =>
      'Encara no hi ha vídeos — sigues el primer a pujar-ne un.';

  @override
  String get resultView3d => 'Mostra la peça defectuosa en 3D';

  @override
  String get scene3dTitle => 'Peça destacada';

  @override
  String get scene3dHint =>
      'Arrossega per girar. La marca taronja mostra el component probablement defectuós.';

  @override
  String get scene3dNav => 'Vehicle 3D';

  @override
  String get communityFilter => 'Filtra per DTC';

  @override
  String get communityComments => 'Comentaris';

  @override
  String get communityCommentPlaceholder => 'Comparteix la teva solució…';

  @override
  String get communityCommentSend => 'Envia';

  @override
  String get uploadDetails => 'Detalls';

  @override
  String get uploadTitle => 'Títol';

  @override
  String get uploadSummary => 'Què ho ha solucionat?';

  @override
  String get uploadPick => 'Tria un vídeo';

  @override
  String get uploadSubmit => 'Envia per a revisió';

  @override
  String get uploadSuccess =>
      'Pujat. Pendent de moderació (els admins publiquen a l’instant).';

  @override
  String get uploadErrorTitle => 'El títol és obligatori.';

  @override
  String get profileSubscription => 'Subscripció';

  @override
  String get profilePlan => 'Pla';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratuït';

  @override
  String get profileUpgrade => 'Actualitza a Pro';

  @override
  String get profileMyVideos => 'Els meus vídeos';

  @override
  String get profileMyVideosEmpty => 'Encara no hi ha pujades.';

  @override
  String get profileSignOut => 'Tanca la sessió';

  @override
  String get paywallSubtitle =>
      'Desbloqueja el ressaltat 3D de peces, més quota de vídeo i l’historial de reparacions.';

  @override
  String get paywallBenefit3d => 'Localització interactiva d’avaries en 3D';

  @override
  String get paywallBenefitVideo => 'Fins a 30 pujades a la comunitat / mes';

  @override
  String get paywallBenefitHistory => 'Historial de diagnòstics il·limitat';

  @override
  String get paywallDemoUnlock => 'Desbloqueja Pro (Demostració)';

  @override
  String get paywallClose => 'Tanca';

  @override
  String get authPlayNote =>
      'Versió de Google Play — el següent pas és Firebase Auth.';

  @override
  String get uploadPicked => 'Vídeo seleccionat';

  @override
  String get uploadQuotaFull => 'Quota plena — actualitza a Pro.';

  @override
  String get uploadNavTitle => 'Puja un vídeo';

  @override
  String get paywallBillingNote =>
      'Play Billing (subscripció de Google Play) es connectarà a continuació.';

  @override
  String commentsCount(int count) {
    return '$count comentaris';
  }

  @override
  String uploadsLeft(int count) {
    return 'Et queden $count pujades aquest mes';
  }

  @override
  String get language => 'Idioma';
}
