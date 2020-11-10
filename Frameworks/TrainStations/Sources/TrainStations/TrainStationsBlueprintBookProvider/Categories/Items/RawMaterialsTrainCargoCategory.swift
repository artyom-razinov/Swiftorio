final class RawMaterialsTrainCargoCategory: ItemTrainCargoCategory {
    var name: String { "Raw materials" }
    
    var icon: String { "iron-ore" }
    
    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
        return itemTrainCargoEntity.item.subgroup == "raw-material"
    }
}