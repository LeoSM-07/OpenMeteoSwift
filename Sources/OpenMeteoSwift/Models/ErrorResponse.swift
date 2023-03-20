import Foundation

/// If the API returns an error, an `ErrorResponse` object will be present
public struct ErrorResponse: MeteoData {
    public var error: Bool
    public var reason: String
}
