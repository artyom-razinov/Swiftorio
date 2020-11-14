//import SwiftorioDataRaw
//
//final class RawMaterialsTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Raw materials" }
//    
//    var itemName: AnyItemPrototypeName {
//        .ironPlate
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .rawMaterial
//    }
//}
//
//final class RawResourcesTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Raw resources" }
//    
//    var itemName: AnyItemPrototypeName {
//        .ironOre
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .rawResource
//    }
//}
//
//final class AmmoTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Ammo" }
//    
//    var itemName: AnyItemPrototypeName {
//        .firearmMagazine
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .ammo
//    }
//}
//
//final class GunsTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Guns" }
//    
//    var itemName: AnyItemPrototypeName {
//        .pistol
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .gun
//    }
//}
//
//final class IntermediateProductsTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Intermediate products" }
//    
//    var itemName: AnyItemPrototypeName {
//        .electronicCircuit
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .intermediateProduct
//    }
//}
//
//final class ModulesTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Modules" }
//    
//    var itemName: AnyItemPrototypeName {
//        .effectivityModule3
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .module
//    }
//}
//
//final class SciencePacksTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Science packs" }
//    
//    var itemName: AnyItemPrototypeName {
//        .automationSciencePack
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .sciencePack
//    }
//}
//
//final class TerrainTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Terrain" }
//    
//    var itemName: AnyItemPrototypeName {
//        .automationSciencePack
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .terrain
//    }
//}
//
//final class BeltsTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Belts" }
//    
//    var itemName: AnyItemPrototypeName {
//        .transportBelt
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .belt
//    }
//}
//
//final class BeltsTrainCargoCategory: ItemTrainCargoCategory {
//    var name: String { "Circuit network" }
//    
//    var itemName: AnyItemPrototypeName {
//        .transportBelt
//    }
//    
//    override func match(itemTrainCargoEntity: ItemTrainCargoEntity) -> Bool {
//        return itemTrainCargoEntity.itemPrototype.subgroup == .belt
//    }
//}
