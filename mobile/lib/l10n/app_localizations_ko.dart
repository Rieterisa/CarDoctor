// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get tabDiagnose => '진단';

  @override
  String get tabCommunity => '커뮤니티';

  @override
  String get tabUpload => '업로드';

  @override
  String get tabProfile => '프로필';

  @override
  String get authTagline => 'VIN + 고장 코드 → 부품, 수리 단계, 커뮤니티의 3D 안내.';

  @override
  String get authDemo => '데모로 계속';

  @override
  String get diagnoseHeadline => '고장 찾기';

  @override
  String get diagnoseSubtitle => '구체적인 VIN과 고장 코드를 입력하세요 — 진단은 차량 브랜드별로 처리됩니다.';

  @override
  String get diagnoseVin => 'VIN / 차대번호';

  @override
  String get diagnoseDtc => '고장 코드(DTC)';

  @override
  String get diagnoseSubmit => '진단하기';

  @override
  String get diagnoseSamples => '흔한 코드 사용해 보기';

  @override
  String get legalDisclaimer =>
      '정보 제공 목적입니다. 전문 정비 조언을 대체하지 않습니다. 안전 절차를 따르세요.';

  @override
  String get errorDtcInvalid => 'P0300처럼 유효한 코드를 입력하세요.';

  @override
  String get errorDtcNotFound => '이 고장 코드는 아직 카탈로그에 없습니다.';

  @override
  String get resultSteps => '수리 단계';

  @override
  String get resultVideos => '커뮤니티 영상';

  @override
  String get resultVideosEmpty => '아직 영상이 없습니다 — 첫 업로드를 해보세요.';

  @override
  String get resultView3d => '고장 부품을 3D로 보기';

  @override
  String get scene3dTitle => '강조된 부품';

  @override
  String get scene3dHint => '드래그하여 회전하세요. 주황 표시가 고장 가능성이 있는 부품을 나타냅니다.';

  @override
  String get scene3dNav => '3D 차량';

  @override
  String get communityFilter => 'DTC로 필터';

  @override
  String get communityComments => '댓글';

  @override
  String get communityCommentPlaceholder => '해결 방법을 공유하세요…';

  @override
  String get communityCommentSend => '보내기';

  @override
  String get uploadDetails => '세부정보';

  @override
  String get uploadTitle => '제목';

  @override
  String get uploadSummary => '무엇이 해결했나요?';

  @override
  String get uploadPick => '영상 선택';

  @override
  String get uploadSubmit => '검토 요청';

  @override
  String get uploadSuccess => '업로드됨. 검수 대기 중(관리자는 즉시 게시).';

  @override
  String get uploadErrorTitle => '제목은 필수입니다.';

  @override
  String get profileSubscription => '구독';

  @override
  String get profilePlan => '플랜';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => '무료';

  @override
  String get profileUpgrade => 'Pro로 업그레이드';

  @override
  String get profileMyVideos => '내 영상';

  @override
  String get profileMyVideosEmpty => '아직 업로드가 없습니다.';

  @override
  String get profileSignOut => '로그아웃';

  @override
  String get paywallSubtitle => '3D 부품 하이라이트, 더 많은 영상 할당량, 수리 기록을 잠금 해제하세요.';

  @override
  String get paywallBenefit3d => '인터랙티브 3D 고장 위치 표시';

  @override
  String get paywallBenefitVideo => '월 최대 30회 커뮤니티 업로드';

  @override
  String get paywallBenefitHistory => '무제한 진단 기록';

  @override
  String get paywallDemoUnlock => 'Pro 잠금 해제(데모)';

  @override
  String get paywallClose => '닫기';

  @override
  String get authPlayNote => 'Google Play 빌드 — 다음은 Firebase Auth입니다.';

  @override
  String get uploadPicked => '영상 선택됨';

  @override
  String get uploadQuotaFull => '할당량이 가득 찼습니다 — Pro로 업그레이드하세요.';

  @override
  String get uploadNavTitle => '영상 업로드';

  @override
  String get paywallBillingNote =>
      'Play Billing(Google Play 구독)은 다음 단계에서 연결됩니다.';

  @override
  String commentsCount(int count) {
    return '댓글 $count개';
  }

  @override
  String uploadsLeft(int count) {
    return '이번 달 업로드 $count회 남음';
  }

  @override
  String get language => '언어';
}
