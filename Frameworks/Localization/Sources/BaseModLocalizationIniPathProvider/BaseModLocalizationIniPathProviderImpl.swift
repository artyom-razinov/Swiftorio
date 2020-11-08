import PathKit
import SwiftorioGameBundle

public final class BaseModLocalizationIniPathProviderImpl: BaseModLocalizationIniPathProvider {
    private let gameBundlePathProvider: GameBundlePathProvider
    
    public init(gameBundlePathProvider: GameBundlePathProvider) {
        self.gameBundlePathProvider = gameBundlePathProvider
    }
    
    public func baseModLocalizationIniPath(locale: Locale) throws -> Path {
        return try gameBundlePathProvider.gameBundlePath()
            + "Contents/data/base/locale"
            + locale.rawValue
            + "base.cfg"
    }
}
