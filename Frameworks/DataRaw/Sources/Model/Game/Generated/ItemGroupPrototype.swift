public final class ItemGroupPrototype: PrototypeBase {
    public let icon: FileName
    public let inventoryOrder: String?
    
    enum CodingKeys: String, CodingKey {
        case icon
        case inventoryOrder = "inventory_order"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.icon = try container.decode(key: .icon)
        self.inventoryOrder = try container.decode(key: .inventoryOrder)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(icon, forKey: .icon)
        try container.encode(inventoryOrder, forKey: .inventoryOrder)
    }
}
