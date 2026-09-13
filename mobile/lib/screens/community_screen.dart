import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../models.dart';
import '../theme.dart';
import '../widgets/ui_kit.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final filter = TextEditingController();

  @override
  void dispose() {
    filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l10n = AppLocalizations.of(context);
    final posts = state.feed(filter: filter.text);

    return Scaffold(
      body: AtmosphereBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                child: Text(l10n.tabCommunity, style: AppTheme.display(size: 32)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 14, 22, 10),
                child: TextField(
                  controller: filter,
                  textCapitalization: TextCapitalization.characters,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: l10n.communityFilter,
                    prefixIcon: const Icon(Icons.filter_list),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(22, 6, 22, 24),
                  itemCount: posts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    final post = posts[i];
                    return InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RepairDetailScreen(post: post)),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppTheme.ink.withValues(alpha: 0.06)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  post.dtcCode,
                                  style: AppTheme.body(size: 12, weight: FontWeight.w800, color: AppTheme.accentDeep),
                                ),
                                const Spacer(),
                                Icon(Icons.favorite, size: 14, color: AppTheme.muted.withValues(alpha: 0.8)),
                                const SizedBox(width: 4),
                                Text('${post.likesCount}', style: AppTheme.body(size: 12, color: AppTheme.muted)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(post.title, style: AppTheme.display(size: 18)),
                            const SizedBox(height: 6),
                            Text(
                              post.summary,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.body(size: 13, color: AppTheme.muted),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              [post.authorName, if (post.makeModel != null) post.makeModel].join(' · '),
                              style: AppTheme.body(size: 12, color: AppTheme.muted),
                            ),
                          ],
                        ),
                      ),
                    ).animate().fadeIn(delay: (40 * i).ms);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RepairDetailScreen extends StatefulWidget {
  const RepairDetailScreen({super.key, required this.post});

  final RepairPost post;

  @override
  State<RepairDetailScreen> createState() => _RepairDetailScreenState();
}

class _RepairDetailScreenState extends State<RepairDetailScreen> {
  final commentCtrl = TextEditingController();

  @override
  void dispose() {
    commentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l10n = AppLocalizations.of(context);
    final comments = state.comments[widget.post.id] ?? [];
    final liked = state.liked.contains(widget.post.id);
    final live = state.posts.firstWhere((p) => p.id == widget.post.id, orElse: () => widget.post);

    return Scaffold(
      body: AtmosphereBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(22, 8, 22, 24),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              Text(widget.post.dtcCode, style: AppTheme.body(size: 13, weight: FontWeight.w800, color: AppTheme.accentDeep)),
              const SizedBox(height: 8),
              Text(widget.post.title, style: AppTheme.display(size: 28)),
              const SizedBox(height: 10),
              Text(widget.post.summary, style: AppTheme.body(size: 15, color: AppTheme.muted)),
              const SizedBox(height: 16),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () => state.toggleLike(widget.post.id),
                    icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: AppTheme.fault),
                    label: Text('${live.likesCount}', style: AppTheme.body(weight: FontWeight.w700)),
                  ),
                  Text('${comments.length} ${l10n.communityComments}', style: AppTheme.body(size: 13, color: AppTheme.muted)),
                ],
              ),
              const SizedBox(height: 8),
              Divider(color: AppTheme.ink.withValues(alpha: 0.08)),
              const SizedBox(height: 8),
              Text(l10n.communityComments, style: AppTheme.display(size: 18)),
              const SizedBox(height: 10),
              ...comments.map(
                (c) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(c.authorName, style: AppTheme.body(size: 12, weight: FontWeight.w800)),
                      Text(c.text, style: AppTheme.body(size: 14)),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: commentCtrl,
                      decoration: InputDecoration(hintText: l10n.communityCommentPlaceholder),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: () {
                      state.addComment(widget.post.id, commentCtrl.text);
                      commentCtrl.clear();
                    },
                    child: Text(l10n.communityCommentSend),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
