# Requesting Weather Forecast Data

Detailed, localized weather modeling

## Overview

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

