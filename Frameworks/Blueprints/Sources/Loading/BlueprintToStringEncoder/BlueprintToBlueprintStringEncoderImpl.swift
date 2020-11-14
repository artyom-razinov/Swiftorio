import SwiftorioFoundation
import SwiftorioZlib
import Foundation

public final class BlueprintToBlueprintStringEncoderImpl: BlueprintToBlueprintStringEncoder {
    private let algorithmPerformer: AlgorithmPerformer
    
    public init(algorithmPerformer: AlgorithmPerformer) {
        self.algorithmPerformer = algorithmPerformer
    }
    
    public func encodeToBlueprintString(blueprint: BlueprintOrBook) throws -> String {
        let encoder = JSONEncoder()
        
        encoder.outputFormatting = [.sortedKeys]
        
        let jsonData = try encoder.encode(blueprint)
        
        let compressedData = try compressed(data: jsonData)
        
        return BlueprintStringVersion.version + compressedData.base64EncodedString()
    }
    
    private func compressed(data: Data) throws -> Data {
        return try algorithmPerformer.perform(
            algorithm: DeflateAlgorithm(level: ._9),
            data: data
        )
    }
}
