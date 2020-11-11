public final class NamedPrototype<N, P> {
    public typealias NameType = N
    public typealias PrototypeType = P
    
    public let name: NameType
    public let prototype: PrototypeType
    
    public init(
        name: NameType,
        prototype: PrototypeType)
    {
        self.name = name
        self.prototype = prototype
    }
}
