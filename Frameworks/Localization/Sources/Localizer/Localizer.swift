public enum Locator {
    case fullId(String)
    case idInSpecificSection(LocalizationSectionName, String)
    case idInAnySection(String)
}

public protocol Localizer {
    func localize(
        locale: Locale,
        locator: Locator,
        parameters: [String])
        throws
        -> String
}

extension Localizer {
    public func localize(
        locale: Locale,
        fullId: String,
        parameters: [String] = [])
        throws
        -> String
    {
        return try localize(
            locale: locale,
            locator: .fullId(fullId),
            parameters: parameters
        )
    }
    
    public func localize(
        locale: Locale,
        sectionName: LocalizationSectionName,
        idInSection: String,
        parameters: [String] = [])
        throws
        -> String
    {
        return try localize(
            locale: locale,
            locator: .idInSpecificSection(sectionName, idInSection),
            parameters: parameters
        )
    }
    
    public func localize(
        locale: Locale,
        idInAnySection: String,
        parameters: [String] = [])
        throws
        -> String
    {
        return try localize(
            locale: locale,
            locator: .idInAnySection(idInAnySection),
            parameters: parameters
        )
    }
}
