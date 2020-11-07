public final class Technology: Codable {
    public let upgrade: Bool?
    public let order: String?
    public let iconSize: Integer?
    public let unit: Unit
    public let prerequisites: Prerequisites?
    public let icon: FileName
    
    enum CodingKeys: String, CodingKey {
        case upgrade
        case order
        case iconSize = "icon_size"
        case unit
        case prerequisites
        case icon
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.upgrade = try container.decodeIfPresent(Bool.self, forKey: .upgrade) ?? false
        self.order = try container.decode(String.self, forKey: .order)
        self.iconSize = try container.decodeIfPresent(Integer.self, forKey: .iconSize) ?? 32
        self.unit = try container.decode(Unit.self, forKey: .unit)
        self.prerequisites = try container.decodeIfPresent(Prerequisites.self, forKey: .prerequisites) ?? nil /* FIXME */
        self.icon = try container.decode(FileName.self, forKey: .icon)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(upgrade, forKey: .upgrade)
        try container.encode(order, forKey: .order)
        try container.encode(iconSize, forKey: .iconSize)
        try container.encode(unit, forKey: .unit)
        try container.encode(prerequisites, forKey: .prerequisites)
        try container.encode(icon, forKey: .icon)
    }
}