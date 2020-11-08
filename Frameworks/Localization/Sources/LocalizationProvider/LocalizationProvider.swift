public protocol LocalizationProvider {
    func localization(locale: Locale) throws -> Localization
}
