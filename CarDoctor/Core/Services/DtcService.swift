import Foundation
import Observation

@Observable
@MainActor
final class DtcService {
    /// Keyed by `CODE#Make` for brand-specific lookup.
    private(set) var entries: [String: DtcEntry] = [:]
    private(set) var parts: [String: PartInfo] = [:]
    private(set) var supportedMakes: [String] = VehicleBrandRegistry.supportedMakes
    private(set) var isLoaded = false
    private(set) var loadError: String?

    func loadCatalogIfNeeded() async {
        guard !isLoaded else { return }
        do {
            let catalog = try SeedLoader.loadCatalog()
            ingest(catalog)
            isLoaded = true
        } catch {
            loadError = error.localizedDescription
            ingest(SeedLoader.embeddedFallback())
            isLoaded = true
        }
    }

    private func ingest(_ catalog: DtcCatalogFile) {
        if let makes = catalog.makes, !makes.isEmpty {
            supportedMakes = makes
        }
        entries = Dictionary(uniqueKeysWithValues: catalog.dtc.map { entry in
            let make = VehicleBrandRegistry.normalizeMake(entry.make) ?? entry.make
            let normalized = DtcEntry(
                code: entry.code.uppercased(),
                make: make,
                titleTR: entry.titleTR,
                titleEN: entry.titleEN,
                descriptionTR: entry.descriptionTR,
                descriptionEN: entry.descriptionEN,
                severity: entry.severity,
                partId: entry.partId,
                repairStepsTR: entry.repairStepsTR,
                repairStepsEN: entry.repairStepsEN,
                safetyNotesTR: entry.safetyNotesTR,
                safetyNotesEN: entry.safetyNotesEN
            )
            return (normalized.id, normalized)
        })
        parts = Dictionary(uniqueKeysWithValues: catalog.parts.map { ($0.id, $0) })
    }

    /// Brand-specific DTC lookup — requires a decoded vehicle make (not a generic catalog hit).
    func lookup(code raw: String, make rawMake: String) -> DtcEntry? {
        let code = DtcParser.normalize(raw)
        guard let make = VehicleBrandRegistry.normalizeMake(rawMake) else { return nil }
        if let exact = entries["\(code)#\(make)"] {
            return exact
        }
        // Alias folding already applied in normalizeMake; nothing else to try.
        return nil
    }

    func part(for entry: DtcEntry) -> PartInfo? {
        parts[entry.partId]
    }

    /// Sample codes for a specific make (OEM + common). Falls back to Honda demos if make unknown.
    func sampleCodes(forMake rawMake: String?) -> [String] {
        let make = rawMake.flatMap(VehicleBrandRegistry.normalizeMake) ?? "Honda"
        let forMake = entries.values
            .filter { $0.make == make }
            .map(\.code)
            .sorted()
        // Prefer a mix: put OEM-looking (P1xxx) first when present, then common P0.
        let oem = forMake.filter { $0.hasPrefix("P1") || $0.hasPrefix("P2") }
        let common = forMake.filter { $0.hasPrefix("P0") }
        var picked: [String] = []
        picked.append(contentsOf: oem.prefix(3))
        picked.append(contentsOf: common.prefix(5))
        if picked.isEmpty {
            picked = Array(forMake.prefix(8))
        }
        return Array(picked.uniqued().prefix(8))
    }

    var sampleCodes: [String] {
        sampleCodes(forMake: "Honda")
    }

    func supportsMake(_ rawMake: String) -> Bool {
        guard let make = VehicleBrandRegistry.normalizeMake(rawMake) else { return false }
        return entries.keys.contains { $0.hasSuffix("#\(make)") }
    }
}

struct DtcCatalogFile: Codable, Sendable {
    let parts: [PartInfo]
    let makes: [String]?
    let dtc: [DtcEntry]
}

enum SeedLoader {
    static func loadCatalog() throws -> DtcCatalogFile {
        let url =
            Bundle.main.url(forResource: "dtc_catalog", withExtension: "json")
            ?? Bundle.allBundles.lazy.compactMap { $0.url(forResource: "dtc_catalog", withExtension: "json") }.first
            ?? Bundle.allFrameworks.lazy.compactMap { $0.url(forResource: "dtc_catalog", withExtension: "json") }.first
        guard let url else { throw SeedError.missingFile }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(DtcCatalogFile.self, from: data)
    }

    static func embeddedFallback() -> DtcCatalogFile {
        DtcCatalogFile(parts: Self.fallbackParts, makes: VehicleBrandRegistry.supportedMakes, dtc: Self.fallbackDtc)
    }

    private static let fallbackParts: [PartInfo] = [
        PartInfo(id: "o2_sensor", nameTR: "Oksijen Sensörü", nameEN: "Oxygen Sensor", category: "emissions", usdzEntityName: "o2_sensor", relatedCodes: ["P0130", "P0131", "P0133"]),
        PartInfo(id: "ignition_coil", nameTR: "Ateşleme Bobini", nameEN: "Ignition Coil", category: "ignition", usdzEntityName: "ignition_coil", relatedCodes: ["P0300", "P0301", "P0351"]),
        PartInfo(id: "maf_sensor", nameTR: "MAF Sensörü", nameEN: "MAF Sensor", category: "air", usdzEntityName: "maf_sensor", relatedCodes: ["P0101", "P0102"]),
        PartInfo(id: "catalytic_converter", nameTR: "Katalitik Konvertör", nameEN: "Catalytic Converter", category: "emissions", usdzEntityName: "catalytic_converter", relatedCodes: ["P0420"]),
        PartInfo(id: "abs_module", nameTR: "ABS Modülü", nameEN: "ABS Module", category: "brakes", usdzEntityName: "abs_module", relatedCodes: ["C0035"]),
        PartInfo(id: "battery", nameTR: "Akü", nameEN: "Battery", category: "electrical", usdzEntityName: "battery", relatedCodes: ["P0562"]),
        PartInfo(id: "alternator", nameTR: "Alternatör", nameEN: "Alternator", category: "electrical", usdzEntityName: "alternator", relatedCodes: ["P0563"]),
        PartInfo(id: "fuel_pump", nameTR: "Yakıt Pompası", nameEN: "Fuel Pump", category: "fuel", usdzEntityName: "fuel_pump", relatedCodes: ["P0230"]),
        PartInfo(id: "throttle_body", nameTR: "Gaz Kelebeği", nameEN: "Throttle Body", category: "air", usdzEntityName: "throttle_body", relatedCodes: ["P0121", "P2111"]),
        PartInfo(id: "engine", nameTR: "Motor Bloğu / Genel", nameEN: "Engine Block / General", category: "engine", usdzEntityName: "engine", relatedCodes: ["P0217"]),
        PartInfo(id: "cam_sensor", nameTR: "Eksantrik Sensörü", nameEN: "Camshaft Sensor", category: "engine", usdzEntityName: "engine", relatedCodes: ["P0340"]),
        PartInfo(id: "knock_sensor", nameTR: "Vuruntu Sensörü", nameEN: "Knock Sensor", category: "engine", usdzEntityName: "engine", relatedCodes: ["P0325"]),
        PartInfo(id: "crank_sensor", nameTR: "Krank Sensörü", nameEN: "Crankshaft Sensor", category: "engine", usdzEntityName: "engine", relatedCodes: ["P0335"])
    ]

    private static let fallbackDtc: [DtcEntry] = [
        DtcEntry(
            code: "P0300",
            make: "Honda",
            titleTR: "Rastgele / Çoklu Silindir Teklemesi",
            titleEN: "Random/Multiple Cylinder Misfire",
            descriptionTR: "Honda aracında P0300: Motor bir veya birden fazla silindirde düzensiz ateşleme algıladı. Bu teşhis Honda için markaya özel yorumlanmıştır.",
            descriptionEN: "On Honda vehicles, P0300: The engine detected irregular combustion in one or more cylinders. This diagnosis is interpreted specifically for Honda.",
            severity: .high,
            partId: "ignition_coil",
            repairStepsTR: [
                "Honda için: OBD tarayıcı ile hangi silindirlerin telediğini doğrula",
                "Honda için: Buji ve bobin konektörlerini kontrol et",
                "Honda için: Ateşleme bobinlerini çapraz değişim ile test et",
                "HDS servis verisiyle doğrula"
            ],
            repairStepsEN: [
                "For Honda: confirm misfiring cylinders with an OBD scanner",
                "For Honda: inspect spark plug and coil connectors",
                "For Honda: swap ignition coils to isolate the fault",
                "Confirm with HDS service data"
            ],
            safetyNotesTR: "Katalitik konvertör hasarı riski: uzun süre tekleme ile sürmeyin.",
            safetyNotesEN: "Catalytic converter damage risk: avoid prolonged driving with misfire."
        ),
        DtcEntry(
            code: "P1457",
            make: "Honda",
            titleTR: "EVAP Kanister Sistem Kaçağı (Honda)",
            titleEN: "EVAP Canister System Leak (Honda)",
            descriptionTR: "Honda EVAP kanister purge/vent tarafında kaçak veya tıkanıklık.",
            descriptionEN: "Honda EVAP canister purge/vent side leak or blockage.",
            severity: .low,
            partId: "fuel_pump",
            repairStepsTR: [
                "Yakıt kapağını ve conta durumunu kontrol et",
                "Honda HDS ile EVAP sızıntı testini çalıştır",
                "Kanister vent valfini ve hortumları incele"
            ],
            repairStepsEN: [
                "Inspect fuel cap and seal",
                "Run EVAP leak test with Honda HDS",
                "Check canister vent valve and hoses"
            ],
            safetyNotesTR: "Yakıt buharı: kıvılcım ve açık ateşten uzak durun.",
            safetyNotesEN: "Fuel vapor hazard: keep sparks and open flame away."
        ),
        DtcEntry(
            code: "P0300",
            make: "Toyota",
            titleTR: "Rastgele / Çoklu Silindir Teklemesi",
            titleEN: "Random/Multiple Cylinder Misfire",
            descriptionTR: "Toyota aracında P0300: Motor tekleme algıladı. Bu teşhis Toyota için markaya özel yorumlanmıştır.",
            descriptionEN: "On Toyota vehicles, P0300: The engine detected a misfire. This diagnosis is interpreted specifically for Toyota.",
            severity: .high,
            partId: "ignition_coil",
            repairStepsTR: [
                "Toyota için: Techstream ile silindir tekleme sayaçlarını izle",
                "Toyota için: Bobin ve buji dirençlerini ölç",
                "Techstream servis verisiyle doğrula"
            ],
            repairStepsEN: [
                "For Toyota: monitor cylinder misfire counts with Techstream",
                "For Toyota: measure coil and plug resistance",
                "Confirm with Techstream service data"
            ],
            safetyNotesTR: "Katalitik konvertör hasarı riski: uzun süre tekleme ile sürmeyin.",
            safetyNotesEN: "Catalytic converter damage risk: avoid prolonged driving with misfire."
        ),
        DtcEntry(
            code: "P1135",
            make: "Toyota",
            titleTR: "Ön Isıtmalı O2 Sensörü Isıtıcı Devresi (Banka 1 Sensör 1)",
            titleEN: "A/F Sensor Heater Circuit (Bank 1 Sensor 1)",
            descriptionTR: "Toyota A/F sensör ısıtıcı devresinde arıza.",
            descriptionEN: "Toyota A/F sensor heater circuit fault.",
            severity: .medium,
            partId: "o2_sensor",
            repairStepsTR: [
                "Toyota Techstream ile canlı A/F ısıtıcı akımını kontrol et",
                "Gerekirse orijinal A/F sensörünü değiştir"
            ],
            repairStepsEN: [
                "Check live A/F heater current with Techstream",
                "Replace OEM A/F sensor if needed"
            ],
            safetyNotesTR: "Egzoz sıcakken sensöre dokunmayın.",
            safetyNotesEN: "Do not touch the sensor while the exhaust is hot."
        )
    ]
}

enum SeedError: LocalizedError {
    case missingFile
    var errorDescription: String? { "DTC catalog file missing" }
}

private extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
}
