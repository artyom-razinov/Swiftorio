import PathKit

public protocol BaseModLocalizationIniPathProvider {
    func baseModLocalizationIniPath(locale: Locale) throws -> Path
}
