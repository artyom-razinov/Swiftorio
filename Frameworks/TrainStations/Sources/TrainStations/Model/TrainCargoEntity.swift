public protocol TrainCargoEntity {
    var id: String { get }
    var localizedName: String { get }
    var category: TrainCargoEntityCategory { get }
    var entityType: TrainCargoEntityType { get }
}
