import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';
import 'services.dart';
import 'validators.dart';

class AppState extends ChangeNotifier {
  final catalog = CatalogService();
  final vinService = VinDecodeService();

  bool ready = false;
  bool isAuthenticated = false;
  bool isPremium = false;
  Locale locale = const Locale('tr');
  AppUser? user;

  final List<RepairPost> posts = [];
  final Map<String, List<RepairComment>> comments = {};
  final Set<String> liked = {};
  final List<VideoItem> videos = [];

  /// DTC catalog currently ships TR + EN copy; use TR only for Turkish UI.
  bool get preferTurkish => locale.languageCode == 'tr';

  Future<void> bootstrap() async {
    try {
      await catalog.load();
    } catch (_) {
      // Asset may be unavailable in some test contexts; UI still boots.
    }
    _seedCommunity();
    final prefs = await SharedPreferences.getInstance();
    isPremium = prefs.getBool('demo_premium') ?? false;
    locale = _parseLocale(prefs.getString('locale') ?? 'tr');
    ready = true;
    notifyListeners();
  }

  static Locale _parseLocale(String tag) {
    final parts = tag.replaceAll('-', '_').split('_');
    if (parts.length >= 3) {
      return Locale.fromSubtags(
        languageCode: parts[0],
        scriptCode: parts[1],
        countryCode: parts[2],
      );
    }
    if (parts.length == 2) {
      final second = parts[1];
      if (second.length == 4) {
        return Locale.fromSubtags(languageCode: parts[0], scriptCode: second);
      }
      return Locale(parts[0], second);
    }
    return Locale(parts[0]);
  }

  Future<void> setLocale(Locale value) async {
    locale = value;
    final prefs = await SharedPreferences.getInstance();
    final tag = value.countryCode != null
        ? '${value.languageCode}_${value.countryCode}'
        : (value.scriptCode != null
            ? '${value.languageCode}_${value.scriptCode}'
            : value.languageCode);
    await prefs.setString('locale', tag);
    notifyListeners();
  }

  void signInDemo() {
    user = AppUser(
      id: 'demo-user',
      displayName: 'Demo Mechanic',
      email: 'demo@cardoctor.app',
      role: 'admin',
    );
    isAuthenticated = true;
    notifyListeners();
  }

  void signOut() {
    user = null;
    isAuthenticated = false;
    notifyListeners();
  }

  Future<void> setPremium(bool value) async {
    isPremium = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('demo_premium', value);
    notifyListeners();
  }

  Future<DiagnosisResult> diagnose({
    required String vin,
    required String dtc,
    required String invalidDtcMessage,
    required String notFoundMessage,
  }) async {
    final code = DtcParser.normalize(dtc);
    if (!DtcParser.isValid(code)) {
      throw Exception(invalidDtcMessage);
    }
    final entry = catalog.lookup(code);
    if (entry == null) {
      throw Exception(notFoundMessage);
    }
    final part = catalog.partFor(entry);
    if (part == null) {
      throw Exception('Part mapping missing');
    }
    final vehicle = await vinService.decode(
      vin.trim().isEmpty ? '1HGCM82633A004352' : vin,
    );
    return DiagnosisResult(vehicle: vehicle, entry: entry, part: part);
  }

  List<RepairPost> feed({String? filter}) {
    var list = posts.where((p) => p.status == 'published').toList();
    if (filter != null && filter.trim().isNotEmpty) {
      final code = DtcParser.normalize(filter);
      list = list.where((p) => p.dtcCode == code).toList();
    }
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list;
  }

  void toggleLike(String postId) {
    final i = posts.indexWhere((p) => p.id == postId);
    if (i < 0) return;
    if (liked.contains(postId)) {
      liked.remove(postId);
      posts[i].likesCount = (posts[i].likesCount - 1).clamp(0, 1 << 30);
    } else {
      liked.add(postId);
      posts[i].likesCount += 1;
    }
    notifyListeners();
  }

  void addComment(String repairId, String text) {
    final u = user;
    if (u == null) return;
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    comments.putIfAbsent(repairId, () => []);
    comments[repairId]!.add(RepairComment(
      id: UniqueKey().toString(),
      authorId: u.id,
      authorName: u.displayName,
      text: trimmed,
      createdAt: DateTime.now(),
    ));
    final i = posts.indexWhere((p) => p.id == repairId);
    if (i >= 0) posts[i].commentsCount += 1;
    notifyListeners();
  }

  int remainingVideoQuota() {
    final limit = isPremium ? 30 : 1;
    final u = user;
    if (u == null) return 0;
    return (limit - u.monthlyVideoUploads).clamp(0, limit);
  }

  void submitVideo({
    required String dtcCode,
    required String title,
    required String summary,
    String? localPath,
  }) {
    final u = user;
    if (u == null) throw Exception('Not signed in');
    if (remainingVideoQuota() <= 0) {
      throw Exception('quota');
    }
    final code = DtcParser.normalize(dtcCode);
    final status = u.role == 'admin' ? 'published' : 'pending';
    videos.insert(
      0,
      VideoItem(
        id: UniqueKey().toString(),
        dtcCode: code,
        title: title,
        authorId: u.id,
        authorName: u.displayName,
        durationSeconds: 120,
        createdAt: DateTime.now(),
        status: status,
        localPath: localPath,
      ),
    );
    posts.insert(
      0,
      RepairPost(
        id: UniqueKey().toString(),
        dtcCode: code,
        title: title,
        summary: summary.isEmpty ? title : summary,
        authorId: u.id,
        authorName: u.displayName,
        likesCount: 0,
        commentsCount: 0,
        createdAt: DateTime.now(),
        status: status,
      ),
    );
    u.monthlyVideoUploads += 1;
    notifyListeners();
  }

  List<VideoItem> videosFor(String dtcCode) {
    final code = DtcParser.normalize(dtcCode);
    return videos
        .where((v) => v.dtcCode == code && v.status == 'published')
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  List<VideoItem> myVideos() {
    final id = user?.id;
    if (id == null) return [];
    return videos.where((v) => v.authorId == id).toList();
  }

  void _seedCommunity() {
    posts.addAll([
      RepairPost(
        id: 'repair-p0300',
        dtcCode: 'P0300',
        title: 'Bobin değişimi ile P0300 çözümü',
        summary: '4. silindir bobini arızalıydı. Değişim sonrası tekleme kayboldu.',
        authorId: 'u1',
        authorName: 'Mehmet Usta',
        makeModel: '2015 Toyota Corolla',
        likesCount: 24,
        commentsCount: 1,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        status: 'published',
      ),
      RepairPost(
        id: 'repair-p0420',
        dtcCode: 'P0420',
        title: 'P0420 — egzoz sızıntısı kontrolü',
        summary: 'Katalitik öncesi conta sızıntısı vardı. Conta ile düzeldi.',
        authorId: 'u3',
        authorName: 'Can',
        makeModel: '2012 VW Golf',
        likesCount: 11,
        commentsCount: 0,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        status: 'published',
      ),
    ]);
    comments['repair-p0300'] = [
      RepairComment(
        id: 'c1',
        authorId: 'u2',
        authorName: 'Ayşe',
        text: 'Bobin değişimi işe yaradı, teşekkürler!',
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ];
    videos.add(VideoItem(
      id: 'video-demo-1',
      dtcCode: 'P0300',
      title: 'Ignition coil swap walkthrough',
      authorId: 'u1',
      authorName: 'Mehmet Usta',
      durationSeconds: 186,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      status: 'published',
    ));
  }
}
