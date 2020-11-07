public final class AssemblingMachine: Codable, EntityWithHealthProtocol {
    public let minable: Minable?
    public let selectionBox: Rect?
    public let collisionBox: Rect?
    public let weight: Float?
    public let fastReplaceableGroup: String?
    public let icon: FileName?
    public let maxHealth: Float
    public let craftingCategories: CraftingCategories
    public let ingredientCount: Integer
    public let craftingSpeed: Float
    
    enum CodingKeys: String, CodingKey {
        case minable
        case selectionBox = "selection_box"
        case collisionBox = "collision_box"
        case weight
        case fastReplaceableGroup = "fast_replaceable_group"
        case icon
        case maxHealth = "max_health"
        case craftingCategories = "crafting_categories"
        case ingredientCount = "ingredient_count"
        case craftingSpeed = "crafting_speed"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minable = try container.decode(Minable.self, forKey: .minable)
        self.selectionBox = try container.decode(Rect.self, forKey: .selectionBox)
        self.collisionBox = try container.decode(Rect.self, forKey: .collisionBox)
        self.weight = try container.decodeIfPresent(Float.self, forKey: .weight) ?? 1
        self.fastReplaceableGroup = try container.decode(String.self, forKey: .fastReplaceableGroup)
        self.icon = try container.decode(FileName.self, forKey: .icon)
        self.maxHealth = try container.decode(Float.self, forKey: .maxHealth)
        self.craftingCategories = try container.decode(CraftingCategories.self, forKey: .craftingCategories)
        self.ingredientCount = try container.decode(Integer.self, forKey: .ingredientCount)
        self.craftingSpeed = try container.decode(Float.self, forKey: .craftingSpeed)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(minable, forKey: .minable)
        try container.encode(selectionBox, forKey: .selectionBox)
        try container.encode(collisionBox, forKey: .collisionBox)
        try container.encode(weight, forKey: .weight)
        try container.encode(fastReplaceableGroup, forKey: .fastReplaceableGroup)
        try container.encode(icon, forKey: .icon)
        try container.encode(maxHealth, forKey: .maxHealth)
        try container.encode(craftingCategories, forKey: .craftingCategories)
        try container.encode(ingredientCount, forKey: .ingredientCount)
        try container.encode(craftingSpeed, forKey: .craftingSpeed)
    }
}