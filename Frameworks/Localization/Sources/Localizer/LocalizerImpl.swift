// This class is not thread safe or stateless
public final class LocalizerImpl: Localizer {
    private let localizationProvider: LocalizationProvider
    private var cachedLocalizations: [Locale: Localization] = [:]
    
    public init(localizationProvider: LocalizationProvider) {
        self.localizationProvider = localizationProvider
    }
    
    public func localize(
        locale: Locale,
        locator: Locator,
        parameters: [String])
        throws
        -> String
    {
        return try localization(locale: locale)
            .localize(locator: locator, parameters: parameters)
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
