public final class VirtualSignalPrototype: PrototypeBase {
    public let specialSignal: Bool
    public let icon: FileName
    public let subgroup: ItemSubgroupName
    
    enum CodingKeys: String, CodingKey {
        case order
        case specialSignal = "special_signal"
        case icon
        case subgroup
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.specialSignal = try container.decode(key: .specialSignal, default: false)
        self.icon = try container.decode(key: .icon)
        self.subgroup = try container.decode(key: .subgroup, default: .virtualSignal)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
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
