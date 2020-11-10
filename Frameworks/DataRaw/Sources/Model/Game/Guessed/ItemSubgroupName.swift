public enum ItemSubgroupName: String, Codable {
    case ammo
    case armor
    case belt
    case capsule
    case circuitNetwork = "circuit-network"
    case crashSite = "crash-site"
    case defensiveStructure = "defensive-structure"
    case emptyBarrel = "empty-barrel"
    case energy
    case energyPipeDistribution = "energy-pipe-distribution"
    case equipment
    case extractionMachine = "extraction-machine"
    case fillBarrel = "fill-barrel"
    case fluid = "fluid"
    case fluidRecipes = "fluid-recipes"
    case gun
    case inserter
    case intermediateProduct = "intermediate-product"
    case logisticNetwork = "logistic-network"
    case militaryEquipment = "military-equipment"
    case module
    case other
    case productionMachine = "production-machine"
    case rawMaterial = "raw-material"
    case rawResource = "raw-resource"
    case sciencePack = "science-pack"
    case smeltingMachine = "smelting-machine"
    case storage
    case terrain
    case tool
    case trainTransport = "train-transport"
    case transport
    case virtualSignal = "virtual-signal"
    case virtualSignalColor = "virtual-signal-color"
    case virtualSignalLetter = "virtual-signal-letter"
    case virtualSignalNumber = "virtual-signal-number"
    case virtualSignalSpecial = "virtual-signal-special"
}
