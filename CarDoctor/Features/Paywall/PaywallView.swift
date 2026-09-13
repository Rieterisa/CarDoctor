import SwiftUI
import StoreKit

struct PaywallView: View {
    @Environment(AppModel.self) private var appModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("CarDoctor Pro")
                        .font(.system(size: 34, weight: .bold, design: .serif))
                    Text(String(localized: "paywall.subtitle"))
                        .foregroundStyle(AppTheme.muted)
                }

                VStack(alignment: .leading, spacing: 12) {
                    benefit("cube.transparent", String(localized: "paywall.benefit.3d"))
                    benefit("video", String(localized: "paywall.benefit.video"))
                    benefit("clock.arrow.circlepath", String(localized: "paywall.benefit.history"))
                }

                if appModel.subscriptionService.products.isEmpty {
                    Button {
                        appModel.subscriptionService.enableDemoPremium()
                        dismiss()
                    } label: {
                        Text(String(localized: "paywall.demoUnlock"))
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .foregroundStyle(.white)
                            .background(AppTheme.accent)
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }
                } else {
                    ForEach(appModel.subscriptionService.products, id: \.id) { product in
                        Button {
                            Task {
                                await appModel.subscriptionService.purchase(product)
                                if appModel.subscriptionService.effectivePremium { dismiss() }
                            }
                        } label: {
                            HStack {
                                Text(product.displayName)
                                Spacer()
                                Text(product.displayPrice)
                            }
                            .font(.headline)
                            .padding()
                            .background(AppTheme.accentSoft)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        }
                    }

                    Button(String(localized: "paywall.restore")) {
                        Task { await appModel.subscriptionService.restore() }
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity)
                }

                Spacer()
            }
            .padding(24)
            .background(AppTheme.canvas.ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(String(localized: "paywall.close")) { dismiss() }
                }
            }
        }
    }

    private func benefit(_ icon: String, _ text: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(AppTheme.accent)
                .frame(width: 28)
            Text(text).font(.subheadline)
        }
    }
}
