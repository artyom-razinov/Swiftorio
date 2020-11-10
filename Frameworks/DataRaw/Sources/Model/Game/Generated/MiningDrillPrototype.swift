public final class MiningDrillPrototype: EntityWithHealthPrototype {
    public let resourceCategories: [String]
    public let miningPower: Float?
    public let miningSpeed: Float
    
    enum CodingKeys: String, CodingKey {
        case weight
        case selectionBox = "selection_box"
        case fastReplaceableGroup = "fast_replaceable_group"
        case minable
        case collisionBox = "collision_box"
        case icon
        case maxHealth = "max_health"
        case resourceCategories = "resource_categories"
        case miningPower = "mining_power"
        case miningSpeed = "mining_speed"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resourceCategories = try container.decode(key: .resourceCategories)
        self.miningPower = try container.decode(key: .miningPower)
        self.miningSpeed = try container.decode(key: .miningSpeed)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(resourceCategories, forKey: .resourceCategories)
        try container.encode(miningPower, forKey: .miningPower)
        try container.encode(miningSpeed, forKey: .miningSpeed)
    }
}