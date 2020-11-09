import SwiftorioDi
import SwiftorioDataRaw
import SwiftorioZlib

public final class SwiftorioBlueprintsDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            SwiftorioDataRawDependencyCollectionRegisterer(),
            SwiftorioZlibDependencyCollectionRegisterer()
        ]
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
        di.register(type: BlueprintToJsonStringEncoder.self) { di in
            BlueprintToJsonStringEncoderImpl()
        }
        di.register(type: BlueprintToBlueprintStringEncoder.self) { di in
            BlueprintToBlueprintStringEncoderImpl(
                algorithmPerformer: try di.resolve()
            )
        }
        di.register(type: BlueprintFromBlueprintStringDecoder.self) { di in
            BlueprintFromBlueprintStringDecoderImpl(
                algorithmPerformer: try di.resolve()
            )
        }
    }
}
