import Foundation

/// Maps WMI (VIN positions 1–3) and NHTSA make strings to a canonical brand key.
enum VehicleBrandRegistry {
    /// Makes that have per-brand DTC coverage in the seed catalog.
    static let supportedMakes: [String] = [
        "Toyota", "Honda", "Ford", "Chevrolet", "Volkswagen", "BMW",
        "Mercedes-Benz", "Hyundai", "Kia", "Nissan", "Mazda", "Subaru",
        "Audi", "Peugeot", "Renault", "Fiat", "Volvo", "Jeep"
    ]

    /// Common World Manufacturer Identifiers → canonical make.
    private static let wmiToMake: [String: String] = [
        // Honda / Acura
        "1HG": "Honda", "2HG": "Honda", "3HG": "Honda", "SHH": "Honda", "JHM": "Honda",
        "19X": "Honda", "JH4": "Honda", "2HN": "Honda",
        // Toyota / Lexus
        "4T1": "Toyota", "4T3": "Toyota", "5TD": "Toyota", "5TF": "Toyota", "5TE": "Toyota",
        "JTD": "Toyota", "JT2": "Toyota", "JT3": "Toyota", "JT4": "Toyota", "JT8": "Toyota",
        "JTE": "Toyota", "JTN": "Toyota", "2T1": "Toyota", "4T4": "Toyota",
        "JTH": "Toyota", "JTJ": "Toyota", "JT6": "Toyota",
        // Ford
        "1FA": "Ford", "1FB": "Ford", "1FM": "Ford", "1FT": "Ford", "1ZV": "Ford",
        "2FA": "Ford", "2FM": "Ford", "3FA": "Ford", "WF0": "Ford", "1FADP": "Ford",
        // GM / Chevrolet
        "1G1": "Chevrolet", "1GC": "Chevrolet", "1GN": "Chevrolet", "2G1": "Chevrolet",
        "3G1": "Chevrolet", "KL1": "Chevrolet", "1GCDC": "Chevrolet",
        // Volkswagen
        "WVW": "Volkswagen", "WV1": "Volkswagen", "WV2": "Volkswagen", "3VW": "Volkswagen",
        "1VW": "Volkswagen", "AAV": "Volkswagen",
        // BMW
        "WBA": "BMW", "WBS": "BMW", "WBY": "BMW", "4US": "BMW", "5UM": "BMW",
        // Mercedes-Benz
        "WDB": "Mercedes-Benz", "WDD": "Mercedes-Benz", "WDC": "Mercedes-Benz",
        "4JG": "Mercedes-Benz", "WDY": "Mercedes-Benz",
        // Hyundai
        "KMH": "Hyundai", "KM8": "Hyundai", "5NM": "Hyundai", "5NP": "Hyundai",
        // Kia
        "KNA": "Kia", "KND": "Kia", "5XY": "Kia", "5XX": "Kia",
        // Nissan / Infiniti
        "1N4": "Nissan", "1N6": "Nissan", "3N1": "Nissan", "JN1": "Nissan",
        "JN8": "Nissan", "5N1": "Nissan",
        // Mazda
        "JM1": "Mazda", "JM3": "Mazda", "1YV": "Mazda", "3MZ": "Mazda",
        // Subaru
        "JF1": "Subaru", "JF2": "Subaru", "4S3": "Subaru", "4S4": "Subaru",
        // Audi
        "WAU": "Audi", "WA1": "Audi", "TRU": "Audi",
        // Peugeot / PSA
        "VF3": "Peugeot", "VR3": "Peugeot",
        // Renault
        "VF1": "Renault", "UU1": "Renault",
        // Fiat / Chrysler
        "ZFA": "Fiat", "ZFF": "Fiat", "3C3": "Fiat",
        // Volvo
        "YV1": "Volvo", "YV4": "Volvo", "LVY": "Volvo",
        // Jeep
        "1C4": "Jeep", "1J4": "Jeep", "1J8": "Jeep"
    ]

    private static let makeAliases: [String: String] = [
        "mercedes": "Mercedes-Benz",
        "mercedes benz": "Mercedes-Benz",
        "mercedes-benz": "Mercedes-Benz",
        "vw": "Volkswagen",
        "volkswagen": "Volkswagen",
        "chevy": "Chevrolet",
        "chevrolet": "Chevrolet",
        "gm": "Chevrolet",
        "general motors": "Chevrolet",
        "honda": "Honda",
        "acura": "Honda",
        "toyota": "Toyota",
        "lexus": "Toyota",
        "ford": "Ford",
        "lincoln": "Ford",
        "bmw": "BMW",
        "mini": "BMW",
        "hyundai": "Hyundai",
        "kia": "Kia",
        "nissan": "Nissan",
        "infiniti": "Nissan",
        "mazda": "Mazda",
        "subaru": "Subaru",
        "audi": "Audi",
        "peugeot": "Peugeot",
        "renault": "Renault",
        "fiat": "Fiat",
        "alfa romeo": "Fiat",
        "volvo": "Volvo",
        "jeep": "Jeep",
        "chrysler": "Jeep",
        "dodge": "Jeep",
        "ram": "Jeep"
    ]

    static func normalizeMake(_ raw: String) -> String? {
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return nil }
        let key = trimmed.lowercased()
        // Never accept a generic / placeholder brand — diagnosis must be vehicle-specific.
        if key == "generic" || key == "unknown" || key == "n/a" || key == "na" {
            return nil
        }
        if let alias = makeAliases[key] { return alias }
        // Exact case-insensitive match against supported list
        if let match = supportedMakes.first(where: { $0.caseInsensitiveCompare(trimmed) == .orderedSame }) {
            return match
        }
        // Title-case passthrough for unsupported but specific brands (still not "Generic")
        return trimmed
    }

    static func make(fromVin vin: String) -> String? {
        let normalized = VinValidator.normalize(vin)
        guard normalized.count >= 3 else { return nil }
        let wmi3 = String(normalized.prefix(3))
        if let make = wmiToMake[wmi3] { return make }
        // Some entries use 5-char keys in the table for disambiguation
        if normalized.count >= 5 {
            let wmi5 = String(normalized.prefix(5))
            if let make = wmiToMake[wmi5] { return make }
        }
        return nil
    }

    static func isSupported(_ make: String) -> Bool {
        guard let canonical = normalizeMake(make) else { return false }
        return supportedMakes.contains(canonical)
    }
}
