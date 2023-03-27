# OpenMeteo Swift
![Swift Test Badge](https://github.com/LeoSM-07/OpenMeteoSwift/actions/workflows/swift.yml/badge.svg?event=push)
[![Deploy DocC](https://github.com/LeoSM-07/OpenMeteoSwift/actions/workflows/docC.yml/badge.svg)](https://github.com/LeoSM-07/OpenMeteoSwift/actions/workflows/docC.yml)

A swift package that enables swifty communication with the free [Open-Meteo API](https://open-meteo.com/). Please note that this package is still under development and may have several bugs.

Please refer to the [full documentation](https://leosm-07.github.io/OpenMeteoSwift/documentation/openmeteoswift/) that has additional guides and other supporting documentation.

## Current Features & Todo
**Current Features**
- Weather Forecast Calls
- Marine Forecast Calls
- Geocoding API Calls

**Todo:**
- Clean up return data for marine forecast
- Add historical forecast
- Add air quality forecast
- Maybe more? Submit an issue for requests :)

## [Weather Forecast Request](https://leosm-07.github.io/OpenMeteoSwift/documentation/openmeteoswift/requestingweatherdata)
See the full API explorer on the [official Open-Meteo website](https://open-meteo.com/en/docs)

An example forecast request could look like the following:

```swift
let result = await OpenMeteo().forecast(
    lat: 34.03,
    long: -118.49,
    hourly: [
        .temperature2m,
        .apparentTemperature,
    ],
    currentWeather: true,
    timezone: "America/Los_Angeles",
    pastDays: 2,
    forecastDays: 5,
    temperatureUnit: .fahrenheit,
    windSpeedUnit: .mph,
    precipitationUnit: .inch
)


if let error = result.error {
    // Handle Error
} else if let data = result.data {
    // Handle Data
}
```
