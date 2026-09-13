// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnostic';

  @override
  String get tabCommunity => 'Comunitate';

  @override
  String get tabUpload => 'Încarcă';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + cod de eroare → piesă, pași de reparație și ghid 3D din comunitate.';

  @override
  String get authDemo => 'Continuă cu Demo';

  @override
  String get diagnoseHeadline => 'Găsește defectul';

  @override
  String get diagnoseSubtitle =>
      'Introdu un VIN și un cod de eroare specifice — diagnosticul se rezolvă pe marcă.';

  @override
  String get diagnoseVin => 'VIN / Șasiu';

  @override
  String get diagnoseDtc => 'Cod de eroare (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnozează';

  @override
  String get diagnoseSamples => 'Încearcă un cod comun';

  @override
  String get legalDisclaimer =>
      'Doar în scop informativ. Nu înlocuiește sfatul unui service profesionist. Respectați procedurile de siguranță.';

  @override
  String get errorDtcInvalid => 'Introdu un cod valid precum P0300.';

  @override
  String get errorDtcNotFound => 'Acest cod de eroare nu este încă în catalog.';

  @override
  String get resultSteps => 'Pași de reparație';

  @override
  String get resultVideos => 'Videoclipuri din comunitate';

  @override
  String get resultVideosEmpty =>
      'Încă nu există videoclipuri — fii primul care încarcă.';

  @override
  String get resultView3d => 'Vezi piesa defectă în 3D';

  @override
  String get scene3dTitle => 'Piesă evidențiată';

  @override
  String get scene3dHint =>
      'Trage pentru a roti. Marcajul portocaliu arată componenta probabil defectă.';

  @override
  String get scene3dNav => 'Vehicul 3D';

  @override
  String get communityFilter => 'Filtrează după DTC';

  @override
  String get communityComments => 'Comentarii';

  @override
  String get communityCommentPlaceholder => 'Împărtășește reparația ta…';

  @override
  String get communityCommentSend => 'Trimite';

  @override
  String get uploadDetails => 'Detalii';

  @override
  String get uploadTitle => 'Titlu';

  @override
  String get uploadSummary => 'Ce a rezolvat?';

  @override
  String get uploadPick => 'Alege un videoclip';

  @override
  String get uploadSubmit => 'Trimite pentru verificare';

  @override
  String get uploadSuccess =>
      'Încărcat. Așteaptă moderare (adminii publică imediat).';

  @override
  String get uploadErrorTitle => 'Titlul este obligatoriu.';

  @override
  String get profileSubscription => 'Abonament';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratuit';

  @override
  String get profileUpgrade => 'Treci la Pro';

  @override
  String get profileMyVideos => 'Videoclipurile mele';

  @override
  String get profileMyVideosEmpty => 'Nicio încărcare încă.';

  @override
  String get profileSignOut => 'Deconectare';

  @override
  String get paywallSubtitle =>
      'Deblochează evidențierea 3D a pieselor, cotă video mai mare și istoricul reparațiilor.';

  @override
  String get paywallBenefit3d => 'Localizare interactivă a defectelor în 3D';

  @override
  String get paywallBenefitVideo =>
      'Până la 30 de încărcări în comunitate / lună';

  @override
  String get paywallBenefitHistory => 'Istoric de diagnostic nelimitat';

  @override
  String get paywallDemoUnlock => 'Deblochează Pro (Demo)';

  @override
  String get paywallClose => 'Închide';

  @override
  String get authPlayNote => 'Build Google Play — Firebase Auth urmează.';

  @override
  String get uploadPicked => 'Videoclip selectat';

  @override
  String get uploadQuotaFull => 'Cota e plină — treci la Pro.';

  @override
  String get uploadNavTitle => 'Încarcă videoclip';

  @override
  String get paywallBillingNote =>
      'Play Billing (abonament Google Play) va fi conectat ulterior.';

  @override
  String commentsCount(int count) {
    return '$count comentarii';
  }

  @override
  String uploadsLeft(int count) {
    return '$count încărcări rămase luna aceasta';
  }

  @override
  String get language => 'Limbă';
}
