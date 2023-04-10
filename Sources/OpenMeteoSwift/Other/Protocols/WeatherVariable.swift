import Foundation

public protocol WeatherVariable: RawRepresentable, MeteoData, CaseIterable, CodingKey where RawValue == String {
    var name: String { get }
}
