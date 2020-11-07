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
        self.ingredients = try container.decodeIfPresent(RecipeIngredients.self, forKey: .ingredients)
        self.results = try container.decodeIfPresent(RecipeResults.self, forKey: .results)
        self.energyRequired = try container.decodeIfPresent(Float.self, forKey: .energyRequired) ?? 0.5
        self.category = try container.decodeIfPresent(RecipeCategory.self, forKey: .category) ?? nil /* FIXME: ?? crafting */
        self.hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden) ?? false
        self.subgroup = try container.decodeIfPresent(String.self, forKey: .subgroup) ?? "other"
        self.icons = try container.decodeIfPresent(Icons.self, forKey: .icons) ?? nil /* FIXME */
        self.order = try container.decodeIfPresent(String.self, forKey: .order)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled) ?? true
        self.icon = try container.decodeIfPresent(FileName.self, forKey: .icon)
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
