import Foundation

public enum HourlyForecastVariable: String, MeteoData, CaseIterable, CodingKey {
    /// Air temperature at 2 meters above ground
    case temperature2m = "temperature_2m"
    /// Relative humidity at 2 meters above ground
    case relativeHumidity2m = "relativehumidity_2m"
    /// Dew point temperature at 2 meters above ground
    case dewPoint2m = "dewpoint_2m"
    /// Apparent temperature is the perceived feels-like temperature combining wind chill factor, relative humidity and solar radiation
    case apparentTemperature = "apparent_temperature"
    /// Atmospheric air pressure reduced to mean sea level (msl)
    ///
    /// Typically pressure on mean sea level is used in meteorology.
    case pressureMSL = "pressure_msl"
    /// Pressure at surface
    ///
    /// Surface pressure gets lower with increasing elevation.
    case surfacePressure = "surface_pressure"
    /// Total cloud cover as an area fraction
    case cloudCover = "cloudcover"
    /// Low level clouds and fog up to 3 km altitude
    case cloudCoverLow = "cloudcover_low"
    /// Mid level clouds from 3 to 8 km altitude
    case cloudCoverMid = "cloudcover_mid"
    /// High level clouds from 8 km altitude
    case cloudCoverHigh = "cloudcover_high"
    /// Wind speed at 10 meters above ground
    ///
    /// Wind speed on 10 meters is the standard level.
    case windSpeed10m = "windspeed_10m"
    /// Wind speed at 80 meters above ground
    ///
    /// Wind speed on 10 meters is the standard level.
    case windSpeed80m = "windspeed_80m"
    /// Wind speed at 120 meters above ground
    ///
    /// Wind speed on 10 meters is the standard level.
    case windSpeed120m = "windspeed_120m"
    /// Wind speed at 180 meters above ground
    ///
    /// Wind speed on 10 meters is the standard level.
    case windSpeed180m = "windspeed_180m"
    /// Wind direction at 10 meters above ground
    case windDirection10m = "winddirection_10m"
    /// Wind direction at 80 meters above ground
    case windDirection80m = "winddirection_80m"
    /// Wind direction at 120 meters above ground
    case windDirection120m = "winddirection_120m"
    /// Wind direction at 180 meters above ground
    case windDirection180m = "winddirection_180m"
    /// Gusts at 10 meters above ground as a maximum of the preceding hour
    case windGusts10m = "windgusts_10m"
    /// Shortwave solar radiation as average of the preceding hour. This is equal to the total global horizontal irradiation
    case shortwaveRadiation = "shortwave_radiation"
    /// Direct solar radiation as average of the preceding hour on the horizontal plane
    case directRadiation = "direct_radiation"
    /// Direct solar radiation as average of the preceding hour on the the normal plane (perpendicular to the sun)
    case directNormalIrradiance = "direct_normal_irradiance"
    /// Diffuse solar radiation as average of the preceding hour
    case diffuseRadiation = "diffuse_radiation"
    /// Vapor Pressure Deficit (VPD) in kilopascal (kPa).
    ///
    /// For high VPD (over 1.6), water transpiration of plants increases. For low VPD (under 0.4), transpiration decreases.
    case vaporPressureDeficit = "vapor_pressure_deficit"
    /// Convective available potential energy. [See Wikipedia](https://en.wikipedia.org/wiki/Convective_available_potential_energy)
    case cape = "cape"
    /// Evapotranspiration from land surface and plants that weather models assumes for this location. Available soil water is considered. 1 mm evapotranspiration per hour equals 1 liter of water per spare meter.
    case evapotranspiration = "evapotranspiration"
    /// ET₀ Reference Evapotranspiration of a well watered grass field
    ///
    /// Based on [FAO-56 Penman-Monteith equations](https://www.fao.org/3/x0490e/x0490e04.htm) ET₀ is calculated from temperature, wind speed, humidity and solar radiation. Unlimited soil water is assumed. ET₀ is commonly used to estimate the required irrigation for plants.
    case et0faoEvapotranspiration = "et0_fao_evapotranspiration"
    /// Total precipitation (rain, showers, snow) sum of the preceding hour
    case precipitation = "precipitation"
    /// Snowfall amount of the preceding hour in centimeters. For the water equivalent in millimeter, divide by 7. E.g. 7 cm snow = 10 mm precipitation water equivalent
    case snowfall = "snowfall"
    /// Probability of precipitation with more than 0.1 mm of the preceding hour.
    ///
    /// Probability is based on ensemble weather models with 0.25° (~27 km) resolution. 30 different simulations are computed to better represent future weather conditions.
    case precipitationProbability = "precipitation_probability"
    /// Rain from large scale weather systems of the preceding hour in millimeter
    case rain = "rain"
    /// Showers from convective precipitation in millimeters from the preceding hour
    case showers = "showers"
    /// Weather condition as a numeric code. Follow WMO weather interpretation codes.
    case weatherCode = "weatherCode"
    /// Snow depth on the ground
    case snowDepth = "snow_depth"
    /// Altitude above sea level of the 0°C level
    case freezingLevelHeight = "freezinglevel_height"
    /// Viewing distance in meters. Influenced by low clouds, humidity and aerosols.
    ///
    /// Maximum visibility is approximately 24 km.
    case visibility = "visibility"
    /// Temperature in the soil at 0 cm depth.
    ///
    /// 0 cm is the surface temperature on land or water surface temperature on water.
    case soilTemperature0cm = "soil_temperature_0cm"
    /// Temperature in the soil at 6 cm depth.
    ///
    /// 0 cm is the surface temperature on land or water surface temperature on water.
    case soilTemperature6cm = "soil_temperature_6cm"
    /// Temperature in the soil at 18 cm depth.
    ///
    /// 0 cm is the surface temperature on land or water surface temperature on water.
    case soilTemperature18cm = "soil_temperature_18cm"
    /// Temperature in the soil at 54 cm depth.
    ///
    /// 0 cm is the surface temperature on land or water surface temperature on water.
    case soilTemperature54cm = "soil_temperature_54cm"
    /// Average soil water content as volumetric mixing ratio at 0-1 cm depth.
    case soilMoisture0_1cm = "soil_moisture_0_1cm"
    /// Average soil water content as volumetric mixing ratio at 1-3 cm depth.
    case soilMoisture1_3cm = "soil_moisture_1_3cm"
    /// Average soil water content as volumetric mixing ratio at 3-9 cm depth.
    case soilMoisture3_9cm = "soil_moisture_3_9cm"
    /// Average soil water content as volumetric mixing ratio at 9-27 cm depth.
    case soilMoisture9_27cm = "soil_moisture_9_27cm"
    /// Average soil water content as volumetric mixing ratio at 27-81 cm depth.
    case soilMoisture27_81cm = "soil_moisture_27_81cm"

    /// The human readable name of the variable
    public var name: String {
        switch self {
        case .temperature2m: return "Temperature (2 m)"
        case .relativeHumidity2m: return "Relative Humidity (2 m)"
        case .dewPoint2m: return "Dewpoint (2 m)"
        case .apparentTemperature: return "Apparent Temperature"
        case .pressureMSL: return "Sealevel Pressure"
        case .surfacePressure: return "Surface Pressure"
        case .cloudCover: return "Cloudcover Total"
        case .cloudCoverLow: return "Cloudcover Low"
        case .cloudCoverMid: return "Cloudcover Mid"
        case .cloudCoverHigh: return "Cloudcover High"
        case .windSpeed10m: return "Wind Speed (10 m)"
        case .windSpeed80m: return "Wind Speed (80 m)"
        case .windSpeed120m: return "Wind Speed (120 m)"
        case .windSpeed180m: return "Wind Speed (180 m)"
        case .windDirection10m: return "Wind Direction (10 m)"
        case .windDirection80m: return "Wind Direction (80 m)"
        case .windDirection120m: return "Wind Direction (120 m)"
        case .windDirection180m: return "Wind Direction (180 m)"
        case .windGusts10m: return "Wind Gusts (10 m)"
        case .shortwaveRadiation: return "Shortwave Solar Radiation"
        case .directRadiation: return "Direct Solar Radiation"
        case .directNormalIrradiance: return "Direct Normal Irradiance"
        case .diffuseRadiation: return "Diffuse Solar Radiation"
        case .vaporPressureDeficit: return ""
        case .cape: return "Convective Available Potential Energy"
        case .evapotranspiration: return "Evapotranspiration"
        case .et0faoEvapotranspiration: return "Reference Evapotranspiration (ET₀)"
        case .precipitation: return "Precipitation (rain + showers + snow)"
        case .snowfall: return "Snowfall"
        case .precipitationProbability: return "Precipitation Probability"
        case .rain: return "Rain"
        case .showers: return "Showers"
        case .weatherCode: return "Weathercode"
        case .snowDepth: return "Snow Depth"
        case .freezingLevelHeight: return "Freezing Level Height"
        case .visibility: return "Visibility"
        case .soilTemperature0cm: return "Soil Temperature (0 cm)"
        case .soilTemperature6cm: return "Soil Temperature (8 cm)"
        case .soilTemperature18cm: return "Soil Temperature (18 cm)"
        case .soilTemperature54cm: return "Soil Temperature (54 cm)"
        case .soilMoisture0_1cm: return "Soil Moisture (0-1 cm)"
        case .soilMoisture1_3cm: return "Soil Moisture (1-3 cm)"
        case .soilMoisture3_9cm: return "Soil Moisture (3-9 cm)"
        case .soilMoisture9_27cm: return "Soil Moisture (9-27 cm)"
        case .soilMoisture27_81cm: return "Soil Moisture (27-81 cm)"
        }
    }
}
