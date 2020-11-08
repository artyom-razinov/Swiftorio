import SwiftorioLocalization
import SwiftorioDataRaw
import SwiftorioBlueprints
import SwiftorioDi

public final class SwiftorioTrainStationsDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            SwiftorioLocalizationDependencyCollectionRegisterer(),
            SwiftorioDataRawDependencyCollectionRegisterer(),
            SwiftorioBlueprintsDependencyCollectionRegisterer(),
        ]
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
        di.register(type: TrainStationsBlueprintBookProvider.self) { di in
            TrainStationsBlueprintBookProviderImpl(
                dataRawProvider: try di.resolve(),
                localizer: try di.resolve()
            )
        }
    }
}
