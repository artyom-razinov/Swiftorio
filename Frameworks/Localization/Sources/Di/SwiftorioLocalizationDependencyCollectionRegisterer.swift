import SwiftorioGameBundle
import SwiftorioDi

public final class SwiftorioLocalizationDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            SwiftorioGameBundleDependencyCollectionRegisterer()
        ]
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
        di.register(type: Localizer.self) { di in
            LocalizerImpl(
                localizationProvider: try di.resolve()
            )
        }
        di.register(type: IniParser.self) { di in
            IniParserImpl()
        }
        di.register(type: LocalizationProvider.self) { di in
            LocalizationProviderImpl(
                baseModLocalizationIniPathProvider: try di.resolve(),
                iniParser: try di.resolve()
            )
        }
        di.register(type: BaseModLocalizationIniPathProvider.self) { di in
            BaseModLocalizationIniPathProviderImpl(
                gameBundlePathProvider: try di.resolve()
            )
        }
    }
}
