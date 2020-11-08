public final class Color: Codable {
    // red, number from 0 to 1.
    public let r: Floating
    
    // green, number from 0 to 1.
    public let g: Floating
    
    // blue, number from 0 to 1.
    public let b: Floating
    
    // transparency, number from 0 to 1.
    public let a: Floating
    
    public init(r: Floating, g: Floating, b: Floating, a: Floating) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
}
