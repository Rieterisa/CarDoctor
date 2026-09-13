// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get tabDiagnose => '診断';

  @override
  String get tabCommunity => 'コミュニティ';

  @override
  String get tabUpload => 'アップロード';

  @override
  String get tabProfile => 'プロフィール';

  @override
  String get authTagline => 'VIN＋故障コード → 部品、修理手順、コミュニティの3Dガイド。';

  @override
  String get authDemo => 'デモで続行';

  @override
  String get diagnoseHeadline => '故障を特定';

  @override
  String get diagnoseSubtitle => '具体的なVINと故障コードを入力 — 診断は車種メーカーごとに解決されます。';

  @override
  String get diagnoseVin => 'VIN / 車台番号';

  @override
  String get diagnoseDtc => '故障コード（DTC）';

  @override
  String get diagnoseSubmit => '診断する';

  @override
  String get diagnoseSamples => 'よくあるコードを試す';

  @override
  String get legalDisclaimer => '情報提供のみです。専門整備の代替ではありません。安全手順に従ってください。';

  @override
  String get errorDtcInvalid => 'P0300のような有効なコードを入力してください。';

  @override
  String get errorDtcNotFound => 'この故障コードはまだカタログにありません。';

  @override
  String get resultSteps => '修理手順';

  @override
  String get resultVideos => 'コミュニティ動画';

  @override
  String get resultVideosEmpty => 'まだ動画がありません — 最初にアップロードしましょう。';

  @override
  String get resultView3d => '故障部品を3Dで表示';

  @override
  String get scene3dTitle => '強調表示された部品';

  @override
  String get scene3dHint => 'ドラッグで回転。オレンジの印が故障の可能性がある部品を示します。';

  @override
  String get scene3dNav => '3D車両';

  @override
  String get communityFilter => 'DTCで絞り込み';

  @override
  String get communityComments => 'コメント';

  @override
  String get communityCommentPlaceholder => '修理内容を共有…';

  @override
  String get communityCommentSend => '送信';

  @override
  String get uploadDetails => '詳細';

  @override
  String get uploadTitle => 'タイトル';

  @override
  String get uploadSummary => '何で直りましたか？';

  @override
  String get uploadPick => '動画を選択';

  @override
  String get uploadSubmit => '審査に提出';

  @override
  String get uploadSuccess => 'アップロード済み。審査待ち（管理者は即公開）。';

  @override
  String get uploadErrorTitle => 'タイトルは必須です。';

  @override
  String get profileSubscription => 'サブスクリプション';

  @override
  String get profilePlan => 'プラン';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => '無料';

  @override
  String get profileUpgrade => 'Proにアップグレード';

  @override
  String get profileMyVideos => '自分の動画';

  @override
  String get profileMyVideosEmpty => 'まだアップロードがありません。';

  @override
  String get profileSignOut => 'サインアウト';

  @override
  String get paywallSubtitle => '3D部品ハイライト、動画枠の拡大、修理履歴を解除。';

  @override
  String get paywallBenefit3d => 'インタラクティブな3D故障位置表示';

  @override
  String get paywallBenefitVideo => 'コミュニティ投稿最大30件／月';

  @override
  String get paywallBenefitHistory => '診断履歴無制限';

  @override
  String get paywallDemoUnlock => 'Proを解除（デモ）';

  @override
  String get paywallClose => '閉じる';

  @override
  String get authPlayNote => 'Google Play版 — 次はFirebase Authです。';

  @override
  String get uploadPicked => '動画を選択済み';

  @override
  String get uploadQuotaFull => '枠がいっぱいです — Proにアップグレード。';

  @override
  String get uploadNavTitle => '動画をアップロード';

  @override
  String get paywallBillingNote =>
      'Play Billing（Google Play定期購入）は次のステップで接続します。';

  @override
  String commentsCount(int count) {
    return 'コメント$count件';
  }

  @override
  String uploadsLeft(int count) {
    return '今月の残りアップロード：$count';
  }

  @override
  String get language => '言語';
}
