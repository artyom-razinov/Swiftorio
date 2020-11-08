public protocol BlueprintFromBlueprintStringDecoder {
    func decodeFromBlueprintString(string: String) throws -> BlueprintOrBook
}
