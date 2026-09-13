import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import 'paywall_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final titleCtrl = TextEditingController();
  final dtcCtrl = TextEditingController();
  final summaryCtrl = TextEditingController();
  String? videoPath;
  String? message;
  bool loading = false;

  @override
  void dispose() {
    titleCtrl.dispose();
    dtcCtrl.dispose();
    summaryCtrl.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    final file = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (file != null) setState(() => videoPath = file.path);
  }

  Future<void> _submit() async {
    final state = context.read<AppState>();
    final l10n = AppLocalizations.of(context);
    setState(() {
      loading = true;
      message = null;
    });
    try {
      if (state.remainingVideoQuota() <= 0) {
        final ok = await Navigator.of(context).push<bool>(
          MaterialPageRoute(builder: (_) => const PaywallScreen()),
        );
        if (ok != true) return;
      }
      if (titleCtrl.text.trim().isEmpty) {
        setState(() => message = l10n.uploadErrorTitle);
        return;
      }
      state.submitVideo(
        dtcCode: dtcCtrl.text,
        title: titleCtrl.text,
        summary: summaryCtrl.text,
        localPath: videoPath,
      );
      setState(() {
        message = l10n.uploadSuccess;
        titleCtrl.clear();
        dtcCtrl.clear();
        summaryCtrl.clear();
        videoPath = null;
      });
    } catch (e) {
      final msg = e.toString();
      setState(() => message = msg.contains('quota') ? l10n.uploadQuotaFull : msg.replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final remaining = context.watch<AppState>().remainingVideoQuota();
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.uploadNavTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleCtrl,
            decoration: InputDecoration(labelText: l10n.uploadTitle, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: dtcCtrl,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(labelText: l10n.diagnoseDtc, hintText: 'P0300', border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: summaryCtrl,
            maxLines: 3,
            decoration: InputDecoration(labelText: l10n.uploadSummary, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _pick,
            icon: const Icon(Icons.video_library_outlined),
            label: Text(videoPath == null ? l10n.uploadPick : l10n.uploadPicked),
          ),
          const SizedBox(height: 8),
          Text(l10n.uploadsLeft(remaining), style: const TextStyle(color: AppTheme.muted, fontSize: 13)),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: loading ? null : _submit,
            child: loading ? const CircularProgressIndicator(color: Colors.white) : Text(l10n.uploadSubmit),
          ),
          if (message != null) ...[
            const SizedBox(height: 12),
            Text(message!, style: const TextStyle(color: AppTheme.accent)),
          ],
        ],
      ),
    );
  }
}
