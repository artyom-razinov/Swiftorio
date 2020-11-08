public protocol Localizer {
    func localize(
        locale: Locale,
        section: LocalizationSectionName,
        id: String)
        throws
        -> String
}
