public final class AssemblingMachine: EntityWithHealth {
    public let craftingCategories: CraftingCategories
    public let ingredientCount: Integer?
    public let craftingSpeed: Float
    
    enum CodingKeys: String, CodingKey {
        case craftingCategories = "crafting_categories"
        case ingredientCount = "ingredient_count"
        case craftingSpeed = "crafting_speed"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.craftingCategories = try container.decode(CraftingCategories.self, forKey: .craftingCategories)
        self.ingredientCount = try container.decodeIfPresent(Integer.self, forKey: .ingredientCount)
        self.craftingSpeed = try container.decode(Float.self, forKey: .craftingSpeed)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(craftingCategories, forKey: .craftingCategories)
        try container.encode(ingredientCount, forKey: .ingredientCount)
        try container.encode(craftingSpeed, forKey: .craftingSpeed)
    }
}
