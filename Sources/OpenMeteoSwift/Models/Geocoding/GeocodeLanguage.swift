import Foundation

public enum GeocodeLanguage: String, MeteoData, Identifiable, CaseIterable {
    case english = "en"
    case german = "de"
    case french = "fr"
    case spanish = "es"
    case italian = "it"
    case portuguese = "pt"
    case russian = "rs"
    case turkish = "tr"
    case hindi = "hi"

    public var name: String {
        switch self {
        case .english:
            return "English"
        case .german:
            return "German"
        case .french:
            return "French"
        case .spanish:
            return "Spanish"
        case .italian:
            return "Italian"
        case .portuguese:
            return "Portuguese"
        case .russian:
            return "Russian"
        case .turkish:
            return "Turkish"
        case .hindi:
            return "Hindi"
        }
    }

    public var id: String {
        return self.rawValue
    }
}
