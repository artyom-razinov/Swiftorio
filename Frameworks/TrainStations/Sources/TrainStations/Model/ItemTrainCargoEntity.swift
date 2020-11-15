import SwiftorioDataRaw
import SwiftorioLocalization

public struct ItemTrainCargoEntity: TrainCargoEntity {
    public let id: String
    public let itemPrototype: ItemPrototype
    public let provideLocalizedName: (Locale) throws -> String
    
    public func localizedName(locale: Locale) throws -> String {
        try provideLocalizedName(locale)
    }
    
    public var itemOrFluidPrototype: ItemOrFluidPrototype {
        return itemPrototype
    }
    
    public var entityType: TrainCargoEntityType {
        return .item
    }
    
    public var isHidden: Bool {
        return itemPrototype.flags.contains("hidden")
    }
}
