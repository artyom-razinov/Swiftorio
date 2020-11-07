public struct InfinitySettings: Codable {
    // Boolean. Whether the "remove unfiltered items" checkbox is checked.
    public let remove_unfiltered_items: Bool
    
    // Filters of the infinity container, optional. Array of #Infinity filter objects.
    public let filters: [InfinityFilter]?
}
