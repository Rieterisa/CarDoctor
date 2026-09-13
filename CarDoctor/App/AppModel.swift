import Foundation
import Observation

@Observable
@MainActor
final class AppModel {
    let authService: AuthService
    let dtcService: DtcService
    let vinService: VinDecodeService
    let repairService: RepairService
    let videoService: VideoService
    let subscriptionService: SubscriptionService

    var selectedTab: AppTab = .diagnose

    init(
        authService: AuthService = AuthService(),
        dtcService: DtcService = DtcService(),
        vinService: VinDecodeService = VinDecodeService(),
        repairService: RepairService? = nil,
        videoService: VideoService? = nil,
        subscriptionService: SubscriptionService = SubscriptionService()
    ) {
        self.authService = authService
        self.dtcService = dtcService
        self.vinService = vinService
        self.repairService = repairService ?? RepairService()
        self.videoService = videoService ?? VideoService()
        self.subscriptionService = subscriptionService
    }
}

enum AppTab: Hashable {
    case diagnose
    case community
    case upload
    case profile
}
