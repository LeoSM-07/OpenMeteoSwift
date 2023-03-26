import XCTest
@testable import OpenMeteoSwift

extension OpenMeteoSwiftTests {
    func testGeocodeResponse1() throws {
        let data = try! Data(contentsOf: Bundle.module.url(forResource: "geocodeData1", withExtension: "json")!)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodeTest = try decoder.decode(GeocodeResponseData.self, from: data)
        let result = decodeTest.results

        XCTAssertEqual(result.count, 10)
        XCTAssertEqual(result.first?.name, "United States")
    }

    func testGeocodeResponse2() throws {
        let data = try! Data(contentsOf: Bundle.module.url(forResource: "geocodeData2", withExtension: "json")!)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodeTest = try decoder.decode(GeocodeResponseData.self, from: data)
        let result = decodeTest.results

        XCTAssertEqual(result.count, 10)
        XCTAssertEqual(result.first?.name, "Paris")
    }
}
