import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../models.dart';
import '../theme.dart';
import '../widgets/ui_kit.dart';
import 'paywall_screen.dart';
import 'scene3d_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});

  final DiagnosisResult result;

  Color _severityColor(String s) {
    switch (s) {
      case 'low':
        return AppTheme.success;
      case 'medium':
        return AppTheme.warning;
      case 'high':
        return AppTheme.danger;
      default:
        return AppTheme.ink;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l10n = AppLocalizations.of(context);
    final tr = state.preferTurkish;
    final videos = state.videosFor(result.entry.code);
    final severity = _severityColor(result.entry.severity);

    return Scaffold(
      body: AtmosphereBackground(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: AppTheme.canvas.withValues(alpha: 0.92),
              title: Text(result.entry.code, style: AppTheme.display(size: 22)),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(22, 8, 22, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text(result.vehicle.displayName, style: AppTheme.display(size: 28))
                      .animate()
                      .fadeIn(duration: 400.ms),
                  const SizedBox(height: 4),
                  Text(
                    result.vehicle.vin,
                    style: AppTheme.body(size: 12, color: AppTheme.muted).copyWith(fontFamily: 'monospace'),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          severity.withValues(alpha: 0.16),
                          AppTheme.surface,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: severity.withValues(alpha: 0.35)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: severity,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                result.entry.severity.toUpperCase(),
                                style: AppTheme.body(size: 11, weight: FontWeight.w800, color: Colors.white),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              result.part.name(tr),
                              style: AppTheme.body(size: 13, weight: FontWeight.w800, color: AppTheme.accentDeep),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(result.entry.title(tr), style: AppTheme.display(size: 22)),
                        const SizedBox(height: 8),
                        Text(result.entry.description(tr), style: AppTheme.body(size: 14, color: AppTheme.muted)),
                        const SizedBox(height: 12),
                        Text(result.entry.safety(tr), style: AppTheme.body(size: 13, color: AppTheme.warning, weight: FontWeight.w600)),
                      ],
                    ),
                  ).animate().fadeIn(delay: 80.ms).slideY(begin: 0.06),
                  const SizedBox(height: 28),
                  Text(l10n.resultSteps, style: AppTheme.display(size: 20)),
                  const SizedBox(height: 14),
                  ...result.entry.steps(tr).asMap().entries.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 28,
                                child: Text(
                                  '${e.key + 1}'.padLeft(2, '0'),
                                  style: AppTheme.display(size: 18, color: AppTheme.accentDeep),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(child: Text(e.value, style: AppTheme.body(size: 15))),
                            ],
                          ),
                        ),
                      ),
                  const SizedBox(height: 18),
                  Text(l10n.resultVideos, style: AppTheme.display(size: 20)),
                  const SizedBox(height: 10),
                  if (videos.isEmpty)
                    Text(l10n.resultVideosEmpty, style: AppTheme.body(size: 14, color: AppTheme.muted))
                  else
                    ...videos.map(
                      (v) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppTheme.accentSoft,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.play_arrow_rounded, color: AppTheme.accentDeep),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(v.title, style: AppTheme.body(size: 14, weight: FontWeight.w700)),
                                  Text(
                                    '${v.authorName} · ${v.durationSeconds ~/ 60}m',
                                    style: AppTheme.body(size: 12, color: AppTheme.muted),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),
                  PrimaryCta(
                    label: l10n.resultView3d,
                    icon: Icons.view_in_ar,
                    dark: true,
                    onPressed: () async {
                      if (!state.isPremium) {
                        final unlocked = await Navigator.of(context).push<bool>(
                          MaterialPageRoute(builder: (_) => const PaywallScreen()),
                        );
                        if (unlocked != true || !context.mounted) return;
                      }
                      if (!context.mounted) return;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Scene3DScreen(
                            partName: result.part.name(tr),
                            entityName: result.part.usdzEntityName,
                            vehicle: result.vehicle,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  Text(l10n.legalDisclaimer, style: AppTheme.body(size: 11, color: AppTheme.muted)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
