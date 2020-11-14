public final class ItemSubgroupPrototype: PrototypeBase {
    public let group: ItemGroupPrototypeName
    
    enum CodingKeys: String, CodingKey {
        case group
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.group = try container.decode(key: .group)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(group, forKey: .group)
    }
}
