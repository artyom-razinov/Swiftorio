public struct SignalId: Codable {
    // Name of the signal prototype this signal is set to.
    public let name: String
    
    // Type of the signal. Either "item", "fluid" or "virtual".
    public let type: String
}
