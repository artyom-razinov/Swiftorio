public enum SignalIdType: String, Codable { // FIXME: move
    case item
    case fluid
    case virtual
}

public struct SignalId: Codable {
    // Name of the signal prototype this signal is set to.
    public let name: String
    
    // Type of the signal. Either "item", "fluid" or "virtual".
    public let type: SignalIdType
    
    public init(name: String, type: SignalIdType) {
        self.name = name
        self.type = type
    }
}
