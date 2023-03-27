# Quick Start Guide

Learn to make your first API request

## Connect to the API

To get started with Open-Meteo, initialize a new ``OpenMeteo`` object that will serve as host for the API connection.

Please review any information and notices from the [official Open-Meteo website](https://open-meteo.com/) as well. 

```swift
let api = OpenMeteo()
```

To make a request, just call one of the methods on ``OpenMeteo``. All requests are asynchronous return a tuple that either contains the result data or a ``ErrorResponse`` object. If neither is returned, there is most likely an error with the network or request.
```swift
let result = await api.forecast(
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

All other requests follow a similar structure.

## Topics

### Additional Requests
Check out some of the possible requests available after initializing the API

- ``OpenMeteoSwift/OpenMeteo/forecast(lat:long:hourly:currentWeather:timezone:pastDays:forecastDays:temperatureUnit:windSpeedUnit:precipitationUnit:)``
- ``OpenMeteoSwift/OpenMeteo/marineForecast(lat:long:hourly:daily:timezone:pastDays:)``
- ``OpenMeteoSwift/OpenMeteo/geocode(_:language:resultCount:)``

