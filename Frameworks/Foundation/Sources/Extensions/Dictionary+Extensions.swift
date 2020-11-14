extension Collection {
    public func toDictionary<Key: Hashable, Value>(
        groupedBy getPair: (Element) throws -> (key: Key, value: Value)?)
        rethrows
        -> [Key: Value]
    {
        var dictionary = [Key: Value]()
        
        try forEach {
            if let pair = try getPair($0) {
                dictionary[pair.key] = pair.value
            }
        }
        
        return dictionary
    }
    
    public func group<Key, Value, Container>(
        container: () -> Container,
        insert: (inout Container, Value) -> (),
        value: (Element) throws -> (key: Key, value: Value)?)
        rethrows
        -> [Key: Container]
        where
        Key: Hashable,
        Value == Container.Element,
        Container: Collection
    {
        var dictionary = [Key: Container]()
        
        try forEach {
            if let pair = try value($0) {
                insert(
                    &dictionary[pair.key, default: container()],
                    pair.value
                )
            }
        }
        
        return dictionary
    }
}
