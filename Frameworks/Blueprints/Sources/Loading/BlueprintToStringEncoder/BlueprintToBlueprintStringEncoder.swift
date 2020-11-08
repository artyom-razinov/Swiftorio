public protocol BlueprintToBlueprintStringEncoder {
    func encodeToBlueprintString(blueprint: BlueprintOrBook) throws -> String
}
