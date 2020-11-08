import INIParser
import Foundation

public final class LocalizationProviderImpl: LocalizationProvider {
    private let baseModLocalizationIniPathProvider: BaseModLocalizationIniPathProvider
    private let iniParser: IniParser
    
    public init(
        baseModLocalizationIniPathProvider: BaseModLocalizationIniPathProvider,
        iniParser: IniParser)
    {
        self.baseModLocalizationIniPathProvider = baseModLocalizationIniPathProvider
        self.iniParser = iniParser
    }
    
    public func localization(locale: Locale) throws -> Localization {
        let iniFilePath = try baseModLocalizationIniPathProvider.baseModLocalizationIniPath(locale: locale)
        
        let iniString = try NSString(contentsOfFile: iniFilePath.string, encoding: String.Encoding.utf8.rawValue) as String
        
        let config = try iniParser.parseIni(string: iniString)
        
        var sections: [LocalizationSectionName: [String: String]] = [:]
        
        for section in config.sections {
            let localizationSectionName = try LocalizationSectionName(rawValue: section.name).unwrapOrThrow(
                message: "Section named \(section.name) is not supported in \(LocalizationSectionName.self)"
            )
            sections[localizationSectionName] = section.pairs
        }
        
        return Localization(
            locale: locale,
            sections: sections
        )
    }
}
