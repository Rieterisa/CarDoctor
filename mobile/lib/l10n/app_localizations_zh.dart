// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get tabDiagnose => '诊断';

  @override
  String get tabCommunity => '社区';

  @override
  String get tabUpload => '上传';

  @override
  String get tabProfile => '个人资料';

  @override
  String get authTagline => 'VIN + 故障码 → 零件、维修步骤以及社区的 3D 指引。';

  @override
  String get authDemo => '使用演示继续';

  @override
  String get diagnoseHeadline => '查找故障';

  @override
  String get diagnoseSubtitle => '输入具体的 VIN 和故障码 — 诊断按车辆品牌解析。';

  @override
  String get diagnoseVin => 'VIN / 车架号';

  @override
  String get diagnoseDtc => '故障码（DTC）';

  @override
  String get diagnoseSubmit => '开始诊断';

  @override
  String get diagnoseSamples => '试试常见代码';

  @override
  String get legalDisclaimer => '仅供参考。不能替代专业维修建议。请遵守安全规程。';

  @override
  String get errorDtcInvalid => '请输入有效代码，例如 P0300。';

  @override
  String get errorDtcNotFound => '该故障码尚未收录到目录中。';

  @override
  String get resultSteps => '维修步骤';

  @override
  String get resultVideos => '社区视频';

  @override
  String get resultVideosEmpty => '暂无视频 — 成为第一个上传的人。';

  @override
  String get resultView3d => '以 3D 查看故障零件';

  @override
  String get scene3dTitle => '高亮零件';

  @override
  String get scene3dHint => '拖动以旋转。橙色标记显示可能的故障部件。';

  @override
  String get scene3dNav => '3D 车辆';

  @override
  String get communityFilter => '按 DTC 筛选';

  @override
  String get communityComments => '评论';

  @override
  String get communityCommentPlaceholder => '分享你的修复方法…';

  @override
  String get communityCommentSend => '发送';

  @override
  String get uploadDetails => '详细信息';

  @override
  String get uploadTitle => '标题';

  @override
  String get uploadSummary => '是什么修好的？';

  @override
  String get uploadPick => '选择视频';

  @override
  String get uploadSubmit => '提交审核';

  @override
  String get uploadSuccess => '已上传。等待审核（管理员可立即发布）。';

  @override
  String get uploadErrorTitle => '标题为必填项。';

  @override
  String get profileSubscription => '订阅';

  @override
  String get profilePlan => '方案';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => '免费';

  @override
  String get profileUpgrade => '升级到 Pro';

  @override
  String get profileMyVideos => '我的视频';

  @override
  String get profileMyVideosEmpty => '暂无上传。';

  @override
  String get profileSignOut => '退出登录';

  @override
  String get paywallSubtitle => '解锁 3D 零件高亮、更高视频配额和维修历史。';

  @override
  String get paywallBenefit3d => '交互式 3D 故障定位';

  @override
  String get paywallBenefitVideo => '每月最多 30 次社区上传';

  @override
  String get paywallBenefitHistory => '无限诊断历史';

  @override
  String get paywallDemoUnlock => '解锁 Pro（演示）';

  @override
  String get paywallClose => '关闭';

  @override
  String get authPlayNote => 'Google Play 版本 — 接下来是 Firebase Auth。';

  @override
  String get uploadPicked => '已选择视频';

  @override
  String get uploadQuotaFull => '配额已满 — 请升级到 Pro。';

  @override
  String get uploadNavTitle => '上传视频';

  @override
  String get paywallBillingNote => '下一步将接入 Play Billing（Google Play 订阅）。';

  @override
  String commentsCount(int count) {
    return '$count 条评论';
  }

  @override
  String uploadsLeft(int count) {
    return '本月剩余 $count 次上传';
  }

  @override
  String get language => '语言';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get tabDiagnose => '診斷';

  @override
  String get tabCommunity => '社群';

  @override
  String get tabUpload => '上傳';

  @override
  String get tabProfile => '個人檔案';

  @override
  String get authTagline => 'VIN + 故障碼 → 零件、維修步驟以及社群的 3D 指引。';

  @override
  String get authDemo => '使用示範繼續';

  @override
  String get diagnoseHeadline => '找出故障';

  @override
  String get diagnoseSubtitle => '輸入具體的 VIN 和故障碼 — 診斷依車輛品牌解析。';

  @override
  String get diagnoseVin => 'VIN / 車架號碼';

  @override
  String get diagnoseDtc => '故障碼（DTC）';

  @override
  String get diagnoseSubmit => '開始診斷';

  @override
  String get diagnoseSamples => '試試常見代碼';

  @override
  String get legalDisclaimer => '僅供參考。不能取代專業維修建議。請遵守安全程序。';

  @override
  String get errorDtcInvalid => '請輸入有效代碼，例如 P0300。';

  @override
  String get errorDtcNotFound => '此故障碼尚未收錄於目錄中。';

  @override
  String get resultSteps => '維修步驟';

  @override
  String get resultVideos => '社群影片';

  @override
  String get resultVideosEmpty => '尚無影片 — 成為第一個上傳的人。';

  @override
  String get resultView3d => '以 3D 查看故障零件';

  @override
  String get scene3dTitle => '醒目零件';

  @override
  String get scene3dHint => '拖曳以旋轉。橘色標記顯示可能故障的零件。';

  @override
  String get scene3dNav => '3D 車輛';

  @override
  String get communityFilter => '依 DTC 篩選';

  @override
  String get communityComments => '留言';

  @override
  String get communityCommentPlaceholder => '分享你的修復方法…';

  @override
  String get communityCommentSend => '傳送';

  @override
  String get uploadDetails => '詳細資料';

  @override
  String get uploadTitle => '標題';

  @override
  String get uploadSummary => '是什麼修好的？';

  @override
  String get uploadPick => '選擇影片';

  @override
  String get uploadSubmit => '提交審核';

  @override
  String get uploadSuccess => '已上傳。等待審核（管理員可立即發佈）。';

  @override
  String get uploadErrorTitle => '標題為必填。';

  @override
  String get profileSubscription => '訂閱';

  @override
  String get profilePlan => '方案';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => '免費';

  @override
  String get profileUpgrade => '升級至 Pro';

  @override
  String get profileMyVideos => '我的影片';

  @override
  String get profileMyVideosEmpty => '尚無上傳。';

  @override
  String get profileSignOut => '登出';

  @override
  String get paywallSubtitle => '解鎖 3D 零件醒目、更高影片配額與維修紀錄。';

  @override
  String get paywallBenefit3d => '互動式 3D 故障定位';

  @override
  String get paywallBenefitVideo => '每月最多 30 次社群上傳';

  @override
  String get paywallBenefitHistory => '無限診斷紀錄';

  @override
  String get paywallDemoUnlock => '解鎖 Pro（示範）';

  @override
  String get paywallClose => '關閉';

  @override
  String get authPlayNote => 'Google Play 版本 — 接下來是 Firebase Auth。';

  @override
  String get uploadPicked => '已選擇影片';

  @override
  String get uploadQuotaFull => '配額已滿 — 請升級至 Pro。';

  @override
  String get uploadNavTitle => '上傳影片';

  @override
  String get paywallBillingNote => '下一步將接上 Play Billing（Google Play 訂閱）。';

  @override
  String commentsCount(int count) {
    return '$count 則留言';
  }

  @override
  String uploadsLeft(int count) {
    return '本月剩餘 $count 次上傳';
  }

  @override
  String get language => '語言';
}
