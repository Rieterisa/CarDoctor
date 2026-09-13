import SwiftUI

struct ProfileView: View {
    @Environment(AppModel.self) private var appModel
    @State private var showPaywall = false

    var body: some View {
        NavigationStack {
            List {
                if let user = appModel.authService.currentUser {
                    Section {
                        HStack(spacing: 14) {
                            Circle()
                                .fill(AppTheme.accentSoft)
                                .frame(width: 56, height: 56)
                                .overlay {
                                    Text(String(user.displayName.prefix(1)))
                                        .font(.title2.weight(.bold))
                                        .foregroundStyle(AppTheme.accent)
                                }
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.displayName).font(.headline)
                                Text(user.email ?? user.role.rawValue)
                                    .font(.caption)
                                    .foregroundStyle(AppTheme.muted)
                            }
                        }
                    }

                    Section(String(localized: "profile.subscription")) {
                        HStack {
                            Text(String(localized: "profile.plan"))
                            Spacer()
                            Text(appModel.subscriptionService.effectivePremium
                                 ? String(localized: "profile.plan.pro")
                                 : String(localized: "profile.plan.free"))
                                .foregroundStyle(AppTheme.accent)
                        }
                        if !appModel.subscriptionService.effectivePremium {
                            Button(String(localized: "profile.upgrade")) { showPaywall = true }
                        }
                    }

                    Section(String(localized: "profile.myVideos")) {
                        let videos = appModel.videoService.videos(forAuthor: user.id)
                        if videos.isEmpty {
                            Text(String(localized: "profile.myVideos.empty"))
                                .foregroundStyle(AppTheme.muted)
                        } else {
                            ForEach(videos) { video in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(video.title).font(.subheadline.weight(.semibold))
                                    Text("\(video.dtcCode) · \(video.status.rawValue)")
                                        .font(.caption)
                                        .foregroundStyle(AppTheme.muted)
                                }
                            }
                        }
                    }

                    Section {
                        Button(String(localized: "profile.signOut"), role: .destructive) {
                            appModel.authService.signOut()
                        }
                    }
                }
            }
            .navigationTitle(String(localized: "tab.profile"))
            .sheet(isPresented: $showPaywall) {
                PaywallView()
            }
        }
    }
}
