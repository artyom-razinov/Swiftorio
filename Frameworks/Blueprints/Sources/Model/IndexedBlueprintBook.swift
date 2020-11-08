public final class IndexedBlueprintBook: Codable {
    public let blueprint_book: BlueprintBook
    public let index: LongInteger
    
    public init(blueprint_book: BlueprintBook, index: LongInteger) {
        self.blueprint_book = blueprint_book
        self.index = index
    }
}
