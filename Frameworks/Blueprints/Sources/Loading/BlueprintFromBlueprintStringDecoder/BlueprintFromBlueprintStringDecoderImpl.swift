import SwiftorioFoundation
import Gzip

public final class BlueprintFromBlueprintStringDecoderImpl: BlueprintFromBlueprintStringDecoder {
    public init() {
    }
    
    public func decodeFromBlueprintString(string: String) throws -> BlueprintOrBook {
        guard let version = string.first else {
            throw ErrorString("Blueprint string is empty")
        }
        
        guard String(version) == BlueprintStringVersion.version else {
            throw ErrorString("Unknow blueprint version: \(version), expected version: \(BlueprintStringVersion.version)")
        }
        
        let encodedZippedJsonString = string.dropFirst()
        let encodedZippedJsonData = try encodedZippedJsonString.data(using: .utf8).unwrapOrThrow(
            message: "Failed to encode json string to Data"
        )
        
        let decodedZippedJsonData = try Data(base64Encoded: encodedZippedJsonData).unwrapOrThrow(
            message: "Failed to decode json data from base64 encoding"
        )
        
        let decodedJsonData = try decodedZippedJsonData.gunzipped()
        
        return try JSONDecoder().decode(BlueprintOrBook.self, from: decodedJsonData)
    }
}
