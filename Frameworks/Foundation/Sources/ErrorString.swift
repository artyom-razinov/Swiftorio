open class ErrorString: Error, Hashable, Codable, ExpressibleByStringLiteral, CustomStringConvertible {
    public let value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public required convenience init(stringLiteral: String) {
        self.init(stringLiteral)
    }
    
    public convenience init(_ other: Error) {
        self.init(String(describing: other))
    }
    
    public var description: String {
        return value
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
    
    public static func ==(lhs: ErrorString, rhs: ErrorString) -> Bool {
        return lhs.value == rhs.value
    }
}
