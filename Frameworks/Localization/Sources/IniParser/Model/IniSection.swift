public final class IniSection {
    public let name: String
    public let pairs: [String: String]
    
    public init(
        name: String,
        pairs: [String : String])
    {
        self.name = name
        self.pairs = pairs
    }
}
