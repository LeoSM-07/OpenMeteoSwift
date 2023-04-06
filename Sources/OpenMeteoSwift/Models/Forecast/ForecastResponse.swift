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

private enum PrivateHourlyForecastVariable: String, MeteoData, CaseIterable, CodingKey {
    case temperature2m = "temperature_2m"
    case relativeHumidity2m = "relativehumidity_2m"
    case dewPoint2m = "dewpoint_2m"
    case apparentTemperature = "apparent_temperature"
    case pressureMSL = "pressure_msl"
    case surfacePressure = "surface_pressure"
    case cloudCover = "cloudcover"
    case cloudCoverLow = "cloudcover_low"
    case cloudCoverMid = "cloudcover_mid"
    case cloudCoverHigh = "cloudcover_high"
    case windSpeed10m = "windspeed_10m"
    case windSpeed80m = "windspeed_80m"
    case windSpeed120m = "windspeed_120m"
    case windSpeed180m = "windspeed_180m"
    case windDirection10m = "winddirection_10m"
    case windDirection80m = "winddirection_80m"
    case windDirection120m = "winddirection_120m"
    case windDirection180m = "winddirection_180m"
    case windGusts10m = "windgusts_10m"
    case shortwaveRadiation = "shortwave_radiation"
    case directRadiation = "direct_radiation"
    case directNormalIrradiance = "direct_normal_irradiance"
    case diffuseRadiation = "diffuse_radiation"
    case vaporPressureDeficit = "vapor_pressure_deficit"
    case cape = "cape"
    case evapotranspiration = "evapotranspiration"
    case et0faoEvapotranspiration = "et0_fao_evapotranspiration"
    case precipitation = "precipitation"
    case snowfall = "snowfall"
    case precipitationProbability = "precipitation_probability"
    case rain = "rain"
    case showers = "showers"
    case weatherCode = "weathercode"
    case snowDepth = "snow_depth"
    case freezingLevelHeight = "freezinglevel_height"
    case visibility = "visibility"
    case soilTemperature0cm = "soil_temperature_0cm"
    case soilTemperature6cm = "soil_temperature_6cm"
    case soilTemperature18cm = "soil_temperature_18cm"
    case soilTemperature54cm = "soil_temperature_54cm"
    case soilMoisture0_1cm = "soil_moisture_0_1cm"
    case soilMoisture1_3cm = "soil_moisture_1_3cm"
    case soilMoisture3_9cm = "soil_moisture_3_9cm"
    case soilMoisture9_27cm = "soil_moisture_9_27cm"
    case soilMoisture27_81cm = "soil_moisture_27_81cm"
    case time = "time"
}

private enum PrivateDailyForecastVariable: String, MeteoData, CaseIterable, CodingKey {
    case temperature2mMax = "temperature_2m_max"
    case temperature2mMin = "temperature_2m_min"
    case apparentTemperatureMax = "apparent_temperature_max"
    case apparentTemperatureMin = "apparent_temperature_min"
    case precipitationSum = "precipitation_sum"
    case rainSum = "rain_sum"
    case showersSum = "showers_sum"
    case snowfallSum = "snowfall_sum"
    case precipitationHours = "precipitation_hours"
    case precipitationProbabilityMax = "precipitation_probability_max"
    case precipitationProbabilityMin = "precipitation_probability_min"
    case precipitationProbabilityMean = "precipitation_probability_mean"
    case weatherCode = "weathercode"
    case sunrise = "sunrise"
    case sunset = "sunset"
    case windSpeed10mMax = "windspeed_10m_max"
    case windGusts10mMax = "windgusts_10m_max"
    case windDirection10mDominant = "winddirection_10m_dominant"
    case shortWaveRadiationSum = "shortwave_radiation_sum"
    case et0faoEvapotranspiration = "et0_fao_evapotranspiration"
    case uvIndexMax = "uv_index_max"
    case uvIndexClearSkyMax = "uv_index_clear_sky_max"
    case time = "time"
}

/// A single snapshot in time that contains a date and appropriate measurements for that point in time
public struct HourlyForecastItem: MeteoData {
    /// The date of the Snapshot
    public var date: Date
    /// The measurements corresponding to the specific date
    public var measurements: [ItemData]

    public struct ItemData: MeteoData {
        public var variable: HourlyForecastVariable
        public var value: Float
    }

    public func measurementFor(_ variable: HourlyForecastVariable) -> Float? {
        return measurements.first(where: {$0.variable == variable})?.value
    }
}

/// A single snapshot in time that contains a date and appropriate measurements for that point in time
public struct DailyForecastItem: MeteoData {
    /// The date of the Snapshot
    public var date: Date
    /// The measurements corresponding to the specific date
    public var measurements: [ItemData]

    public struct ItemData: MeteoData {
        public var variable: DailyForecastVariable
        public var value: Float
    }

    public func measurementFor(_ variable: DailyForecastVariable) -> Float? {
        return measurements.first(where: {$0.variable == variable})?.value
    }
}

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
    /// The units for an associated `HourlyForecastVariable`
    public var hourlyUnits: [HourlyForecastVariable: String]?
    /// A list of timestamps with associated forecast variables and their associated values
    public var hourly: [HourlyForecastItem]?
    /// The units for an associated `HourlyForecastVariable`
    public var dailyUnits: [DailyForecastVariable: String]?
    /// A list of timestamps with associated forecast variables and their associated values
    public var daily: [DailyForecastItem]?

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
            self.hourlyUnits = hourlyUnitsDict
        }

        // Decode hourly units
        var dailyUnitsDict = [DailyForecastVariable: String]()

        let dailyUnitsContainer = try? container.nestedContainer(keyedBy: DailyForecastVariable.self, forKey: .dailyUnits)
        if let dailyUnitsContainer {
            for key in dailyUnitsContainer.allKeys {
                let value = try dailyUnitsContainer.decode(String.self, forKey: key)
                dailyUnitsDict[key] = value
            }
            self.dailyUnits = dailyUnitsDict
        }

        // Decode Hourly
        var hourlyArray: [HourlyForecastItem] = []

        let hourlyContainer = try? container.nestedContainer(keyedBy: PrivateHourlyForecastVariable.self, forKey: .hourly)
        if let hourlyContainer {
            let timeArray = try hourlyContainer.decode([Date].self, forKey: .time)

            for (index, date) in timeArray.enumerated() {

                for (key) in hourlyContainer.allKeys {
                    if key != .time {
                        let element = try hourlyContainer.decode([Float].self, forKey: key)
                        if let hourlyIndex = hourlyArray.firstIndex(where: {$0.date == date}) {
                            hourlyArray[hourlyIndex].measurements.append(.init(variable: HourlyForecastVariable(rawValue: key.rawValue)!, value: element[index]))
                        } else {
                            hourlyArray.append(.init(date: date, measurements: [.init(variable: HourlyForecastVariable(rawValue: key.rawValue)!, value: element[index])]))
                        }
                    }
                }
            }
            self.hourly = hourlyArray.sorted(by: {$0.date < $1.date})
        }


        // Decode Daily
        var dailyArray: [DailyForecastItem] = []

        let dailyContainer = try? container.nestedContainer(keyedBy: PrivateDailyForecastVariable.self, forKey: .daily)
        if let dailyContainer {
            let timeArray = try dailyContainer.decode([Date].self, forKey: .time)

            for (index, date) in timeArray.enumerated() {

                for (key) in dailyContainer.allKeys {
                    if key != .time {
                        let element = try dailyContainer.decode([Float].self, forKey: key)
                        if let dailyIndex = dailyArray.firstIndex(where: {$0.date == date}) {
                            dailyArray[dailyIndex].measurements.append(.init(variable: DailyForecastVariable(rawValue: key.rawValue)!, value: element[index]))
                        } else {
                            dailyArray.append(.init(date: date, measurements: [.init(variable: DailyForecastVariable(rawValue: key.rawValue)!, value: element[index])]))
                        }
                    }
                }
            }
            self.daily = dailyArray.sorted(by: {$0.date < $1.date})
        }

    }
}
