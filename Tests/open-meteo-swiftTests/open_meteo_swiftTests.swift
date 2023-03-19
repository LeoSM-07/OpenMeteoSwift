import XCTest
@testable import open_meteo_swift

final class open_meteo_swiftTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(open_meteo_swift().text, "Hello, World!")
    }
}
