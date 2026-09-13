// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnose';

  @override
  String get tabCommunity => 'Community';

  @override
  String get tabUpload => 'Upload';

  @override
  String get tabProfile => 'Profile';

  @override
  String get authTagline =>
      'VIN + fault code → part, repair steps, and 3D guidance from the community.';

  @override
  String get authDemo => 'Continue with Demo';

  @override
  String get diagnoseHeadline => 'Find the fault';

  @override
  String get diagnoseSubtitle =>
      'Enter a specific VIN and fault code — diagnosis is resolved per vehicle brand.';

  @override
  String get diagnoseVin => 'VIN / Chassis';

  @override
  String get diagnoseDtc => 'Fault code (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnose';

  @override
  String get diagnoseSamples => 'Try a common code';

  @override
  String get legalDisclaimer =>
      'For informational purposes only. Not a substitute for professional service advice. Follow safety procedures.';

  @override
  String get errorDtcInvalid => 'Enter a valid code like P0300.';

  @override
  String get errorDtcNotFound => 'This fault code is not in the catalog yet.';

  @override
  String get resultSteps => 'Repair steps';

  @override
  String get resultVideos => 'Community videos';

  @override
  String get resultVideosEmpty => 'No videos yet — be the first to upload.';

  @override
  String get resultView3d => 'View faulty part in 3D';

  @override
  String get scene3dTitle => 'Highlighted part';

  @override
  String get scene3dHint =>
      'Drag to rotate. Orange mark shows the likely faulty component.';

  @override
  String get scene3dNav => '3D Vehicle';

  @override
  String get communityFilter => 'Filter by DTC';

  @override
  String get communityComments => 'Comments';

  @override
  String get communityCommentPlaceholder => 'Share your fix…';

  @override
  String get communityCommentSend => 'Send';

  @override
  String get uploadDetails => 'Details';

  @override
  String get uploadTitle => 'Title';

  @override
  String get uploadSummary => 'What fixed it?';

  @override
  String get uploadPick => 'Pick a video';

  @override
  String get uploadSubmit => 'Submit for review';

  @override
  String get uploadSuccess =>
      'Uploaded. Pending moderation (admins publish instantly).';

  @override
  String get uploadErrorTitle => 'Title is required.';

  @override
  String get profileSubscription => 'Subscription';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Free';

  @override
  String get profileUpgrade => 'Upgrade to Pro';

  @override
  String get profileMyVideos => 'My videos';

  @override
  String get profileMyVideosEmpty => 'No uploads yet.';

  @override
  String get profileSignOut => 'Sign out';

  @override
  String get paywallSubtitle =>
      'Unlock 3D part highlight, higher video quota, and repair history.';

  @override
  String get paywallBenefit3d => 'Interactive 3D fault localization';

  @override
  String get paywallBenefitVideo => 'Up to 30 community uploads / month';

  @override
  String get paywallBenefitHistory => 'Unlimited diagnosis history';

  @override
  String get paywallDemoUnlock => 'Unlock Pro (Demo)';

  @override
  String get paywallClose => 'Close';

  @override
  String get authPlayNote => 'Google Play build — Firebase Auth comes next.';

  @override
  String get uploadPicked => 'Video selected';

  @override
  String get uploadQuotaFull => 'Quota full — upgrade to Pro.';

  @override
  String get uploadNavTitle => 'Upload video';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play subscription) will be connected next.';

  @override
  String commentsCount(int count) {
    return '$count comments';
  }

  @override
  String uploadsLeft(int count) {
    return '$count uploads left this month';
  }

  @override
  String get language => 'Language';
}
