import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('es', '419'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sv'),
    Locale('sw'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @tabDiagnose.
  ///
  /// In en, this message translates to:
  /// **'Diagnose'**
  String get tabDiagnose;

  /// No description provided for @tabCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get tabCommunity;

  /// No description provided for @tabUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get tabUpload;

  /// No description provided for @tabProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// No description provided for @authTagline.
  ///
  /// In en, this message translates to:
  /// **'VIN + fault code → part, repair steps, and 3D guidance from the community.'**
  String get authTagline;

  /// No description provided for @authDemo.
  ///
  /// In en, this message translates to:
  /// **'Continue with Demo'**
  String get authDemo;

  /// No description provided for @diagnoseHeadline.
  ///
  /// In en, this message translates to:
  /// **'Find the fault'**
  String get diagnoseHeadline;

  /// No description provided for @diagnoseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter a specific VIN and fault code — diagnosis is resolved per vehicle brand.'**
  String get diagnoseSubtitle;

  /// No description provided for @diagnoseVin.
  ///
  /// In en, this message translates to:
  /// **'VIN / Chassis'**
  String get diagnoseVin;

  /// No description provided for @diagnoseDtc.
  ///
  /// In en, this message translates to:
  /// **'Fault code (DTC)'**
  String get diagnoseDtc;

  /// No description provided for @diagnoseSubmit.
  ///
  /// In en, this message translates to:
  /// **'Diagnose'**
  String get diagnoseSubmit;

  /// No description provided for @diagnoseSamples.
  ///
  /// In en, this message translates to:
  /// **'Try a common code'**
  String get diagnoseSamples;

  /// No description provided for @legalDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'For informational purposes only. Not a substitute for professional service advice. Follow safety procedures.'**
  String get legalDisclaimer;

  /// No description provided for @errorDtcInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid code like P0300.'**
  String get errorDtcInvalid;

  /// No description provided for @errorDtcNotFound.
  ///
  /// In en, this message translates to:
  /// **'This fault code is not in the catalog yet.'**
  String get errorDtcNotFound;

  /// No description provided for @resultSteps.
  ///
  /// In en, this message translates to:
  /// **'Repair steps'**
  String get resultSteps;

  /// No description provided for @resultVideos.
  ///
  /// In en, this message translates to:
  /// **'Community videos'**
  String get resultVideos;

  /// No description provided for @resultVideosEmpty.
  ///
  /// In en, this message translates to:
  /// **'No videos yet — be the first to upload.'**
  String get resultVideosEmpty;

  /// No description provided for @resultView3d.
  ///
  /// In en, this message translates to:
  /// **'View faulty part in 3D'**
  String get resultView3d;

  /// No description provided for @scene3dTitle.
  ///
  /// In en, this message translates to:
  /// **'Highlighted part'**
  String get scene3dTitle;

  /// No description provided for @scene3dHint.
  ///
  /// In en, this message translates to:
  /// **'Drag to rotate. Orange mark shows the likely faulty component.'**
  String get scene3dHint;

  /// No description provided for @scene3dNav.
  ///
  /// In en, this message translates to:
  /// **'3D Vehicle'**
  String get scene3dNav;

  /// No description provided for @communityFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter by DTC'**
  String get communityFilter;

  /// No description provided for @communityComments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get communityComments;

  /// No description provided for @communityCommentPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Share your fix…'**
  String get communityCommentPlaceholder;

  /// No description provided for @communityCommentSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get communityCommentSend;

  /// No description provided for @uploadDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get uploadDetails;

  /// No description provided for @uploadTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get uploadTitle;

  /// No description provided for @uploadSummary.
  ///
  /// In en, this message translates to:
  /// **'What fixed it?'**
  String get uploadSummary;

  /// No description provided for @uploadPick.
  ///
  /// In en, this message translates to:
  /// **'Pick a video'**
  String get uploadPick;

  /// No description provided for @uploadSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit for review'**
  String get uploadSubmit;

  /// No description provided for @uploadSuccess.
  ///
  /// In en, this message translates to:
  /// **'Uploaded. Pending moderation (admins publish instantly).'**
  String get uploadSuccess;

  /// No description provided for @uploadErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Title is required.'**
  String get uploadErrorTitle;

  /// No description provided for @profileSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get profileSubscription;

  /// No description provided for @profilePlan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get profilePlan;

  /// No description provided for @profilePlanPro.
  ///
  /// In en, this message translates to:
  /// **'Pro'**
  String get profilePlanPro;

  /// No description provided for @profilePlanFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get profilePlanFree;

  /// No description provided for @profileUpgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Pro'**
  String get profileUpgrade;

  /// No description provided for @profileMyVideos.
  ///
  /// In en, this message translates to:
  /// **'My videos'**
  String get profileMyVideos;

  /// No description provided for @profileMyVideosEmpty.
  ///
  /// In en, this message translates to:
  /// **'No uploads yet.'**
  String get profileMyVideosEmpty;

  /// No description provided for @profileSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get profileSignOut;

  /// No description provided for @paywallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock 3D part highlight, higher video quota, and repair history.'**
  String get paywallSubtitle;

  /// No description provided for @paywallBenefit3d.
  ///
  /// In en, this message translates to:
  /// **'Interactive 3D fault localization'**
  String get paywallBenefit3d;

  /// No description provided for @paywallBenefitVideo.
  ///
  /// In en, this message translates to:
  /// **'Up to 30 community uploads / month'**
  String get paywallBenefitVideo;

  /// No description provided for @paywallBenefitHistory.
  ///
  /// In en, this message translates to:
  /// **'Unlimited diagnosis history'**
  String get paywallBenefitHistory;

  /// No description provided for @paywallDemoUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock Pro (Demo)'**
  String get paywallDemoUnlock;

  /// No description provided for @paywallClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get paywallClose;

  /// No description provided for @authPlayNote.
  ///
  /// In en, this message translates to:
  /// **'Google Play build — Firebase Auth comes next.'**
  String get authPlayNote;

  /// No description provided for @uploadPicked.
  ///
  /// In en, this message translates to:
  /// **'Video selected'**
  String get uploadPicked;

  /// No description provided for @uploadQuotaFull.
  ///
  /// In en, this message translates to:
  /// **'Quota full — upgrade to Pro.'**
  String get uploadQuotaFull;

  /// No description provided for @uploadNavTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload video'**
  String get uploadNavTitle;

  /// No description provided for @paywallBillingNote.
  ///
  /// In en, this message translates to:
  /// **'Play Billing (Google Play subscription) will be connected next.'**
  String get paywallBillingNote;

  /// No description provided for @commentsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} comments'**
  String commentsCount(int count);

  /// No description provided for @uploadsLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} uploads left this month'**
  String uploadsLeft(int count);

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bg',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fi',
    'fil',
    'fr',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nb',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sv',
    'sw',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'es':
      {
        switch (locale.countryCode) {
          case '419':
            return AppLocalizationsEs419();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
