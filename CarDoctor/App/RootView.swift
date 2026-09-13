import SwiftUI

struct RootView: View {
    @Environment(AppModel.self) private var appModel

    var body: some View {
        Group {
            if appModel.authService.isAuthenticated {
                MainTabView()
            } else {
                AuthView()
            }
        }
        .animation(.easeInOut(duration: 0.25), value: appModel.authService.isAuthenticated)
        .task {
            await appModel.dtcService.loadCatalogIfNeeded()
            await appModel.subscriptionService.refresh()
        }
    }
}

struct MainTabView: View {
    @Environment(AppModel.self) private var appModel

    var body: some View {
        @Bindable var model = appModel
        TabView(selection: $model.selectedTab) {
            DiagnoseView()
                .tabItem { Label(String(localized: "tab.diagnose"), systemImage: "magnifyingglass") }
                .tag(AppTab.diagnose)

            CommunityView()
                .tabItem { Label(String(localized: "tab.community"), systemImage: "person.3") }
                .tag(AppTab.community)

            VideoUploadView()
                .tabItem { Label(String(localized: "tab.upload"), systemImage: "video.badge.plus") }
                .tag(AppTab.upload)

            ProfileView()
                .tabItem { Label(String(localized: "tab.profile"), systemImage: "person.crop.circle") }
                .tag(AppTab.profile)
        }
        .tint(AppTheme.accent)
    }
}
