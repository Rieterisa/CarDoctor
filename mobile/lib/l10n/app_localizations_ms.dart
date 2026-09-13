// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnosa';

  @override
  String get tabCommunity => 'Komuniti';

  @override
  String get tabUpload => 'Muat naik';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + kod kerosakan → bahagian, langkah pembaikan dan panduan 3D dari komuniti.';

  @override
  String get authDemo => 'Teruskan dengan Demo';

  @override
  String get diagnoseHeadline => 'Cari kerosakan';

  @override
  String get diagnoseSubtitle =>
      'Masukkan VIN dan kod kerosakan khusus — diagnosis diselesaikan mengikut jenama kenderaan.';

  @override
  String get diagnoseVin => 'VIN / Casis';

  @override
  String get diagnoseDtc => 'Kod kerosakan (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosa';

  @override
  String get diagnoseSamples => 'Cuba kod biasa';

  @override
  String get legalDisclaimer =>
      'Untuk maklumat sahaja. Bukan pengganti nasihat servis profesional. Patuhi prosedur keselamatan.';

  @override
  String get errorDtcInvalid => 'Masukkan kod sah seperti P0300.';

  @override
  String get errorDtcNotFound => 'Kod kerosakan ini belum ada dalam katalog.';

  @override
  String get resultSteps => 'Langkah pembaikan';

  @override
  String get resultVideos => 'Video komuniti';

  @override
  String get resultVideosEmpty =>
      'Belum ada video — jadilah yang pertama memuat naik.';

  @override
  String get resultView3d => 'Lihat bahagian rosak dalam 3D';

  @override
  String get scene3dTitle => 'Bahagian diserlahkan';

  @override
  String get scene3dHint =>
      'Seret untuk putar. Tanda jingga menunjukkan komponen yang mungkin rosak.';

  @override
  String get scene3dNav => 'Kenderaan 3D';

  @override
  String get communityFilter => 'Tapis mengikut DTC';

  @override
  String get communityComments => 'Komen';

  @override
  String get communityCommentPlaceholder => 'Kongsi pembaikan anda…';

  @override
  String get communityCommentSend => 'Hantar';

  @override
  String get uploadDetails => 'Butiran';

  @override
  String get uploadTitle => 'Tajuk';

  @override
  String get uploadSummary => 'Apa yang membaikinya?';

  @override
  String get uploadPick => 'Pilih video';

  @override
  String get uploadSubmit => 'Hantar untuk semakan';

  @override
  String get uploadSuccess =>
      'Dimuat naik. Menunggu penyederhanaan (admin terbitkan serta-merta).';

  @override
  String get uploadErrorTitle => 'Tajuk diperlukan.';

  @override
  String get profileSubscription => 'Langganan';

  @override
  String get profilePlan => 'Pelan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Percuma';

  @override
  String get profileUpgrade => 'Naik taraf ke Pro';

  @override
  String get profileMyVideos => 'Video saya';

  @override
  String get profileMyVideosEmpty => 'Belum ada muat naik.';

  @override
  String get profileSignOut => 'Log keluar';

  @override
  String get paywallSubtitle =>
      'Buka kunci sorotan bahagian 3D, kuota video lebih tinggi dan sejarah pembaikan.';

  @override
  String get paywallBenefit3d => 'Penyetempatan kerosakan 3D interaktif';

  @override
  String get paywallBenefitVideo => 'Sehingga 30 muat naik komuniti / bulan';

  @override
  String get paywallBenefitHistory => 'Sejarah diagnosis tanpa had';

  @override
  String get paywallDemoUnlock => 'Buka kunci Pro (Demo)';

  @override
  String get paywallClose => 'Tutup';

  @override
  String get authPlayNote => 'Binaan Google Play — Firebase Auth menyusul.';

  @override
  String get uploadPicked => 'Video dipilih';

  @override
  String get uploadQuotaFull => 'Kuota penuh — naik taraf ke Pro.';

  @override
  String get uploadNavTitle => 'Muat naik video';

  @override
  String get paywallBillingNote =>
      'Play Billing (langganan Google Play) akan disambungkan seterusnya.';

  @override
  String commentsCount(int count) {
    return '$count komen';
  }

  @override
  String uploadsLeft(int count) {
    return '$count muat naik lagi bulan ini';
  }

  @override
  String get language => 'Bahasa';
}
