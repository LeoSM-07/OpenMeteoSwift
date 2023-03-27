//
// File.swift
// 
//
// Created by LeoSM_07 on 3/26/23.
//

import Foundation

/// All possible parameters that can be requested and returned from the weather API. Single value for each day.
///
/// Aggregations are a simple 24 hour aggregation from hourly values.
public enum DailyForecastVariable: String, MeteoData, CaseIterable, CodingKey {
    /// Maximum daily air temperature at 2 meters above ground
    case temperature2mMax = "temperature_2m_max"
    /// Minimum daily air temperature at 2 meters above ground
    case temperature2mMin = "temperature_2m_min"
    /// Maximum daily apparent temperature
    case apparentTemperatureMax = "apparent_temperature_max"
    /// Minimum daily apparent temperature
    case apparentTemperatureMin = "apparent_temperature_min"
    /// Sum of daily precipitation (including rain, showers and snowfall)
    case precipitationSum = "precipitation_sum"
    /// Sum of daily rain
    case rainSum = "rain_sum"
    /// Sum of daily showers
    case showersSum = "showers_sum"
    /// Sum of daily snowfall
    case snowfallSum = "snowfall_sum"
    /// The number of hours with rain
    case precipitationHours = "precipitation_hours"
    /// The maximum probability of precipitation
    case precipitationProbabilityMax = "precipitation_probability_max"
    /// The minimum probability of precipitation
    case precipitationProbabilityMin = "precipitation_probability_min"
    /// The mean probability of precipitation
    case precipitationProbabilityMean = "precipitation_probability_mean"
    /// The most severe weather condition on a given day.
    ///
    /// Follow WMO weather interpretation codes.
    case weatherCode = "weatherCode"
    /// Sunrise set time in Unix timestamp form
    case sunrise = "sunrise"
    /// Sunset set time in Unix timestamp form
    case sunset = "sunset"
    /// Maximum wind speed on a day
    case windSpeed10mMax = "windspeed_10m_max"
    /// Maximum wind gusts on a day
    case windGusts10mMax = "windgusts_10m_max"
    /// Dominant wind direction
    case windDirection10mDominant = "winddirection_10m_dominant"
    /// The sum of solar radiation on a given day in Megajoules
    case shortWaveRadiationSum = "shortwave_radiation_sum"
    /// Daily sum of ET₀ Reference Evapotranspiration of a well watered grass field
    case et0faoEvapotranspiration = "et0_fao_evapotranspiration"
    /// Daily maximum in UV Index starting from 0. Please follow the [official WMO guidelines](https://www.who.int/news-room/questions-and-answers/item/radiation-the-ultraviolet-(uv)-index) for ultraviolet index.
    case uvIndexMax = "uv_index_max"
    /// Daily maximum in UV Index starting from 0 assuming cloud free conditions. Please follow the [official WMO guidelines](https://www.who.int/news-room/questions-and-answers/item/radiation-the-ultraviolet-(uv)-index) for ultraviolet index.
    case uvIndexClearSkyMax = "uv_index_clear_sky_max"

    public var name: String {
        switch self {
        case .temperature2mMax: return "Maximum Temperature (2 m)"
        case .temperature2mMin: return "Minimum Temperature (2 m)"
        case .apparentTemperatureMax: return "Maximum Apparent Temperature (2 m)"
        case .apparentTemperatureMin: return "Minimum Apparent Temperature (2 m)"
        case .precipitationSum: return "Precipitation Sum "
        case .rainSum: return "Rain Sum"
        case .showersSum: return "Showers Sum"
        case .snowfallSum: return "Snowfall Sum"
        case .precipitationHours: return "Precipitation Hours"
        case .precipitationProbabilityMax: return "Precipitation Probability Maximum"
        case .precipitationProbabilityMin: return "Precipitation Probability Minimum"
        case .precipitationProbabilityMean: return "Precipitation Probability Mean"
        case .weatherCode: return "Weathercode"
        case .sunrise: return "Sunrise"
        case .sunset: return "Sunset"
        case .windSpeed10mMax: return "Maximum Wind Speed (10 m)"
        case .windGusts10mMax: return "Maximum Wind Gusts (10 m)"
        case .windDirection10mDominant: return "Dominant Wind Direction (10 m)"
        case .shortWaveRadiationSum: return "Shortwave Radiation Sum"
        case .et0faoEvapotranspiration: return "Reference Evapotranspiration (ET₀)"
        case .uvIndexMax: return "UV Index"
        case .uvIndexClearSkyMax: return "UV Index Clear Sky"
        }
    }
}
