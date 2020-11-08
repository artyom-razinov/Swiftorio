public struct FluidTrainCargoEntity: TrainCargoEntity {
    public let id: String
    
    public var entityType: TrainCargoEntityType {
        return .fluid
    }
}
