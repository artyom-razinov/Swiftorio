public final class Resource: Entity {
    public let maximum: Integer?
    public let minimum: Integer?
    public let category: ResourceCategory?
    public let normal: Integer?
    public let infinite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case maximum
        case minimum
        case category
        case normal
        case infinite
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maximum = try container.decodeIfPresent(Integer.self, forKey: .maximum) ?? 0
        self.minimum = try container.decodeIfPresent(Integer.self, forKey: .minimum) ?? 0
        self.category = try container.decodeIfPresent(ResourceCategory.self, forKey: .category) ?? nil /* FIXME: ?? basic-solid */
        self.normal = try container.decodeIfPresent(Integer.self, forKey: .normal) ?? 0
        self.infinite = try container.decodeIfPresent(Bool.self, forKey: .infinite) ?? false
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(maximum, forKey: .maximum)
        try container.encode(minimum, forKey: .minimum)
        try container.encode(category, forKey: .category)
        try container.encode(normal, forKey: .normal)
        try container.encode(infinite, forKey: .infinite)
    }
}
