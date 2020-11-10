// https://wiki.factorio.com/PrototypeBase
open class PrototypeBase: Codable {
    public let name: String
    public let type: String
    public let localisedDescription: LocalisedString?
    public let localisedName: LocalisedString?
    public let order: Order?
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case localisedDescription = "localised_description"
        case localisedName = "localised_name"
        case order
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(key: .name)
        self.type = try container.decode(key: .type)
        self.localisedDescription = try container.decode(key: .localisedDescription)
        self.localisedName = try container.decode(key: .localisedName)
        self.order = try container.decode(key: .order)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(localisedDescription, forKey: .localisedDescription)
        try container.encode(localisedName, forKey: .localisedName)
        try container.encode(order, forKey: .order)
    }
}
