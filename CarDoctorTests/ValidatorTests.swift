import XCTest
@testable import CarDoctor

final class ValidatorTests: XCTestCase {
    func testVinNormalizeAndValidate() {
        XCTAssertEqual(VinValidator.normalize(" 1hgcm82633a004352 "), "1HGCM82633A004352")
        XCTAssertTrue(VinValidator.isValid("1HGCM82633A004352"))
        XCTAssertFalse(VinValidator.isValid("SHORT"))
        XCTAssertFalse(VinValidator.isValid("1HGCM82633A00435I")) // contains I
    }

    func testDtcNormalizeAndValidate() {
        XCTAssertEqual(DtcParser.normalize("p0300"), "P0300")
        XCTAssertEqual(DtcParser.normalize("P 0300"), "P0300")
        XCTAssertTrue(DtcParser.isValid("P0420"))
        XCTAssertTrue(DtcParser.isValid("C0035"))
        XCTAssertFalse(DtcParser.isValid("X0300"))
        XCTAssertFalse(DtcParser.isValid("P03"))
    }

    func testWmiMapsToSpecificMake() {
        XCTAssertEqual(VehicleBrandRegistry.make(fromVin: "1HGCM82633A004352"), "Honda")
        XCTAssertEqual(VehicleBrandRegistry.make(fromVin: "4T1BE32K55U000001"), "Toyota")
        XCTAssertEqual(VehicleBrandRegistry.make(fromVin: "WVWZZZ3CZWE000001"), "Volkswagen")
        XCTAssertEqual(VehicleBrandRegistry.normalizeMake("vw"), "Volkswagen")
        XCTAssertEqual(VehicleBrandRegistry.normalizeMake("Mercedes"), "Mercedes-Benz")
        XCTAssertNil(VehicleBrandRegistry.normalizeMake("Generic"))
        XCTAssertFalse(VehicleBrandRegistry.supportedMakes.contains("Generic"))
    }

    @MainActor
    func testBrandSpecificDtcLookup() async {
        let service = DtcService()
        await service.loadCatalogIfNeeded()

        let honda = service.lookup(code: "P0300", make: "Honda")
        let toyota = service.lookup(code: "P0300", make: "Toyota")
        XCTAssertNotNil(honda)
        XCTAssertNotNil(toyota)
        XCTAssertEqual(honda?.make, "Honda")
        XCTAssertEqual(toyota?.make, "Toyota")
        XCTAssertNotEqual(honda?.descriptionEN, toyota?.descriptionEN)

        // Honda-only OEM code must not resolve for Toyota
        XCTAssertNotNil(service.lookup(code: "P1457", make: "Honda"))
        XCTAssertNil(service.lookup(code: "P1457", make: "Toyota"))

        // Toyota-only OEM
        XCTAssertNotNil(service.lookup(code: "P1135", make: "Toyota"))
        XCTAssertNil(service.lookup(code: "P1135", make: "Honda"))
    }

    func testVinDecodeDemoIsBrandSpecific() async throws {
        let service = VinDecodeService()
        let honda = try await service.decode(vin: "1HGCM82633A004352")
        XCTAssertEqual(honda.make, "Honda")
        XCTAssertEqual(honda.model, "Accord")
        XCTAssertNotEqual(honda.make.lowercased(), "generic")

        let toyota = try await service.decode(vin: "4T1BE32K55U000001")
        XCTAssertEqual(toyota.make, "Toyota")
    }
}
