// FIXME:
public struct RecipeIngredients: Codable {}
public struct RecipeResults: Codable {}

public final class Recipe: Codable {
    public let ingredients: RecipeIngredients?
    public let results: RecipeResults?
    public let energyRequired: Float?
    public let category: RecipeCategory?
    public let hidden: Bool?
    public let subgroup: ItemSubgroupName
    public let icons: Icons?
    public let order: String?
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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ingredients = try container.decode(key: .ingredients)
        self.results = try container.decode(key: .results)
        self.energyRequired = try container.decode(key: .energyRequired, default: 0.5)
        self.category = try container.decode(key: .category, default: nil /* FIXME: ?? crafting */)
        self.hidden = try container.decode(key: .hidden, default: false)
        self.subgroup = try container.decode(key: .subgroup, default: .other)
        self.icons = try container.decode(key: .icons, default: nil /* FIXME */)
        self.order = try container.decode(key: .order)
        self.enabled = try container.decode(key: .enabled, default: true)
        self.icon = try container.decode(key: .icon)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(energyRequired, forKey: .energyRequired)
        try container.encode(category, forKey: .category)
        try container.encode(hidden, forKey: .hidden)
        try container.encode(subgroup, forKey: .subgroup)
        try container.encode(icons, forKey: .icons)
        try container.encode(order, forKey: .order)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(icon, forKey: .icon)
    }
}
