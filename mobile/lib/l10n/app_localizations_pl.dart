// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnostyka';

  @override
  String get tabCommunity => 'Społeczność';

  @override
  String get tabUpload => 'Prześlij';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + kod usterki → część, kroki naprawy i wskazówki 3D od społeczności.';

  @override
  String get authDemo => 'Kontynuuj w trybie demo';

  @override
  String get diagnoseHeadline => 'Znajdź usterkę';

  @override
  String get diagnoseSubtitle =>
      'Wpisz konkretny VIN i kod usterki — diagnoza jest rozwiązywana według marki.';

  @override
  String get diagnoseVin => 'VIN / Podwozie';

  @override
  String get diagnoseDtc => 'Kod usterki (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnostikuj';

  @override
  String get diagnoseSamples => 'Wypróbuj popularny kod';

  @override
  String get legalDisclaimer =>
      'Wyłącznie w celach informacyjnych. Nie zastępuje porady warsztatu. Przestrzegaj procedur bezpieczeństwa.';

  @override
  String get errorDtcInvalid => 'Wpisz prawidłowy kod, np. P0300.';

  @override
  String get errorDtcNotFound => 'Tego kodu usterki nie ma jeszcze w katalogu.';

  @override
  String get resultSteps => 'Kroki naprawy';

  @override
  String get resultVideos => 'Filmy społeczności';

  @override
  String get resultVideosEmpty =>
      'Brak filmów — bądź pierwszą osobą, która prześle.';

  @override
  String get resultView3d => 'Zobacz uszkodzoną część w 3D';

  @override
  String get scene3dTitle => 'Podświetlona część';

  @override
  String get scene3dHint =>
      'Przeciągnij, aby obrócić. Pomarańczowe oznaczenie wskazuje prawdopodobnie uszkodzony element.';

  @override
  String get scene3dNav => 'Pojazd 3D';

  @override
  String get communityFilter => 'Filtruj według DTC';

  @override
  String get communityComments => 'Komentarze';

  @override
  String get communityCommentPlaceholder => 'Podziel się naprawą…';

  @override
  String get communityCommentSend => 'Wyślij';

  @override
  String get uploadDetails => 'Szczegóły';

  @override
  String get uploadTitle => 'Tytuł';

  @override
  String get uploadSummary => 'Co pomogło?';

  @override
  String get uploadPick => 'Wybierz film';

  @override
  String get uploadSubmit => 'Wyślij do weryfikacji';

  @override
  String get uploadSuccess =>
      'Przesłano. Oczekuje na moderację (admini publikują od razu).';

  @override
  String get uploadErrorTitle => 'Tytuł jest wymagany.';

  @override
  String get profileSubscription => 'Subskrypcja';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Bezpłatny';

  @override
  String get profileUpgrade => 'Ulepsz do Pro';

  @override
  String get profileMyVideos => 'Moje filmy';

  @override
  String get profileMyVideosEmpty => 'Brak przesłań.';

  @override
  String get profileSignOut => 'Wyloguj';

  @override
  String get paywallSubtitle =>
      'Odblokuj podświetlenie części 3D, wyższy limit filmów i historię napraw.';

  @override
  String get paywallBenefit3d => 'Interaktywna lokalizacja usterki w 3D';

  @override
  String get paywallBenefitVideo => 'Do 30 przesłań społeczności / miesiąc';

  @override
  String get paywallBenefitHistory => 'Nieograniczona historia diagnostyki';

  @override
  String get paywallDemoUnlock => 'Odblokuj Pro (Demo)';

  @override
  String get paywallClose => 'Zamknij';

  @override
  String get authPlayNote =>
      'Wersja Google Play — Firebase Auth w kolejnym kroku.';

  @override
  String get uploadPicked => 'Wybrano film';

  @override
  String get uploadQuotaFull => 'Limit wyczerpany — ulepsz do Pro.';

  @override
  String get uploadNavTitle => 'Prześlij film';

  @override
  String get paywallBillingNote =>
      'Play Billing (subskrypcja Google Play) zostanie podłączony w kolejnym kroku.';

  @override
  String commentsCount(int count) {
    return '$count komentarzy';
  }

  @override
  String uploadsLeft(int count) {
    return 'Pozostało $count przesłań w tym miesiącu';
  }

  @override
  String get language => 'Język';
}
