public struct ItemTrainCargoEntity: TrainCargoEntity {
    public let id: String
    
    public var entityType: TrainCargoEntityType {
        return .item
    }
}
