//
// File.swift
// 
//
// Created by LeoSM_07 on 3/19/23.
//

import Foundation

/// A list of possible daily parameters that can be passed to the Marine API.
///
/// Most weather variables are given as an instantaneous value for the indicated hour.
/// Some variables like precipitation are calculated from the preceding hour as an average or sum.
public enum DailyMarineVariable: String, MeteoData, CaseIterable, CodingKey {
    case waveHeightMax = "wave_height_max"
    case waveDirectionDominant = "wave_direction_dominant"
    case wavePeriodMax = "wave_period_max"
    case windWaveHeightMax = "wind_wave_height_max"
    case windWaveDirectionDominant = "wind_wave_direction_dominant"
    case windWavePeriodMax = "wind_wave_period_max"
    case windWavePeakPeriodMax = "wind_wave_peak_period_max"
    case swellWaveHeightMax = "swell_wave_height_max"
    case swellWaveDirectionDominant = "swell_wave_direction_dominant"
    case swellWavePeriodMax = "swell_wave_period_max"
    case swellWavePeakPeriodMax = "swell_wave_peak_period_max"

    var name: String {
        switch self {
        case .waveHeightMax:
            return "Wave Height Max"
        case .waveDirectionDominant:
            return "Wave Direction Dominant"
        case .wavePeriodMax:
            return "Wave Period Max"
        case .windWaveHeightMax:
            return "Wind Wave Height Max"
        case .windWaveDirectionDominant:
            return "Wind Wave Direction Dominant"
        case .windWavePeriodMax:
            return "Wind Wave Period Max"
        case .windWavePeakPeriodMax:
            return "Wind Wave Peak Period Max"
        case .swellWaveHeightMax:
            return "Swell Wave Height Max"
        case .swellWaveDirectionDominant:
            return "Swell Wave Direction Dominant"
        case .swellWavePeriodMax:
            return "Swell Wave Period Max"
        case .swellWavePeakPeriodMax:
            return " well Wave Period Max"
        }
    }
}

/// A list of possible hourly parameters that can be passed to the Marine API.
///
/// Most weather variables are given as an instantaneous value for the indicated hour.
/// Some variables like precipitation are calculated from the preceding hour as an average or sum.
public enum HourlyMarineVariable: String, MeteoData, CaseIterable, CodingKey {
    case waveHeight = "wave_height"
    case waveDirection = "wave_direction"
    case wavePeriod = "wave_period"
    case windWaveHeight = "wind_wave_height"
    case windWaveDirection = "wind_wave_direction"
    case windWavePeriod = "wind_wave_period"
    case windWavePeakPeriod = "wind_wave_peak_period"
    case swellWaveHeight = "swell_wave_height"
    case swellWaveDirection = "swell_wave_direction"
    case swellWavePeriod = "swell_wave_period"
    case swellWavePeakPeriod = "swell_wave_peak_period"

    var name: String {
        switch self {
        case .waveHeight:
            return "Wave Height"
        case .waveDirection:
            return "Wave Direction"
        case .wavePeriod:
            return "Wave Period"
        case .windWaveHeight:
            return "Wind Wave Height"
        case .windWaveDirection:
            return "Wind Wave Height"
        case .windWavePeriod:
            return "Wind Wave Period"
        case .windWavePeakPeriod:
            return "Wind Wave Peak Period"
        case .swellWaveHeight:
            return "Swell Wave Height"
        case .swellWaveDirection:
            return "Swell Wave Direction"
        case .swellWavePeriod:
            return "Swell Wave Period"
        case .swellWavePeakPeriod:
            return "Swell Wave Peak Period"
        }
    }
}

private enum PrivateDailyMarineVariable: String, MeteoData, CaseIterable, CodingKey {
    case waveHeightMax = "wave_height_max"
    case waveDirectionDominant = "wave_direction_dominant"
    case wavePeriodMax = "wave_period_max"
    case windWaveHeightMax = "wind_wave_height_max"
    case windWaveDirectionDominant = "wind_wave_direction_dominant"
    case windWavePeriodMax = "wind_wave_period_max"
    case windWavePeakPeriodMax = "wind_wave_peak_period_max"
    case swellWaveHeightMax = "swell_wave_height_max"
    case swellWaveDirectionDominant = "swell_wave_direction_dominant"
    case swellWavePeriodMax = "swell_wave_period_max"
    case swellWavePeakPeriodMax = "swell_wave_peak_period_max"
    case time = "time"
}

private enum PrivateHourlyMarineVariable: String, MeteoData, CaseIterable, CodingKey {
    case waveHeight = "wave_height"
    case waveDirection = "wave_direction"
    case wavePeriod = "wave_period"
    case windWaveHeight = "wind_wave_height"
    case windWaveDirection = "wind_wave_direction"
    case windWavePeriod = "wind_wave_period"
    case windWavePeakPeriod = "wind_wave_peak_period"
    case swellWaveHeight = "swell_wave_height"
    case swellWaveDirection = "swell_wave_direction"
    case swellWavePeriod = "swell_wave_period"
    case swellWavePeakPeriod = "swell_wave_peak_period"
    case time = "time"
}

public struct MarineResponse: MeteoData {
    /// WGS84 of the center of the weather grid-cell which was used to generate this forecast. This coordinate might be up to 5 km away.
    public var latitude: Double
    /// WGS84 of the center of the weather grid-cell which was used to generate this forecast. This coordinate might be up to 5 km away.
    public var longitude: Double
    /// Generation time of the weather forecast in milliseconds. This is mainly used for performance monitoring and improvements
    public var generationTime: Double
    /// Applied timezone offset from the timezone parameter
    public var utcOffsetSeconds: Int
    /// Timezone identifier (e.g. `Europe/Berlin`)
    public var timezone: String
    /// Timezone abbreviation (e.g. `CEST`)
    public var timezoneAbbreviation: String
    /// The units for an associated `HourlyMarineVariable`
    public var hourlyUnits: [HourlyMarineVariable: String]?
    /// A list of timestamps with associated marine variables and their associated values
    public var hourly: [Date: [HourlyMarineVariable: Float]]?
    /// The units for an associated `DailyMarineVariable`
    public var dailyUnits: [DailyMarineVariable: String]?
    /// A list of timestamps with associated marine variables and their associated values
    public var daily: [Date: [DailyMarineVariable: Float]]?

    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
        case generationTime = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone = "timezone"
        case timezoneAbbreviation = "timezone_abbreviation"
        case hourlyUnits = "hourly_units"
        case hourly = "hourly"
        case dailyUnits = "daily_units"
        case daily = "daily"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.generationTime = try container.decode(Double.self, forKey: .generationTime)
        self.utcOffsetSeconds = try container.decode(Int.self, forKey: .utcOffsetSeconds)
        self.timezone = try container.decode(String.self, forKey: .timezone)
        self.timezoneAbbreviation = try container.decode(String.self, forKey: .timezoneAbbreviation)

        // Decode hourly units
        var hourlyUnitsDict = [HourlyMarineVariable: String]()

        let hourlyUnitsContainer = try container.nestedContainer(keyedBy: HourlyMarineVariable.self, forKey: .hourlyUnits)
        for key in hourlyUnitsContainer.allKeys {
            let value = try hourlyUnitsContainer.decode(String.self, forKey: key)
            hourlyUnitsDict[key] = value
        }
        self.hourlyUnits = hourlyUnitsDict

        // Decode daily units
        var dailyUnitsDict = [DailyMarineVariable: String]()

        let dailyUnitsContainer = try container.nestedContainer(keyedBy: DailyMarineVariable.self, forKey: .dailyUnits)
        for key in dailyUnitsContainer.allKeys {
            let value = try dailyUnitsContainer.decode(String.self, forKey: key)
            dailyUnitsDict[key] = value
        }
        self.dailyUnits = dailyUnitsDict

        // Decode hourly
        var hourlyDict: [Date: [HourlyMarineVariable: Float]] = [:]

        let hourlyContainer = try container.nestedContainer(keyedBy: PrivateHourlyMarineVariable.self, forKey: .hourly)
        let timeArray = try hourlyContainer.decode([Date].self, forKey: .time)

        for (index, date) in timeArray.enumerated() {

            for (key) in hourlyContainer.allKeys {
                if key != .time {
                    let element = try hourlyContainer.decode([Float].self, forKey: key)

                    if (hourlyDict[date] != nil) {
                        hourlyDict[date]!.updateValue(element[index], forKey: HourlyMarineVariable(rawValue: key.rawValue)!)
                    } else {
                        hourlyDict.updateValue([HourlyMarineVariable(rawValue: key.rawValue)!: element[index]], forKey: date)
                    }
                }
            }
        }
        self.hourly = hourlyDict

        // Decode daily
        var dailyDict: [Date: [DailyMarineVariable: Float]] = [:]

        let dailyContainer = try container.nestedContainer(keyedBy: PrivateDailyMarineVariable.self, forKey: .daily)
        let timeArrayDaily = try dailyContainer.decode([Date].self, forKey: .time)

        for (index, date) in timeArrayDaily.enumerated() {

            for (key) in dailyContainer.allKeys {
                if key != .time {
                    let element = try dailyContainer.decode([Float].self, forKey: key)

                    if (dailyDict[date] != nil) {
                        dailyDict[date]!.updateValue(element[index], forKey: DailyMarineVariable(rawValue: key.rawValue)!)
                    } else {
                        dailyDict.updateValue([DailyMarineVariable(rawValue: key.rawValue)!: element[index]], forKey: date)
                    }
                }
            }
        }
        self.daily = dailyDict

    }
}
