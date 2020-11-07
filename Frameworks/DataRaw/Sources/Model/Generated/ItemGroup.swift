public final class ItemGroup: Codable {
    public let inventoryOrder: String?
    public let order: String
    public let icon: FileName
    
    enum CodingKeys: String, CodingKey {
        case inventoryOrder = "inventory_order"
        case order
        case icon
    }
}