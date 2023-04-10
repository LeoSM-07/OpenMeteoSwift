import Foundation

/// A list of possible hourly parameters that can be passed to the Marine API.
///
/// Most weather variables are given as an instantaneous value for the indicated hour.
/// Some variables like precipitation are calculated from the preceding hour as an average or sum.
public enum HourlyMarineVariable: String, WeatherVariable {
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

    public var name: String {
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
