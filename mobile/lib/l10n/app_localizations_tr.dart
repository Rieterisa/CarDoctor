// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get tabDiagnose => 'Teşhis';

  @override
  String get tabCommunity => 'Topluluk';

  @override
  String get tabUpload => 'Yükle';

  @override
  String get tabProfile => 'Profil';

  @override
  String get authTagline =>
      'Şasi + arıza kodu → parça, tamir adımları ve topluluktan 3D rehberlik.';

  @override
  String get authDemo => 'Demo ile devam et';

  @override
  String get diagnoseHeadline => 'Arızayı bul';

  @override
  String get diagnoseSubtitle =>
      'Spesifik VIN ve arıza kodunu gir — teşhis araç markasına göre çözülür.';

  @override
  String get diagnoseVin => 'VIN / Şasi';

  @override
  String get diagnoseDtc => 'Arıza kodu (DTC)';

  @override
  String get diagnoseSubmit => 'Teşhis et';

  @override
  String get diagnoseSamples => 'Yaygın bir kod dene';

  @override
  String get legalDisclaimer =>
      'Yalnızca bilgilendirme amaçlıdır. Profesyonel servis tavsiyesinin yerini tutmaz. Güvenlik prosedürlerine uyun.';

  @override
  String get errorDtcInvalid => 'P0300 gibi geçerli bir kod girin.';

  @override
  String get errorDtcNotFound => 'Bu arıza kodu henüz katalogda yok.';

  @override
  String get resultSteps => 'Tamir adımları';

  @override
  String get resultVideos => 'Topluluk videoları';

  @override
  String get resultVideosEmpty => 'Henüz video yok — ilk yükleyen sen ol.';

  @override
  String get resultView3d => 'Arızalı parçayı 3D’de gör';

  @override
  String get scene3dTitle => 'Vurgulanan parça';

  @override
  String get scene3dHint =>
      'Döndürmek için sürükle. Turuncu işaret olası arızalı parçayı gösterir.';

  @override
  String get scene3dNav => '3D Araç';

  @override
  String get communityFilter => 'DTC ile filtrele';

  @override
  String get communityComments => 'Yorumlar';

  @override
  String get communityCommentPlaceholder => 'Çözümünü paylaş…';

  @override
  String get communityCommentSend => 'Gönder';

  @override
  String get uploadDetails => 'Detaylar';

  @override
  String get uploadTitle => 'Başlık';

  @override
  String get uploadSummary => 'Ne düzeltti?';

  @override
  String get uploadPick => 'Video seç';

  @override
  String get uploadSubmit => 'İncelemeye gönder';

  @override
  String get uploadSuccess =>
      'Yüklendi. Moderasyon bekliyor (admin anında yayınlar).';

  @override
  String get uploadErrorTitle => 'Başlık gerekli.';

  @override
  String get profileSubscription => 'Abonelik';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Ücretsiz';

  @override
  String get profileUpgrade => 'Pro’ya geç';

  @override
  String get profileMyVideos => 'Videolarım';

  @override
  String get profileMyVideosEmpty => 'Henüz yükleme yok.';

  @override
  String get profileSignOut => 'Çıkış yap';

  @override
  String get paywallSubtitle =>
      '3D parça vurgusu, yüksek video kotası ve tamir geçmişini aç.';

  @override
  String get paywallBenefit3d => 'İnteraktif 3D arıza konumlandırma';

  @override
  String get paywallBenefitVideo => 'Ayda 30’a kadar topluluk videosu';

  @override
  String get paywallBenefitHistory => 'Sınırsız teşhis geçmişi';

  @override
  String get paywallDemoUnlock => 'Pro’yu aç (Demo)';

  @override
  String get paywallClose => 'Kapat';

  @override
  String get authPlayNote => 'Google Play sürümü — Firebase Auth sonraki adım.';

  @override
  String get uploadPicked => 'Video seçildi';

  @override
  String get uploadQuotaFull => 'Kotan doldu — Pro’ya geç.';

  @override
  String get uploadNavTitle => 'Video yükle';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play abonelik) sonraki adımda bağlanacak.';

  @override
  String commentsCount(int count) {
    return '$count yorum';
  }

  @override
  String uploadsLeft(int count) {
    return 'Bu ay $count yükleme hakkın kaldı';
  }

  @override
  String get language => 'Dil';
}
