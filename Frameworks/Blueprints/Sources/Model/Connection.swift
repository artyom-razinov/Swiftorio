public struct Connection: Codable {
    // Key: 1. First connection point. The default for everything that doesn't have multiple connection points.#Connection point object
    public let first: ConnectionPoint
    // Key: 2. Second connection point. For example, the "output" part of an arithmetic combinator.#Connection point object
    public let second: ConnectionPoint
    
    enum CodingKeys: String, CodingKey {
        case first = "1"
        case second = "2"
    }
}
