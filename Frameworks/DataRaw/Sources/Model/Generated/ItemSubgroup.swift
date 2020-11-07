public final class ItemSubgroup: Codable {
    public let group: String
    public let order: String
    
    enum CodingKeys: String, CodingKey {
        case group
        case order
    }
}
