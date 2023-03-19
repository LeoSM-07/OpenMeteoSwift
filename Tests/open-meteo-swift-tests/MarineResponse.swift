import XCTest
@testable import open_meteo_swift

final class OpenMeteoSwiftTests: XCTestCase {
    func testMarineResponse() throws {
        let data = """
        {
            "latitude": 33.75,
            "longitude": -118.75,
            "generationtime_ms": 0.3579854965209961,
            "utc_offset_seconds": -25200,
            "timezone": "America/Los_Angeles",
            "timezone_abbreviation": "PDT",
            "hourly_units": {
                "time": "unixtime",
                "wave_height": "m",
                "wave_direction": "°"
            },
            "hourly": {
              "time": [1679122800, 1679126400, 1679130000],
              "wave_height": [0.96, 1.10, 1.10],
              "wave_direction": [245, 243, 241]
            },
            "daily_units": {
                "time": "unixtime",
                "wave_height_max": "m",
                "wave_direction_dominant": "°"
            },
            "daily": {
              "time": [1679122800, 1679126400, 1679130000],
              "wave_height_max": [0.96, 1.28, 3.32],
              "wave_direction_dominant": [229, 201, 237]
            }
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodeTest = try decoder.decode(MarineResponse.self, from: data)
        let hourlySorted = decodeTest.hourly!.sorted(by: {$0.key < $1.key})
        let dailySorted = decodeTest.daily!.sorted(by: {$0.key < $1.key})



        XCTAssertEqual(decodeTest.latitude, 33.75)
        XCTAssertEqual(decodeTest.longitude, -118.75)
        XCTAssertEqual(decodeTest.generationTime, 0.3579854965209961)
        XCTAssertEqual(decodeTest.utcOffsetSeconds, -25200)
        XCTAssertEqual(decodeTest.timezone, "America/Los_Angeles")
        XCTAssertEqual(decodeTest.timezoneAbbreviation, "PDT")
        XCTAssertEqual(hourlySorted.first?.key, Date(timeIntervalSince1970: 1679122800))
        XCTAssertEqual(hourlySorted.first?.value.count, decodeTest.hourlyUnits?.count)
        XCTAssertEqual(dailySorted.first?.value.count, decodeTest.dailyUnits?.count)
    }
}
