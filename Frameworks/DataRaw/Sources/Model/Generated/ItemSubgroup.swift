public final class ItemSubgroup: Codable {
    public let group: ItemGroup
    public let order: String
    
    enum CodingKeys: String, CodingKey {
        case group
        case order
    }
}