public final class Resource: Codable, EntityProtocol {
    public let weight: Float?
    public let selectionBox: Rect?
    public let fastReplaceableGroup: String?
    public let minable: Minable?
    public let collisionBox: Rect?
    public let icon: FileName?
    public let maximum: Integer?
    public let minimum: Integer?
    public let category: ResourceCategory?
    public let normal: Integer?
    public let infinite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case weight
        case selectionBox = "selection_box"
        case fastReplaceableGroup = "fast_replaceable_group"
        case minable
        case collisionBox = "collision_box"
        case icon
        case maximum
        case minimum
        case category
        case normal
        case infinite
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.weight = try container.decodeIfPresent(Float.self, forKey: .weight) ?? 1
        self.selectionBox = try container.decodeIfPresent(Rect.self, forKey: .selectionBox)
        self.fastReplaceableGroup = try container.decodeIfPresent(String.self, forKey: .fastReplaceableGroup)
        self.minable = try container.decodeIfPresent(Minable.self, forKey: .minable)
        self.collisionBox = try container.decodeIfPresent(Rect.self, forKey: .collisionBox)
        self.icon = try container.decodeIfPresent(FileName.self, forKey: .icon)
        self.maximum = try container.decodeIfPresent(Integer.self, forKey: .maximum) ?? 0
        self.minimum = try container.decodeIfPresent(Integer.self, forKey: .minimum) ?? 0
        self.category = try container.decodeIfPresent(ResourceCategory.self, forKey: .category) ?? nil /* FIXME: ?? basic-solid */
        self.normal = try container.decodeIfPresent(Integer.self, forKey: .normal) ?? 0
        self.infinite = try container.decodeIfPresent(Bool.self, forKey: .infinite) ?? false
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(weight, forKey: .weight)
        try container.encode(selectionBox, forKey: .selectionBox)
        try container.encode(fastReplaceableGroup, forKey: .fastReplaceableGroup)
        try container.encode(minable, forKey: .minable)
        try container.encode(collisionBox, forKey: .collisionBox)
        try container.encode(icon, forKey: .icon)
        try container.encode(maximum, forKey: .maximum)
        try container.encode(minimum, forKey: .minimum)
        try container.encode(category, forKey: .category)
        try container.encode(normal, forKey: .normal)
        try container.encode(infinite, forKey: .infinite)
    }
}