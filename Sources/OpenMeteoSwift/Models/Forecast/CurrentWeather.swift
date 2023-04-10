import Foundation

/// The current weather conditions
public struct CurrentWeather: MeteoData {
    public var temperature: Double
    public var windSpeed: Double
    public var windDirection: Double
    public var weatherCode: Int
    public var time: Date

    enum CodingKeys: String, CodingKey {
        case temperature
        case windSpeed = "windspeed"
        case windDirection = "winddirection"
        case weatherCode = "weathercode"
        case time
    }
}
