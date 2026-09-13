import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import 'paywall_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _localeChoices = <(String label, Locale locale)>[
    ('English', Locale('en')),
    ('Türkçe', Locale('tr')),
    ('Español', Locale('es')),
    ('Español (LATAM)', Locale('es', '419')),
    ('Português (BR)', Locale('pt', 'BR')),
    ('Português (PT)', Locale('pt', 'PT')),
    ('हिन्दी', Locale('hi')),
    ('Bahasa Indonesia', Locale('id')),
    ('العربية', Locale('ar')),
    ('Русский', Locale('ru')),
    ('Deutsch', Locale('de')),
    ('Français', Locale('fr')),
    ('日本語', Locale('ja')),
    ('한국어', Locale('ko')),
    ('中文 (简体)', Locale('zh')),
    ('中文 (繁體)', Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')),
    ('Tiếng Việt', Locale('vi')),
    ('ไทย', Locale('th')),
    ('Italiano', Locale('it')),
    ('Polski', Locale('pl')),
    ('Nederlands', Locale('nl')),
    ('Bahasa Melayu', Locale('ms')),
    ('Filipino', Locale('fil')),
    ('اردو', Locale('ur')),
    ('বাংলা', Locale('bn')),
    ('فارسی', Locale('fa')),
    ('Українська', Locale('uk')),
    ('Română', Locale('ro')),
    ('Čeština', Locale('cs')),
    ('Svenska', Locale('sv')),
    ('Ελληνικά', Locale('el')),
    ('עברית', Locale('he')),
    ('Magyar', Locale('hu')),
    ('Dansk', Locale('da')),
    ('Suomi', Locale('fi')),
    ('Norsk', Locale('nb')),
    ('Slovenčina', Locale('sk')),
    ('Hrvatski', Locale('hr')),
    ('Български', Locale('bg')),
    ('Kiswahili', Locale('sw')),
    ('Català', Locale('ca')),
  ];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l10n = AppLocalizations.of(context);
    final user = state.user;
    final videos = state.myVideos();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.tabProfile)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (user != null)
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppTheme.accentSoft,
                  child: Text(
                    user.displayName.isNotEmpty ? user.displayName[0].toUpperCase() : '?',
                    style: const TextStyle(color: AppTheme.accent, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.displayName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(user.email ?? user.role, style: const TextStyle(color: AppTheme.muted, fontSize: 13)),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 24),
          Text(l10n.language, style: const TextStyle(fontWeight: FontWeight.bold)),
          DropdownButtonFormField<Locale>(
            value: _matchLocale(state.locale),
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items: [
              for (final choice in _localeChoices)
                DropdownMenuItem(value: choice.$2, child: Text(choice.$1)),
            ],
            onChanged: (locale) {
              if (locale != null) state.setLocale(locale);
            },
          ),
          const SizedBox(height: 24),
          Text(l10n.profileSubscription, style: const TextStyle(fontWeight: FontWeight.bold)),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.profilePlan),
            trailing: Text(
              state.isPremium ? l10n.profilePlanPro : l10n.profilePlanFree,
              style: const TextStyle(color: AppTheme.accent),
            ),
          ),
          if (!state.isPremium)
            FilledButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaywallScreen())),
              child: Text(l10n.profileUpgrade),
            ),
          const SizedBox(height: 24),
          Text(l10n.profileMyVideos, style: const TextStyle(fontWeight: FontWeight.bold)),
          if (videos.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(l10n.profileMyVideosEmpty, style: const TextStyle(color: AppTheme.muted)),
            )
          else
            ...videos.map(
              (v) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(v.title),
                subtitle: Text('${v.dtcCode} · ${v.status}'),
              ),
            ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () => state.signOut(),
            child: Text(l10n.profileSignOut, style: const TextStyle(color: AppTheme.danger)),
          ),
        ],
      ),
    );
  }

  static Locale _matchLocale(Locale current) {
    for (final choice in _localeChoices) {
      final l = choice.$2;
      if (l.languageCode == current.languageCode &&
          l.scriptCode == current.scriptCode &&
          l.countryCode == current.countryCode) {
        return l;
      }
    }
    for (final choice in _localeChoices) {
      if (choice.$2.languageCode == current.languageCode) return choice.$2;
    }
    return const Locale('en');
  }
}
