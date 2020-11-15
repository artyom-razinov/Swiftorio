import SwiftorioDataRaw
import SwiftorioLocalization
import SwiftorioFoundation

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
    
    public func typedTrainCargoEntities(locale: Locale) throws -> [TypedTrainCargoEntity] {
        let dataRaw = try dataRawProvider.dataRaw()
        
        let allItemsDictionaries: [[String: ItemPrototype]] = [
            dataRaw.ammo.keydByString,
            dataRaw.capsule.keydByString,
            dataRaw.gun.keydByString,
            dataRaw.item.keydByString,
            dataRaw.module.keydByString,
            dataRaw.tool.keydByString
        ]
        
        let allItems = allItemsDictionaries.flatMap {
            ValueWithId.valuesWithId(dictionary: $0)
        }
        
        let fluids: [ValueWithId<FluidPrototype>] = ValueWithId.valuesWithId(
            dictionary: dataRaw.fluid.keydByString
        )
        
        var trainCargoEntities: [TypedTrainCargoEntity] = []
        
        try trainCargoEntities.append(
            contentsOf: allItems.compactMap { [localizer] itemWithId in
                let subgroupName = itemWithId.value.subgroup
                let subgroup = try dataRaw.itemSubgroup.keyedByPrototypeName[subgroupName].unwrapOrThrow()
                let groupName = subgroup.group
                let group = try dataRaw.itemGroup.keyedByPrototypeName[groupName].unwrapOrThrow()
                let order = [
                    self.order(
                        order: group.order,
                        id: group.name
                    ),
                    self.order(
                        order: subgroup.order,
                        id: subgroup.name
                    ),
                    self.order(
                        order: itemWithId.value.order,
                        id: itemWithId.id
                    )
                ].joined(separator: "|")
                
                return TypedTrainCargoEntity.item(
                    ItemTrainCargoEntity(
                        id: itemWithId.id,
                        itemPrototype: itemWithId.value,
                        provideLocalizedName: { locale in
                            let prototype = itemWithId.value
                            
                            if let localisedName = prototype.localisedName {
                                return try localizer.localize(
                                    locale: locale,
                                    fullId: localisedName.id,
                                    parameters: localisedName.parameters
                                )
                            } else {
                                return try localizer.localize(
                                    locale: locale,
                                    idInAnySection: prototype.name
                                )
                            }
                        },
                        order: order
                    )
                )
            }
        )
        
        trainCargoEntities.append(
            contentsOf: fluids.compactMap { [localizer] itemWithId in
                return TypedTrainCargoEntity.fluid(
                    FluidTrainCargoEntity(
                        id: itemWithId.id,
                        fluidPrototype: itemWithId.value,
                        provideLocalizedName: { locale in
                            try localizer.localize(
                                locale: locale,
                                sectionName: .fluidName,
                                idInSection: itemWithId.id
                            )
                        },
                        order: order(
                            order: itemWithId.value.order,
                            id: itemWithId.id
                        )
                    )
                )
            }
        )
        
        return trainCargoEntities.filter { !$0.isHidden }
    }
    
    private func order(order: Order?, id: String) -> Order {
        return order.map { "0:\($0)" }
            ?? "1:\(id)"
    }
}
