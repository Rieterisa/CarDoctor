import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import '../widgets/ui_kit.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: AtmosphereBackground(
        dark: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(l10n.paywallClose, style: AppTheme.body(color: Colors.white70, weight: FontWeight.w700)),
                  ),
                ),
                const Spacer(),
                Text('CarDoctor Pro', style: AppTheme.display(size: 40, color: Colors.white))
                    .animate()
                    .fadeIn()
                    .slideY(begin: 0.1),
                const SizedBox(height: 12),
                Text(l10n.paywallSubtitle, style: AppTheme.body(size: 16, color: Colors.white70)),
                const SizedBox(height: 28),
                _Benefit(Icons.view_in_ar, l10n.paywallBenefit3d),
                _Benefit(Icons.video_library, l10n.paywallBenefitVideo),
                _Benefit(Icons.history, l10n.paywallBenefitHistory),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: AppTheme.fault, foregroundColor: Colors.white),
                    onPressed: () async {
                      await context.read<AppState>().setPremium(true);
                      if (context.mounted) Navigator.pop(context, true);
                    },
                    child: Text(l10n.paywallDemoUnlock),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.paywallBillingNote,
                  style: AppTheme.body(size: 12, color: Colors.white54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Benefit extends StatelessWidget {
  const _Benefit(this.icon, this.text);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.accent),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: AppTheme.body(size: 15, color: Colors.white))),
        ],
      ),
    );
  }
}
