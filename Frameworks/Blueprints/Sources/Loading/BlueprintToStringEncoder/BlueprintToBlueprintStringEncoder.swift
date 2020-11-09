public protocol BlueprintToBlueprintStringEncoder {
    func encodeToBlueprintString(blueprint: BlueprintOrBook) throws -> String
}

extension BlueprintToBlueprintStringEncoder {
    public func encodeToBlueprintString(blueprint: Blueprint) throws -> String {
        return try encodeToBlueprintString(blueprint: .blueprint(blueprint))
    }
    
    public func encodeToBlueprintString(blueprint: BlueprintBook) throws -> String {
        return try encodeToBlueprintString(blueprint: .book(blueprint))
    }
}
