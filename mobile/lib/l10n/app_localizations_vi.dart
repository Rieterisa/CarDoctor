// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get tabDiagnose => 'Chẩn đoán';

  @override
  String get tabCommunity => 'Cộng đồng';

  @override
  String get tabUpload => 'Tải lên';

  @override
  String get tabProfile => 'Hồ sơ';

  @override
  String get authTagline =>
      'VIN + mã lỗi → phụ tùng, bước sửa chữa và hướng dẫn 3D từ cộng đồng.';

  @override
  String get authDemo => 'Tiếp tục với bản demo';

  @override
  String get diagnoseHeadline => 'Tìm lỗi';

  @override
  String get diagnoseSubtitle =>
      'Nhập VIN và mã lỗi cụ thể — chẩn đoán được giải quyết theo từng hãng xe.';

  @override
  String get diagnoseVin => 'VIN / Khung xe';

  @override
  String get diagnoseDtc => 'Mã lỗi (DTC)';

  @override
  String get diagnoseSubmit => 'Chẩn đoán';

  @override
  String get diagnoseSamples => 'Thử mã phổ biến';

  @override
  String get legalDisclaimer =>
      'Chỉ mang tính thông tin. Không thay thế tư vấn sửa chữa chuyên nghiệp. Tuân thủ quy trình an toàn.';

  @override
  String get errorDtcInvalid => 'Nhập mã hợp lệ như P0300.';

  @override
  String get errorDtcNotFound => 'Mã lỗi này chưa có trong danh mục.';

  @override
  String get resultSteps => 'Các bước sửa chữa';

  @override
  String get resultVideos => 'Video cộng đồng';

  @override
  String get resultVideosEmpty =>
      'Chưa có video — hãy là người đầu tiên tải lên.';

  @override
  String get resultView3d => 'Xem phụ tùng lỗi ở dạng 3D';

  @override
  String get scene3dTitle => 'Phụ tùng được tô sáng';

  @override
  String get scene3dHint =>
      'Kéo để xoay. Dấu cam cho thấy linh kiện có thể bị lỗi.';

  @override
  String get scene3dNav => 'Xe 3D';

  @override
  String get communityFilter => 'Lọc theo DTC';

  @override
  String get communityComments => 'Bình luận';

  @override
  String get communityCommentPlaceholder => 'Chia sẻ cách sửa của bạn…';

  @override
  String get communityCommentSend => 'Gửi';

  @override
  String get uploadDetails => 'Chi tiết';

  @override
  String get uploadTitle => 'Tiêu đề';

  @override
  String get uploadSummary => 'Cái gì đã khắc phục?';

  @override
  String get uploadPick => 'Chọn video';

  @override
  String get uploadSubmit => 'Gửi để duyệt';

  @override
  String get uploadSuccess =>
      'Đã tải lên. Đang chờ kiểm duyệt (quản trị viên đăng ngay).';

  @override
  String get uploadErrorTitle => 'Tiêu đề là bắt buộc.';

  @override
  String get profileSubscription => 'Thuê bao';

  @override
  String get profilePlan => 'Gói';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Miễn phí';

  @override
  String get profileUpgrade => 'Nâng cấp lên Pro';

  @override
  String get profileMyVideos => 'Video của tôi';

  @override
  String get profileMyVideosEmpty => 'Chưa có nội dung tải lên.';

  @override
  String get profileSignOut => 'Đăng xuất';

  @override
  String get paywallSubtitle =>
      'Mở khóa tô sáng phụ tùng 3D, hạn mức video cao hơn và lịch sử sửa chữa.';

  @override
  String get paywallBenefit3d => 'Định vị lỗi 3D tương tác';

  @override
  String get paywallBenefitVideo => 'Tối đa 30 lần tải lên cộng đồng / tháng';

  @override
  String get paywallBenefitHistory => 'Lịch sử chẩn đoán không giới hạn';

  @override
  String get paywallDemoUnlock => 'Mở khóa Pro (Demo)';

  @override
  String get paywallClose => 'Đóng';

  @override
  String get authPlayNote =>
      'Bản Google Play — Firebase Auth sẽ tới tiếp theo.';

  @override
  String get uploadPicked => 'Đã chọn video';

  @override
  String get uploadQuotaFull => 'Đã hết hạn mức — nâng cấp lên Pro.';

  @override
  String get uploadNavTitle => 'Tải video lên';

  @override
  String get paywallBillingNote =>
      'Play Billing (thuê bao Google Play) sẽ được kết nối tiếp theo.';

  @override
  String commentsCount(int count) {
    return '$count bình luận';
  }

  @override
  String uploadsLeft(int count) {
    return 'Còn $count lượt tải lên trong tháng này';
  }

  @override
  String get language => 'Ngôn ngữ';
}
