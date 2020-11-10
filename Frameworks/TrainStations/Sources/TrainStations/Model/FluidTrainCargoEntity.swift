import SwiftorioDataRaw

public struct FluidTrainCargoEntity: TrainCargoEntity {
    public let id: String
    public let localizedName: String
    public let fluid: Fluid
    
    public var itemOrFluid: ItemOrFluid {
        return fluid
    }
    
    public var entityType: TrainCargoEntityType {
        return .fluid
    }
}
