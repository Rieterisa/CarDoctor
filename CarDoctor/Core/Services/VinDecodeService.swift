import Foundation

actor VinDecodeService {
    private let session: URLSession

    /// Known demo / offline VINs with fully specific vehicle identity (no generic sedan).
    private static let demoVehicles: [String: VehicleInfo] = [
        "1HGCM82633A004352": VehicleInfo(
            vin: "1HGCM82633A004352",
            make: "Honda",
            model: "Accord",
            year: "2003",
            bodyClass: "Sedan",
            manufacturer: "Honda Motor Co., Ltd.",
            plantCountry: "USA",
            vehicleType: "Passenger Car",
            fuelType: "Gasoline",
            displacementL: "3.0"
        ),
        "4T1BE32K55U000001": VehicleInfo(
            vin: "4T1BE32K55U000001",
            make: "Toyota",
            model: "Camry",
            year: "2005",
            bodyClass: "Sedan",
            manufacturer: "Toyota Motor Manufacturing",
            plantCountry: "USA",
            vehicleType: "Passenger Car",
            fuelType: "Gasoline",
            displacementL: "2.4"
        ),
        "1FAFP404X1F100001": VehicleInfo(
            vin: "1FAFP404X1F100001",
            make: "Ford",
            model: "Mustang",
            year: "2001",
            bodyClass: "Coupe",
            manufacturer: "Ford Motor Company",
            plantCountry: "USA",
            vehicleType: "Passenger Car",
            fuelType: "Gasoline",
            displacementL: "3.8"
        ),
        "WVWZZZ3CZWE000001": VehicleInfo(
            vin: "WVWZZZ3CZWE000001",
            make: "Volkswagen",
            model: "Golf",
            year: "1998",
            bodyClass: "Hatchback",
            manufacturer: "Volkswagen AG",
            plantCountry: "Germany",
            vehicleType: "Passenger Car",
            fuelType: "Gasoline",
            displacementL: "1.8"
        ),
        "WBA3A5C50EF000001": VehicleInfo(
            vin: "WBA3A5C50EF000001",
            make: "BMW",
            model: "328i",
            year: "2014",
            bodyClass: "Sedan",
            manufacturer: "BMW AG",
            plantCountry: "Germany",
            vehicleType: "Passenger Car",
            fuelType: "Gasoline",
            displacementL: "2.0"
        ),
        "KMHCT41DABU000001": VehicleInfo(
            vin: "KMHCT41DABU000001",
            make: "Hyundai",
            model: "Accent",
            year: "2011",
            bodyClass: "Sedan",
            manufacturer: "Hyundai Motor Company",
            plantCountry: "South Korea",
            vehicleType: "Passenger Car",
            fuelType: "Gasoline",
            displacementL: "1.6"
        )
    ]

    init(session: URLSession = .shared) {
        self.session = session
    }

    func decode(vin raw: String) async throws -> VehicleInfo {
        let vin = VinValidator.normalize(raw)
        guard VinValidator.isValid(vin) else {
            throw VinError.invalidFormat
        }

        if let demo = Self.demoVehicles[vin] {
            return demo
        }

        let urlString = "https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVinValues/\(vin)?format=json"
        guard let url = URL(string: urlString) else { throw VinError.invalidFormat }

        do {
            let (data, response) = try await session.data(from: url)
            guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
                throw VinError.network
            }
            let decoded = try JSONDecoder().decode(NHTSAResponse.self, from: data)
            guard let result = decoded.Results.first else { throw VinError.notFound }

            let rawMake = result.Make?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            let model = result.Model?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            let year = result.ModelYear?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

            let canonicalMake =
                VehicleBrandRegistry.normalizeMake(rawMake)
                ?? VehicleBrandRegistry.make(fromVin: vin)

            guard let make = canonicalMake, !make.isEmpty, !model.isEmpty || !rawMake.isEmpty else {
                // Last resort: WMI-only brand identity (still specific — never "Generic").
                if let wmiMake = VehicleBrandRegistry.make(fromVin: vin) {
                    return VehicleInfo(
                        vin: vin,
                        make: wmiMake,
                        model: model.isEmpty ? "Unknown" : model,
                        year: year.isEmpty ? estimateYear(from: vin) : year,
                        bodyClass: result.BodyClass,
                        manufacturer: result.Manufacturer,
                        plantCountry: result.PlantCountry,
                        vehicleType: result.VehicleType,
                        fuelType: result.FuelTypePrimary,
                        displacementL: result.DisplacementL
                    )
                }
                throw VinError.notFound
            }

            return VehicleInfo(
                vin: vin,
                make: make,
                model: model.isEmpty ? "Unknown" : model,
                year: year.isEmpty ? estimateYear(from: vin) : year,
                bodyClass: result.BodyClass,
                manufacturer: result.Manufacturer ?? rawMake,
                plantCountry: result.PlantCountry,
                vehicleType: result.VehicleType,
                fuelType: result.FuelTypePrimary,
                displacementL: result.DisplacementL
            )
        } catch let error as VinError {
            throw error
        } catch {
            // Offline: resolve a specific brand from WMI — never invent a generic sedan.
            if let make = VehicleBrandRegistry.make(fromVin: vin) {
                return VehicleInfo(
                    vin: vin,
                    make: make,
                    model: "Unknown",
                    year: estimateYear(from: vin),
                    bodyClass: nil,
                    manufacturer: make,
                    plantCountry: nil,
                    vehicleType: nil,
                    fuelType: nil,
                    displacementL: nil
                )
            }
            throw VinError.network
        }
    }

    private func estimateYear(from vin: String) -> String {
        guard vin.count == 17 else { return "—" }
        let code = vin[vin.index(vin.startIndex, offsetBy: 9)]
        let map: [Character: String] = [
            "A": "2010", "B": "2011", "C": "2012", "D": "2013", "E": "2014",
            "F": "2015", "G": "2016", "H": "2017", "J": "2018", "K": "2019",
            "L": "2020", "M": "2021", "N": "2022", "P": "2023", "R": "2024",
            "S": "2025", "T": "2026"
        ]
        return map[code] ?? "—"
    }
}

enum VinError: LocalizedError {
    case invalidFormat
    case network
    case notFound

    var errorDescription: String? {
        switch self {
        case .invalidFormat: String(localized: "error.vin.invalid")
        case .network: String(localized: "error.vin.network")
        case .notFound: String(localized: "error.vin.notFound")
        }
    }
}

private struct NHTSAResponse: Decodable {
    let Results: [NHTSAResult]
}

private struct NHTSAResult: Decodable {
    let Make: String?
    let Model: String?
    let ModelYear: String?
    let BodyClass: String?
    let Manufacturer: String?
    let PlantCountry: String?
    let VehicleType: String?
    let FuelTypePrimary: String?
    let DisplacementL: String?
}
