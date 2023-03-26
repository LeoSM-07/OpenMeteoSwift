import XCTest
@testable import OpenMeteoSwift

extension OpenMeteoSwiftTests {
    func testForecastResponse() throws {
        let data = try! Data(contentsOf: Bundle.module.url(forResource: "forecastData1", withExtension: "json")!)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodeTest = try decoder.decode(ForecastResponse.self, from: data)
        let first = decodeTest.hourly!.sorted(by: {$0.key < $1.key}).first!
        XCTAssertEqual(decodeTest.latitude, 34.060257)
        XCTAssertEqual(decodeTest.longitude, -118.234344)
        XCTAssertEqual(decodeTest.elevation, 87.0)
        XCTAssertEqual(decodeTest.generationTime, 2.3490190505981445)
        XCTAssertEqual(decodeTest.utcOffsetSeconds, -25200)
        XCTAssertEqual(decodeTest.timezone, "America/Los_Angeles")
        XCTAssertEqual(decodeTest.timezoneAbbreviation, "PDT")
        XCTAssertEqual(decodeTest.currentWeather?.time, Date(timeIntervalSince1970: 1679799600))
        XCTAssertEqual(decodeTest.currentWeather?.temperature, 55.8)

        XCTAssertEqual(first.key, Date(timeIntervalSince1970: 1679727600))
        XCTAssertEqual(first.value[.temperature2m], 50.1)
        XCTAssertEqual(first.value[.relativeHumidity2m], 48)
        XCTAssertEqual(first.value[.dewPoint2m], 31.1)
        XCTAssertEqual(first.value[.apparentTemperature], 45.5)
        XCTAssertEqual(first.value[.precipitationProbability], 0)
        XCTAssertEqual(first.value[.pressureMSL], 1020.6)
        XCTAssertEqual(first.value[.visibility], 134514.438)
    }
}
