public final class Resource: Codable, EntityProtocol {
    public let minable: Minable?
    public let selectionBox: Rect?
    public let collisionBox: Rect?
    public let weight: Float?
    public let fastReplaceableGroup: String?
    public let icon: FileName?
    public let infinite: Bool?
    public let normal: Integer?
    public let maximum: Integer?
    public let category: ResourceCategory?
    public let minimum: Integer?
    
    enum CodingKeys: String, CodingKey {
        case minable
        case selectionBox = "selection_box"
        case collisionBox = "collision_box"
        case weight
        case fastReplaceableGroup = "fast_replaceable_group"
        case icon
        case infinite
        case normal
        case maximum
        case category
        case minimum
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minable = try container.decode(Minable.self, forKey: .minable)
        self.selectionBox = try container.decode(Rect.self, forKey: .selectionBox)
        self.collisionBox = try container.decode(Rect.self, forKey: .collisionBox)
        self.weight = try container.decodeIfPresent(Float.self, forKey: .weight) ?? 1
        self.fastReplaceableGroup = try container.decode(String.self, forKey: .fastReplaceableGroup)
        self.icon = try container.decode(FileName.self, forKey: .icon)
        self.infinite = try container.decodeIfPresent(Bool.self, forKey: .infinite) ?? false
        self.normal = try container.decodeIfPresent(Integer.self, forKey: .normal) ?? 0
        self.maximum = try container.decodeIfPresent(Integer.self, forKey: .maximum) ?? 0
        self.category = try container.decodeIfPresent(ResourceCategory.self, forKey: .category) /* FIXME ?? basic-solid */
        self.minimum = try container.decodeIfPresent(Integer.self, forKey: .minimum) ?? 0
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(minable, forKey: .minable)
        try container.encode(selectionBox, forKey: .selectionBox)
        try container.encode(collisionBox, forKey: .collisionBox)
        try container.encode(weight, forKey: .weight)
        try container.encode(fastReplaceableGroup, forKey: .fastReplaceableGroup)
        try container.encode(icon, forKey: .icon)
        try container.encode(infinite, forKey: .infinite)
        try container.encode(normal, forKey: .normal)
        try container.encode(maximum, forKey: .maximum)
        try container.encode(category, forKey: .category)
        try container.encode(minimum, forKey: .minimum)
    }
}
