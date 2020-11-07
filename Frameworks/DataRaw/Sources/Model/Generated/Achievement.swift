public final class Achievement: Codable {
    public let icon: FileName
    public let order: String
    
    enum CodingKeys: String, CodingKey {
        case icon
        case order
    }
}