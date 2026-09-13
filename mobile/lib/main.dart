import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'l10n/app_localizations.dart';
import 'theme.dart';
import 'screens/auth_screen.dart';
import 'screens/home_shell.dart';
import 'widgets/ui_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CarDoctorApp());
}

class CarDoctorApp extends StatelessWidget {
  const CarDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState()..bootstrap(),
      child: Consumer<AppState>(
        builder: (context, state, _) {
          return MaterialApp(
            title: 'CarDoctor',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            locale: state.ready ? state.locale : null,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const _Root(),
          );
        },
      ),
    );
  }
}

class _Root extends StatelessWidget {
  const _Root();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    if (!state.ready) {
      return const Scaffold(
        body: AtmosphereBackground(
          dark: true,
          child: Center(
            child: SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
            ),
          ),
        ),
      );
    }
    return state.isAuthenticated ? const HomeShell() : const AuthScreen();
  }
}
