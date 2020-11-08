import SwiftorioDataRaw

public enum TypedTrainCargoEntity: TrainCargoEntity {
    case fluid(FluidTrainCargoEntity)
    case item(ItemTrainCargoEntity)
    
    public var id: String {
        return associatedValue.id
    }
    
    public var localizedName: String {
        return associatedValue.localizedName
    }
    
    public var category: TrainCargoEntityCategory {
        return associatedValue.category
    }
    
    public var entityType: TrainCargoEntityType {
        return associatedValue.entityType
    }
    
    private var associatedValue: TrainCargoEntity {
        switch self {
        case let .fluid(value):
            return value
        case let .item(value):
            return value
        }
    }
}
