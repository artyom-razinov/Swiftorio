public final class IndexedBlueprint: Codable {
    public let blueprint: Blueprint
    public let index: LongInteger
    
    public init(blueprint: Blueprint, index: LongInteger) {
        self.blueprint = blueprint
        self.index = index
    }
}
