import SwiftorioFoundation
import Foundation

public final class DataRawProviderImpl: DataRawProvider {
    private let dataRawJsonStringProvider: DataRawJsonStringProvider
    
    public init(dataRawJsonStringProvider: DataRawJsonStringProvider) {
        self.dataRawJsonStringProvider = dataRawJsonStringProvider
    }
    
    public func dataRaw() throws -> DataRaw {
        let jsonString = try dataRawJsonStringProvider.dataRawJsonString()
        let data = try jsonString.data(using: .utf8).unwrapOrThrow()
        
        return try JSONDecoder().decode(DataRaw.self, from: data)
    }
}
