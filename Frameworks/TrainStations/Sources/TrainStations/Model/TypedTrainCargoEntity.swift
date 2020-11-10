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
    
    public var entityType: TrainCargoEntityType {
        return associatedValue.entityType
    }
    
    public var itemOrFluid: ItemOrFluid {
        return associatedValue.itemOrFluid
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
