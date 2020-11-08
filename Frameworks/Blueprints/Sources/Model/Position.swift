public final class Position: Codable {
    // X position within the blueprint, 0 is the center.
    public let x: Floating
    
    // Y position within the blueprint, 0 is the center.
    public let y: Floating

    public init(x: Floating, y: Floating) {
        self.x = x
        self.y = y
    }
}
