import SwiftorioDataRaw
import SwiftorioDi

public final class SwiftorioBlueprintsDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            SwiftorioDataRawDependencyCollectionRegisterer()
        ]
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
        di.register(type: BlueprintStringEncoder.self) { di in
            BlueprintStringEncoderImpl()
        }
    }
}
