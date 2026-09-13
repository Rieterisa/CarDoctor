// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get tabDiagnose => 'วินิจฉัย';

  @override
  String get tabCommunity => 'ชุมชน';

  @override
  String get tabUpload => 'อัปโหลด';

  @override
  String get tabProfile => 'โปรไฟล์';

  @override
  String get authTagline =>
      'VIN + รหัสความผิดปกติ → อะไหล่ ขั้นตอนซ่อม และคำแนะนำ 3D จากชุมชน';

  @override
  String get authDemo => 'ดำเนินการต่อด้วยเดโม';

  @override
  String get diagnoseHeadline => 'ค้นหาความผิดปกติ';

  @override
  String get diagnoseSubtitle =>
      'ใส่ VIN และรหัสความผิดปกติที่เฉพาะเจาะจง — การวินิจฉัยแยกตามยี่ห้อรถ';

  @override
  String get diagnoseVin => 'VIN / หมายเลขตัวถัง';

  @override
  String get diagnoseDtc => 'รหัสความผิดปกติ (DTC)';

  @override
  String get diagnoseSubmit => 'วินิจฉัย';

  @override
  String get diagnoseSamples => 'ลองรหัสที่ใช้บ่อย';

  @override
  String get legalDisclaimer =>
      'เพื่อข้อมูลเท่านั้น ไม่ใช่คำแนะนำจากช่างมืออาชีพ โปรดปฏิบัติตามขั้นตอนความปลอดภัย';

  @override
  String get errorDtcInvalid => 'ใส่รหัสที่ถูกต้อง เช่น P0300';

  @override
  String get errorDtcNotFound => 'ยังไม่มีรหัสความผิดปกตินี้ในแคตตาล็อก';

  @override
  String get resultSteps => 'ขั้นตอนการซ่อม';

  @override
  String get resultVideos => 'วิดีโอจากชุมชน';

  @override
  String get resultVideosEmpty => 'ยังไม่มีวิดีโอ — เป็นคนแรกที่อัปโหลด';

  @override
  String get resultView3d => 'ดูอะไหล่ที่ชำรุดแบบ 3D';

  @override
  String get scene3dTitle => 'อะไหล่ที่ไฮไลต์';

  @override
  String get scene3dHint =>
      'ลากเพื่อหมุน เครื่องหมายสีส้มแสดงชิ้นส่วนที่น่าจะชำรุด';

  @override
  String get scene3dNav => 'ยานพาหนะ 3D';

  @override
  String get communityFilter => 'กรองตาม DTC';

  @override
  String get communityComments => 'ความคิดเห็น';

  @override
  String get communityCommentPlaceholder => 'แชร์วิธีแก้ของคุณ…';

  @override
  String get communityCommentSend => 'ส่ง';

  @override
  String get uploadDetails => 'รายละเอียด';

  @override
  String get uploadTitle => 'ชื่อเรื่อง';

  @override
  String get uploadSummary => 'อะไรทำให้หาย?';

  @override
  String get uploadPick => 'เลือกวิดีโอ';

  @override
  String get uploadSubmit => 'ส่งเพื่อตรวจสอบ';

  @override
  String get uploadSuccess =>
      'อัปโหลดแล้ว รอการตรวจสอบ (แอดมินเผยแพร่ได้ทันที)';

  @override
  String get uploadErrorTitle => 'ต้องระบุชื่อเรื่อง';

  @override
  String get profileSubscription => 'การสมัครสมาชิก';

  @override
  String get profilePlan => 'แผน';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'ฟรี';

  @override
  String get profileUpgrade => 'อัปเกรดเป็น Pro';

  @override
  String get profileMyVideos => 'วิดีโอของฉัน';

  @override
  String get profileMyVideosEmpty => 'ยังไม่มีการอัปโหลด';

  @override
  String get profileSignOut => 'ออกจากระบบ';

  @override
  String get paywallSubtitle =>
      'ปลดล็อกไฮไลต์อะไหล่ 3D โควตาวิดีโอสูงขึ้น และประวัติการซ่อม';

  @override
  String get paywallBenefit3d => 'ระบุตำแหน่งความผิดปกติแบบอินเทอร์แอคทีฟ 3D';

  @override
  String get paywallBenefitVideo => 'อัปโหลดชุมชนได้สูงสุด 30 ครั้ง/เดือน';

  @override
  String get paywallBenefitHistory => 'ประวัติการวินิจฉัยไม่จำกัด';

  @override
  String get paywallDemoUnlock => 'ปลดล็อก Pro (เดโม)';

  @override
  String get paywallClose => 'ปิด';

  @override
  String get authPlayNote =>
      'เวอร์ชัน Google Play — ขั้นถัดไปคือ Firebase Auth';

  @override
  String get uploadPicked => 'เลือกวิดีโอแล้ว';

  @override
  String get uploadQuotaFull => 'โควตาเต็ม — อัปเกรดเป็น Pro';

  @override
  String get uploadNavTitle => 'อัปโหลดวิดีโอ';

  @override
  String get paywallBillingNote =>
      'จะเชื่อมต่อ Play Billing (การสมัคร Google Play) ในขั้นถัดไป';

  @override
  String commentsCount(int count) {
    return '$count ความคิดเห็น';
  }

  @override
  String uploadsLeft(int count) {
    return 'เหลือการอัปโหลด $count ครั้งในเดือนนี้';
  }

  @override
  String get language => 'ภาษา';
}
