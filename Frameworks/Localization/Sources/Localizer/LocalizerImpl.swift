// This class is not thread safe or stateless
public final class LocalizerImpl: Localizer {
    private let localizationProvider: LocalizationProvider
    private var cachedLocalizations: [Locale: Localization] = [:]
    
    public init(localizationProvider: LocalizationProvider) {
        self.localizationProvider = localizationProvider
    }
    
    public func localize(locale: Locale, section: LocalizationSectionName, id: String) throws -> String {
        let localization: Localization
        
        if let cachedLocalization = cachedLocalizations[locale] {
            localization = cachedLocalization
        } else {
            localization = try localizationProvider.localization(locale: locale)
            
            cachedLocalizations[locale] = localization
        }
        
        return try localization.localize(section: section, id: id)
    }
}
