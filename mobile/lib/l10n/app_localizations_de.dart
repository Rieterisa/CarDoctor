// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnose';

  @override
  String get tabCommunity => 'Community';

  @override
  String get tabUpload => 'Hochladen';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'FIN + Fehlercode → Teil, Reparaturschritte und 3D‑Hilfe aus der Community.';

  @override
  String get authDemo => 'Mit Demo fortfahren';

  @override
  String get diagnoseHeadline => 'Fehler finden';

  @override
  String get diagnoseSubtitle =>
      'Geben Sie eine konkrete FIN und einen Fehlercode ein — die Diagnose erfolgt markenspezifisch.';

  @override
  String get diagnoseVin => 'FIN / Fahrgestell';

  @override
  String get diagnoseDtc => 'Fehlercode (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnostizieren';

  @override
  String get diagnoseSamples => 'Häufigen Code ausprobieren';

  @override
  String get legalDisclaimer =>
      'Nur zu Informationszwecken. Kein Ersatz für professionellen Werkstattservice. Sicherheitsregeln beachten.';

  @override
  String get errorDtcInvalid => 'Geben Sie einen gültigen Code wie P0300 ein.';

  @override
  String get errorDtcNotFound => 'Dieser Fehlercode ist noch nicht im Katalog.';

  @override
  String get resultSteps => 'Reparaturschritte';

  @override
  String get resultVideos => 'Community-Videos';

  @override
  String get resultVideosEmpty =>
      'Noch keine Videos — laden Sie als Erste:r hoch.';

  @override
  String get resultView3d => 'Defektes Teil in 3D anzeigen';

  @override
  String get scene3dTitle => 'Hervorgehobenes Teil';

  @override
  String get scene3dHint =>
      'Zum Drehen ziehen. Orange Markierung zeigt das vermutlich defekte Bauteil.';

  @override
  String get scene3dNav => '3D-Fahrzeug';

  @override
  String get communityFilter => 'Nach DTC filtern';

  @override
  String get communityComments => 'Kommentare';

  @override
  String get communityCommentPlaceholder => 'Teilen Sie Ihre Lösung…';

  @override
  String get communityCommentSend => 'Senden';

  @override
  String get uploadDetails => 'Details';

  @override
  String get uploadTitle => 'Titel';

  @override
  String get uploadSummary => 'Was hat geholfen?';

  @override
  String get uploadPick => 'Video auswählen';

  @override
  String get uploadSubmit => 'Zur Prüfung senden';

  @override
  String get uploadSuccess =>
      'Hochgeladen. Warte auf Moderation (Admins veröffentlichen sofort).';

  @override
  String get uploadErrorTitle => 'Titel ist erforderlich.';

  @override
  String get profileSubscription => 'Abonnement';

  @override
  String get profilePlan => 'Tarif';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Kostenlos';

  @override
  String get profileUpgrade => 'Auf Pro upgraden';

  @override
  String get profileMyVideos => 'Meine Videos';

  @override
  String get profileMyVideosEmpty => 'Noch keine Uploads.';

  @override
  String get profileSignOut => 'Abmelden';

  @override
  String get paywallSubtitle =>
      'Schalten Sie 3D-Teilmarkierung, höheres Videokontingent und Reparaturverlauf frei.';

  @override
  String get paywallBenefit3d => 'Interaktive 3D-Fehlerlokalisierung';

  @override
  String get paywallBenefitVideo => 'Bis zu 30 Community-Uploads / Monat';

  @override
  String get paywallBenefitHistory => 'Unbegrenzter Diagnoseverlauf';

  @override
  String get paywallDemoUnlock => 'Pro freischalten (Demo)';

  @override
  String get paywallClose => 'Schließen';

  @override
  String get authPlayNote =>
      'Google-Play-Build — Firebase Auth folgt als Nächstes.';

  @override
  String get uploadPicked => 'Video ausgewählt';

  @override
  String get uploadQuotaFull => 'Kontingent voll — auf Pro upgraden.';

  @override
  String get uploadNavTitle => 'Video hochladen';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google-Play-Abo) wird als Nächstes angebunden.';

  @override
  String commentsCount(int count) {
    return '$count Kommentare';
  }

  @override
  String uploadsLeft(int count) {
    return 'Noch $count Uploads diesen Monat';
  }

  @override
  String get language => 'Sprache';
}
