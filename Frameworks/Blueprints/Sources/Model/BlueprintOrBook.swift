public enum BlueprintOrBook: Codable {
    case book(BlueprintBook)
    case blueprint(Blueprint)
    
    enum CodingKeys: String, CodingKey {
        case blueprint_book
        case blueprint
        case index
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if container.allKeys.contains(.blueprint_book) {
            self = .book(
                try container.decode(BlueprintBook.self, forKey: .blueprint_book)
            )
        } else {
            self = .blueprint(
                try container.decode(Blueprint.self, forKey: .blueprint)
            )
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case let .blueprint(value):
            try container.encode(value, forKey: .blueprint)
        case let .book(value):
            try container.encode(value, forKey: .blueprint_book)
        }
    }
}
