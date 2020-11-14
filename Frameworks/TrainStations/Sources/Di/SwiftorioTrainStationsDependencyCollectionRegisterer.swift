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
                typedTrainCargoEntityProvider: try di.resolve(),
                richTextBuilder: try di.resolve(),
                orderComparator: try di.resolve(),
                trainCargoCategoriesProvider: try di.resolve()
            )
        }
        di.register(type: TrainCargoCategoriesProvider.self) { di in
            TrainCargoCategoriesProviderImpl(
                dataRawProvider: try di.resolve(),
                orderComparator: try di.resolve(),
                localizer: try di.resolve()
            )
        }
        
        di.register(type: TypedTrainCargoEntityProvider.self) { di in
            TypedTrainCargoEntityProviderImpl(
                dataRawProvider: try di.resolve(),
                localizer: try di.resolve()
            )
        }
    }
}
