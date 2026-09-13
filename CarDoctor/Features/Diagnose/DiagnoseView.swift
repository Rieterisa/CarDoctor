import SwiftUI

struct DiagnoseView: View {
    @Environment(AppModel.self) private var appModel
    @State private var vin = ""
    @State private var dtc = ""
    @State private var isLoading = false
    @State private var isDecodingVin = false
    @State private var errorMessage: String?
    @State private var decodedVehicle: VehicleInfo?
    @State private var result: DiagnosisResult?
    @State private var showResult = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    formCard
                    if let decodedVehicle {
                        vehicleChip(decodedVehicle)
                    }
                    if let errorMessage {
                        Text(errorMessage)
                            .font(.footnote)
                            .foregroundStyle(AppTheme.danger)
                    }
                    sampleCodes
                    disclaimer
                }
                .padding(20)
            }
            .background(AppTheme.canvas.ignoresSafeArea())
            .navigationTitle("CarDoctor")
            .navigationDestination(isPresented: $showResult) {
                if let result {
                    DiagnosisResultView(result: result)
                }
            }
            .task {
                await appModel.dtcService.loadCatalogIfNeeded()
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(String(localized: "diagnose.headline"))
                .font(.system(size: 28, weight: .bold, design: .serif))
                .foregroundStyle(AppTheme.ink)
            Text(String(localized: "diagnose.subtitle"))
                .font(.subheadline)
                .foregroundStyle(AppTheme.muted)
        }
    }

    private var formCard: some View {
        VStack(spacing: 14) {
            field(
                title: String(localized: "diagnose.vin"),
                text: $vin,
                prompt: "1HGCM82633A004352",
                keyboard: .asciiCapable
            )
            .onChange(of: vin) { _, newValue in
                decodedVehicle = nil
                let normalized = VinValidator.normalize(newValue)
                guard VinValidator.isValid(normalized) else { return }
                Task { await previewVin(normalized) }
            }

            field(
                title: String(localized: "diagnose.dtc"),
                text: $dtc,
                prompt: decodedVehicle.map { "\($0.make) e.g. P0300" } ?? "P0300",
                keyboard: .asciiCapable
            )

            Button {
                Task { await runDiagnosis() }
            } label: {
                HStack {
                    if isLoading { ProgressView().tint(.white) }
                    Text(String(localized: "diagnose.submit"))
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .foregroundStyle(.white)
                .background(AppTheme.accent)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
            .disabled(isLoading)
        }
        .padding(18)
        .background(AppTheme.surface)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: .black.opacity(0.04), radius: 12, y: 4)
    }

    private func vehicleChip(_ vehicle: VehicleInfo) -> some View {
        HStack(spacing: 10) {
            if isDecodingVin {
                ProgressView()
            } else {
                Image(systemName: "car.fill")
                    .foregroundStyle(AppTheme.accent)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(vehicle.displayName)
                    .font(.subheadline.weight(.semibold))
                Text(String(localized: "diagnose.brandSpecific"))
                    .font(.caption2)
                    .foregroundStyle(AppTheme.muted)
            }
            Spacer()
        }
        .padding(12)
        .background(AppTheme.accentSoft)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }

    private var sampleCodes: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(
                decodedVehicle.map { String(localized: "diagnose.samples.brand") + " (\($0.make))" }
                    ?? String(localized: "diagnose.samples")
            )
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(AppTheme.ink)
            FlowCodes(codes: appModel.dtcService.sampleCodes(forMake: decodedVehicle?.make)) { code in
                dtc = code
            }
        }
    }

    private var disclaimer: some View {
        Text(String(localized: "legal.disclaimer"))
            .font(.caption2)
            .foregroundStyle(AppTheme.muted)
            .padding(.top, 8)
    }

    private func field(title: String, text: Binding<String>, prompt: String, keyboard: UIKeyboardType) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundStyle(AppTheme.muted)
            TextField(prompt, text: text)
                .textInputAutocapitalization(.characters)
                .autocorrectionDisabled()
                .keyboardType(keyboard)
                .padding(14)
                .background(AppTheme.canvas)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }

    private func previewVin(_ normalized: String) async {
        isDecodingVin = true
        defer { isDecodingVin = false }
        do {
            decodedVehicle = try await appModel.vinService.decode(vin: normalized)
        } catch {
            decodedVehicle = nil
        }
    }

    private func runDiagnosis() async {
        errorMessage = nil
        isLoading = true
        defer { isLoading = false }

        let normalizedVin = VinValidator.normalize(vin)
        guard VinValidator.isValid(normalizedVin) else {
            errorMessage = String(localized: "error.vin.invalid")
            return
        }

        let code = DtcParser.normalize(dtc)
        guard DtcParser.isValid(code) else {
            errorMessage = String(localized: "error.dtc.invalid")
            return
        }

        do {
            let vehicle = try await appModel.vinService.decode(vin: normalizedVin)
            decodedVehicle = vehicle

            guard appModel.dtcService.supportsMake(vehicle.make) else {
                errorMessage = String(format: String(localized: "error.dtc.makeUnsupported"), vehicle.make)
                return
            }

            guard let entry = appModel.dtcService.lookup(code: code, make: vehicle.make) else {
                errorMessage = String(format: String(localized: "error.dtc.notForMake"), code, vehicle.make)
                return
            }
            guard let part = appModel.dtcService.part(for: entry) else {
                errorMessage = String(localized: "error.dtc.notFound")
                return
            }

            result = DiagnosisResult(vehicle: vehicle, entry: entry, part: part)
            showResult = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

struct DiagnosisResult: Hashable {
    let vehicle: VehicleInfo
    let entry: DtcEntry
    let part: PartInfo
}

private struct FlowCodes: View {
    let codes: [String]
    let onTap: (String) -> Void

    var body: some View {
        FlexibleWrap(spacing: 8) {
            ForEach(codes, id: \.self) { code in
                Button(code) { onTap(code) }
                    .font(.caption.weight(.semibold))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(AppTheme.accentSoft)
                    .foregroundStyle(AppTheme.accent)
                    .clipShape(Capsule())
            }
        }
    }
}

/// Simple wrap layout without third-party deps.
struct FlexibleWrap<Content: View>: View {
    var spacing: CGFloat = 8
    @ViewBuilder var content: () -> Content

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 72), spacing: spacing)], spacing: spacing) {
            content()
        }
    }
}
