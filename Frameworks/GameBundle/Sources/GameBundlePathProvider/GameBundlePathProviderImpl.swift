import SwiftorioFoundation
import PathKit

public final class GameBundlePathProviderImpl: GameBundlePathProvider {
    private let environmentProvider: EnvironmentProvider
    
    public init(environmentProvider: EnvironmentProvider) {
        self.environmentProvider = environmentProvider
    }
    
    public func gameBundlePath() throws -> Path {
        let home = Path(
            try environmentProvider
                .environment["HOME"]
                .unwrapOrThrow(message: "Can't obtain home directory path")
        )
        
        return home + "Library/Application Support/Steam/steamapps/common/Factorio/factorio.app"
    }
}
