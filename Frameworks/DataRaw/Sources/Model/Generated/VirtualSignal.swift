public final class VirtualSignal: Codable {
    public let subgroup: String
    public let order: String
    public let specialSignal: Bool?
    public let icon: FileName
    
    enum CodingKeys: String, CodingKey {
        case subgroup
        case order
        case specialSignal = "special_signal"
        case icon
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.subgroup = try container.decode(String.self, forKey: .subgroup)
        self.order = try container.decode(String.self, forKey: .order)
        self.specialSignal = try container.decodeIfPresent(Bool.self, forKey: .specialSignal) ?? false
        self.icon = try container.decode(FileName.self, forKey: .icon)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(subgroup, forKey: .subgroup)
        try container.encode(order, forKey: .order)
        try container.encode(specialSignal, forKey: .specialSignal)
        try container.encode(icon, forKey: .icon)
    }
}