import SwiftorioFoundation

public final class BlueprintToJsonStringEncoderImpl: BlueprintToJsonStringEncoder {
    public init() {
    }
    
    public func encodeToJsonString(blueprint: BlueprintOrBook) throws -> String {
        let encoder = JSONEncoder()
        
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        
        let jsonString = String(
            data: try encoder.encode(blueprint),
            encoding: .utf8
        )
        
        return try jsonString.unwrapOrThrow(
            message: "Failed to create json string from Data"
        )
    }
}
