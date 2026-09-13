import SwiftUI

struct CommunityView: View {
    @Environment(AppModel.self) private var appModel
    @State private var filter = ""
    @State private var selectedPost: RepairPost?

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TextField(String(localized: "community.filter"), text: $filter)
                    .textInputAutocapitalization(.characters)
                    .padding(12)
                    .background(AppTheme.surface)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .padding()

                List(appModel.repairService.feed(filterCode: filter)) { post in
                    Button {
                        selectedPost = post
                    } label: {
                        RepairPostRow(post: post)
                    }
                    .listRowBackground(AppTheme.surface)
                }
                .listStyle(.plain)
            }
            .background(AppTheme.canvas.ignoresSafeArea())
            .navigationTitle(String(localized: "tab.community"))
            .navigationDestination(item: $selectedPost) { post in
                RepairDetailView(post: post)
            }
        }
    }
}

struct RepairPostRow: View {
    let post: RepairPost

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(post.dtcCode)
                    .font(.caption.weight(.bold))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(AppTheme.accentSoft)
                    .foregroundStyle(AppTheme.accent)
                    .clipShape(Capsule())
                Spacer()
                Label("\(post.likesCount)", systemImage: "heart.fill")
                    .font(.caption)
                    .foregroundStyle(AppTheme.muted)
            }
            Text(post.title)
                .font(.headline)
                .foregroundStyle(AppTheme.ink)
                .multilineTextAlignment(.leading)
            Text(post.summary)
                .font(.subheadline)
                .foregroundStyle(AppTheme.muted)
                .lineLimit(2)
            HStack {
                Text(post.authorName)
                if let makeModel = post.makeModel {
                    Text("· \(makeModel)")
                }
            }
            .font(.caption)
            .foregroundStyle(AppTheme.muted)
        }
        .padding(.vertical, 6)
    }
}

struct RepairDetailView: View {
    @Environment(AppModel.self) private var appModel
    let post: RepairPost
    @State private var commentText = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(post.title)
                    .font(.system(size: 26, weight: .bold, design: .serif))
                Text(post.summary)
                    .foregroundStyle(AppTheme.muted)

                HStack(spacing: 16) {
                    Button {
                        appModel.repairService.toggleLike(post.id)
                    } label: {
                        Label(
                            "\(currentLikes)",
                            systemImage: appModel.repairService.isLiked(post.id) ? "heart.fill" : "heart"
                        )
                    }
                    Label("\(appModel.repairService.comments(for: post.id).count)", systemImage: "text.bubble")
                        .foregroundStyle(AppTheme.muted)
                }
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(AppTheme.accent)

                Divider()

                Text(String(localized: "community.comments"))
                    .font(.headline)

                ForEach(appModel.repairService.comments(for: post.id)) { comment in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(comment.authorName).font(.caption.weight(.bold))
                        Text(comment.text).font(.subheadline)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(AppTheme.surface)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }

                HStack {
                    TextField(String(localized: "community.comment.placeholder"), text: $commentText)
                        .padding(12)
                        .background(AppTheme.surface)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    Button(String(localized: "community.comment.send")) {
                        guard let user = appModel.authService.currentUser else { return }
                        appModel.repairService.addComment(repairId: post.id, author: user, text: commentText)
                        commentText = ""
                    }
                    .disabled(commentText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .padding(20)
        }
        .background(AppTheme.canvas.ignoresSafeArea())
        .navigationTitle(post.dtcCode)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var currentLikes: Int {
        appModel.repairService.posts.first(where: { $0.id == post.id })?.likesCount ?? post.likesCount
    }
}
