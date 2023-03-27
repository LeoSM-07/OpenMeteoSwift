# Requesting Marine Weather Data

Hourly wave forecasts at 5 km resolution

## Overview

See the full API explorer on the [official Open-Meteo website](https://open-meteo.com/en/docs/marine-weather-api) 

An example marine request could look like the following:
```swift
let result = await OpenMeteo().marineForecast(
    lat: 34.03,
    long: -118.49,
    hourly: [
        .swellWavePeriod,
        .swellWaveHeight,
        .swellWavePeakPeriod,
    ],
    daily: [],
    timezone: "America/Los_Angeles",
    pastDays: 5
)

if let error = result.error {
    // Handle Error
} else if let data = result.data {
    // Handle Data
}
```

