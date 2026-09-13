import Foundation
import Observation

@Observable
@MainActor
final class AuthService {
    private(set) var currentUser: AppUser?
    private(set) var isAuthenticated = false
    private(set) var isLoading = false
    private(set) var errorMessage: String?

    /// Demo auth for local development without Firebase.
    func signInAsDemo() {
        currentUser = AppUser(
            id: "demo-user",
            displayName: "Demo Mechanic",
            email: "demo@cardoctor.app",
            role: .admin,
            monthlyVideoUploads: 0,
            videoQuotaMonthKey: Self.currentMonthKey()
        )
        isAuthenticated = true
        errorMessage = nil
    }

    func signInWithApple(displayName: String) {
        // Hook for AuthenticationServices + Firebase Auth.
        currentUser = AppUser(
            id: UUID().uuidString,
            displayName: displayName.isEmpty ? "Driver" : displayName,
            email: nil,
            role: .user,
            monthlyVideoUploads: 0,
            videoQuotaMonthKey: Self.currentMonthKey()
        )
        isAuthenticated = true
    }

    func signOut() {
        currentUser = nil
        isAuthenticated = false
    }

    func remainingVideoQuota(isPremium: Bool) -> Int {
        let limit = isPremium ? 30 : 1
        guard let user = currentUser else { return 0 }
        resetQuotaIfNeeded()
        return max(0, limit - (currentUser?.monthlyVideoUploads ?? user.monthlyVideoUploads))
    }

    func recordVideoUpload() {
        resetQuotaIfNeeded()
        currentUser?.monthlyVideoUploads += 1
    }

    private func resetQuotaIfNeeded() {
        let key = Self.currentMonthKey()
        guard var user = currentUser else { return }
        if user.videoQuotaMonthKey != key {
            user.videoQuotaMonthKey = key
            user.monthlyVideoUploads = 0
            currentUser = user
        }
    }

    static func currentMonthKey() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        return formatter.string(from: Date())
    }
}
