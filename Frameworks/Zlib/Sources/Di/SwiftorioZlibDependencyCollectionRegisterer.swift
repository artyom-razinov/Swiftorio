import SwiftorioDi
import SwiftorioFoundation

public final class SwiftorioZlibDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            SwiftorioFoundationDependencyCollectionRegisterer()
        ]
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
        di.register(type: AlgorithmPerformer.self) { _ in
            AlgorithmPerformerImpl()
        }
    }
}
