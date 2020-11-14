import SwiftorioDataRaw

// typealias ItemTrainCargoCategory = BaseItemTrainCargoCategory & TrainCargoCategory & AnyItemPrototypeNameProvider

public final class ItemTrainCargoCategory: TrainCargoCategory {
    public let name: String
    public let icon: String
    
    private let subgroups: Set<ItemSubgroupPrototypeName>
    
    public init(
        name: String,
        iconItemPrototypeName: AnyItemPrototypeName,
        subgroups: Set<ItemSubgroupPrototypeName>)
    {
        self.name = name
        self.icon = iconItemPrototypeName.rawValue
        self.subgroups = subgroups
    }
    
    public var trainCargoEntityType: TrainCargoEntityType {
        return .item
    }
    
    public func match(typedTrainCargoEntity: TypedTrainCargoEntity) -> Bool {
        switch typedTrainCargoEntity {
        case .item(let item):
            return !item.isHidden
                && subgroups.contains(item.itemPrototype.subgroup)
        case .fluid:
            return false
        }
    }
}
