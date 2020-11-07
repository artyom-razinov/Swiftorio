public final class Inserter: Codable, EntityWithHealthProtocol {
    public let weight: Float?
    public let selectionBox: Rect?
    public let fastReplaceableGroup: String?
    public let minable: Minable?
    public let collisionBox: Rect?
    public let icon: FileName?
    public let maxHealth: Float
    public let rotationSpeed: Float
    public let handSize: Float?
    public let filterCount: Integer?
    public let stack: Bool
    public let extensionSpeed: Float
    public let energyPerMovement: String // TODO: Strong type?
    public let energyPerRotation: String // TODO: Strong type?
    
    enum CodingKeys: String, CodingKey {
        case weight
        case selectionBox = "selection_box"
        case fastReplaceableGroup = "fast_replaceable_group"
        case minable
        case collisionBox = "collision_box"
        case icon
        case maxHealth = "max_health"
        case rotationSpeed = "rotation_speed"
        case handSize = "hand_size"
        case filterCount = "filter_count"
        case stack
        case extensionSpeed = "extension_speed"
        case energyPerMovement = "energy_per_movement"
        case energyPerRotation = "energy_per_rotation"
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
        self.rotationSpeed = try container.decode(Float.self, forKey: .rotationSpeed)
        self.handSize = try container.decodeIfPresent(Float.self, forKey: .handSize) ?? 1
        self.filterCount = try container.decodeIfPresent(Integer.self, forKey: .filterCount) ?? 0
        self.stack = try container.decodeIfPresent(Bool.self, forKey: .stack) ?? false
        self.extensionSpeed = try container.decode(Float.self, forKey: .extensionSpeed)
        self.energyPerMovement = try container.decode(String.self, forKey: .energyPerMovement)
        self.energyPerRotation = try container.decode(String.self, forKey: .energyPerRotation)
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
        try container.encode(rotationSpeed, forKey: .rotationSpeed)
        try container.encode(handSize, forKey: .handSize)
        try container.encode(filterCount, forKey: .filterCount)
        try container.encode(stack, forKey: .stack)
        try container.encode(extensionSpeed, forKey: .extensionSpeed)
        try container.encode(energyPerMovement, forKey: .energyPerMovement)
        try container.encode(energyPerRotation, forKey: .energyPerRotation)
    }
}
