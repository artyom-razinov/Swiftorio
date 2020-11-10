open class EntityPrototype: PrototypeBase {
    public let weight: Float?
    public let selectionBox: Rect?
    public let fastReplaceableGroup: String?
    public let minable: Minable?
    public let collisionBox: Rect?
    public let icon: FileName?
    
    enum CodingKeys: String, CodingKey {
        case weight
        case selectionBox = "selection_box"
        case fastReplaceableGroup = "fast_replaceable_group"
        case minable
        case collisionBox = "collision_box"
        case icon
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.weight = try container.decode(key: .weight, default: 1)
        self.selectionBox = try container.decode(key: .selectionBox)
        self.fastReplaceableGroup = try container.decode(key: .fastReplaceableGroup)
        self.minable = try container.decode(key: .minable)
        self.collisionBox = try container.decode(key: .collisionBox)
        self.icon = try container.decode(key: .icon)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(weight, forKey: .weight)
        try container.encode(selectionBox, forKey: .selectionBox)
        try container.encode(fastReplaceableGroup, forKey: .fastReplaceableGroup)
        try container.encode(minable, forKey: .minable)
        try container.encode(collisionBox, forKey: .collisionBox)
        try container.encode(icon, forKey: .icon)
    }
}
