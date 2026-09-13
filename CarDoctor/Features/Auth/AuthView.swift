import SwiftUI
import AuthenticationServices

struct AuthView: View {
    @Environment(AppModel.self) private var appModel
    @State private var appear = false

    var body: some View {
        ZStack {
            AppTheme.heroGradient.ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                VStack(alignment: .leading, spacing: 16) {
                    Text("CarDoctor")
                        .font(.system(size: 48, weight: .bold, design: .serif))
                        .foregroundStyle(.white)

                    Text(String(localized: "auth.tagline"))
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.88))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 28)
                .opacity(appear ? 1 : 0)
                .offset(y: appear ? 0 : 20)

                Spacer()

                VStack(spacing: 14) {
                    SignInWithAppleButton(.signIn) { _ in
                        // Full ASAuthorization flow wires here on device.
                        appModel.authService.signInWithApple(displayName: "Driver")
                    } onCompletion: { _ in }
                    .signInWithAppleButtonStyle(.white)
                    .frame(height: 52)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

                    Button {
                        appModel.authService.signInAsDemo()
                    } label: {
                        Text(String(localized: "auth.demo"))
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .foregroundStyle(.white)
                            .background(.white.opacity(0.16))
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.7)) { appear = true }
        }
    }
}
