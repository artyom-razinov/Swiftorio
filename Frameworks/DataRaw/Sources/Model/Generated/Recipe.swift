public final class Recipe: Codable {
    public let enabled: Bool?
    public let icons: Icons?
    public let energyRequired: Float?
    public let hidden: Bool?
    public let order: String?
    public let icon: FileName?
    public let subgroup: String?
    public let category: RecipeCategory?
    
    enum CodingKeys: String, CodingKey {
        case enabled
        case icons
        case energyRequired = "energy_required"
        case hidden
        case order
        case icon
        case subgroup
        case category
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled) ?? true
        self.icons = try container.decodeIfPresent(Icons.self, forKey: .icons) ?? nil /* FIXME */
        self.energyRequired = try container.decodeIfPresent(Float.self, forKey: .energyRequired) ?? 0.5
        self.hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden) ?? false
        self.order = try container.decode(String.self, forKey: .order)
        self.icon = try container.decode(FileName.self, forKey: .icon)
        self.subgroup = try container.decodeIfPresent(String.self, forKey: .subgroup) /* FIXME ?? other */
        self.category = try container.decodeIfPresent(RecipeCategory.self, forKey: .category) /* FIXME: ?? crafting */
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(icons, forKey: .icons)
        try container.encode(energyRequired, forKey: .energyRequired)
        try container.encode(hidden, forKey: .hidden)
        try container.encode(order, forKey: .order)
        try container.encode(icon, forKey: .icon)
        try container.encode(subgroup, forKey: .subgroup)
        try container.encode(category, forKey: .category)
    }
}
