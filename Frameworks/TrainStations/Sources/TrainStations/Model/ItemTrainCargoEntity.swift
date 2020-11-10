import SwiftorioDataRaw

public struct ItemTrainCargoEntity: TrainCargoEntity {
    public let id: String
    public let localizedName: String
    public let item: Item
    
    public var itemOrFluid: ItemOrFluid {
        return item
    }
    
    public var entityType: TrainCargoEntityType {
        return .item
    }
}
