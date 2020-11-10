open class AchievementPrototype: PrototypeBase {
    public let icon: FileName
    
    enum CodingKeys: String, CodingKey {
        case icon
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.icon = try container.decode(key: .icon)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(icon, forKey: .icon)
    }
}
