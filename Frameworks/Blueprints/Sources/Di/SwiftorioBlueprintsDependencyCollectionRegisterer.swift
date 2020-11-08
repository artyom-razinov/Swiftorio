import SwiftorioDi
import SwiftorioDataRaw

public final class SwiftorioBlueprintsDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            SwiftorioDataRawDependencyCollectionRegisterer()
        ]
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
        di.register(type: BlueprintToJsonStringEncoder.self) { di in
            BlueprintToJsonStringEncoderImpl()
        }
        di.register(type: BlueprintToBlueprintStringEncoder.self) { di in
            BlueprintToBlueprintStringEncoderImpl()
        }
        di.register(type: BlueprintFromBlueprintStringDecoder.self) { di in
            BlueprintFromBlueprintStringDecoderImpl()
        }
    }
}
