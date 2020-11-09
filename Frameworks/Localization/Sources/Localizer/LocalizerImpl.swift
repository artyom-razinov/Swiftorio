// This class is not thread safe or stateless
public final class LocalizerImpl: Localizer {
    private let localizationProvider: LocalizationProvider
    private var cachedLocalizations: [Locale: Localization] = [:]
    
    public init(localizationProvider: LocalizationProvider) {
        self.localizationProvider = localizationProvider
    }
    
    public func localize(
        locale: Locale,
        fullId: String)
        throws
        -> String
    {
        return try localization(locale: locale)
            .localize(fullId: fullId)
    }
    
    public func localize(
        locale: Locale,
        sectionName: LocalizationSectionName,
        idInSection: String)
        throws
        -> String
    {
        return try localization(locale: locale)
            .localize(sectionName: sectionName, idInSection: idInSection)
    }
    
    public func localize(
        locale: Locale,
        idInAnySection: String)
        throws
        -> String
    {
        return try localization(locale: locale)
            .localize(idInAnySection: idInAnySection)
    }
    
    private func localization(locale: Locale) throws -> Localization {
        let localization: Localization
        
        if let cachedLocalization = cachedLocalizations[locale] {
            localization = cachedLocalization
        } else {
            localization = try localizationProvider.localization(locale: locale)
            
            cachedLocalizations[locale] = localization
        }
        
        return localization
    }
}
