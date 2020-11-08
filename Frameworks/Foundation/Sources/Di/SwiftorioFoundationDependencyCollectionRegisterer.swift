import SwiftorioDi

public final class SwiftorioFoundationDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return []
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
        di.register(type: TemporaryDirectoryPathProvider.self) { _ in
            NsTemporaryDirectoryPathProvider()
        }
        di.register(type: EnvironmentProvider.self) { _ in
            ProcessInfoEnvironmentProvider(
                processInfo: ProcessInfo.processInfo
            )
        }
    }
}
