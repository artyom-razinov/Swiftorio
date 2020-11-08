public enum BlueprintBookItem: Codable {
    case blueprint_book(IndexedBlueprintBook)
    case blueprint(IndexedBlueprint)
    
    enum CodingKeys: String, CodingKey {
        case blueprint_book
        case blueprint
        case index
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if container.allKeys.contains(.blueprint_book) {
            self = .blueprint_book(
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
        case let .blueprint_book(value):
            try value.encode(to: encoder)
        }
    }
}

public final class IndexedBlueprintBook: Codable {
    public let blueprint_book: BlueprintBook
    public let index: LongInteger
    
    public init(blueprint_book: BlueprintBook, index: LongInteger) {
        self.blueprint_book = blueprint_book
        self.index = index
    }
}

public final class IndexedBlueprint: Codable {
    public let blueprint: Blueprint
    public let index: LongInteger
    
    public init(blueprint: Blueprint, index: LongInteger) {
        self.blueprint = blueprint
        self.index = index
    }
}
