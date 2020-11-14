// FIXME:
public struct RecipeIngredients: Codable {}
public struct RecipeResults: Codable {}

public final class RecipePrototype: PrototypeBase {
    public let ingredients: RecipeIngredients?
    public let results: RecipeResults?
    public let energyRequired: Float?
    public let category: String?
    public let hidden: Bool?
    public let subgroup: ItemSubgroupPrototypeName
    public let icons: Icons?
    public let enabled: Bool?
    public let icon: FileName?
    
    enum CodingKeys: String, CodingKey {
        case ingredients
        case results
        case energyRequired = "energy_required"
        case category
        case hidden
        case subgroup
        case icons
        case order
        case enabled
        case icon
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ingredients = try container.decode(key: .ingredients)
        self.results = try container.decode(key: .results)
        self.energyRequired = try container.decode(key: .energyRequired, default: 0.5)
        self.category = try container.decode(key: .category, default: nil /* FIXME: ?? crafting */)
        self.hidden = try container.decode(key: .hidden, default: false)
        self.subgroup = try container.decode(key: .subgroup, default: .other)
        self.icons = try container.decode(key: .icons, default: nil /* FIXME */)
        self.enabled = try container.decode(key: .enabled, default: true)
        self.icon = try container.decode(key: .icon)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(energyRequired, forKey: .energyRequired)
        try container.encode(category, forKey: .category)
        try container.encode(hidden, forKey: .hidden)
        try container.encode(subgroup, forKey: .subgroup)
        try container.encode(icons, forKey: .icons)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(icon, forKey: .icon)
    }
}
