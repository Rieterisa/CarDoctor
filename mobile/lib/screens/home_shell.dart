import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../theme.dart';
import 'community_screen.dart';
import 'diagnose_screen.dart';
import 'profile_screen.dart';
import 'upload_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;

  final pages = const [
    DiagnoseScreen(),
    CommunityScreen(),
    UploadScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          border: Border(top: BorderSide(color: AppTheme.ink.withValues(alpha: 0.06))),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (i) => setState(() => index = i),
          destinations: [
            NavigationDestination(icon: const Icon(Icons.troubleshoot_outlined), selectedIcon: const Icon(Icons.troubleshoot), label: l10n.tabDiagnose),
            NavigationDestination(icon: const Icon(Icons.forum_outlined), selectedIcon: const Icon(Icons.forum), label: l10n.tabCommunity),
            NavigationDestination(icon: const Icon(Icons.videocam_outlined), selectedIcon: const Icon(Icons.videocam), label: l10n.tabUpload),
            NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: const Icon(Icons.person), label: l10n.tabProfile),
          ],
        ),
      ),
    );
  }
}
