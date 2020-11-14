public final class PrototypeDictionary<N, P>: Codable
    where
    N: CodingKey & Hashable & PrototypeName,
    P: Codable
{
    public typealias NameType = N
    public typealias PrototypeType = P
    
    private let dictionary: [NameType: PrototypeType]
    
    public var keyedByPrototypeName: [NameType: PrototypeType] {
        return dictionary
    }
    
    public var keydByString: [String: PrototypeType] {
        var plain = [String: PrototypeType]()
        
        for (key, value) in dictionary {
            plain[key.stringValue] = value
        }
        
        return plain
    }
    
    public var values: [PrototypeType] {
        return dictionary.map { _, prototype in
            prototype
        }
    }
    
    public var flatten: [NamedPrototype<NameType, PrototypeType>] {
        return dictionary.map { name, prototype in
            NamedPrototype(name: name, prototype: prototype)
        }
    }
    
    public init(dictionary: [NameType: PrototypeType]) {
        self.dictionary = dictionary
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NameType.self)
        
        let uniqueKeysWithValues = try container.allKeys.lazy.map {
            (key: $0, value: try container.decode(PrototypeType.self, forKey: $0))
        }
        
        dictionary = Dictionary(uniqueKeysWithValues: uniqueKeysWithValues)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: NameType.self)

        for (key, value) in dictionary {
            try container.encode(value, forKey: key)
        }
    }
}
