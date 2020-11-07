public final class Explosion: Codable, EntityProtocol {
    public let minable: Minable?
    public let selectionBox: Rect?
    public let collisionBox: Rect?
    public let weight: Float?
    public let fastReplaceableGroup: String?
    public let icon: FileName?
    
    enum CodingKeys: String, CodingKey {
        case minable
        case selectionBox = "selection_box"
        case collisionBox = "collision_box"
        case weight
        case fastReplaceableGroup = "fast_replaceable_group"
        case icon
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minable = try container.decode(Minable.self, forKey: .minable)
        self.selectionBox = try container.decode(Rect.self, forKey: .selectionBox)
        self.collisionBox = try container.decode(Rect.self, forKey: .collisionBox)
        self.weight = try container.decodeIfPresent(Float.self, forKey: .weight) ?? 1
        self.fastReplaceableGroup = try container.decode(String.self, forKey: .fastReplaceableGroup)
        self.icon = try container.decode(FileName.self, forKey: .icon)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(minable, forKey: .minable)
        try container.encode(selectionBox, forKey: .selectionBox)
        try container.encode(collisionBox, forKey: .collisionBox)
        try container.encode(weight, forKey: .weight)
        try container.encode(fastReplaceableGroup, forKey: .fastReplaceableGroup)
        try container.encode(icon, forKey: .icon)
    }
}