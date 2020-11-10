extension KeyedDecodingContainer {
    func decode<T: Codable>(type: T.Type = T.self, key: Key, default: @autoclosure () -> T) throws -> T {
        return try decodeIfPresent(T.self, forKey: key) ?? `default`()
    }
    
    func decode<T: Codable>(type: T.Type = T.self, key: Key) throws -> T {
        if let optionalType = type as? OptionalProtocol.Type {
            do {
                return try self.decode(type, forKey: key)
            } catch {
                if let nilValue = optionalType.optionalProtocolNilValue as? T {
                    return nilValue
                } else {
                    // Fallback
                    
                    return try self.decode(type, forKey: key)
                }
            }
        } else {
            return try self.decode(type, forKey: key)
        }
    }
}
