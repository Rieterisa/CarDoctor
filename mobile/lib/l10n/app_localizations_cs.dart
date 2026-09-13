// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnostika';

  @override
  String get tabCommunity => 'Komunita';

  @override
  String get tabUpload => 'Nahrát';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + chybový kód → díl, kroky opravy a 3D návod od komunity.';

  @override
  String get authDemo => 'Pokračovat v demu';

  @override
  String get diagnoseHeadline => 'Najděte závadu';

  @override
  String get diagnoseSubtitle =>
      'Zadejte konkrétní VIN a chybový kód — diagnostika se řeší podle značky vozidla.';

  @override
  String get diagnoseVin => 'VIN / Podvozek';

  @override
  String get diagnoseDtc => 'Chybový kód (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnostikovat';

  @override
  String get diagnoseSamples => 'Vyzkoušejte běžný kód';

  @override
  String get legalDisclaimer =>
      'Pouze pro informaci. Nenahrazuje odborný servis. Dodržujte bezpečnostní postupy.';

  @override
  String get errorDtcInvalid => 'Zadejte platný kód, např. P0300.';

  @override
  String get errorDtcNotFound => 'Tento chybový kód zatím není v katalogu.';

  @override
  String get resultSteps => 'Kroky opravy';

  @override
  String get resultVideos => 'Videa komunity';

  @override
  String get resultVideosEmpty =>
      'Zatím žádná videa — buďte první, kdo nahraje.';

  @override
  String get resultView3d => 'Zobrazit vadný díl ve 3D';

  @override
  String get scene3dTitle => 'Zvýrazněný díl';

  @override
  String get scene3dHint =>
      'Přetažením otočíte. Oranžová značka ukazuje pravděpodobně vadný díl.';

  @override
  String get scene3dNav => '3D vozidlo';

  @override
  String get communityFilter => 'Filtrovat podle DTC';

  @override
  String get communityComments => 'Komentáře';

  @override
  String get communityCommentPlaceholder => 'Sdílejte svou opravu…';

  @override
  String get communityCommentSend => 'Odeslat';

  @override
  String get uploadDetails => 'Podrobnosti';

  @override
  String get uploadTitle => 'Název';

  @override
  String get uploadSummary => 'Co to opravilo?';

  @override
  String get uploadPick => 'Vyberte video';

  @override
  String get uploadSubmit => 'Odeslat ke kontrole';

  @override
  String get uploadSuccess =>
      'Nahráno. Čeká na moderaci (admini publikují ihned).';

  @override
  String get uploadErrorTitle => 'Název je povinný.';

  @override
  String get profileSubscription => 'Předplatné';

  @override
  String get profilePlan => 'Tarif';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Zdarma';

  @override
  String get profileUpgrade => 'Přejít na Pro';

  @override
  String get profileMyVideos => 'Moje videa';

  @override
  String get profileMyVideosEmpty => 'Zatím žádná nahrání.';

  @override
  String get profileSignOut => 'Odhlásit se';

  @override
  String get paywallSubtitle =>
      'Odemkněte zvýraznění dílu ve 3D, vyšší kvótu videí a historii oprav.';

  @override
  String get paywallBenefit3d => 'Interaktivní lokalizace závady ve 3D';

  @override
  String get paywallBenefitVideo => 'Až 30 nahrání do komunity / měsíc';

  @override
  String get paywallBenefitHistory => 'Neomezená historie diagnostiky';

  @override
  String get paywallDemoUnlock => 'Odemknout Pro (Demo)';

  @override
  String get paywallClose => 'Zavřít';

  @override
  String get authPlayNote => 'Sestavení Google Play — dále Firebase Auth.';

  @override
  String get uploadPicked => 'Video vybráno';

  @override
  String get uploadQuotaFull => 'Kvóta vyčerpána — přejděte na Pro.';

  @override
  String get uploadNavTitle => 'Nahrát video';

  @override
  String get paywallBillingNote =>
      'Play Billing (předplatné Google Play) bude připojeno dále.';

  @override
  String commentsCount(int count) {
    return '$count komentářů';
  }

  @override
  String uploadsLeft(int count) {
    return 'Tento měsíc zbývá $count nahrání';
  }

  @override
  String get language => 'Jazyk';
}
