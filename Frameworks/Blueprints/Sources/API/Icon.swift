public struct Icon: Codable {
    // Index of the icon, 1-based.
    public let index: Integer
    
    // The icon that is displayed, #SignalID object.
    public let signal: SignalId
    
    public init(index: Integer, signal: SignalId) {
        self.index = index
        self.signal = signal
    }
}
