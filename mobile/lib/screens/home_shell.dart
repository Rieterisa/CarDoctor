import 'package:flutter/material.dart';

import 'community_screen.dart';
import 'diagnose_screen.dart';
import 'profile_screen.dart';
import 'upload_screen.dart';
import '../theme.dart';

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
    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        indicatorColor: AppTheme.accentSoft,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.search), label: 'Teşhis'),
          NavigationDestination(icon: Icon(Icons.groups_outlined), label: 'Topluluk'),
          NavigationDestination(icon: Icon(Icons.video_call_outlined), label: 'Yükle'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}
