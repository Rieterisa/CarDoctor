import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import '../widgets/ui_kit.dart';
import 'result_screen.dart';

class DiagnoseScreen extends StatefulWidget {
  const DiagnoseScreen({super.key});

  @override
  State<DiagnoseScreen> createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen> {
  final vinCtrl = TextEditingController();
  final dtcCtrl = TextEditingController();
  bool loading = false;
  String? error;

  @override
  void dispose() {
    vinCtrl.dispose();
    dtcCtrl.dispose();
    super.dispose();
  }

  Future<void> _run() async {
    final l10n = AppLocalizations.of(context);
    setState(() {
      loading = true;
      error = null;
    });
    try {
      final result = await context.read<AppState>().diagnose(
            vin: vinCtrl.text,
            dtc: dtcCtrl.text,
            invalidDtcMessage: l10n.errorDtcInvalid,
            notFoundMessage: l10n.errorDtcNotFound,
          );
      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ResultScreen(result: result)),
      );
    } catch (e) {
      setState(() => error = e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: AtmosphereBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 28),
            children: [
              const BrandMark(size: 26)
                  .animate()
                  .fadeIn(duration: 400.ms),
              const SizedBox(height: 28),
              Text(l10n.diagnoseHeadline, style: AppTheme.display(size: 36))
                  .animate()
                  .fadeIn(delay: 60.ms)
                  .slideY(begin: 0.08),
              const SizedBox(height: 10),
              Text(l10n.diagnoseSubtitle, style: AppTheme.body(size: 15, color: AppTheme.muted))
                  .animate()
                  .fadeIn(delay: 100.ms),
              const SizedBox(height: 28),
              TextField(
                controller: vinCtrl,
                textCapitalization: TextCapitalization.characters,
                style: AppTheme.body(size: 16, weight: FontWeight.w600),
                decoration: InputDecoration(
                  labelText: l10n.diagnoseVin,
                  hintText: '1HGCM82633A004352',
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: dtcCtrl,
                textCapitalization: TextCapitalization.characters,
                style: AppTheme.body(size: 16, weight: FontWeight.w700),
                decoration: InputDecoration(
                  labelText: l10n.diagnoseDtc,
                  hintText: 'P0300',
                ),
              ),
              if (error != null) ...[
                const SizedBox(height: 12),
                Text(error!, style: AppTheme.body(size: 13, color: AppTheme.danger, weight: FontWeight.w600)),
              ],
              const SizedBox(height: 18),
              PrimaryCta(label: l10n.diagnoseSubmit, onPressed: _run, loading: loading, icon: Icons.troubleshoot)
                  .animate()
                  .fadeIn(delay: 140.ms),
              const SizedBox(height: 32),
              Text(l10n.diagnoseSamples, style: AppTheme.body(size: 13, weight: FontWeight.w800, color: AppTheme.muted)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: state.catalog.sampleCodes
                    .map(
                      (c) => InkWell(
                        onTap: () => setState(() => dtcCtrl.text = c),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                          decoration: BoxDecoration(
                            color: dtcCtrl.text.toUpperCase() == c ? AppTheme.accentDeep : AppTheme.surface,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: dtcCtrl.text.toUpperCase() == c
                                  ? AppTheme.accentDeep
                                  : AppTheme.ink.withValues(alpha: 0.08),
                            ),
                          ),
                          child: Text(
                            c,
                            style: AppTheme.body(
                              size: 13,
                              weight: FontWeight.w800,
                              color: dtcCtrl.text.toUpperCase() == c ? Colors.white : AppTheme.accentDeep,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 36),
              Text(l10n.legalDisclaimer, style: AppTheme.body(size: 11, color: AppTheme.muted)),
            ],
          ),
        ),
      ),
    );
  }
}
