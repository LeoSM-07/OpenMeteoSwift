import Foundation

public extension OpenMeteo {
    struct ForecastRequestOptions {
        public enum TemperatureUnit: String {
            case fahrenheit = "fahrenheit"
            case celsius = "celsius"
        }
        public enum WindSpeedUnit: String {
            case mph = "mph"
            case ms = "ms"
            case knots = "kn"
            case kmh = "kmh"
        }
        public enum PrecipitationUnit: String {
            case inch = "inch"
            case ms = "ms"
        }
    }

    /// Get general weather forecast data for a location
    /// - Parameters:
    ///   - lat: Geographical WGS84 coordinate of the location
    ///   - long: Geographical WGS84 coordinate of the location
    ///   - hourly: (Optional) A list of weather variables which should be returned with per hour values
    ///   - currentWeather: (Optional) Include information abut the current weather
    ///   - timezone: (Optional) All timestamps are returned as local-time and data is returned starting at 00:00 local-time. Default is GMT
    ///   - pastDays: (Optional) The number of days in the past to return (limit 92)
    ///   - forecastDays: (Optional) The number of days in the past to return (limit 16)
    ///   - temperatureUnit: (Optional) The unit of temperature. Default Celsius
    ///   - windSpeedUnit: (Optional) The unit of temperature. Default Km/h
    ///   - precipitationUnit: (Optional) The unit of precipitation. Default mm
    /// - Returns: Either the ``ForecastResponse`` or ``ErrorResponse``
    func forecast(
        lat: Double,
        long: Double,
        hourly: [HourlyForecastVariable]? = nil,
        currentWeather: Bool? = nil,
        timezone: String? = nil,
        pastDays: Int? = nil,
        forecastDays: Int? = nil,
        temperatureUnit: ForecastRequestOptions.TemperatureUnit? = nil,
        windSpeedUnit: ForecastRequestOptions.WindSpeedUnit? = nil,
        precipitationUnit: ForecastRequestOptions.PrecipitationUnit? = nil
    ) async -> (data: ForecastResponse?, error: ErrorResponse?) {
        var queries: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(long)"),
        ]
        if let hourly { queries.append(URLQueryItem(name: "hourly", value: "\(hourly.compactMap{$0.rawValue}.joined(separator: ","))")) }
        if let currentWeather { queries.append(URLQueryItem(name: "current_weather", value: "\(currentWeather)"))}
        if let timezone { queries.append(URLQueryItem(name: "timezone", value: timezone)) }
        if let pastDays { queries.append(URLQueryItem(name: "past_days", value: "\(pastDays)")) }
        if let forecastDays { queries.append(URLQueryItem(name: "forecast_days", value: "\(forecastDays)")) }
        if let temperatureUnit { queries.append(URLQueryItem(name: "temperature_unit", value: "\(temperatureUnit.rawValue)")) }
        if let windSpeedUnit { queries.append(URLQueryItem(name: "windspeed_unit", value: "\(windSpeedUnit.rawValue)")) }
        if let precipitationUnit { queries.append(URLQueryItem(name: "precipitation_unit", value: "\(precipitationUnit.rawValue)")) }
        return await fetchForecastData(queries)
    }

    
    /// Get general weather forecast data for a location
    /// - Parameters:
    ///   - lat: Geographical WGS84 coordinate of the location
    ///   - long: Geographical WGS84 coordinate of the location
    ///   - hourly: (Optional) A list of weather variables which should be returned with per hour values
    ///   - currentWeather: (Optional) Include information abut the current weather
    ///   - timezone: (Optional) All timestamps are returned as local-time and data is returned starting at 00:00 local-time. Default is GMT
    ///   - startDate: (Optional) The date to start forecast (can be in the past)
    ///   - endDate: (Optional) The date to end the forecast
    ///   - temperatureUnit: (Optional) The unit of temperature. Default Celsius
    ///   - windSpeedUnit: (Optional) The unit of temperature. Default Km/h
    ///   - precipitationUnit: (Optional) The unit of precipitation. Default mm
    /// - Returns: Either the ``ForecastResponse`` or ``ErrorResponse``
    func forecast(
        lat: Double,
        long: Double,
        hourly: [HourlyForecastVariable]? = nil,
        currentWeather: Bool? = nil,
        timezone: String? = nil,
        startDate: Date,
        endDate: Date,
        temperatureUnit: ForecastRequestOptions.TemperatureUnit? = nil,
        windSpeedUnit: ForecastRequestOptions.WindSpeedUnit? = nil,
        precipitationUnit: ForecastRequestOptions.PrecipitationUnit? = nil
    ) async -> (data: ForecastResponse?, error: ErrorResponse?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var queries: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(long)"),
            URLQueryItem(name: "start_date", value: dateFormatter.string(from: startDate)),
            URLQueryItem(name: "end_date", value: dateFormatter.string(from: endDate))
        ]
        if let hourly { queries.append(URLQueryItem(name: "hourly", value: "\(hourly.compactMap{$0.rawValue}.joined(separator: ","))")) }
        if let currentWeather { queries.append(URLQueryItem(name: "current_weather", value: "\(currentWeather)"))}
        if let timezone { queries.append(URLQueryItem(name: "timezone", value: timezone)) }
        if let temperatureUnit { queries.append(URLQueryItem(name: "temperature_unit", value: "\(temperatureUnit.rawValue)")) }
        if let windSpeedUnit { queries.append(URLQueryItem(name: "windspeed_unit", value: "\(windSpeedUnit.rawValue)")) }
        if let precipitationUnit { queries.append(URLQueryItem(name: "precipitation_unit", value: "\(precipitationUnit.rawValue)")) }
        return await fetchForecastData(queries)
    }

    /// Get general weather forecast data for a location
    /// - Parameters:
    ///   - lat: Geographical WGS84 coordinate of the location
    ///   - long: Geographical WGS84 coordinate of the location
    ///   - timezone: (Optional) All timestamps are returned as local-time and data is returned starting at 00:00 local-time. Default is GMT
    ///   - daily: A list of weather variables which should be returned with per day values
    ///   - hourly: (Optional) A list of weather variables which should be returned with per hour values
    ///   - currentWeather: (Optional) Include information abut the current weather
    ///   - pastDays: (Optional) The number of days in the past to return (limit 92)
    ///   - forecastDays: (Optional) The number of days in the past to return (limit 16)
    ///   - temperatureUnit: (Optional) The unit of temperature. Default Celsius
    ///   - windSpeedUnit: (Optional) The unit of temperature. Default Km/h
    ///   - precipitationUnit: (Optional) The unit of precipitation. Default mm
    /// - Returns: Either the ``ForecastResponse`` or ``ErrorResponse``
    func forecast(
        lat: Double,
        long: Double,
        timezone: String,
        daily: [DailyForecastVariable],
        hourly: [HourlyForecastVariable]? = nil,
        currentWeather: Bool? = nil,
        pastDays: Int? = nil,
        forecastDays: Int? = nil,
        temperatureUnit: ForecastRequestOptions.TemperatureUnit? = nil,
        windSpeedUnit: ForecastRequestOptions.WindSpeedUnit? = nil,
        precipitationUnit: ForecastRequestOptions.PrecipitationUnit? = nil
    ) async -> (data: ForecastResponse?, error: ErrorResponse?) {
        var queries: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(long)"),
            URLQueryItem(name: "timezone", value: "\(timezone)"),
            URLQueryItem(name: "daily", value: "\(daily.compactMap{$0.rawValue}.joined(separator: ","))")
        ]
        if let hourly { queries.append(URLQueryItem(name: "hourly", value: "\(hourly.compactMap{$0.rawValue}.joined(separator: ","))")) }
        if let currentWeather { queries.append(URLQueryItem(name: "current_weather", value: "\(currentWeather)"))}
        if let pastDays { queries.append(URLQueryItem(name: "past_days", value: "\(pastDays)")) }
        if let forecastDays { queries.append(URLQueryItem(name: "forecast_days", value: "\(forecastDays)")) }
        if let temperatureUnit { queries.append(URLQueryItem(name: "temperature_unit", value: "\(temperatureUnit.rawValue)")) }
        if let windSpeedUnit { queries.append(URLQueryItem(name: "windspeed_unit", value: "\(windSpeedUnit.rawValue)")) }
        if let precipitationUnit { queries.append(URLQueryItem(name: "precipitation_unit", value: "\(precipitationUnit.rawValue)")) }
        return await fetchForecastData(queries)
    }

    /// Get general weather forecast data for a location
    /// - Parameters:
    ///   - lat: Geographical WGS84 coordinate of the location
    ///   - long: Geographical WGS84 coordinate of the location
    ///   - timezone: (Optional) All timestamps are returned as local-time and data is returned starting at 00:00 local-time. Default is GMT
    ///   - daily: A list of weather variables which should be returned with per day values
    ///   - hourly: (Optional) A list of weather variables which should be returned with per hour values
    ///   - currentWeather: (Optional) Include information abut the current weather
    ///   - startDate: (Optional) The date to start forecast (can be in the past)
    ///   - endDate: (Optional) The date to end the forecast
    ///   - temperatureUnit: (Optional) The unit of temperature. Default Celsius
    ///   - windSpeedUnit: (Optional) The unit of temperature. Default Km/h
    ///   - precipitationUnit: (Optional) The unit of precipitation. Default mm
    /// - Returns: Either the ``ForecastResponse`` or ``ErrorResponse``
    func forecast(
        lat: Double,
        long: Double,
        timezone: String,
        daily: [DailyForecastVariable],
        hourly: [HourlyForecastVariable]? = nil,
        currentWeather: Bool? = nil,
        startDate: Date,
        endDate: Date,
        temperatureUnit: ForecastRequestOptions.TemperatureUnit? = nil,
        windSpeedUnit: ForecastRequestOptions.WindSpeedUnit? = nil,
        precipitationUnit: ForecastRequestOptions.PrecipitationUnit? = nil
    ) async -> (data: ForecastResponse?, error: ErrorResponse?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var queries: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(long)"),
            URLQueryItem(name: "timezone", value: "\(timezone)"),
            URLQueryItem(name: "daily", value: "\(daily.compactMap{$0.rawValue}.joined(separator: ","))"),
            URLQueryItem(name: "start_date", value: dateFormatter.string(from: startDate)),
            URLQueryItem(name: "end_date", value: dateFormatter.string(from: endDate))
        ]
        if let hourly { queries.append(URLQueryItem(name: "hourly", value: "\(hourly.compactMap{$0.rawValue}.joined(separator: ","))")) }
        if let currentWeather { queries.append(URLQueryItem(name: "current_weather", value: "\(currentWeather)"))}
        if let temperatureUnit { queries.append(URLQueryItem(name: "temperature_unit", value: "\(temperatureUnit.rawValue)")) }
        if let windSpeedUnit { queries.append(URLQueryItem(name: "windspeed_unit", value: "\(windSpeedUnit.rawValue)")) }
        if let precipitationUnit { queries.append(URLQueryItem(name: "precipitation_unit", value: "\(precipitationUnit.rawValue)")) }
        return await fetchForecastData(queries)
    }

    private func fetchForecastData(_ queries: [URLQueryItem]) async -> (data: ForecastResponse?, error: ErrorResponse?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.open-meteo.com"
        urlComponents.path = "/v1/forecast"
        urlComponents.queryItems = queries
        urlComponents.queryItems?.append(URLQueryItem(name: "timeformat", value: "unixtime"))

        let request = URLRequest(url: urlComponents.url!)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            // Catch any errors returned from the api
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let error = try? decoder.decode(ErrorResponse.self, from: data)

                print("OpenMeteoAPI Server Returned Error: \(error?.reason ?? "Unknown Reason")")
                return (nil, ErrorResponse(error: true, reason: error?.reason ?? "Unknown Reason"))
            }

            let result = try decoder.decode(ForecastResponse.self, from: data)
            return (result, nil)

        } catch {
            print("OpenMeteoAPI Request Error: \(error)")
            return (nil, ErrorResponse(error: true, reason: error.localizedDescription))
        }
    }
}
