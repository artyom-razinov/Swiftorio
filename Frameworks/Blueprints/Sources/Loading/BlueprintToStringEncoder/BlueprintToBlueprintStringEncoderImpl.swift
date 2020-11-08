import Gzip
import SwiftorioFoundation

public final class BlueprintToBlueprintStringEncoderImpl: BlueprintToBlueprintStringEncoder {
    public init() {
    }
    
    public func encodeToBlueprintString(blueprint: BlueprintOrBook) throws -> String {
        let encoder = JSONEncoder()
        
        encoder.outputFormatting = [.sortedKeys]
        
        let jsonData = try encoder.encode(blueprint)
        
        let compressedData = try jsonData.gzipped(level: CompressionLevel(rawValue: 9))
        
        return BlueprintStringVersion.version + compressedData.base64EncodedString()
    }
}
