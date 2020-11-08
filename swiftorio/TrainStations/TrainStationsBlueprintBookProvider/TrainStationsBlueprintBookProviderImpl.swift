import SwiftorioBlueprints
import SwiftorioDataRaw

public final class TrainStationsBlueprintBookProviderImpl: TrainStationsBlueprintBookProvider {
    private let version = 281474976710656
    private let dataRawProvider: DataRawProvider
    
    public init(dataRawProvider: DataRawProvider) {
        self.dataRawProvider = dataRawProvider
    }
    
    public func trainStationsBlueprintBook() throws -> SwiftorioBlueprints.BlueprintBook {
        return book(
            label: "Train stops",
            description: "Train stops and trains for all resources (requester/provider) with rich text names",
            blueprints: [
                
            ]
        )
    }
    
    private func trainCargoEntities() throws -> [TypedTrainCargoEntity] {
        let dataRaw = try dataRawProvider.dataRaw()
        
        let allItemsDictionaries: [[String: ItemProtocol]] = [
            dataRaw.ammo,
            dataRaw.capsule,
            dataRaw.gun,
            dataRaw.item,
            dataRaw.module,
            dataRaw.tool
        ]
            
        let allItems = allItemsDictionaries.flatMap {
            ValueWithId.valuesWithId(dictionary: $0)
        }
        
        
        let fluid: [ValueWithId<Fluid>] = ValueWithId.valuesWithId(dictionary: dataRaw.fluid)
        
        var trainCargoEntities: [TypedTrainCargoEntity] = []
        
        // TODO: WIP. Add localisation, fluids.
        trainCargoEntities.append(
            contentsOf: allItems.map { itemWithId in
                TypedTrainCargoEntity.item(
                    ItemTrainCargoEntity(id: itemWithId.id)
                )
            }
        )
        
        return trainCargoEntities
    }
    
    private func book(label: String, description: String?, blueprints: [IndexedBlueprint]) -> SwiftorioBlueprints.BlueprintBook {
        return SwiftorioBlueprints.BlueprintBook(
            item: "blueprint-book",
            label: label,
            description: description,
            label_color: nil,
            blueprints: blueprints,
            active_index: 0,
            version: version
        )
    }
}
