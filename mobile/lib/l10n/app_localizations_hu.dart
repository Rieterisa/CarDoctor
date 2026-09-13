// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnózis';

  @override
  String get tabCommunity => 'Közösség';

  @override
  String get tabUpload => 'Feltöltés';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'Alvázszám + hibakód → alkatrész, javítási lépések és 3D útmutató a közösségtől.';

  @override
  String get authDemo => 'Folytatás demóval';

  @override
  String get diagnoseHeadline => 'Hibakeresés';

  @override
  String get diagnoseSubtitle =>
      'Adjon meg egy konkrét alvázszámot és hibakódot — a diagnózis márkánként történik.';

  @override
  String get diagnoseVin => 'Alvázszám / VIN';

  @override
  String get diagnoseDtc => 'Hibakód (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosztizálás';

  @override
  String get diagnoseSamples => 'Próbáljon egy gyakori kódot';

  @override
  String get legalDisclaimer =>
      'Csak tájékoztató jellegű. Nem helyettesíti a szakszerviz tanácsát. Tartsa be a biztonsági előírásokat.';

  @override
  String get errorDtcInvalid => 'Adjon meg érvényes kódot, pl. P0300.';

  @override
  String get errorDtcNotFound => 'Ez a hibakód még nincs a katalógusban.';

  @override
  String get resultSteps => 'Javítási lépések';

  @override
  String get resultVideos => 'Közösségi videók';

  @override
  String get resultVideosEmpty =>
      'Még nincsenek videók — legyen Ön az első feltöltő.';

  @override
  String get resultView3d => 'Hibás alkatrész megtekintése 3D-ben';

  @override
  String get scene3dTitle => 'Kiemelt alkatrész';

  @override
  String get scene3dHint =>
      'Húzza a forgatáshoz. A narancssárga jel a valószínűleg hibás alkatrészt mutatja.';

  @override
  String get scene3dNav => '3D jármű';

  @override
  String get communityFilter => 'Szűrés DTC szerint';

  @override
  String get communityComments => 'Hozzászólások';

  @override
  String get communityCommentPlaceholder => 'Ossza meg a javítását…';

  @override
  String get communityCommentSend => 'Küldés';

  @override
  String get uploadDetails => 'Részletek';

  @override
  String get uploadTitle => 'Cím';

  @override
  String get uploadSummary => 'Mi javította meg?';

  @override
  String get uploadPick => 'Válasszon videót';

  @override
  String get uploadSubmit => 'Beküldés ellenőrzésre';

  @override
  String get uploadSuccess =>
      'Feltöltve. Moderálásra vár (az adminok azonnal közzéteszik).';

  @override
  String get uploadErrorTitle => 'A cím kötelező.';

  @override
  String get profileSubscription => 'Előfizetés';

  @override
  String get profilePlan => 'Csomag';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Ingyenes';

  @override
  String get profileUpgrade => 'Váltás Pro-ra';

  @override
  String get profileMyVideos => 'Saját videóim';

  @override
  String get profileMyVideosEmpty => 'Még nincsenek feltöltések.';

  @override
  String get profileSignOut => 'Kijelentkezés';

  @override
  String get paywallSubtitle =>
      'Oldja fel a 3D alkatrész-kiemelést, a magasabb videókvótát és a javítási előzményeket.';

  @override
  String get paywallBenefit3d => 'Interaktív 3D hibameghatározás';

  @override
  String get paywallBenefitVideo => 'Havonta akár 30 közösségi feltöltés';

  @override
  String get paywallBenefitHistory => 'Korlátlan diagnóziselőzmény';

  @override
  String get paywallDemoUnlock => 'Pro feloldása (Demó)';

  @override
  String get paywallClose => 'Bezárás';

  @override
  String get authPlayNote => 'Google Play build — következő a Firebase Auth.';

  @override
  String get uploadPicked => 'Videó kiválasztva';

  @override
  String get uploadQuotaFull => 'A kvóta betelt — váltson Pro-ra.';

  @override
  String get uploadNavTitle => 'Videó feltöltése';

  @override
  String get paywallBillingNote =>
      'A Play Billing (Google Play előfizetés) a következő lépésben csatlakozik.';

  @override
  String commentsCount(int count) {
    return '$count hozzászólás';
  }

  @override
  String uploadsLeft(int count) {
    return 'Ebben a hónapban $count feltöltés van hátra';
  }

  @override
  String get language => 'Nyelv';
}
