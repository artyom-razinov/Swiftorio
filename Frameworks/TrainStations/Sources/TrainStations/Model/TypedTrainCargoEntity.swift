import SwiftorioDataRaw
import SwiftorioLocalization

public enum TypedTrainCargoEntity: TrainCargoEntity {
    case fluid(FluidTrainCargoEntity)
    case item(ItemTrainCargoEntity)
    
    public var id: String {
        return associatedValue.id
    }
    
    public var isHidden: Bool {
        return associatedValue.isHidden
    }
    
    public func localizedName(locale: Locale) throws -> String {
        return try associatedValue.localizedName(locale: locale)
    }
    
    public var entityType: TrainCargoEntityType {
        return associatedValue.entityType
    }
    
    public var itemOrFluidPrototype: ItemOrFluidPrototype {
        return associatedValue.itemOrFluidPrototype
    }
    
    public var order: Order {
        return associatedValue.order
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
