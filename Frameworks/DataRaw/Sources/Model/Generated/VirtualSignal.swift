public final class VirtualSignal: Codable {
    public let order: String?
    public let specialSignal: Bool?
    public let icon: FileName
    public let subgroup: ItemSubgroupName
    
    enum CodingKeys: String, CodingKey {
        case order
        case specialSignal = "special_signal"
        case icon
        case subgroup
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.order = try container.decodeIfPresent(String.self, forKey: .order)
        self.specialSignal = try container.decodeIfPresent(Bool.self, forKey: .specialSignal) ?? false
        self.icon = try container.decode(FileName.self, forKey: .icon)
        self.subgroup = try container.decode(String.self, forKey: .subgroup)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(order, forKey: .order)
        try container.encode(specialSignal, forKey: .specialSignal)
        try container.encode(icon, forKey: .icon)
        try container.encode(subgroup, forKey: .subgroup)
    }
}
