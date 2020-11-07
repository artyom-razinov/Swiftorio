public struct ConnectionPoint: Codable {
    // An array of #Connection data object containing all the connections from this point created by red wire.
    public let red: [ConnectionData]
    
    // An array of #Connection data object containing all the connections from this point created by green wire.
    public let green: [ConnectionData]
}
