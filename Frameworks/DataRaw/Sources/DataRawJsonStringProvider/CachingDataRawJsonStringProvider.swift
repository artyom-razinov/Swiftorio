import Foundation

// Class is not thread safe.
public final class CachingDataRawJsonStringProvider: DataRawJsonStringProvider {
    private let dataRawJsonStringProvider: DataRawJsonStringProvider
    private let cachedFileName = "data_raw_v1.json"
    private let temporaryDirectory = NSTemporaryDirectory() + "/swiftorio-92FC8B70-C6B5-407C-AF93-00F78084BED2"
    
    private var cachedFilePath: String {
        return "\(temporaryDirectory)/\(cachedFileName)"
    }
    
    public init(dataRawJsonStringProvider: DataRawJsonStringProvider) {
        self.dataRawJsonStringProvider = dataRawJsonStringProvider
    }
    
    public func dataRawJsonString() throws -> String {
        do {
            let dataRawJsonString = try NSString(
                contentsOfFile: cachedFilePath,
                encoding: String.Encoding.utf8.rawValue
            )
            
            return dataRawJsonString as String
        } catch {
            let dataRawJsonString = try dataRawJsonStringProvider.dataRawJsonString()
            
            try NSString(string: dataRawJsonString).write(
                toFile: cachedFilePath,
                atomically: true,
                encoding: String.Encoding.utf8.rawValue
            )
            
            return dataRawJsonString
        }
    }
}
