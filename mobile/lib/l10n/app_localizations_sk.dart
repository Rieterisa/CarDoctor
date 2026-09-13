// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnostika';

  @override
  String get tabCommunity => 'Komunita';

  @override
  String get tabUpload => 'Nahrať';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + chybový kód → diel, kroky opravy a 3D návod od komunity.';

  @override
  String get authDemo => 'Pokračovať v deme';

  @override
  String get diagnoseHeadline => 'Nájdite poruchu';

  @override
  String get diagnoseSubtitle =>
      'Zadajte konkrétne VIN a chybový kód — diagnostika sa rieši podľa značky vozidla.';

  @override
  String get diagnoseVin => 'VIN / Podvozok';

  @override
  String get diagnoseDtc => 'Chybový kód (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnostikovať';

  @override
  String get diagnoseSamples => 'Vyskúšajte bežný kód';

  @override
  String get legalDisclaimer =>
      'Len na informáciu. Nenahrádza odborný servis. Dodržiavajte bezpečnostné postupy.';

  @override
  String get errorDtcInvalid => 'Zadajte platný kód, napr. P0300.';

  @override
  String get errorDtcNotFound => 'Tento chybový kód zatiaľ nie je v katalógu.';

  @override
  String get resultSteps => 'Kroky opravy';

  @override
  String get resultVideos => 'Videá komunity';

  @override
  String get resultVideosEmpty =>
      'Zatiaľ žiadne videá — buďte prvý, kto nahrá.';

  @override
  String get resultView3d => 'Zobraziť chybný diel v 3D';

  @override
  String get scene3dTitle => 'Zvýraznený diel';

  @override
  String get scene3dHint =>
      'Potiahnutím otočíte. Oranžová značka ukazuje pravdepodobne chybný diel.';

  @override
  String get scene3dNav => '3D vozidlo';

  @override
  String get communityFilter => 'Filtrovať podľa DTC';

  @override
  String get communityComments => 'Komentáre';

  @override
  String get communityCommentPlaceholder => 'Zdieľajte svoju opravu…';

  @override
  String get communityCommentSend => 'Odoslať';

  @override
  String get uploadDetails => 'Podrobnosti';

  @override
  String get uploadTitle => 'Názov';

  @override
  String get uploadSummary => 'Čo to opravilo?';

  @override
  String get uploadPick => 'Vyberte video';

  @override
  String get uploadSubmit => 'Odoslať na kontrolu';

  @override
  String get uploadSuccess =>
      'Nahrané. Čaká na moderáciu (admini publikujú ihneď).';

  @override
  String get uploadErrorTitle => 'Názov je povinný.';

  @override
  String get profileSubscription => 'Predplatné';

  @override
  String get profilePlan => 'Tarif';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Zadarmo';

  @override
  String get profileUpgrade => 'Prejsť na Pro';

  @override
  String get profileMyVideos => 'Moje videá';

  @override
  String get profileMyVideosEmpty => 'Zatiaľ žiadne nahratia.';

  @override
  String get profileSignOut => 'Odhlásiť sa';

  @override
  String get paywallSubtitle =>
      'Odomknite zvýraznenie dielu v 3D, vyššiu kvótu videí a históriu opráv.';

  @override
  String get paywallBenefit3d => 'Interaktívna lokalizácia poruchy v 3D';

  @override
  String get paywallBenefitVideo => 'Až 30 nahraní do komunity / mesiac';

  @override
  String get paywallBenefitHistory => 'Neobmedzená história diagnostiky';

  @override
  String get paywallDemoUnlock => 'Odomknúť Pro (Demo)';

  @override
  String get paywallClose => 'Zavrieť';

  @override
  String get authPlayNote => 'Zostavenie Google Play — ďalej Firebase Auth.';

  @override
  String get uploadPicked => 'Video vybrané';

  @override
  String get uploadQuotaFull => 'Kvóta je vyčerpaná — prejdite na Pro.';

  @override
  String get uploadNavTitle => 'Nahrať video';

  @override
  String get paywallBillingNote =>
      'Play Billing (predplatné Google Play) sa pripojí ďalej.';

  @override
  String commentsCount(int count) {
    return '$count komentárov';
  }

  @override
  String uploadsLeft(int count) {
    return 'Tento mesiac zostáva $count nahraní';
  }

  @override
  String get language => 'Jazyk';
}
