import Foundation
import Observation

@Observable
@MainActor
final class VideoService {
    private(set) var videos: [VideoItem] = []

    init() {
        videos = [
            VideoItem(
                id: "video-demo-1",
                repairId: "repair-p0300",
                dtcCode: "P0300",
                title: "Ignition coil swap walkthrough",
                authorId: "u1",
                authorName: "Mehmet Usta",
                storagePath: nil,
                localFileName: nil,
                thumbnailPath: nil,
                durationSeconds: 186,
                createdAt: Date().addingTimeInterval(-86400 * 2),
                status: .published
            )
        ]
    }

    func videos(for dtcCode: String) -> [VideoItem] {
        let code = DtcParser.normalize(dtcCode)
        return videos
            .filter { $0.dtcCode == code && $0.status == .published }
            .sorted { $0.createdAt > $1.createdAt }
    }

    func videos(forAuthor authorId: String) -> [VideoItem] {
        videos.filter { $0.authorId == authorId }.sorted { $0.createdAt > $1.createdAt }
    }

    func enqueueUpload(
        dtcCode: String,
        title: String,
        author: AppUser,
        durationSeconds: Int,
        localFileName: String?
    ) -> VideoItem {
        let item = VideoItem(
            id: UUID().uuidString,
            repairId: nil,
            dtcCode: DtcParser.normalize(dtcCode),
            title: title,
            authorId: author.id,
            authorName: author.displayName,
            storagePath: nil,
            localFileName: localFileName,
            thumbnailPath: nil,
            durationSeconds: durationSeconds,
            createdAt: Date(),
            status: author.role == .admin ? .published : .pending
        )
        videos.insert(item, at: 0)
        return item
    }
}
