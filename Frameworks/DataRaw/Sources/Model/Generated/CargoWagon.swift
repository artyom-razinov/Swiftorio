public final class CargoWagon: Codable, TrainUnitProtocol {
    public let weight: Float?
    public let selectionBox: Rect?
    public let fastReplaceableGroup: String?
    public let minable: Minable?
    public let collisionBox: Rect?
    public let icon: FileName?
    public let maxHealth: Float
    
    enum CodingKeys: String, CodingKey {
        case weight
        case selectionBox = "selection_box"
        case fastReplaceableGroup = "fast_replaceable_group"
        case minable
        case collisionBox = "collision_box"
        case icon
        case maxHealth = "max_health"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.weight = try container.decodeIfPresent(Float.self, forKey: .weight) ?? 1
        self.selectionBox = try container.decodeIfPresent(Rect.self, forKey: .selectionBox)
        self.fastReplaceableGroup = try container.decodeIfPresent(String.self, forKey: .fastReplaceableGroup)
        self.minable = try container.decodeIfPresent(Minable.self, forKey: .minable)
        self.collisionBox = try container.decodeIfPresent(Rect.self, forKey: .collisionBox)
        self.icon = try container.decodeIfPresent(FileName.self, forKey: .icon)
        self.maxHealth = try container.decode(Float.self, forKey: .maxHealth)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(weight, forKey: .weight)
        try container.encode(selectionBox, forKey: .selectionBox)
        try container.encode(fastReplaceableGroup, forKey: .fastReplaceableGroup)
        try container.encode(minable, forKey: .minable)
        try container.encode(collisionBox, forKey: .collisionBox)
        try container.encode(icon, forKey: .icon)
        try container.encode(maxHealth, forKey: .maxHealth)
    }
}