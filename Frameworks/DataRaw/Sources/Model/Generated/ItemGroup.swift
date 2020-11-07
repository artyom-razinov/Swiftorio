public final class ItemGroup: Codable {
    public let order: String
    public let icon: FileName
    public let inventoryOrder: String?
    
    enum CodingKeys: String, CodingKey {
        case order
        case icon
        case inventoryOrder = "inventory_order"
    }
}