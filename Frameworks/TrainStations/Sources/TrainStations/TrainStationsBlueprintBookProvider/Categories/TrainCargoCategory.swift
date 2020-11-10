public protocol TrainCargoCategory {
    var name: String { get }
    var icon: String { get }
    var trainCargoEntityType: TrainCargoEntityType { get }
    
    func match(typedTrainCargoEntity: TypedTrainCargoEntity) -> Bool
}
