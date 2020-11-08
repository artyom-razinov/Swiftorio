public struct ItemTrainCargoEntity: TrainCargoEntity {
    public let id: String
    public let localizedName: String
    public let category: TrainCargoEntityCategory
    
    public var entityType: TrainCargoEntityType {
        return .item
    }
}
