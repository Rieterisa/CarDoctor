// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get tabDiagnose => 'Diagnosticar';

  @override
  String get tabCommunity => 'Comunidade';

  @override
  String get tabUpload => 'Enviar';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get authTagline =>
      'VIN + código de falha → peça, passos de reparo e orientação 3D da comunidade.';

  @override
  String get authDemo => 'Continuar com Demo';

  @override
  String get diagnoseHeadline => 'Encontre a falha';

  @override
  String get diagnoseSubtitle =>
      'Informe um VIN e um código de falha específicos — o diagnóstico é por marca do veículo.';

  @override
  String get diagnoseVin => 'VIN / Chassi';

  @override
  String get diagnoseDtc => 'Código de falha (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosticar';

  @override
  String get diagnoseSamples => 'Experimente um código comum';

  @override
  String get legalDisclaimer =>
      'Apenas para informação. Não substitui orientação profissional. Siga os procedimentos de segurança.';

  @override
  String get errorDtcInvalid => 'Informe um código válido como P0300.';

  @override
  String get errorDtcNotFound =>
      'Este código de falha ainda não está no catálogo.';

  @override
  String get resultSteps => 'Passos de reparo';

  @override
  String get resultVideos => 'Vídeos da comunidade';

  @override
  String get resultVideosEmpty =>
      'Ainda não há vídeos — seja o primeiro a enviar.';

  @override
  String get resultView3d => 'Ver a peça com falha em 3D';

  @override
  String get scene3dTitle => 'Peça destacada';

  @override
  String get scene3dHint =>
      'Arraste para girar. A marca laranja mostra o componente provavelmente com falha.';

  @override
  String get scene3dNav => 'Veículo 3D';

  @override
  String get communityFilter => 'Filtrar por DTC';

  @override
  String get communityComments => 'Comentários';

  @override
  String get communityCommentPlaceholder => 'Compartilhe sua correção…';

  @override
  String get communityCommentSend => 'Enviar';

  @override
  String get uploadDetails => 'Detalhes';

  @override
  String get uploadTitle => 'Título';

  @override
  String get uploadSummary => 'O que resolveu?';

  @override
  String get uploadPick => 'Escolher um vídeo';

  @override
  String get uploadSubmit => 'Enviar para análise';

  @override
  String get uploadSuccess =>
      'Enviado. Aguardando moderação (admins publicam na hora).';

  @override
  String get uploadErrorTitle => 'O título é obrigatório.';

  @override
  String get profileSubscription => 'Assinatura';

  @override
  String get profilePlan => 'Plano';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Grátis';

  @override
  String get profileUpgrade => 'Assinar o Pro';

  @override
  String get profileMyVideos => 'Meus vídeos';

  @override
  String get profileMyVideosEmpty => 'Ainda não há envios.';

  @override
  String get profileSignOut => 'Sair';

  @override
  String get paywallSubtitle =>
      'Desbloqueie destaque 3D de peças, mais cota de vídeo e histórico de reparos.';

  @override
  String get paywallBenefit3d => 'Localização interativa de falhas em 3D';

  @override
  String get paywallBenefitVideo => 'Até 30 envios à comunidade / mês';

  @override
  String get paywallBenefitHistory => 'Histórico de diagnósticos ilimitado';

  @override
  String get paywallDemoUnlock => 'Desbloquear Pro (Demo)';

  @override
  String get paywallClose => 'Fechar';

  @override
  String get authPlayNote => 'Versão Google Play — Firebase Auth vem a seguir.';

  @override
  String get uploadPicked => 'Vídeo selecionado';

  @override
  String get uploadQuotaFull => 'Cota esgotada — assine o Pro.';

  @override
  String get uploadNavTitle => 'Enviar vídeo';

  @override
  String get paywallBillingNote =>
      'O Play Billing (assinatura Google Play) será conectado em seguida.';

  @override
  String commentsCount(int count) {
    return '$count comentários';
  }

  @override
  String uploadsLeft(int count) {
    return '$count envios restantes neste mês';
  }

  @override
  String get language => 'Idioma';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get tabDiagnose => 'Diagnosticar';

  @override
  String get tabCommunity => 'Comunidade';

  @override
  String get tabUpload => 'Enviar';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get authTagline =>
      'VIN + código de falha → peça, passos de reparo e orientação 3D da comunidade.';

  @override
  String get authDemo => 'Continuar com Demo';

  @override
  String get diagnoseHeadline => 'Encontre a falha';

  @override
  String get diagnoseSubtitle =>
      'Informe um VIN e um código de falha específicos — o diagnóstico é por marca do veículo.';

  @override
  String get diagnoseVin => 'VIN / Chassi';

  @override
  String get diagnoseDtc => 'Código de falha (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosticar';

  @override
  String get diagnoseSamples => 'Experimente um código comum';

  @override
  String get legalDisclaimer =>
      'Apenas para informação. Não substitui orientação profissional. Siga os procedimentos de segurança.';

  @override
  String get errorDtcInvalid => 'Informe um código válido como P0300.';

  @override
  String get errorDtcNotFound =>
      'Este código de falha ainda não está no catálogo.';

  @override
  String get resultSteps => 'Passos de reparo';

  @override
  String get resultVideos => 'Vídeos da comunidade';

  @override
  String get resultVideosEmpty =>
      'Ainda não há vídeos — seja o primeiro a enviar.';

  @override
  String get resultView3d => 'Ver a peça com falha em 3D';

  @override
  String get scene3dTitle => 'Peça destacada';

  @override
  String get scene3dHint =>
      'Arraste para girar. A marca laranja mostra o componente provavelmente com falha.';

  @override
  String get scene3dNav => 'Veículo 3D';

  @override
  String get communityFilter => 'Filtrar por DTC';

  @override
  String get communityComments => 'Comentários';

  @override
  String get communityCommentPlaceholder => 'Compartilhe sua correção…';

  @override
  String get communityCommentSend => 'Enviar';

  @override
  String get uploadDetails => 'Detalhes';

  @override
  String get uploadTitle => 'Título';

  @override
  String get uploadSummary => 'O que resolveu?';

  @override
  String get uploadPick => 'Escolher um vídeo';

  @override
  String get uploadSubmit => 'Enviar para análise';

  @override
  String get uploadSuccess =>
      'Enviado. Aguardando moderação (admins publicam na hora).';

  @override
  String get uploadErrorTitle => 'O título é obrigatório.';

  @override
  String get profileSubscription => 'Assinatura';

  @override
  String get profilePlan => 'Plano';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Grátis';

  @override
  String get profileUpgrade => 'Assinar o Pro';

  @override
  String get profileMyVideos => 'Meus vídeos';

  @override
  String get profileMyVideosEmpty => 'Ainda não há envios.';

  @override
  String get profileSignOut => 'Sair';

  @override
  String get paywallSubtitle =>
      'Desbloqueie destaque 3D de peças, mais cota de vídeo e histórico de reparos.';

  @override
  String get paywallBenefit3d => 'Localização interativa de falhas em 3D';

  @override
  String get paywallBenefitVideo => 'Até 30 envios à comunidade / mês';

  @override
  String get paywallBenefitHistory => 'Histórico de diagnósticos ilimitado';

  @override
  String get paywallDemoUnlock => 'Desbloquear Pro (Demo)';

  @override
  String get paywallClose => 'Fechar';

  @override
  String get authPlayNote => 'Versão Google Play — Firebase Auth vem a seguir.';

  @override
  String get uploadPicked => 'Vídeo selecionado';

  @override
  String get uploadQuotaFull => 'Cota esgotada — assine o Pro.';

  @override
  String get uploadNavTitle => 'Enviar vídeo';

  @override
  String get paywallBillingNote =>
      'O Play Billing (assinatura Google Play) será conectado em seguida.';

  @override
  String commentsCount(int count) {
    return '$count comentários';
  }

  @override
  String uploadsLeft(int count) {
    return '$count envios restantes neste mês';
  }

  @override
  String get language => 'Idioma';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get tabDiagnose => 'Diagnosticar';

  @override
  String get tabCommunity => 'Comunidade';

  @override
  String get tabUpload => 'Carregar';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get authTagline =>
      'VIN + código de avaria → peça, passos de reparação e orientação 3D da comunidade.';

  @override
  String get authDemo => 'Continuar com Demo';

  @override
  String get diagnoseHeadline => 'Encontre a avaria';

  @override
  String get diagnoseSubtitle =>
      'Introduza um VIN e um código de avaria específicos — o diagnóstico é por marca.';

  @override
  String get diagnoseVin => 'VIN / Chassis';

  @override
  String get diagnoseDtc => 'Código de avaria (DTC)';

  @override
  String get diagnoseSubmit => 'Diagnosticar';

  @override
  String get diagnoseSamples => 'Experimente um código comum';

  @override
  String get legalDisclaimer =>
      'Apenas para fins informativos. Não substitui aconselhamento profissional. Siga os procedimentos de segurança.';

  @override
  String get errorDtcInvalid => 'Introduza um código válido como P0300.';

  @override
  String get errorDtcNotFound =>
      'Este código de avaria ainda não está no catálogo.';

  @override
  String get resultSteps => 'Passos de reparação';

  @override
  String get resultVideos => 'Vídeos da comunidade';

  @override
  String get resultVideosEmpty =>
      'Ainda não há vídeos — seja o primeiro a carregar.';

  @override
  String get resultView3d => 'Ver a peça com avaria em 3D';

  @override
  String get scene3dTitle => 'Peça destacada';

  @override
  String get scene3dHint =>
      'Arraste para rodar. A marca laranja mostra o componente provavelmente com avaria.';

  @override
  String get scene3dNav => 'Veículo 3D';

  @override
  String get communityFilter => 'Filtrar por DTC';

  @override
  String get communityComments => 'Comentários';

  @override
  String get communityCommentPlaceholder => 'Partilhe a sua correção…';

  @override
  String get communityCommentSend => 'Enviar';

  @override
  String get uploadDetails => 'Detalhes';

  @override
  String get uploadTitle => 'Título';

  @override
  String get uploadSummary => 'O que resolveu?';

  @override
  String get uploadPick => 'Escolher um vídeo';

  @override
  String get uploadSubmit => 'Submeter para análise';

  @override
  String get uploadSuccess =>
      'Carregado. A aguardar moderação (os admins publicam de imediato).';

  @override
  String get uploadErrorTitle => 'O título é obrigatório.';

  @override
  String get profileSubscription => 'Subscrição';

  @override
  String get profilePlan => 'Plano';

  @override
  String get profilePlanPro => 'Pro';

  @override
  String get profilePlanFree => 'Grátis';

  @override
  String get profileUpgrade => 'Atualizar para Pro';

  @override
  String get profileMyVideos => 'Os meus vídeos';

  @override
  String get profileMyVideosEmpty => 'Ainda não há carregamentos.';

  @override
  String get profileSignOut => 'Terminar sessão';

  @override
  String get paywallSubtitle =>
      'Desbloqueie o destaque 3D de peças, mais quota de vídeo e histórico de reparações.';

  @override
  String get paywallBenefit3d => 'Localização interativa de avarias em 3D';

  @override
  String get paywallBenefitVideo =>
      'Até 30 carregamentos para a comunidade / mês';

  @override
  String get paywallBenefitHistory => 'Histórico de diagnósticos ilimitado';

  @override
  String get paywallDemoUnlock => 'Desbloquear Pro (Demo)';

  @override
  String get paywallClose => 'Fechar';

  @override
  String get authPlayNote =>
      'Versão Google Play — Firebase Auth é o próximo passo.';

  @override
  String get uploadPicked => 'Vídeo selecionado';

  @override
  String get uploadQuotaFull => 'Quota esgotada — atualize para Pro.';

  @override
  String get uploadNavTitle => 'Carregar vídeo';

  @override
  String get paywallBillingNote =>
      'O Play Billing (subscrição Google Play) será ligado a seguir.';

  @override
  String commentsCount(int count) {
    return '$count comentários';
  }

  @override
  String uploadsLeft(int count) {
    return '$count carregamentos restantes este mês';
  }

  @override
  String get language => 'Idioma';
}
