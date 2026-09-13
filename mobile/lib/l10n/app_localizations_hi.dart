// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get tabDiagnose => 'निदान';

  @override
  String get tabCommunity => 'समुदाय';

  @override
  String get tabUpload => 'अपलोड';

  @override
  String get tabProfile => 'प्रोफ़ाइल';

  @override
  String get authTagline =>
      'VIN + दोष कोड → पार्ट, मरम्मत चरण और समुदाय से 3D मार्गदर्शन।';

  @override
  String get authDemo => 'डेमो के साथ जारी रखें';

  @override
  String get diagnoseHeadline => 'दोष खोजें';

  @override
  String get diagnoseSubtitle =>
      'विशिष्ट VIN और दोष कोड दर्ज करें — निदान वाहन ब्रांड के अनुसार होता है।';

  @override
  String get diagnoseVin => 'VIN / चेसिस';

  @override
  String get diagnoseDtc => 'दोष कोड (DTC)';

  @override
  String get diagnoseSubmit => 'निदान करें';

  @override
  String get diagnoseSamples => 'एक सामान्य कोड आज़माएँ';

  @override
  String get legalDisclaimer =>
      'केवल सूचना हेतु। पेशेवर सेवा सलाह का विकल्प नहीं। सुरक्षा प्रक्रियाओं का पालन करें।';

  @override
  String get errorDtcInvalid => 'P0300 जैसा मान्य कोड दर्ज करें।';

  @override
  String get errorDtcNotFound => 'यह दोष कोड अभी कैटलॉग में नहीं है।';

  @override
  String get resultSteps => 'मरम्मत के चरण';

  @override
  String get resultVideos => 'समुदाय वीडियो';

  @override
  String get resultVideosEmpty =>
      'अभी कोई वीडियो नहीं — पहले अपलोड करने वाले बनें।';

  @override
  String get resultView3d => 'दोषपूर्ण पार्ट को 3D में देखें';

  @override
  String get scene3dTitle => 'हाइलाइट किया गया पार्ट';

  @override
  String get scene3dHint =>
      'घुमाने के लिए खींचें। नारंगी चिह्न संभावित दोषपूर्ण घटक दिखाता है।';

  @override
  String get scene3dNav => '3D वाहन';

  @override
  String get communityFilter => 'DTC से फ़िल्टर करें';

  @override
  String get communityComments => 'टिप्पणियाँ';

  @override
  String get communityCommentPlaceholder => 'अपना समाधान साझा करें…';

  @override
  String get communityCommentSend => 'भेजें';

  @override
  String get uploadDetails => 'विवरण';

  @override
  String get uploadTitle => 'शीर्षक';

  @override
  String get uploadSummary => 'क्या ठीक हुआ?';

  @override
  String get uploadPick => 'वीडियो चुनें';

  @override
  String get uploadSubmit => 'समीक्षा के लिए भेजें';

  @override
  String get uploadSuccess =>
      'अपलोड हो गया। मॉडरेशन लंबित (एडमिन तुरंत प्रकाशित करते हैं)।';

  @override
  String get uploadErrorTitle => 'शीर्षक आवश्यक है।';

  @override
  String get profileSubscription => 'सदस्यता';

  @override
  String get profilePlan => 'योजना';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'मुफ़्त';

  @override
  String get profileUpgrade => 'Pro में अपग्रेड करें';

  @override
  String get profileMyVideos => 'मेरे वीडियो';

  @override
  String get profileMyVideosEmpty => 'अभी कोई अपलोड नहीं।';

  @override
  String get profileSignOut => 'साइन आउट';

  @override
  String get paywallSubtitle =>
      '3D पार्ट हाइलाइट, अधिक वीडियो कोटा और मरम्मत इतिहास अनलॉक करें।';

  @override
  String get paywallBenefit3d => 'इंटरैक्टिव 3D दोष स्थान निर्धारण';

  @override
  String get paywallBenefitVideo => 'प्रति माह 30 तक समुदाय अपलोड';

  @override
  String get paywallBenefitHistory => 'असीमित निदान इतिहास';

  @override
  String get paywallDemoUnlock => 'Pro अनलॉक करें (डेमो)';

  @override
  String get paywallClose => 'बंद करें';

  @override
  String get authPlayNote => 'Google Play बिल्ड — Firebase Auth अगला चरण है।';

  @override
  String get uploadPicked => 'वीडियो चुना गया';

  @override
  String get uploadQuotaFull => 'कोटा भर गया — Pro में अपग्रेड करें।';

  @override
  String get uploadNavTitle => 'वीडियो अपलोड करें';

  @override
  String get paywallBillingNote =>
      'Play Billing (Google Play सदस्यता) अगले चरण में जोड़ा जाएगा।';

  @override
  String commentsCount(int count) {
    return '$count टिप्पणियाँ';
  }

  @override
  String uploadsLeft(int count) {
    return 'इस महीने $count अपलोड शेष';
  }

  @override
  String get language => 'भाषा';
}
