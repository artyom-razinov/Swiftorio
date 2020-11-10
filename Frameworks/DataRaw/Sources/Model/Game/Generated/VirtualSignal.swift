public final class VirtualSignal: Codable {
    public let order: String?
    public let specialSignal: Bool
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
        self.order = try container.decode(key: .order)
        self.specialSignal = try container.decode(key: .specialSignal, default: false)
        self.icon = try container.decode(key: .icon)
        self.subgroup = try container.decode(key: .subgroup, default: .virtualSignal)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(order, forKey: .order)
        try container.encode(specialSignal, forKey: .specialSignal)
        try container.encode(icon, forKey: .icon)
        try container.encode(subgroup, forKey: .subgroup)
    }
}

protocol OptionalProtocol {
    static var optionalProtocolNilValue: Any { get }
}

extension Optional: OptionalProtocol {
    static var optionalProtocolNilValue: Any {
        return Self.none as Any
    }
}
