public protocol Localizer {
    func localize(
        locale: Locale,
        fullId: String)
        throws
        -> String
    
    func localize(
        locale: Locale,
        sectionName: LocalizationSectionName,
        idInSection: String)
        throws
        -> String
    
    func localize(
        locale: Locale,
        idInAnySection: String)
        throws
        -> String
}
