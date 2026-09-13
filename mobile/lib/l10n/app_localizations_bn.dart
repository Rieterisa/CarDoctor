// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get tabDiagnose => 'নির্ণয়';

  @override
  String get tabCommunity => 'কমিউনিটি';

  @override
  String get tabUpload => 'আপলোড';

  @override
  String get tabProfile => 'প্রোফাইল';

  @override
  String get authTagline =>
      'VIN + ত্রুটি কোড → যন্ত্রাংশ, মেরামত ধাপ এবং কমিউনিটির 3D নির্দেশনা।';

  @override
  String get authDemo => 'ডেমো দিয়ে চালিয়ে যান';

  @override
  String get diagnoseHeadline => 'ত্রুটি খুঁজুন';

  @override
  String get diagnoseSubtitle =>
      'নির্দিষ্ট VIN ও ত্রুটি কোড লিখুন — নির্ণয় যানবাহনের ব্র্যান্ড অনুযায়ী হয়।';

  @override
  String get diagnoseVin => 'VIN / চেসিস';

  @override
  String get diagnoseDtc => 'ত্রুটি কোড (DTC)';

  @override
  String get diagnoseSubmit => 'নির্ণয় করুন';

  @override
  String get diagnoseSamples => 'একটি সাধারণ কোড চেষ্টা করুন';

  @override
  String get legalDisclaimer =>
      'শুধু তথ্যের জন্য। পেশাদার সার্ভিস পরামর্শের বিকল্প নয়। নিরাপত্তা পদ্ধতি মেনে চলুন।';

  @override
  String get errorDtcInvalid => 'P0300-এর মতো বৈধ কোড লিখুন।';

  @override
  String get errorDtcNotFound => 'এই ত্রুটি কোড এখনও ক্যাটালগে নেই।';

  @override
  String get resultSteps => 'মেরামতের ধাপ';

  @override
  String get resultVideos => 'কমিউনিটি ভিডিও';

  @override
  String get resultVideosEmpty => 'এখনও কোনো ভিডিও নেই — প্রথম আপলোডকারী হোন।';

  @override
  String get resultView3d => 'ত্রুটিপূর্ণ যন্ত্রাংশ 3D-তে দেখুন';

  @override
  String get scene3dTitle => 'হাইলাইট করা যন্ত্রাংশ';

  @override
  String get scene3dHint =>
      'ঘোরাতে টেনে আনুন। কমলা চিহ্ন সম্ভাব্য ত্রুটিপূর্ণ উপাদান দেখায়।';

  @override
  String get scene3dNav => '3D যানবাহন';

  @override
  String get communityFilter => 'DTC দিয়ে ফিল্টার';

  @override
  String get communityComments => 'মন্তব্য';

  @override
  String get communityCommentPlaceholder => 'আপনার সমাধান শেয়ার করুন…';

  @override
  String get communityCommentSend => 'পাঠান';

  @override
  String get uploadDetails => 'বিস্তারিত';

  @override
  String get uploadTitle => 'শিরোনাম';

  @override
  String get uploadSummary => 'কী ঠিক করেছে?';

  @override
  String get uploadPick => 'ভিডিও বেছে নিন';

  @override
  String get uploadSubmit => 'পর্যালোচনার জন্য জমা দিন';

  @override
  String get uploadSuccess =>
      'আপলোড হয়েছে। মডারেশন অপেক্ষমাণ (অ্যাডমিন সাথে সাথে প্রকাশ করে)।';

  @override
  String get uploadErrorTitle => 'শিরোনাম প্রয়োজন।';

  @override
  String get profileSubscription => 'সাবস্ক্রিপশন';

  @override
  String get profilePlan => 'প্ল্যান';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'বিনামূল্যে';

  @override
  String get profileUpgrade => 'Pro-তে আপগ্রেড করুন';

  @override
  String get profileMyVideos => 'আমার ভিডিও';

  @override
  String get profileMyVideosEmpty => 'এখনও কোনো আপলোড নেই।';

  @override
  String get profileSignOut => 'সাইন আউট';

  @override
  String get paywallSubtitle =>
      '3D যন্ত্রাংশ হাইলাইট, বেশি ভিডিও কোটা ও মেরামত ইতিহাস আনলক করুন।';

  @override
  String get paywallBenefit3d => 'ইন্টারঅ্যাকটিভ 3D ত্রুটি স্থাননির্ধারণ';

  @override
  String get paywallBenefitVideo => 'প্রতি মাসে সর্বোচ্চ ৩০টি কমিউনিটি আপলোড';

  @override
  String get paywallBenefitHistory => 'সীমাহীন নির্ণয় ইতিহাস';

  @override
  String get paywallDemoUnlock => 'Pro আনলক করুন (ডেমো)';

  @override
  String get paywallClose => 'বন্ধ করুন';

  @override
  String get authPlayNote => 'Google Play বিল্ড — পরবর্তী ধাপ Firebase Auth।';

  @override
  String get uploadPicked => 'ভিডিও নির্বাচিত';

  @override
  String get uploadQuotaFull => 'কোটা পূর্ণ — Pro-তে আপগ্রেড করুন।';

  @override
  String get uploadNavTitle => 'ভিডিও আপলোড';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play সাবস্ক্রিপশন) পরবর্তী ধাপে যুক্ত হবে।';

  @override
  String commentsCount(int count) {
    return '$countটি মন্তব্য';
  }

  @override
  String uploadsLeft(int count) {
    return 'এই মাসে $count আপলোড বাকি';
  }

  @override
  String get language => 'ভাষা';
}
