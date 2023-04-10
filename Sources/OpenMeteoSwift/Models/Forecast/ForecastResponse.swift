import Foundation

/// The data returned by a forecast request
public struct ForecastResponse: MeteoData {
    /// WGS84 of the center of the weather grid-cell which was used to generate this forecast. This coordinate might be up to 5 km away.
    public var latitude: Double
    /// WGS84 of the center of the weather grid-cell which was used to generate this forecast. This coordinate might be up to 5 km away.
    public var longitude: Double
    /// The elevation from a 90 meter digital elevation model
    public var elevation: Double
    /// Generation time of the weather forecast in milliseconds. This is mainly used for performance monitoring and improvements
    public var generationTime: Double
    /// Applied timezone offset from the timezone parameter
    public var utcOffsetSeconds: Int
    /// Timezone identifier (e.g. `Europe/Berlin`)
    public var timezone: String
    /// Timezone abbreviation (e.g. `CEST`)
    public var timezoneAbbreviation: String
    /// Returns the current weather conditions if requested. Not included by default.
    public var currentWeather: CurrentWeather?
    /// A list of timestamps with associated forecast variables and their associated values
    public var hourly: [WeatherItem<HourlyForecastVariable>]?
    /// A list of timestamps with associated forecast variables and their associated values
    public var daily: [WeatherItem<DailyForecastVariable>]?

    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
        case elevation = "elevation"
        case generationTime = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone = "timezone"
        case timezoneAbbreviation = "timezone_abbreviation"
        case currentWeather = "current_weather"
        case hourlyUnits = "hourly_units"
        case hourly = "hourly"
        case dailyUnits = "daily_units"
        case daily = "daily"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.elevation = try container.decode(Double.self, forKey: .elevation)
        self.generationTime = try container.decode(Double.self, forKey: .generationTime)
        self.utcOffsetSeconds = try container.decode(Int.self, forKey: .utcOffsetSeconds)
        self.timezone = try container.decode(String.self, forKey: .timezone)
        self.timezoneAbbreviation = try container.decode(String.self, forKey: .timezoneAbbreviation)
        self.currentWeather = try container.decodeIfPresent(CurrentWeather.self, forKey: .currentWeather)

        // Decode hourly units
        var hourlyUnitsDict = [HourlyForecastVariable: String]()

        let hourlyUnitsContainer = try? container.nestedContainer(keyedBy: HourlyForecastVariable.self, forKey: .hourlyUnits)
        if let hourlyUnitsContainer {
            for key in hourlyUnitsContainer.allKeys {
                let value = try hourlyUnitsContainer.decode(String.self, forKey: key)
                hourlyUnitsDict[key] = value
            }
        }

        // Decode hourly units
        var dailyUnitsDict = [DailyForecastVariable: String]()

        let dailyUnitsContainer = try? container.nestedContainer(keyedBy: DailyForecastVariable.self, forKey: .dailyUnits)
        if let dailyUnitsContainer {
            for key in dailyUnitsContainer.allKeys {
                let value = try dailyUnitsContainer.decode(String.self, forKey: key)
                dailyUnitsDict[key] = value
            }
        }

        // Decode Hourly
        var hourlyArray: [WeatherItem<HourlyForecastVariable>] = []
        let hourlyContainer = try? container.nestedContainer(keyedBy: CustomCodingKey.self, forKey: .hourly)
        if let hourlyContainer {
            let timeArray = try hourlyContainer.decode([Date].self, forKey: .init(stringValue: "time"))

            for (index, date) in timeArray.enumerated() {

                for (key) in hourlyContainer.allKeys {
                    if key.stringValue != "time" {
                        let element = try hourlyContainer.decode([Float].self, forKey: key)
                        let unit = hourlyUnitsDict.first(where: {$0.key == .init(stringValue: key.stringValue)!})!
                        if let hourlyIndex = hourlyArray.firstIndex(where: {$0.date == date}) {
                            hourlyArray[hourlyIndex].measurements.append(.init(unit: unit.value, label: HourlyForecastVariable(rawValue: key.stringValue)!, value: element[index]))
                        } else {
                            hourlyArray.append(.init(date: date, measurements: [.init(unit: unit.value, label: HourlyForecastVariable(rawValue: key.stringValue)!, value: element[index])]))
                        }
                    }
                }
            }
            self.hourly = hourlyArray.sorted(by: {$0.date < $1.date})
        }

        // Decode Daily
        var dailyArray: [WeatherItem<DailyForecastVariable>] = []

        let dailyContainer = try? container.nestedContainer(keyedBy: CustomCodingKey.self, forKey: .daily)
        if let dailyContainer {
            let timeArray = try dailyContainer.decode([Date].self, forKey: .init(stringValue: "time"))

            for (index, date) in timeArray.enumerated() {

                for (key) in dailyContainer.allKeys {
                    if key.stringValue != "time" {
                        let element = try dailyContainer.decode([Float].self, forKey: key)
                        let unit = dailyUnitsDict.first(where: {$0.key == .init(stringValue: key.stringValue)!})!
                        if let dailyIndex = dailyArray.firstIndex(where: {$0.date == date}) {
                            dailyArray[dailyIndex].measurements.append(.init(unit: unit.value, label: DailyForecastVariable(rawValue: key.stringValue)!, value: element[index]))
                        } else {
                            dailyArray.append(.init(date: date, measurements: [.init(unit: unit.value, label: DailyForecastVariable(rawValue: key.stringValue)!, value: element[index])]))
                        }
                    }
                }
            }
            self.daily = dailyArray.sorted(by: {$0.date < $1.date})
        }
    }
}

