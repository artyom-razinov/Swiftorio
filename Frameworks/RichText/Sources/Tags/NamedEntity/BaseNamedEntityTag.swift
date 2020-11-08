open class BaseNamedEntityTag {
    public let name: String // (e.g. iron-plate)
    
    public init(name: String) {
        self.name = name
    }
    
    // MARK: - Tag
    
    public var tagParameters: [String] {
        return [name]
    }
}
