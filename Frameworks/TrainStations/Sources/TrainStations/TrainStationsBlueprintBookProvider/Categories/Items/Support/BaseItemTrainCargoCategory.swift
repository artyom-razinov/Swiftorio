class BaseItemTrainCargoCategory {
    var trainCargoEntityType: TrainCargoEntityType { .item }
    
    func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
        return true
    }
    
    func match(typedTrainCargoEntity: TypedTrainCargoEntity) -> Bool {
        switch typedTrainCargoEntity {
        case .item(let itemTrainCargoEntity):
            if itemTrainCargoEntity.item.flags.contains("hidden") {
                return false
            } else {
                return match(itemTrainCargoEntity: itemTrainCargoEntity)
            }
        case .fluid:
            return false
        }
    }
}
