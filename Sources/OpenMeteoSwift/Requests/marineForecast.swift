import Foundation

public extension OpenMeteo {

    /// Request hourly data using `pastDays`
    /// - Parameters:
    ///   - lat: Geographical WGS84 coordinate of the location
    ///   - long: Geographical WGS84 coordinate of the location
    ///   - hourly: (Optional) A list of weather variables which should be returned
    ///   - timezone: (Optional) If timezone is set, all timestamps are returned as local-time and data is returned starting at 00:00 local-time.
    ///   Any time zone name from the [time zone database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) is supported.
    ///   - pastDays: The number of days in the past to return (limit 92)
    /// - Returns: Either the ``MarineResponse`` or ``ErrorResponse``
    func marineForecast(
        lat: Double,
        long: Double,
        hourly: [HourlyMarineVariable],
        timezone: String? = nil,
        pastDays: Int? = nil
    ) async -> (data: MarineResponse?, error: ErrorResponse?) {
        var queries: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(long)"),
            URLQueryItem(name: "hourly", value: "\(hourly.compactMap{$0.rawValue}.joined(separator: ","))"),
        ]
        if let timezone { queries.append(URLQueryItem(name: "timezone", value: timezone)) }
        if let pastDays { queries.append(URLQueryItem(name: "past_days", value: "\(pastDays)")) }
        return await fetchMarineData(queries)
    }

    /// Request hourly data using `startDate & endDate`
    /// - Parameters:
    ///   - lat: Geographical WGS84 coordinate of the location
    ///   - long: Geographical WGS84 coordinate of the location
    ///   - hourly: (Optional) A list of weather variables which should be returned with per hour values
    ///   - daily: (Optional) A list of weather variables which should be returned with per day values
    ///   - timezone: All timestamps are returned as local-time and data is returned starting at 00:00 local-time.
    ///   Any time zone name from the [time zone database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) is supported.
    ///   - startDate: The date to begin the data
    ///   - endDate: The date to end the data
    /// - Returns: Either the ``MarineResponse`` or ``ErrorResponse``
    func marineForecast(
        lat: Double,
        long: Double,
        hourly: [HourlyMarineVariable],
        timezone: String,
        startDate: Date,
        endDate: Date
    ) async -> (data: MarineResponse?, error: ErrorResponse?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let queries: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(long)"),
            URLQueryItem(name: "hourly", value: "\(hourly.compactMap{$0.rawValue}.joined(separator: ","))"),
            URLQueryItem(name: "timezone", value: timezone),
            URLQueryItem(name: "start_date", value: dateFormatter.string(from: startDate)),
            URLQueryItem(name: "end_date", value: dateFormatter.string(from: endDate))
        ]
        return await fetchMarineData(queries)
    }

    /// Request daily (and maybe hourly) data using `pastDays`
    /// - Parameters:
    ///   - lat: Geographical WGS84 coordinate of the location
    ///   - long: Geographical WGS84 coordinate of the location
    ///   - hourly: (Optional) A list of weather variables which should be returned
    ///   - timezone: (Optional) If timezone is set, all timestamps are returned as local-time and data is returned starting at 00:00 local-time.
    ///   Any time zone name from the [time zone database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) is supported.
    ///   - pastDays: The number of days in the past to return (limit 92)
    /// - Returns: Either the ``MarineResponse`` or ``ErrorResponse``
    func marineForecast(
        lat: Double,
        long: Double,
        hourly: [HourlyMarineVariable]? = [],
        daily: [DailyMarineVariable],
        timezone: String,
        pastDays: Int? = nil
    ) async -> (data: MarineResponse?, error: ErrorResponse?) {
        var queries: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(long)"),
            URLQueryItem(name: "timezone", value: timezone),
            URLQueryItem(name: "daily", value: "\(daily.compactMap{$0.rawValue}.joined(separator: ","))"),
        ]
        if let hourly { queries.append(URLQueryItem(name: "hourly", value: "\(hourly.compactMap{$0.rawValue}.joined(separator: ","))")) }
        if let pastDays { queries.append(URLQueryItem(name: "past_days", value: "\(pastDays)")) }
        return await fetchMarineData(queries)
    }

    /// Request daily (and maybe hourly) data using `startDate & endDate`
    /// - Parameters:
    ///   - lat: Geographical WGS84 coordinate of the location
    ///   - long: Geographical WGS84 coordinate of the location
    ///   - hourly: (Optional) A list of weather variables which should be returned with per hour values
    ///   - daily: (Optional) A list of weather variables which should be returned with per day values
    ///   - timezone: All timestamps are returned as local-time and data is returned starting at 00:00 local-time.
    ///   Any time zone name from the [time zone database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) is supported.
    ///   - startDate: The date to begin the data
    ///   - endDate: The date to end the data
    /// - Returns: Either the ``MarineResponse`` or ``ErrorResponse``
    func marineForecast(
        lat: Double,
        long: Double,
        hourly: [HourlyMarineVariable]? = [],
        daily: [DailyMarineVariable],
        timezone: String,
        startDate: Date,
        endDate: Date
    ) async -> (data: MarineResponse?, error: ErrorResponse?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var queries: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(long)"),
            URLQueryItem(name: "daily", value: "\(daily.compactMap{$0.rawValue}.joined(separator: ","))"),
            URLQueryItem(name: "timezone", value: timezone),
            URLQueryItem(name: "start_date", value: dateFormatter.string(from: startDate)),
            URLQueryItem(name: "end_date", value: dateFormatter.string(from: endDate))
        ]
        if let hourly { queries.append(URLQueryItem(name: "hourly", value: "\(hourly.compactMap{$0.rawValue}.joined(separator: ","))")) }
        return await fetchMarineData(queries)
    }

    private func fetchMarineData(_ queries: [URLQueryItem]) async -> (data: MarineResponse?, error: ErrorResponse?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "marine-api.open-meteo.com"
        urlComponents.path = "/v1/marine"
        urlComponents.queryItems = queries
        urlComponents.queryItems?.append(URLQueryItem(name: "timeformat", value: "unixtime"))

        print(urlComponents.url!)

        let request = URLRequest(url: urlComponents.url!)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            // Catch any errors returned from the api
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let error = try? decoder.decode(ErrorResponse.self, from: data)

                print("OpenMeteoAPI Server Returned Error: \(error?.reason ?? "Unknown Reason")")
                return (nil, ErrorResponse(error: true, reason: error?.reason ?? "Unknown Reason"))
            }

            let result = try decoder.decode(MarineResponse.self, from: data)
            return (result, nil)

        } catch {
            print("OpenMeteoAPI Request Error: \(error)")
            return (nil, ErrorResponse(error: true, reason: error.localizedDescription))
        }
    }
}
