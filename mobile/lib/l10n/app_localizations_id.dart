// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnosis';

  @override
  String get tabCommunity => 'Komunitas';

  @override
  String get tabUpload => 'Unggah';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'VIN + kode kesalahan → suku cadang, langkah perbaikan, dan panduan 3D dari komunitas.';

  @override
  String get authDemo => 'Lanjutkan dengan Demo';

  @override
  String get diagnoseHeadline => 'Temukan kesalahan';

  @override
  String get diagnoseSubtitle =>
      'Masukkan VIN dan kode kesalahan spesifik — diagnosis diselesaikan per merek kendaraan.';

  @override
  String get diagnoseVin => 'VIN / Sasis';

  @override
  String get diagnoseDtc => 'Kode kesalahan (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosa';

  @override
  String get diagnoseSamples => 'Coba kode umum';

  @override
  String get legalDisclaimer =>
      'Hanya untuk informasi. Bukan pengganti saran bengkel profesional. Ikuti prosedur keselamatan.';

  @override
  String get errorDtcInvalid => 'Masukkan kode valid seperti P0300.';

  @override
  String get errorDtcNotFound => 'Kode kesalahan ini belum ada di katalog.';

  @override
  String get resultSteps => 'Langkah perbaikan';

  @override
  String get resultVideos => 'Video komunitas';

  @override
  String get resultVideosEmpty =>
      'Belum ada video — jadilah yang pertama mengunggah.';

  @override
  String get resultView3d => 'Lihat suku cadang bermasalah dalam 3D';

  @override
  String get scene3dTitle => 'Suku cadang yang disorot';

  @override
  String get scene3dHint =>
      'Seret untuk memutar. Tanda oranye menunjukkan komponen yang kemungkinan bermasalah.';

  @override
  String get scene3dNav => 'Kendaraan 3D';

  @override
  String get communityFilter => 'Filter menurut DTC';

  @override
  String get communityComments => 'Komentar';

  @override
  String get communityCommentPlaceholder => 'Bagikan perbaikan Anda…';

  @override
  String get communityCommentSend => 'Kirim';

  @override
  String get uploadDetails => 'Detail';

  @override
  String get uploadTitle => 'Judul';

  @override
  String get uploadSummary => 'Apa yang memperbaikinya?';

  @override
  String get uploadPick => 'Pilih video';

  @override
  String get uploadSubmit => 'Kirim untuk ditinjau';

  @override
  String get uploadSuccess =>
      'Diunggah. Menunggu moderasi (admin langsung memublikasikan).';

  @override
  String get uploadErrorTitle => 'Judul wajib diisi.';

  @override
  String get profileSubscription => 'Langganan';

  @override
  String get profilePlan => 'Paket';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratis';

  @override
  String get profileUpgrade => 'Upgrade ke Pro';

  @override
  String get profileMyVideos => 'Video saya';

  @override
  String get profileMyVideosEmpty => 'Belum ada unggahan.';

  @override
  String get profileSignOut => 'Keluar';

  @override
  String get paywallSubtitle =>
      'Buka sorotan suku cadang 3D, kuota video lebih tinggi, dan riwayat perbaikan.';

  @override
  String get paywallBenefit3d => 'Lokalisasi kesalahan 3D interaktif';

  @override
  String get paywallBenefitVideo => 'Hingga 30 unggahan komunitas / bulan';

  @override
  String get paywallBenefitHistory => 'Riwayat diagnosis tanpa batas';

  @override
  String get paywallDemoUnlock => 'Buka Pro (Demo)';

  @override
  String get paywallClose => 'Tutup';

  @override
  String get authPlayNote => 'Build Google Play — Firebase Auth menyusul.';

  @override
  String get uploadPicked => 'Video dipilih';

  @override
  String get uploadQuotaFull => 'Kuota habis — upgrade ke Pro.';

  @override
  String get uploadNavTitle => 'Unggah video';

  @override
  String get paywallBillingNote =>
      'Play Billing (langganan Google Play) akan dihubungkan berikutnya.';

  @override
  String commentsCount(int count) {
    return '$count komentar';
  }

  @override
  String uploadsLeft(int count) {
    return '$count unggahan tersisa bulan ini';
  }

  @override
  String get language => 'Bahasa';
}
