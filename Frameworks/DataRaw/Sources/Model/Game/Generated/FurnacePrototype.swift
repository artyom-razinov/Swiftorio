public final class FurnacePrototype: EntityWithHealthPrototype {
    public let craftingSpeed: Float
    public let craftingCategories: CraftingCategories
    
    enum CodingKeys: String, CodingKey {
        case craftingSpeed = "crafting_speed"
        case craftingCategories = "crafting_categories"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.craftingSpeed = try container.decode(key: .craftingSpeed)
        self.craftingCategories = try container.decode(key: .craftingCategories)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(craftingSpeed, forKey: .craftingSpeed)
        try container.encode(craftingCategories, forKey: .craftingCategories)
    }
}