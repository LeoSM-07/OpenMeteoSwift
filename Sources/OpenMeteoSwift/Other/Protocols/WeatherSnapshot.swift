import Foundation

public protocol WeatherSnapshot: MeteoData, Identifiable {
    associatedtype WeatherType: MeteoData
    var date: Date { get }
    var measurements: [ItemData<WeatherType>] { get }
    func measurement(for variable: WeatherType ) -> ItemData<WeatherType>?

}

/// A single snapshot in time that contains a date and appropriate measurements for that point in time
public struct WeatherItem<Variable: WeatherVariable>: WeatherSnapshot {
    public var id = UUID()
    /// The date of the Snapshot
    public var date: Date
    /// The measurements corresponding to the specific date
    public var measurements: [ItemData<Variable>]
    public func measurement(for label: Variable) -> ItemData<Variable>? {
        return measurements.first(where: {$0.label == label})
    }
}


public struct ItemData<WeatherType: MeteoData>: MeteoData {
    public var unit: String
    public var label: WeatherType
    public var value: Float
}
