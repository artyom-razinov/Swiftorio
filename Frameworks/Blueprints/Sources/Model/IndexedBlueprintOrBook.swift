public enum IndexedBlueprintOrBook: Codable {
    case book(IndexedBlueprintBook)
    case blueprint(IndexedBlueprint)
    
    enum CodingKeys: String, CodingKey {
        case blueprint_book
        case blueprint
        case index
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if container.allKeys.contains(.blueprint_book) {
            self = .book(
                try IndexedBlueprintBook(from: decoder)
            )
        } else {
            self = .blueprint(
                try IndexedBlueprint(from: decoder)
            )
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        switch self {
        case let .blueprint(value):
            try value.encode(to: encoder)
        case let .book(value):
            try value.encode(to: encoder)
        }
    }
}
