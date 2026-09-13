import SwiftUI

struct DiagnosisResultView: View {
    @Environment(AppModel.self) private var appModel
    let result: DiagnosisResult
    @State private var show3D = false
    @State private var showPaywall = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                vehicleHeader
                faultCard
                stepsCard
                videosSection
                ctaRow
                Text(String(localized: "legal.disclaimer"))
                    .font(.caption2)
                    .foregroundStyle(AppTheme.muted)
            }
            .padding(20)
        }
        .background(AppTheme.canvas.ignoresSafeArea())
        .navigationTitle(result.entry.code)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $show3D) {
            Vehicle3DView(highlightedEntity: result.part.usdzEntityName, partName: result.part.name())
        }
        .sheet(isPresented: $showPaywall) {
            PaywallView()
        }
    }

    private var vehicleHeader: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(result.vehicle.displayName)
                .font(.system(size: 24, weight: .bold, design: .serif))
            Text(result.vehicle.vin)
                .font(.caption.monospaced())
                .foregroundStyle(AppTheme.muted)
            HStack(spacing: 8) {
                Text(result.entry.make)
                    .font(.caption.weight(.bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .foregroundStyle(AppTheme.accent)
                    .background(AppTheme.accentSoft)
                    .clipShape(Capsule())
                Text(String(localized: "result.brandSpecific"))
                    .font(.caption)
                    .foregroundStyle(AppTheme.muted)
            }
            .padding(.top, 4)
            if let fuel = result.vehicle.fuelType, !fuel.isEmpty {
                Text(fuel)
                    .font(.caption2)
                    .foregroundStyle(AppTheme.muted)
            }
        }
    }

    private var faultCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                SeverityBadge(severity: result.entry.severity)
                Spacer()
                Text(result.part.name())
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(AppTheme.accent)
            }
            Text(result.entry.title())
                .font(.title3.weight(.bold))
            Text(result.entry.description())
                .font(.body)
                .foregroundStyle(AppTheme.muted)
            Text(result.entry.safetyNotes())
                .font(.footnote)
                .foregroundStyle(AppTheme.warning)
                .padding(.top, 4)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppTheme.surface)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var stepsCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(String(localized: "result.steps"))
                .font(.headline)
            ForEach(Array(result.entry.repairSteps().enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(index + 1)")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(.white)
                        .frame(width: 22, height: 22)
                        .background(AppTheme.accent)
                        .clipShape(Circle())
                    Text(step)
                        .font(.subheadline)
                }
            }
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppTheme.surface)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var videosSection: some View {
        let videos = appModel.videoService.videos(for: result.entry.code)
        return VStack(alignment: .leading, spacing: 12) {
            Text(String(localized: "result.videos"))
                .font(.headline)
            if videos.isEmpty {
                Text(String(localized: "result.videos.empty"))
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.muted)
            } else {
                ForEach(videos) { video in
                    HStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(AppTheme.accentSoft)
                            .frame(width: 64, height: 48)
                            .overlay {
                                Image(systemName: "play.fill")
                                    .foregroundStyle(AppTheme.accent)
                            }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(video.title).font(.subheadline.weight(.semibold))
                            Text("\(video.authorName) · \(video.durationSeconds / 60)m")
                                .font(.caption)
                                .foregroundStyle(AppTheme.muted)
                        }
                    }
                }
            }
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppTheme.surface)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var ctaRow: some View {
        Button {
            if appModel.subscriptionService.effectivePremium {
                show3D = true
            } else {
                showPaywall = true
            }
        } label: {
            Label(String(localized: "result.view3d"), systemImage: "cube.transparent")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .foregroundStyle(.white)
                .background(AppTheme.ink)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
    }
}

struct SeverityBadge: View {
    let severity: FaultSeverity

    var body: some View {
        Text(String(localized: String.LocalizationValue(severity.labelKey)))
            .font(.caption2.weight(.bold))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .foregroundStyle(.white)
            .background(color)
            .clipShape(Capsule())
    }

    private var color: Color {
        switch severity {
        case .low: AppTheme.success
        case .medium: AppTheme.warning
        case .high: AppTheme.danger
        case .critical: Color.black
        }
    }
}
