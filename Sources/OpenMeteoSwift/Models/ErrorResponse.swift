import Foundation

/// If the API returns an error, an `ErrorResponse` object will be present
public struct ErrorResponse: MeteoData {
    var error: Bool
    var reason: String
}
