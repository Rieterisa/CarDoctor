import SwiftUI

enum AppTheme {
    static let accent = Color(red: 0.05, green: 0.45, blue: 0.55)
    static let accentSoft = Color(red: 0.05, green: 0.45, blue: 0.55).opacity(0.12)
    static let danger = Color(red: 0.75, green: 0.18, blue: 0.18)
    static let warning = Color(red: 0.85, green: 0.55, blue: 0.12)
    static let success = Color(red: 0.15, green: 0.55, blue: 0.35)
    static let ink = Color(red: 0.08, green: 0.10, blue: 0.14)
    static let muted = Color(red: 0.40, green: 0.44, blue: 0.50)
    static let canvas = Color(red: 0.94, green: 0.96, blue: 0.97)
    static let surface = Color.white

    static let heroGradient = LinearGradient(
        colors: [
            Color(red: 0.02, green: 0.22, blue: 0.30),
            Color(red: 0.05, green: 0.42, blue: 0.50),
            Color(red: 0.12, green: 0.55, blue: 0.48)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
