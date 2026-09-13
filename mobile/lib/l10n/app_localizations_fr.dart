// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnostiquer';

  @override
  String get tabCommunity => 'Communauté';

  @override
  String get tabUpload => 'Importer';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + code défaut → pièce, étapes de réparation et guide 3D de la communauté.';

  @override
  String get authDemo => 'Continuer en démo';

  @override
  String get diagnoseHeadline => 'Trouver le défaut';

  @override
  String get diagnoseSubtitle =>
      'Saisissez un VIN et un code défaut précis — le diagnostic est résolu par marque.';

  @override
  String get diagnoseVin => 'VIN / Châssis';

  @override
  String get diagnoseDtc => 'Code défaut (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnostiquer';

  @override
  String get diagnoseSamples => 'Essayer un code courant';

  @override
  String get legalDisclaimer =>
      'À titre informatif uniquement. Ne remplace pas un avis professionnel. Respectez les consignes de sécurité.';

  @override
  String get errorDtcInvalid => 'Saisissez un code valide comme P0300.';

  @override
  String get errorDtcNotFound =>
      'Ce code défaut n’est pas encore dans le catalogue.';

  @override
  String get resultSteps => 'Étapes de réparation';

  @override
  String get resultVideos => 'Vidéos de la communauté';

  @override
  String get resultVideosEmpty =>
      'Pas encore de vidéos — soyez le premier à en importer.';

  @override
  String get resultView3d => 'Voir la pièce défectueuse en 3D';

  @override
  String get scene3dTitle => 'Pièce mise en évidence';

  @override
  String get scene3dHint =>
      'Faites glisser pour faire pivoter. Le repère orange indique le composant probablement défectueux.';

  @override
  String get scene3dNav => 'Véhicule 3D';

  @override
  String get communityFilter => 'Filtrer par DTC';

  @override
  String get communityComments => 'Commentaires';

  @override
  String get communityCommentPlaceholder => 'Partagez votre solution…';

  @override
  String get communityCommentSend => 'Envoyer';

  @override
  String get uploadDetails => 'Détails';

  @override
  String get uploadTitle => 'Titre';

  @override
  String get uploadSummary => 'Qu’est-ce qui a résolu le problème ?';

  @override
  String get uploadPick => 'Choisir une vidéo';

  @override
  String get uploadSubmit => 'Soumettre pour examen';

  @override
  String get uploadSuccess =>
      'Importé. En attente de modération (les admins publient immédiatement).';

  @override
  String get uploadErrorTitle => 'Le titre est obligatoire.';

  @override
  String get profileSubscription => 'Abonnement';

  @override
  String get profilePlan => 'Offre';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratuit';

  @override
  String get profileUpgrade => 'Passer à Pro';

  @override
  String get profileMyVideos => 'Mes vidéos';

  @override
  String get profileMyVideosEmpty => 'Aucun import pour le moment.';

  @override
  String get profileSignOut => 'Se déconnecter';

  @override
  String get paywallSubtitle =>
      'Débloquez la mise en évidence 3D, un quota vidéo plus élevé et l’historique des réparations.';

  @override
  String get paywallBenefit3d => 'Localisation interactive des défauts en 3D';

  @override
  String get paywallBenefitVideo => 'Jusqu’à 30 imports communauté / mois';

  @override
  String get paywallBenefitHistory => 'Historique de diagnostics illimité';

  @override
  String get paywallDemoUnlock => 'Débloquer Pro (Démo)';

  @override
  String get paywallClose => 'Fermer';

  @override
  String get authPlayNote =>
      'Version Google Play — Firebase Auth vient ensuite.';

  @override
  String get uploadPicked => 'Vidéo sélectionnée';

  @override
  String get uploadQuotaFull => 'Quota atteint — passez à Pro.';

  @override
  String get uploadNavTitle => 'Importer une vidéo';

  @override
  String get paywallBillingNote =>
      'Play Billing (abonnement Google Play) sera connecté ensuite.';

  @override
  String commentsCount(int count) {
    return '$count commentaires';
  }

  @override
  String uploadsLeft(int count) {
    return '$count imports restants ce mois-ci';
  }

  @override
  String get language => 'Langue';
}
