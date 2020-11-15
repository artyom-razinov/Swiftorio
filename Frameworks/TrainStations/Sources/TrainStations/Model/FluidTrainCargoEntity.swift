import SwiftorioDataRaw
import SwiftorioLocalization

public struct FluidTrainCargoEntity: TrainCargoEntity {
    public let id: String
    public let fluidPrototype: FluidPrototype
    public let provideLocalizedName: (Locale) throws -> String
    public let order: Order
    
    public func localizedName(locale: Locale) throws -> String {
        try provideLocalizedName(locale)
    }
    
    public var itemOrFluidPrototype: ItemOrFluidPrototype {
        return fluidPrototype
    }
    
    public var entityType: TrainCargoEntityType {
        return .fluid
    }
    
    public var isHidden: Bool {
        return fluidPrototype.hidden
    }
}
