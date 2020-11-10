public struct PrototypeDictionary<Key, Value>: Codable
    where
    Key: CodingKey & Hashable & PrototypeName,
    Value: Codable
{
    private let dictionary: [Key: Value]
    
    public var keyedByPrototypeName: [Key: Value] {
        return dictionary
    }
    
    public var keydByString: [String: Value] {
        var plain = [String: Value]()
        
        for (key, value) in dictionary {
            plain[key.stringValue] = value
        }
        
        return plain
    }
    
    public init(dictionary: [Key: Value]) {
        self.dictionary = dictionary
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        
        let uniqueKeysWithValues = try container.allKeys.lazy.map {
            (key: $0, value: try container.decode(Value.self, forKey: $0))
        }
        
        dictionary = Dictionary(uniqueKeysWithValues: uniqueKeysWithValues)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)

        for (key, value) in dictionary {
            try container.encode(value, forKey: key)
        }
    }
}
