# ``OpenMeteoSwift``
@Metadata {
    
}

Seamlessly connect with Open-Meteo, the free weather forecast API for non-commercial use.

## Overview
To make your first request, check out the <doc:QuickstartGuide>.

## Project Structure
This project is far from complete. If you experience any bugs or have any feature requests, please file an issue over on [GitHub](https://github.com/LeoSM-07/VercelKit). 

## Topics


### Articles
- <doc:QuickstartGuide>

### Weather Forecast
- <doc:RequestingWeatherData>
- ``OpenMeteo/forecast(lat:long:hourly:currentWeather:timezone:pastDays:forecastDays:temperatureUnit:windSpeedUnit:precipitationUnit:)``
- ``OpenMeteo/forecast(lat:long:hourly:currentWeather:timezone:startDate:endDate:temperatureUnit:windSpeedUnit:precipitationUnit:)``
- ``OpenMeteoSwift/ForecastResponse``
- ``CurrentWeather``
- ``OpenMeteoSwift/DailyForecastVariable``
- ``OpenMeteoSwift/HourlyForecastVariable``
- ``OpenMeteoSwift/DailyForecastItem``
- ``OpenMeteoSwift/HourlyForecastItem``

### Marine Forecast
- <doc:RequestingMarineData>
- ``OpenMeteoSwift/OpenMeteo/marineForecast(lat:long:hourly:timezone:pastDays:)``
- ``OpenMeteoSwift/OpenMeteo/marineForecast(lat:long:hourly:daily:timezone:pastDays:)``
- ``MarineResponse``
- ``DailyMarineVariable``
- ``HourlyMarineVariable``

### Geocoding
- <doc:RequestingGeocodeData>
- ``OpenMeteoSwift/OpenMeteo/geocode(_:language:resultCount:)``
- ``GeocodeItem``
- ``GeocodeLanguage``

### Misc
- ``OpenMeteoSwift/OpenMeteo``
- ``OpenMeteoSwift/ErrorResponse``
- ``OpenMeteoSwift/MeteoData``
