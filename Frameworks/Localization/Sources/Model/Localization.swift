import SwiftorioFoundation

public final class Localization {
    public let locale: Locale
    public let sections: [LocalizationSectionName: [String: String]]
    
    public init(
        locale: Locale,
        sections: [LocalizationSectionName: [String: String]])
    {
        self.locale = locale
        self.sections = sections
    }
    
    public func localize(section: LocalizationSectionName, id: String) throws -> String {
        let sectionDictionary = try sections[section].unwrapOrThrow(
            message: "Locale '\(locale.rawValue)' doesn't contain section '\(section.rawValue)'"
        )
        
        return try sectionDictionary[id].unwrapOrThrow(
            message: "Section '\(section.rawValue)' of locale '\(locale.rawValue)' doesn't contain localization for '\(id)'"
        )
    }
}
