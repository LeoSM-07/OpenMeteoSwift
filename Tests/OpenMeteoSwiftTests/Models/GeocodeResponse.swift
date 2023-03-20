import XCTest
@testable import OpenMeteoSwift

extension OpenMeteoSwiftTests {
    func testGeocodeResponse1() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodeTest = try decoder.decode(GeocodeResponseData.self, from: geocodeData1)
        let result = decodeTest.results

        XCTAssertEqual(result.count, 10)
        XCTAssertEqual(result.first?.name, "United States")
    }

    func testGeocodeResponse2() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodeTest = try decoder.decode(GeocodeResponseData.self, from: geocodeData2)
        let result = decodeTest.results

        XCTAssertEqual(result.count, 10)
        XCTAssertEqual(result.first?.name, "Paris")
    }
}
