public final class Inserter: Codable, EntityWithHealthProtocol {
    public let minable: Minable?
    public let selectionBox: Rect?
    public let collisionBox: Rect?
    public let weight: Float?
    public let fastReplaceableGroup: String?
    public let icon: FileName?
    public let maxHealth: Float
    public let handSize: Float?
    public let filterCount: Integer?
    public let energyPerRotation: Integer
    public let rotationSpeed: Float
    public let stack: Bool?
    public let extensionSpeed: Float
    public let energyPerMovement: Integer
    
    enum CodingKeys: String, CodingKey {
        case minable
        case selectionBox = "selection_box"
        case collisionBox = "collision_box"
        case weight
        case fastReplaceableGroup = "fast_replaceable_group"
        case icon
        case maxHealth = "max_health"
        case handSize = "hand_size"
        case filterCount = "filter_count"
        case energyPerRotation = "energy_per_rotation"
        case rotationSpeed = "rotation_speed"
        case stack
        case extensionSpeed = "extension_speed"
        case energyPerMovement = "energy_per_movement"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minable = try container.decode(Minable.self, forKey: .minable)
        self.selectionBox = try container.decode(Rect.self, forKey: .selectionBox)
        self.collisionBox = try container.decode(Rect.self, forKey: .collisionBox)
        self.weight = try container.decodeIfPresent(Float.self, forKey: .weight) ?? 1
        self.fastReplaceableGroup = try container.decode(String.self, forKey: .fastReplaceableGroup)
        self.icon = try container.decode(FileName.self, forKey: .icon)
        self.maxHealth = try container.decode(Float.self, forKey: .maxHealth)
        self.handSize = try container.decodeIfPresent(Float.self, forKey: .handSize) ?? 1
        self.filterCount = try container.decodeIfPresent(Integer.self, forKey: .filterCount) ?? 0
        self.energyPerRotation = try container.decode(Integer.self, forKey: .energyPerRotation)
        self.rotationSpeed = try container.decode(Float.self, forKey: .rotationSpeed)
        self.stack = try container.decodeIfPresent(Bool.self, forKey: .stack) ?? false
        self.extensionSpeed = try container.decode(Float.self, forKey: .extensionSpeed)
        self.energyPerMovement = try container.decode(Integer.self, forKey: .energyPerMovement)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(minable, forKey: .minable)
        try container.encode(selectionBox, forKey: .selectionBox)
        try container.encode(collisionBox, forKey: .collisionBox)
        try container.encode(weight, forKey: .weight)
        try container.encode(fastReplaceableGroup, forKey: .fastReplaceableGroup)
        try container.encode(icon, forKey: .icon)
        try container.encode(maxHealth, forKey: .maxHealth)
        try container.encode(handSize, forKey: .handSize)
        try container.encode(filterCount, forKey: .filterCount)
        try container.encode(energyPerRotation, forKey: .energyPerRotation)
        try container.encode(rotationSpeed, forKey: .rotationSpeed)
        try container.encode(stack, forKey: .stack)
        try container.encode(extensionSpeed, forKey: .extensionSpeed)
        try container.encode(energyPerMovement, forKey: .energyPerMovement)
    }
}