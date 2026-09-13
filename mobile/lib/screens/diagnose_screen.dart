import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../theme.dart';
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
    setState(() {
      loading = true;
      error = null;
    });
    try {
      final result = await context.read<AppState>().diagnose(
            vin: vinCtrl.text,
            dtc: dtcCtrl.text,
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
    return Scaffold(
      appBar: AppBar(title: const Text('CarDoctor')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Arızayı bul', style: GoogleFonts.fraunces(fontSize: 28, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const Text(
            'Şasi numarasını (VIN) ve OBD arıza kodunu gir.',
            style: TextStyle(color: AppTheme.muted),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              children: [
                TextField(
                  controller: vinCtrl,
                  textCapitalization: TextCapitalization.characters,
                  decoration: const InputDecoration(
                    labelText: 'VIN / Şasi',
                    hintText: '1HGCM82633A004352',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: dtcCtrl,
                  textCapitalization: TextCapitalization.characters,
                  decoration: const InputDecoration(
                    labelText: 'Arıza kodu (DTC)',
                    hintText: 'P0300',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: loading ? null : _run,
                  child: loading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Teşhis et'),
                ),
              ],
            ),
          ),
          if (error != null) ...[
            const SizedBox(height: 12),
            Text(error!, style: const TextStyle(color: AppTheme.danger)),
          ],
          const SizedBox(height: 24),
          const Text('Yaygın bir kod dene', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: state.catalog.sampleCodes
                .map(
                  (c) => ActionChip(
                    label: Text(c),
                    onPressed: () => setState(() => dtcCtrl.text = c),
                    backgroundColor: AppTheme.accentSoft,
                    labelStyle: const TextStyle(color: AppTheme.accent, fontWeight: FontWeight.w600),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            'Yalnızca bilgilendirme amaçlıdır. Profesyonel servis tavsiyesinin yerini tutmaz.',
            style: TextStyle(fontSize: 11, color: AppTheme.muted),
          ),
        ],
      ),
    );
  }
}
