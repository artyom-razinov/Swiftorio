// https://wiki.factorio.com/Types/LocalisedString
public final class LocalisedString: Codable {
    public let id: String
    public let parameters: [String]
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        id = try container.decode(String.self)
        parameters = try container.decodeIfPresent([String].self) ?? []
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        
        try container.encode(id)
        
        if !parameters.isEmpty {
            try container.encode(parameters)
        }
    }
}
