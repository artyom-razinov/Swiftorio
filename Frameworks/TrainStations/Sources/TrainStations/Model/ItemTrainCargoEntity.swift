import SwiftorioDataRaw

public struct ItemTrainCargoEntity: TrainCargoEntity {
    public let id: String
    public let localizedName: String
    public let itemPrototype: ItemPrototype
    
    public var itemOrFluidPrototype: ItemOrFluidPrototype {
        return itemPrototype
    }
    
    public var entityType: TrainCargoEntityType {
        return .item
    }
}
