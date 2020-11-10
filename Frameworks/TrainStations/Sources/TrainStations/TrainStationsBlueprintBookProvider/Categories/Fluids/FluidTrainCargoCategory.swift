public final class FluidTrainCargoCategory: TrainCargoCategory {
    public var name: String { "Fluids" }
    public var icon: String { return "crude-oil" }
    public var trainCargoEntityType: TrainCargoEntityType { .fluid }
    
    public func match(typedTrainCargoEntity: TypedTrainCargoEntity) -> Bool {
        switch typedTrainCargoEntity {
        case .item:
            return false
        case .fluid(let fluidTrainCargoEntity):
            return !fluidTrainCargoEntity.fluidPrototype.hidden
        }
    }
}
