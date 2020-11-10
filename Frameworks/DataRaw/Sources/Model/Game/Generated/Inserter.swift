public final class Inserter: EntityWithHealth {
    public let rotationSpeed: Float
    public let handSize: Float?
    public let filterCount: Integer?
    public let stack: Bool
    public let extensionSpeed: Float
    public let energyPerMovement: String // TODO: Strong type?
    public let energyPerRotation: String // TODO: Strong type?
    
    enum CodingKeys: String, CodingKey {
        case rotationSpeed = "rotation_speed"
        case handSize = "hand_size"
        case filterCount = "filter_count"
        case stack
        case extensionSpeed = "extension_speed"
        case energyPerMovement = "energy_per_movement"
        case energyPerRotation = "energy_per_rotation"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rotationSpeed = try container.decode(key: .rotationSpeed)
        self.handSize = try container.decode(key: .handSize, default: 1)
        self.filterCount = try container.decode(key: .filterCount, default: 0)
        self.stack = try container.decode(key: .stack, default: false)
        self.extensionSpeed = try container.decode(key: .extensionSpeed)
        self.energyPerMovement = try container.decode(key: .energyPerMovement)
        self.energyPerRotation = try container.decode(key: .energyPerRotation)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(rotationSpeed, forKey: .rotationSpeed)
        try container.encode(handSize, forKey: .handSize)
        try container.encode(filterCount, forKey: .filterCount)
        try container.encode(stack, forKey: .stack)
        try container.encode(extensionSpeed, forKey: .extensionSpeed)
        try container.encode(energyPerMovement, forKey: .energyPerMovement)
        try container.encode(energyPerRotation, forKey: .energyPerRotation)
    }
}
