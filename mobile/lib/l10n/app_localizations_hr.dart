// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get tabDiagnose => 'Dijagnostika';

  @override
  String get tabCommunity => 'Zajednica';

  @override
  String get tabUpload => 'Učitaj';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + kod kvara → dio, koraci popravka i 3D vodič zajednice.';

  @override
  String get authDemo => 'Nastavi s demom';

  @override
  String get diagnoseHeadline => 'Pronađi kvar';

  @override
  String get diagnoseSubtitle =>
      'Unesite konkretan VIN i kod kvara — dijagnostika se rješava po marki vozila.';

  @override
  String get diagnoseVin => 'VIN / Šasija';

  @override
  String get diagnoseDtc => 'Kod kvara (DTC)';

  @override
  String get diagnoseSubmit => 'Dijagnosticiraj';

  @override
  String get diagnoseSamples => 'Isprobaj uobičajeni kod';

  @override
  String get legalDisclaimer =>
      'Samo u informativne svrhe. Ne zamjenjuje savjet stručnog servisa. Slijedite sigurnosne postupke.';

  @override
  String get errorDtcInvalid => 'Unesite valjani kod poput P0300.';

  @override
  String get errorDtcNotFound => 'Ovaj kod kvara još nije u katalogu.';

  @override
  String get resultSteps => 'Koraci popravka';

  @override
  String get resultVideos => 'Videozapisi zajednice';

  @override
  String get resultVideosEmpty =>
      'Još nema videozapisa — budi prvi koji učita.';

  @override
  String get resultView3d => 'Pogledaj neispravan dio u 3D';

  @override
  String get scene3dTitle => 'Istaknuti dio';

  @override
  String get scene3dHint =>
      'Povuci za rotaciju. Narančasta oznaka pokazuje vjerojatno neispravan dio.';

  @override
  String get scene3dNav => '3D vozilo';

  @override
  String get communityFilter => 'Filtriraj po DTC';

  @override
  String get communityComments => 'Komentari';

  @override
  String get communityCommentPlaceholder => 'Podijeli svoje rješenje…';

  @override
  String get communityCommentSend => 'Pošalji';

  @override
  String get uploadDetails => 'Detalji';

  @override
  String get uploadTitle => 'Naslov';

  @override
  String get uploadSummary => 'Što ga je popravilo?';

  @override
  String get uploadPick => 'Odaberi videozapis';

  @override
  String get uploadSubmit => 'Pošalji na pregled';

  @override
  String get uploadSuccess =>
      'Učitano. Čeka moderaciju (admini objavljuju odmah).';

  @override
  String get uploadErrorTitle => 'Naslov je obavezan.';

  @override
  String get profileSubscription => 'Pretplata';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Besplatno';

  @override
  String get profileUpgrade => 'Nadogradi na Pro';

  @override
  String get profileMyVideos => 'Moji videozapisi';

  @override
  String get profileMyVideosEmpty => 'Još nema učitavanja.';

  @override
  String get profileSignOut => 'Odjava';

  @override
  String get paywallSubtitle =>
      'Otključaj 3D isticanje dijela, veću video kvotu i povijest popravaka.';

  @override
  String get paywallBenefit3d => 'Interaktivna 3D lokalizacija kvara';

  @override
  String get paywallBenefitVideo => 'Do 30 učitavanja u zajednicu / mjesec';

  @override
  String get paywallBenefitHistory => 'Neograničena povijest dijagnostike';

  @override
  String get paywallDemoUnlock => 'Otključaj Pro (Demo)';

  @override
  String get paywallClose => 'Zatvori';

  @override
  String get authPlayNote => 'Google Play verzija — sljedeće je Firebase Auth.';

  @override
  String get uploadPicked => 'Videozapis odabran';

  @override
  String get uploadQuotaFull => 'Kvota je puna — nadogradi na Pro.';

  @override
  String get uploadNavTitle => 'Učitaj videozapis';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play pretplata) bit će povezan sljedeće.';

  @override
  String commentsCount(int count) {
    return '$count komentara';
  }

  @override
  String uploadsLeft(int count) {
    return 'Preostalo $count učitavanja ovog mjeseca';
  }

  @override
  String get language => 'Jezik';
}
