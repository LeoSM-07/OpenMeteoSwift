import Foundation

public struct OpenMeteo {

    public init() { }

    let decoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()
}
