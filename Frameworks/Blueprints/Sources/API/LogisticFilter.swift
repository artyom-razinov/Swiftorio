public struct LogisticFilter: Codable {
    // Name of the item prototype this filter is set to.
    public let name: String
    
    // Index of the filter, 1-based.
    public let index: Integer
    
    // Number the filter is set to, Types/ItemCountType. Is 0 for storage chests.
    public let count: ItemCountType
}
