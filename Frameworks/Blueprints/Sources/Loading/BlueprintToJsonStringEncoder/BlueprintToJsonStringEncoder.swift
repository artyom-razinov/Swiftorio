public protocol BlueprintToJsonStringEncoder {
    func encodeToJsonString(blueprint: BlueprintOrBook) throws -> String
}

extension BlueprintToJsonStringEncoder {
    public func encodeToJsonString(blueprint: Blueprint) throws -> String {
        return try encodeToJsonString(blueprint: .blueprint(blueprint))
    }
    
    public func encodeToJsonString(blueprint: BlueprintBook) throws -> String {
        return try encodeToJsonString(blueprint: .book(blueprint))
    }
}
