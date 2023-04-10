import Foundation

public extension OpenMeteo {
    /// Accepts a search term and returns a list of matching locations
    /// - Parameters:
    ///   - name: String to search for. An empty string or only 1 character will return an empty result. 2 characters will only match exact matching locations. 3 and more characters will perform fuzzy matching. The search string can be a location name or a postal code.
    ///   - language: Return translated results, if available, otherwise return english or the native location name.
    ///   - resultCount: The number of search results to return. Up to 100 results can be retrieved.
    /// - Returns: Either an array of ``GeocodeItem`` or ``ErrorResponse``
    func geocode(
        _ name: String,
        language: GeocodeLanguage = .english,
        resultCount: Int = 10
    ) async -> (data: [GeocodeItem]?, error: ErrorResponse?) {
        let queries: [URLQueryItem] = [
            URLQueryItem(name: "name", value: "\(name)"),
            URLQueryItem(name: "language", value: "\(language.rawValue)"),
            URLQueryItem(name: "count", value: "\(resultCount > 100 ? 100 : resultCount < 1 ? 1 : resultCount)"),
        ]
        return await fetchGeocodeData(queries)
    }

    private func fetchGeocodeData(_ queries: [URLQueryItem]) async -> (data: [GeocodeItem]?, error: ErrorResponse?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "geocoding-api.open-meteo.com"
        urlComponents.path = "/v1/search"
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

            let result = try decoder.decode(GeocodeResponseData.self, from: data)
            return (result.results, nil)

        } catch {
            print("OpenMeteoAPI Request Error: \(error)")
            return (nil, ErrorResponse(error: true, reason: error.localizedDescription))
        }
    }
}
