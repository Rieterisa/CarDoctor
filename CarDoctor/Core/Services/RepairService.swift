import Foundation
import Observation

@Observable
@MainActor
final class RepairService {
    private(set) var posts: [RepairPost] = []
    private(set) var commentsByRepair: [String: [RepairComment]] = [:]
    private var likedPostIds: Set<String> = []

    init() {
        posts = Self.seedPosts
        commentsByRepair = [
            "repair-p0300": [
                RepairComment(
                    id: "c1",
                    authorId: "u2",
                    authorName: "Ayşe",
                    text: "Bobin değişimi işe yaradı, teşekkürler!",
                    createdAt: Date().addingTimeInterval(-3600)
                )
            ]
        ]
    }

    func feed(filterCode: String?) -> [RepairPost] {
        let published = posts.filter { $0.status == .published }
        guard let filterCode, !filterCode.isEmpty else {
            return published.sorted { $0.createdAt > $1.createdAt }
        }
        let code = DtcParser.normalize(filterCode)
        return published
            .filter { $0.dtcCode == code }
            .sorted { $0.createdAt > $1.createdAt }
    }

    func isLiked(_ postId: String) -> Bool {
        likedPostIds.contains(postId)
    }

    func toggleLike(_ postId: String) {
        guard let index = posts.firstIndex(where: { $0.id == postId }) else { return }
        if likedPostIds.contains(postId) {
            likedPostIds.remove(postId)
            posts[index].likesCount = max(0, posts[index].likesCount - 1)
        } else {
            likedPostIds.insert(postId)
            posts[index].likesCount += 1
        }
    }

    func comments(for repairId: String) -> [RepairComment] {
        (commentsByRepair[repairId] ?? []).sorted { $0.createdAt < $1.createdAt }
    }

    func addComment(repairId: String, author: AppUser, text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        let comment = RepairComment(
            id: UUID().uuidString,
            authorId: author.id,
            authorName: author.displayName,
            text: trimmed,
            createdAt: Date()
        )
        commentsByRepair[repairId, default: []].append(comment)
        if let index = posts.firstIndex(where: { $0.id == repairId }) {
            posts[index].commentsCount += 1
        }
    }

    func addPost(
        dtcCode: String,
        title: String,
        summary: String,
        author: AppUser,
        makeModel: String?,
        status: ContentStatus = .pending
    ) -> RepairPost {
        let post = RepairPost(
            id: UUID().uuidString,
            dtcCode: DtcParser.normalize(dtcCode),
            title: title,
            summary: summary,
            authorId: author.id,
            authorName: author.displayName,
            makeModel: makeModel,
            videoIds: [],
            likesCount: 0,
            commentsCount: 0,
            createdAt: Date(),
            status: author.role == .admin ? .published : status
        )
        posts.insert(post, at: 0)
        return post
    }

    func posts(for authorId: String) -> [RepairPost] {
        posts.filter { $0.authorId == authorId }.sorted { $0.createdAt > $1.createdAt }
    }

    private static let seedPosts: [RepairPost] = [
        RepairPost(
            id: "repair-p0300",
            dtcCode: "P0300",
            title: "Bobin değişimi ile P0300 çözümü",
            summary: "4. silindir bobini arızalıydı. Değişim sonrası tekleme kayboldu.",
            authorId: "u1",
            authorName: "Mehmet Usta",
            makeModel: "2015 Toyota Corolla",
            videoIds: ["video-demo-1"],
            likesCount: 24,
            commentsCount: 1,
            createdAt: Date().addingTimeInterval(-86400 * 2),
            status: .published
        ),
        RepairPost(
            id: "repair-p0420",
            dtcCode: "P0420",
            title: "P0420 — egzoz sızıntısı kontrolü",
            summary: "Katalitik öncesi conta sızıntısı vardı. Conta + conta pastası ile düzeldi.",
            authorId: "u3",
            authorName: "Can",
            makeModel: "2012 VW Golf",
            videoIds: [],
            likesCount: 11,
            commentsCount: 0,
            createdAt: Date().addingTimeInterval(-86400 * 5),
            status: .published
        ),
        RepairPost(
            id: "repair-p0133",
            dtcCode: "P0133",
            title: "Yavaş O2 sensörü yanıtı",
            summary: "Upstream O2 sensörü değişimi sonrası yakıt trimleri normalize oldu.",
            authorId: "u4",
            authorName: "Lara",
            makeModel: "2018 Honda Civic",
            videoIds: [],
            likesCount: 7,
            commentsCount: 0,
            createdAt: Date().addingTimeInterval(-86400),
            status: .published
        )
    ]
}
