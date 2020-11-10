open class EntityWithHealth: Entity {
    public let maxHealth: Float
    
    enum CodingKeys: String, CodingKey {
        case maxHealth = "max_health"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maxHealth = try container.decode(key: .maxHealth)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(maxHealth, forKey: .maxHealth)
    }
}
