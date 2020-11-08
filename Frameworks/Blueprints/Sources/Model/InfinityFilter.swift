public struct InfinityFilter: Codable {
    // Name of the item prototype the filter is set to, string.
    public let name: String
    
    // Number the filter is set to, Types/ItemCountType.
    public let count: ItemCountType
    
    // Mode of the filter. Either "at-least", "at-most", or "exactly".
    public let mode: InfinityFilterMode
    
    // Index of the filter, 1-based.
    public let index: Integer
}
