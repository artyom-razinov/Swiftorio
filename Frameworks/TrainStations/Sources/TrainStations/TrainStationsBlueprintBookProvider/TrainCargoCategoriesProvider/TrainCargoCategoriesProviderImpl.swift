import SwiftorioDataRaw
import SwiftorioFoundation
import SwiftorioLocalization

public final class TrainCargoCategoriesProviderImpl: TrainCargoCategoriesProvider {
    private let dataRawProvider: DataRawProvider
    private let orderComparator: OrderComparator
    private let localizer: Localizer
    
    public init(
        dataRawProvider: DataRawProvider,
        orderComparator: OrderComparator,
        localizer: Localizer)
    {
        self.dataRawProvider = dataRawProvider
        self.orderComparator = orderComparator
        self.localizer = localizer
    }
    
    public func trainCargoCategories(locale: Locale) throws -> [TrainCargoCategory] {
        let dataRaw = try dataRawProvider.dataRaw()
        
        let subgroupsByGroup = dataRaw
            .itemSubgroup
            .flatten
            .group(
                container: { Set<ItemSubgroupPrototypeName>() },
                insert: { $0.insert($1) },
                value: { subgroup in
                    (key: subgroup.prototype.group, value: subgroup.name)
                }
            )
        
        let itemCategories = dataRaw.itemGroup
            .flatten
            .sorted { (lhs, rhs) in
                orderComparator.isOrderedBefore(
                    lhs: lhs.prototype,
                    rhs: lhs.prototype
                )
            }
            .compactMap {
                trainCargoCategory(
                    groupName: $0.name,
                    subgroupsByGroup: subgroupsByGroup,
                    locale: locale
                )
            }
        
        return itemCategories + [FluidTrainCargoCategory()]
    }
    
    private let iconByGroup: [ItemGroupPrototypeName: AnyItemPrototypeName] = [
        .intermediateProducts: .copperOre,
        .logistics: .transportBelt,
        .production: .assemblingMachine1,
        .combat: .submachineGun,
    ]
    
    private func trainCargoCategory(
        groupName: ItemGroupPrototypeName,
        subgroupsByGroup: [ItemGroupPrototypeName: Set<ItemSubgroupPrototypeName>],
        locale: Locale)
        -> TrainCargoCategory?
    {
        return iconByGroup[groupName].flatMap { icon in
            subgroupsByGroup[groupName].flatMap { subgroups in
                try? ItemTrainCargoCategory(
                    name: localizer.localize(
                        locale: locale,
                        sectionName: .itemGroupName,
                        idInSection: groupName.rawValue
                    ),
                    iconItemPrototypeName: icon,
                    subgroups: subgroups
                )
            }
        }
    }
}
