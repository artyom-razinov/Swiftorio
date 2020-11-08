import SwiftorioDi
import SwiftorioFoundation

public final class SwiftorioGameBundleDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            SwiftorioFoundationDependencyCollectionRegisterer()
        ]
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
        di.register(type: GameBundlePathProvider.self) { di in
            GameBundlePathProviderImpl(
                environmentProvider: try di.resolve()
            )
        }
    }
}
