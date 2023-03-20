import Foundation

/// If the API returns an error, an `ErrorResponse` object will be present
struct GeocodeResponseData: MeteoData {
    public var results: [GeocodeItem]
}

public struct GeocodeItem: MeteoData, Identifiable {
    /// Unique ID for this location
    public var id: Int
    /// Location name. Localized if possible
    public var name: String
    /// Geographical WGS84 coordinates of this location
    public var latitude: Double
    /// Geographical WGS84 coordinates of this location
    public var longitude: Double
    /// Elevation above mean sea level of this location
    public var elevation: Double
    /// Number of inhabitants
    public var population: Int?
    /// Type of this location. Follows the [GeoNames](https://www.geonames.org/export/codes.html) definition
    public var featureCode: String
    /// Country name. Localized if possible
    public var country: String?
    /// 2-Character FIPS [country code](https://en.wikipedia.org/wiki/List_of_FIPS_country_codes). Eg. DE for Germany
    public var countryCode: String?
    /// Unique ID for this country
    public var countryId: Int?
    /// Time zone using [time zone database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) definitions
    public var timezone: String?
    /// Name of hierarchical administrative areas this location resides in. Localized if possible
    public var admin1: String?
    /// Name of hierarchical administrative areas this location resides in. Localized if possible
    public var admin2: String?
    /// Name of hierarchical administrative areas this location resides in. Localized if possible
    public var admin3: String?
    /// Name of hierarchical administrative areas this location resides in. Localized if possible
    public var admin4: String?
    /// Unique IDs for the administrative areas
    public var admin1Id: Int?
    /// Unique IDs for the administrative areas
    public var admin2Id: Int?
    /// Unique IDs for the administrative areas
    public var admin3Id: Int?
    /// Unique IDs for the administrative areas
    public var admin4Id: Int?
    /// List of postcodes for this location
    public var postcodes: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case latitude
        case longitude
        case elevation
        case population
        case featureCode = "feature_code"
        case country
        case countryCode = "country_code"
        case countryId = "country_id"
        case timezone
        case admin1
        case admin2
        case admin3
        case admin4
        case admin1Id = "admin1_id"
        case admin2Id = "admin2_id"
        case admin3Id = "admin3_id"
        case admin4Id = "admin4_id"
        case postcodes
    }
}
