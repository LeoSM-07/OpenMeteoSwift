import XCTest
@testable import OpenMeteoSwift

extension OpenMeteoSwiftTests {
    func testForecastResponse1() throws {
        let data = try! Data(contentsOf: Bundle.module.url(forResource: "forecastData1", withExtension: "json")!)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodeTest = try decoder.decode(ForecastResponse.self, from: data)
        let first = decodeTest.hourly!.first!

        XCTAssertEqual(decodeTest.latitude, 34.060257)
        XCTAssertEqual(decodeTest.longitude, -118.234344)
        XCTAssertEqual(decodeTest.elevation, 87.0)
        XCTAssertEqual(decodeTest.generationTime, 2.3490190505981445)
        XCTAssertEqual(decodeTest.utcOffsetSeconds, -25200)
        XCTAssertEqual(decodeTest.timezone, "America/Los_Angeles")
        XCTAssertEqual(decodeTest.timezoneAbbreviation, "PDT")
        XCTAssertEqual(decodeTest.currentWeather?.time, Date(timeIntervalSince1970: 1679799600))
        XCTAssertEqual(decodeTest.currentWeather?.temperature, 55.8)

        XCTAssertEqual(first.date, Date(timeIntervalSince1970: 1679727600))
        XCTAssertEqual(first.measurementFor(.temperature2m), 50.1)
        XCTAssertEqual(first.measurementFor(.relativeHumidity2m), 48)
        XCTAssertEqual(first.measurementFor(.dewPoint2m), 31.1)
        XCTAssertEqual(first.measurementFor(.apparentTemperature), 45.5)
        XCTAssertEqual(first.measurementFor(.precipitationProbability), 0)
        XCTAssertEqual(first.measurementFor(.pressureMSL), 1020.6)
        XCTAssertEqual(first.measurementFor(.visibility), 134514.438)
    }

    func testForecastResponse2() throws {
        let data = try! Data(contentsOf: Bundle.module.url(forResource: "forecastData2", withExtension: "json")!)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodeTest = try decoder.decode(ForecastResponse.self, from: data)
        let first = decodeTest.daily!.first!

        XCTAssertEqual(decodeTest.latitude, 52.52)
        XCTAssertEqual(decodeTest.longitude, 13.419998)
        XCTAssertEqual(decodeTest.elevation, 38.0)
        XCTAssertEqual(decodeTest.generationTime, 0.9009838104248047)
        XCTAssertEqual(decodeTest.utcOffsetSeconds, -25200)
        XCTAssertEqual(decodeTest.timezone, "America/Los_Angeles")
        XCTAssertEqual(decodeTest.timezoneAbbreviation, "PDT")
        XCTAssertEqual(decodeTest.currentWeather?.time, Date(timeIntervalSince1970: 1679868000))
        XCTAssertEqual(decodeTest.currentWeather?.temperature, 41.2)

        XCTAssertEqual(first.date, Date(timeIntervalSince1970: 1679814000))
        XCTAssertEqual(first.measurementFor(.temperature2mMax), 50.7)
        XCTAssertEqual(first.measurementFor(.temperature2mMin), 33.3)
        XCTAssertEqual(first.measurementFor(.apparentTemperatureMax), 45.1)
        XCTAssertEqual(first.measurementFor(.apparentTemperatureMin), 25.8)
        XCTAssertEqual(first.measurementFor(.uvIndexMax), 1.80)
        XCTAssertEqual(first.measurementFor(.uvIndexClearSkyMax), 4.20)
        XCTAssertEqual(first.measurementFor(.precipitationSum), 0.000)
        XCTAssertEqual(first.measurementFor(.precipitationProbabilityMax), 26)
    }
}
