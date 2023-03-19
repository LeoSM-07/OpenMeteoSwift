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
