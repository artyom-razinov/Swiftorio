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
        
        let allItemsDictionaries: [[String: ItemPrototype]] = [
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
        
        let fluids: [ValueWithId<FluidPrototype>] = ValueWithId.valuesWithId(dictionary: dataRaw.fluid)
        
        var trainCargoEntities: [TypedTrainCargoEntity] = []
        
        trainCargoEntities.append(
            contentsOf: allItems.compactMap { itemWithId in
                do {
                    return TypedTrainCargoEntity.item(
                        ItemTrainCargoEntity(
                            id: itemWithId.id,
                            localizedName: try localizedName(itemWithId: itemWithId),
                            itemPrototype: itemWithId.value
                        )
                    )
                } catch {
                    return nil
                }
            }
        )
        
        trainCargoEntities.append(
            contentsOf: fluids.compactMap { itemWithId in
                do {
                    return TypedTrainCargoEntity.fluid(
                        FluidTrainCargoEntity(
                            id: itemWithId.id,
                            localizedName: try localizer.localize(
                                locale: .en,
                                sectionName: .fluid_name,
                                idInSection: itemWithId.id
                            ),
                            fluidPrototype: itemWithId.value
                        )
                    )
                } catch {
                    return nil
                }
            }
        )
        
        return trainCargoEntities
    }
    
    private func localizedName(itemWithId: ValueWithId<ItemPrototype>) throws -> String {
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
