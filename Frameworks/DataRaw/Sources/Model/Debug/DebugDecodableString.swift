import SwiftorioFoundation

public final class InGameEnumValueRegistry {
    public static let instance = InGameEnumValueRegistry()
    
    public var possibleValuesByTypeName = Dictionary<String, Set<String>>()
    
    public func register(value: String, type: Any.Type) {
        let typeName = "\(type)"
        possibleValuesByTypeName[typeName, default: []].insert(value)
    }
}

public class InGameEnum: Codable, CodingKey, Hashable {
    public let stringValue: String
    public var intValue: Int? { nil }
    public var rawValue: String { stringValue }
    
    public required init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public required init?(intValue: Int) {
        return nil
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(stringValue)
    }
    
    public static func ==(lhs: InGameEnum, rhs: InGameEnum) -> Bool {
        return lhs.stringValue == rhs.stringValue
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        stringValue = try container.decode(String.self)
        
        InGameEnumValueRegistry.instance.register(
            value: stringValue,
            type: type(of: self)
        )
    }
    
    public func encode(to encoder: Encoder) throws {
        throw ErrorString("DebugDecodableString is only for decoding")
    }
}

public struct DictionaryKeyedByInGameEnum<Key: Hashable, Value: Codable>: Codable where Key: CodingKey {
    public let decoded: [Key: Value]
    public var plain: [String: Value] {
        var plain = [String: Value]()
        
        for (key, value) in decoded {
            plain[key.stringValue] = value
        }
        
        return plain
    }
    
    public init(_ decoded: [Key: Value]) {
        self.decoded = decoded
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        
        let uniqueKeysWithValues = try container.allKeys.lazy.map {
            (key: $0, value: try container.decode(Value.self, forKey: $0))
        }
        
        decoded = Dictionary(uniqueKeysWithValues: uniqueKeysWithValues)

        container.allKeys.forEach {
            InGameEnumValueRegistry.instance.register(
                value: $0.stringValue,
                type: Key.self
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)

        for (key, value) in decoded {
            try container.encode(value, forKey: key)
        }
    }
}
