public struct Inventory: Codable {
    // Array of #Item filter objects.
    public let filters: [ItemFilter]
    
    // The index of the first inaccessible item slot due to limiting with the red "bar". 0-based, optional. Types/ItemStackIndex.
    public let bar: ItemStackIndex?
}
