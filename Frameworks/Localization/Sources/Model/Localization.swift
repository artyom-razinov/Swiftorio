import SwiftorioFoundation

public final class Localization {
    public let locale: Locale
    public let sectionedMap: [LocalizationSectionName: [String: String]]
    public let plainMapWithSectionNames: [String: String]
    public let plainMapWithoutSectionNames: [String: String]
    
    public init(
        locale: Locale,
        sections: [LocalizationSectionName: [String: String]])
    {
        self.locale = locale
        self.sectionedMap = sections
        
        var plainMapWithSectionNames = [String: String]()
        var plainMapWithoutSectionNames = [String: String]()
        
        for (firstKey, section) in sectionedMap {
            for (secondKey, value) in section {
                plainMapWithSectionNames["\(firstKey.rawValue).\(secondKey)"] = value
                plainMapWithoutSectionNames[secondKey] = value
            }
        }
        
        self.plainMapWithSectionNames = plainMapWithSectionNames
        self.plainMapWithoutSectionNames = plainMapWithoutSectionNames
    }
    
    public func localize(
        fullId: String)
        throws
        -> String
    {
        return try plainMapWithSectionNames[fullId].unwrapOrThrow(
            message: "Locale '\(locale.rawValue)' doesn't contain localization for '\(fullId)'"
        )
    }
    
    public func localize(
        sectionName: LocalizationSectionName,
        idInSection: String)
        throws
        -> String
    {
        let sectionDictionary = try sectionedMap[sectionName].unwrapOrThrow(
            message: "Locale '\(locale.rawValue)' doesn't contain section '\(sectionName.rawValue)'"
        )
        
        return try sectionDictionary[idInSection].unwrapOrThrow(
            message: "Section '\(sectionName.rawValue)' of locale '\(locale.rawValue)' doesn't contain localization for '\(idInSection)'"
        )
    }
    
    public func localize(
        idInAnySection: String)
        throws
        -> String
    {
        // I have no idea of how localization work and if sections really matter.
        // I don't know how to determine that localization for "player-port" with subgroup "defensive-structure"
        // is inside "entity-name" section. Just regular items can be in "item-name", "entity-name", "equipment-name" or
        // somewhere else too, probably.
        return try plainMapWithoutSectionNames[idInAnySection].unwrapOrThrow(
            message: "Locale '\(locale.rawValue)' doesn't contain localization for '\(idInAnySection)' in any section"
        )
    }
}
