import SwiftorioDataRaw
import SwiftorioLocalization

public final class TypedTrainCargoEntityProviderImpl: TypedTrainCargoEntityProvider {
    private let dataRawProvider: DataRawProvider
    private let localizer: Localizer
    
    public init(
        dataRawProvider: DataRawProvider,
        localizer: Localizer)
    {
        self.dataRawProvider = dataRawProvider
        self.localizer = localizer
    }
    
    public func typedTrainCargoEntities() throws -> [TypedTrainCargoEntity] {
        let dataRaw = try dataRawProvider.dataRaw()
        
        let allItemsDictionaries: [[String: Item]] = [
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
        
        let fluids: [ValueWithId<Fluid>] = ValueWithId.valuesWithId(dictionary: dataRaw.fluid)
        
        var trainCargoEntities: [TypedTrainCargoEntity] = []
        
        trainCargoEntities.append(
            contentsOf: try allItems
                .filter { itemWithId in
                    !itemWithId.value.flags.contains("hidden") // TODO: Generate enum for flags
                }
                .map { itemWithId in
                    TypedTrainCargoEntity.item(
                        ItemTrainCargoEntity(
                            id: itemWithId.id,
                            localizedName: try localizedName(itemWithId: itemWithId),
                            category: .other,
                            item: itemWithId.value
                        )
                    )
                }
        )
        
        trainCargoEntities.append(
            contentsOf: try fluids
                .filter { itemWithId in
                    !itemWithId.value.hidden
                }
                .map { itemWithId in
                    TypedTrainCargoEntity.fluid(
                        FluidTrainCargoEntity(
                            id: itemWithId.id,
                            localizedName: try localizer.localize(
                                locale: .en,
                                sectionName: .fluid_name,
                                idInSection: itemWithId.id
                            ),
                            fluid: itemWithId.value
                        )
                    )
                }
        )
        
        return trainCargoEntities
    }
    
    private func localizedName(itemWithId: ValueWithId<Item>) throws -> String {
        if let localisedName = itemWithId.value.localisedName {
            return try localizer.localize(
                locale: .en,
                fullId: localisedName.id
            )
        } else {
            return try localizer.localize(
                locale: .en,
                idInAnySection: itemWithId.id
            )
        }
    }
}
