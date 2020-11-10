import SwiftorioDataRaw

public struct FluidTrainCargoEntity: TrainCargoEntity {
    public let id: String
    public let localizedName: String
    public let fluidPrototype: FluidPrototype
    
    public var itemOrFluidPrototype: ItemOrFluidPrototype {
        return fluidPrototype
    }
    
    public var entityType: TrainCargoEntityType {
        return .fluid
    }
}
