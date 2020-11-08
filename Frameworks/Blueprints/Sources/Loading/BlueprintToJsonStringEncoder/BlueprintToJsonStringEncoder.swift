public protocol BlueprintToJsonStringEncoder {
    func encodeToJsonData(blueprint: BlueprintOrBook) throws -> String
}
