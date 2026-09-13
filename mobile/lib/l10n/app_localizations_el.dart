// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get tabDiagnose => 'Διάγνωση';

  @override
  String get tabCommunity => 'Κοινότητα';

  @override
  String get tabUpload => 'Μεταφόρτωση';

  @override
  String get tabProfile => 'Προφίλ';

  @override
  String get authTagline =>
      'VIN + κωδικός βλάβης → εξάρτημα, βήματα επισκευής και 3D καθοδήγηση από την κοινότητα.';

  @override
  String get authDemo => 'Συνέχεια με Demo';

  @override
  String get diagnoseHeadline => 'Βρείτε τη βλάβη';

  @override
  String get diagnoseSubtitle =>
      'Εισαγάγετε συγκεκριμένο VIN και κωδικό βλάβης — η διάγνωση γίνεται ανά μάρκα οχήματος.';

  @override
  String get diagnoseVin => 'VIN / Πλαίσιο';

  @override
  String get diagnoseDtc => 'Κωδικός βλάβης (DTC)';

  @override
  String get diagnoseSubmit => 'Διάγνωση';

  @override
  String get diagnoseSamples => 'Δοκιμάστε έναν συνηθισμένο κωδικό';

  @override
  String get legalDisclaimer =>
      'Μόνο για ενημέρωση. Δεν υποκαθιστά επαγγελματική συμβουλή. Ακολουθήστε τις διαδικασίες ασφαλείας.';

  @override
  String get errorDtcInvalid => 'Εισαγάγετε έγκυρο κωδικό όπως P0300.';

  @override
  String get errorDtcNotFound =>
      'Αυτός ο κωδικός βλάβης δεν υπάρχει ακόμη στον κατάλογο.';

  @override
  String get resultSteps => 'Βήματα επισκευής';

  @override
  String get resultVideos => 'Βίντεο κοινότητας';

  @override
  String get resultVideosEmpty =>
      'Δεν υπάρχουν ακόμη βίντεο — ανεβάστε πρώτοι.';

  @override
  String get resultView3d => 'Προβολή ελαττωματικού εξαρτήματος σε 3D';

  @override
  String get scene3dTitle => 'Επισημασμένο εξάρτημα';

  @override
  String get scene3dHint =>
      'Σύρετε για περιστροφή. Το πορτοκαλί σημάδι δείχνει το πιθανό ελαττωματικό εξάρτημα.';

  @override
  String get scene3dNav => 'Όχημα 3D';

  @override
  String get communityFilter => 'Φίλτρο κατά DTC';

  @override
  String get communityComments => 'Σχόλια';

  @override
  String get communityCommentPlaceholder => 'Μοιραστείτε τη λύση σας…';

  @override
  String get communityCommentSend => 'Αποστολή';

  @override
  String get uploadDetails => 'Λεπτομέρειες';

  @override
  String get uploadTitle => 'Τίτλος';

  @override
  String get uploadSummary => 'Τι το διόρθωσε;';

  @override
  String get uploadPick => 'Επιλέξτε βίντεο';

  @override
  String get uploadSubmit => 'Υποβολή για έλεγχο';

  @override
  String get uploadSuccess =>
      'Μεταφορτώθηκε. Εκκρεμεί έλεγχος (οι διαχειριστές δημοσιεύουν αμέσως).';

  @override
  String get uploadErrorTitle => 'Ο τίτλος είναι υποχρεωτικός.';

  @override
  String get profileSubscription => 'Συνδρομή';

  @override
  String get profilePlan => 'Πλάνο';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Δωρεάν';

  @override
  String get profileUpgrade => 'Αναβάθμιση σε Pro';

  @override
  String get profileMyVideos => 'Τα βίντεό μου';

  @override
  String get profileMyVideosEmpty => 'Δεν υπάρχουν ακόμη μεταφορτώσεις.';

  @override
  String get profileSignOut => 'Αποσύνδεση';

  @override
  String get paywallSubtitle =>
      'Ξεκλειδώστε επισήμανση εξαρτήματος 3D, μεγαλύτερο όριο βίντεο και ιστορικό επισκευών.';

  @override
  String get paywallBenefit3d => 'Διαδραστικός εντοπισμός βλάβης σε 3D';

  @override
  String get paywallBenefitVideo => 'Έως 30 μεταφορτώσεις κοινότητας / μήνα';

  @override
  String get paywallBenefitHistory => 'Απεριόριστο ιστορικό διαγνώσεων';

  @override
  String get paywallDemoUnlock => 'Ξεκλείδωμα Pro (Demo)';

  @override
  String get paywallClose => 'Κλείσιμο';

  @override
  String get authPlayNote => 'Έκδοση Google Play — ακολουθεί το Firebase Auth.';

  @override
  String get uploadPicked => 'Επιλέχθηκε βίντεο';

  @override
  String get uploadQuotaFull => 'Το όριο συμπληρώθηκε — αναβαθμίστε σε Pro.';

  @override
  String get uploadNavTitle => 'Μεταφόρτωση βίντεο';

  @override
  String get paywallBillingNote =>
      'Το Play Billing (συνδρομή Google Play) θα συνδεθεί στη συνέχεια.';

  @override
  String commentsCount(int count) {
    return '$count σχόλια';
  }

  @override
  String uploadsLeft(int count) {
    return 'Απομένουν $count μεταφορτώσεις αυτόν τον μήνα';
  }

  @override
  String get language => 'Γλώσσα';
}
