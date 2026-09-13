// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnosticar';

  @override
  String get tabCommunity => 'Comunidad';

  @override
  String get tabUpload => 'Subir';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get authTagline =>
      'VIN + código de fallo → pieza, pasos de reparación y guía 3D de la comunidad.';

  @override
  String get authDemo => 'Continuar con Demo';

  @override
  String get diagnoseHeadline => 'Encuentra el fallo';

  @override
  String get diagnoseSubtitle =>
      'Introduce un VIN y un código de fallo concretos; el diagnóstico se resuelve por marca.';

  @override
  String get diagnoseVin => 'VIN / Chasis';

  @override
  String get diagnoseDtc => 'Código de fallo (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosticar';

  @override
  String get diagnoseSamples => 'Prueba un código habitual';

  @override
  String get legalDisclaimer =>
      'Solo con fines informativos. No sustituye el consejo de un taller profesional. Siga las medidas de seguridad.';

  @override
  String get errorDtcInvalid => 'Introduce un código válido como P0300.';

  @override
  String get errorDtcNotFound =>
      'Este código de fallo aún no está en el catálogo.';

  @override
  String get resultSteps => 'Pasos de reparación';

  @override
  String get resultVideos => 'Vídeos de la comunidad';

  @override
  String get resultVideosEmpty =>
      'Aún no hay vídeos — sé el primero en subir uno.';

  @override
  String get resultView3d => 'Ver la pieza defectuosa en 3D';

  @override
  String get scene3dTitle => 'Pieza resaltada';

  @override
  String get scene3dHint =>
      'Arrastra para rotar. La marca naranja indica el componente probablemente defectuoso.';

  @override
  String get scene3dNav => 'Vehículo 3D';

  @override
  String get communityFilter => 'Filtrar por DTC';

  @override
  String get communityComments => 'Comentarios';

  @override
  String get communityCommentPlaceholder => 'Comparte tu solución…';

  @override
  String get communityCommentSend => 'Enviar';

  @override
  String get uploadDetails => 'Detalles';

  @override
  String get uploadTitle => 'Título';

  @override
  String get uploadSummary => '¿Qué lo solucionó?';

  @override
  String get uploadPick => 'Elegir un vídeo';

  @override
  String get uploadSubmit => 'Enviar para revisión';

  @override
  String get uploadSuccess =>
      'Subido. Pendiente de moderación (los admins publican al instante).';

  @override
  String get uploadErrorTitle => 'El título es obligatorio.';

  @override
  String get profileSubscription => 'Suscripción';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratis';

  @override
  String get profileUpgrade => 'Pasar a Pro';

  @override
  String get profileMyVideos => 'Mis vídeos';

  @override
  String get profileMyVideosEmpty => 'Aún no hay subidas.';

  @override
  String get profileSignOut => 'Cerrar sesión';

  @override
  String get paywallSubtitle =>
      'Desbloquea el resaltado 3D de piezas, más cuota de vídeo e historial de reparaciones.';

  @override
  String get paywallBenefit3d => 'Localización interactiva de fallos en 3D';

  @override
  String get paywallBenefitVideo => 'Hasta 30 subidas a la comunidad / mes';

  @override
  String get paywallBenefitHistory => 'Historial de diagnósticos ilimitado';

  @override
  String get paywallDemoUnlock => 'Desbloquear Pro (Demo)';

  @override
  String get paywallClose => 'Cerrar';

  @override
  String get authPlayNote =>
      'Versión de Google Play — Firebase Auth será el siguiente paso.';

  @override
  String get uploadPicked => 'Vídeo seleccionado';

  @override
  String get uploadQuotaFull => 'Cuota agotada — pasa a Pro.';

  @override
  String get uploadNavTitle => 'Subir vídeo';

  @override
  String get paywallBillingNote =>
      'Play Billing (suscripción de Google Play) se conectará después.';

  @override
  String commentsCount(int count) {
    return '$count comentarios';
  }

  @override
  String uploadsLeft(int count) {
    return 'Te quedan $count subidas este mes';
  }

  @override
  String get language => 'Idioma';
}

/// The translations for Spanish Castilian, as used in Latin America and the Caribbean (`es_419`).
class AppLocalizationsEs419 extends AppLocalizationsEs {
  AppLocalizationsEs419() : super('es_419');

  @override
  String get tabDiagnose => 'Diagnosticar';

  @override
  String get tabCommunity => 'Comunidad';

  @override
  String get tabUpload => 'Subir';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get authTagline =>
      'VIN + código de falla → pieza, pasos de reparación y guía 3D de la comunidad.';

  @override
  String get authDemo => 'Continuar con Demo';

  @override
  String get diagnoseHeadline => 'Encuentra la falla';

  @override
  String get diagnoseSubtitle =>
      'Ingresa un VIN y un código de falla específicos; el diagnóstico se resuelve por marca.';

  @override
  String get diagnoseVin => 'VIN / Chasis';

  @override
  String get diagnoseDtc => 'Código de falla (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosticar';

  @override
  String get diagnoseSamples => 'Prueba un código común';

  @override
  String get legalDisclaimer =>
      'Solo con fines informativos. No sustituye el consejo de un taller profesional. Sigue las medidas de seguridad.';

  @override
  String get errorDtcInvalid => 'Ingresa un código válido como P0300.';

  @override
  String get errorDtcNotFound =>
      'Este código de falla aún no está en el catálogo.';

  @override
  String get resultSteps => 'Pasos de reparación';

  @override
  String get resultVideos => 'Videos de la comunidad';

  @override
  String get resultVideosEmpty =>
      'Aún no hay videos — sé el primero en subir uno.';

  @override
  String get resultView3d => 'Ver la pieza defectuosa en 3D';

  @override
  String get scene3dTitle => 'Pieza resaltada';

  @override
  String get scene3dHint =>
      'Arrastra para rotar. La marca naranja indica el componente probablemente defectuoso.';

  @override
  String get scene3dNav => 'Vehículo 3D';

  @override
  String get communityFilter => 'Filtrar por DTC';

  @override
  String get communityComments => 'Comentarios';

  @override
  String get communityCommentPlaceholder => 'Comparte tu solución…';

  @override
  String get communityCommentSend => 'Enviar';

  @override
  String get uploadDetails => 'Detalles';

  @override
  String get uploadTitle => 'Título';

  @override
  String get uploadSummary => '¿Qué lo solucionó?';

  @override
  String get uploadPick => 'Elegir un video';

  @override
  String get uploadSubmit => 'Enviar para revisión';

  @override
  String get uploadSuccess =>
      'Subido. Pendiente de moderación (los admins publican al instante).';

  @override
  String get uploadErrorTitle => 'El título es obligatorio.';

  @override
  String get profileSubscription => 'Suscripción';

  @override
  String get profilePlan => 'Plan';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Gratis';

  @override
  String get profileUpgrade => 'Pasar a Pro';

  @override
  String get profileMyVideos => 'Mis videos';

  @override
  String get profileMyVideosEmpty => 'Aún no hay subidas.';

  @override
  String get profileSignOut => 'Cerrar sesión';

  @override
  String get paywallSubtitle =>
      'Desbloquea el resaltado 3D de piezas, más cuota de video e historial de reparaciones.';

  @override
  String get paywallBenefit3d => 'Localización interactiva de fallas en 3D';

  @override
  String get paywallBenefitVideo => 'Hasta 30 subidas a la comunidad / mes';

  @override
  String get paywallBenefitHistory => 'Historial de diagnósticos ilimitado';

  @override
  String get paywallDemoUnlock => 'Desbloquear Pro (Demo)';

  @override
  String get paywallClose => 'Cerrar';

  @override
  String get authPlayNote =>
      'Versión de Google Play — Firebase Auth será el siguiente paso.';

  @override
  String get uploadPicked => 'Video seleccionado';

  @override
  String get uploadQuotaFull => 'Cuota agotada — pasa a Pro.';

  @override
  String get uploadNavTitle => 'Subir video';

  @override
  String get paywallBillingNote =>
      'Play Billing (suscripción de Google Play) se conectará después.';

  @override
  String commentsCount(int count) {
    return '$count comentarios';
  }

  @override
  String uploadsLeft(int count) {
    return 'Te quedan $count subidas este mes';
  }

  @override
  String get language => 'Idioma';
}
