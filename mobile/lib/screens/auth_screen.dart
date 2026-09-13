import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import '../widgets/ui_kit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: AtmosphereBackground(
        dark: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 20, 28, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BrandMark(size: 28, color: Colors.white)
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .slideX(begin: -0.08),
                const Spacer(flex: 2),
                Text(
                  'CarDoctor',
                  style: AppTheme.display(size: 56, color: Colors.white, height: 0.95),
                )
                    .animate()
                    .fadeIn(delay: 80.ms, duration: 550.ms)
                    .slideY(begin: 0.12, curve: Curves.easeOutCubic),
                const SizedBox(height: 16),
                Text(
                  l10n.authTagline,
                  style: AppTheme.body(size: 18, color: Colors.white.withValues(alpha: 0.82), height: 1.4),
                )
                    .animate()
                    .fadeIn(delay: 160.ms, duration: 550.ms),
                const SizedBox(height: 28),
                Container(
                  height: 3,
                  width: 72,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppTheme.fault, AppTheme.accent]),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ).animate().scaleX(delay: 220.ms, duration: 450.ms, alignment: Alignment.centerLeft),
                const Spacer(flex: 3),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.ink,
                      textStyle: AppTheme.body(size: 16, weight: FontWeight.w800),
                    ),
                    onPressed: () => context.read<AppState>().signInDemo(),
                    child: Text(l10n.authDemo),
                  ),
                ).animate().fadeIn(delay: 280.ms).slideY(begin: 0.2),
                const SizedBox(height: 14),
                Text(
                  l10n.authPlayNote,
                  style: AppTheme.body(size: 12, color: Colors.white54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
