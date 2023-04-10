import XCTest
@testable import OpenMeteoSwift

extension OpenMeteoSwiftTests {
    func testForecastResponse1() throws {
        let data = try! Data(contentsOf: Bundle.module.url(forResource: "forecastData1", withExtension: "json")!)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodeTest = try decoder.decode(ForecastResponse.self, from: data)
        let first = decodeTest.hourly!.first!

        XCTAssertEqual(decodeTest.latitude, 52.52)
        XCTAssertEqual(decodeTest.longitude, 13.419998)
        XCTAssertEqual(decodeTest.elevation, 38.0)
        XCTAssertEqual(decodeTest.generationTime, 1.963973045349121)
        XCTAssertEqual(decodeTest.utcOffsetSeconds, -25200)
        XCTAssertEqual(decodeTest.timezone, "America/Los_Angeles")
        XCTAssertEqual(decodeTest.timezoneAbbreviation, "PDT")
        XCTAssertEqual(decodeTest.currentWeather?.time, Date(timeIntervalSince1970: 1681146000))
        XCTAssertEqual(decodeTest.currentWeather?.temperature, 59.0)

        XCTAssertEqual(first.date, Date(timeIntervalSince1970: 1681023600))
        XCTAssertEqual(first.measurement(for: .temperature2m)?.value, 39.8)
        XCTAssertEqual(first.measurement(for: .apparentTemperature)?.value, 35.6)

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
        XCTAssertEqual(first.measurement(for: .temperature2mMax)?.value, 50.7)
        XCTAssertEqual(first.measurement(for: .temperature2mMin)?.value, 33.3)
        XCTAssertEqual(first.measurement(for: .apparentTemperatureMax)?.value, 45.1)
        XCTAssertEqual(first.measurement(for: .apparentTemperatureMin)?.value, 25.8)
        XCTAssertEqual(first.measurement(for: .uvIndexMax)?.value, 1.80)
        XCTAssertEqual(first.measurement(for: .uvIndexClearSkyMax)?.value, 4.20)
        XCTAssertEqual(first.measurement(for: .precipitationSum)?.value, 0.000)
        XCTAssertEqual(first.measurement(for: .precipitationProbabilityMax)?.value, 26)
    }
}
