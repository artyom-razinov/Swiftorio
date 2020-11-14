import Foundation
import SwiftorioFoundation

// Class is not thread safe.
public final class CachingDataRawJsonStringProvider: DataRawJsonStringProvider {
    private let temporaryDirectoryPathProvider: TemporaryDirectoryPathProvider
    private let dataRawJsonStringProvider: DataRawJsonStringProvider
    private let cachedFileName = "data_raw_v1.json"
    private let dataRawJsonStringMemoryCache: String? = nil
    
    public init(
        dataRawJsonStringProvider: DataRawJsonStringProvider,
        temporaryDirectoryPathProvider: TemporaryDirectoryPathProvider)
    {
        self.dataRawJsonStringProvider = dataRawJsonStringProvider
        self.temporaryDirectoryPathProvider = temporaryDirectoryPathProvider
    }
    
    public func dataRawJsonString() throws -> String {
        if let dataRawJsonStringMemoryCache = dataRawJsonStringMemoryCache {
            return dataRawJsonStringMemoryCache
        }
        
        do {
            let dataRawJsonString = try NSString(
                contentsOfFile: cachedFilePath,
                encoding: String.Encoding.utf8.rawValue
            )
            
            return dataRawJsonString as String
        } catch {
            let dataRawJsonString = try dataRawJsonStringProvider.dataRawJsonString()
            
            try FileManager.default.createDirectory(
                atPath: temporaryDirectory,
                withIntermediateDirectories: true,
                attributes: nil
            )
            
            try NSString(string: dataRawJsonString).write(
                toFile: cachedFilePath,
                atomically: true,
                encoding: String.Encoding.utf8.rawValue
            )
            
            return dataRawJsonString
        }
    }
    
    private var temporaryDirectory: String {
        return temporaryDirectoryPathProvider.temporaryDirectoryPath() + "/swiftorio-92FC8B70-C6B5-407C-AF93-00F78084BED2"
    }
    
    private var cachedFilePath: String {
        return "\(temporaryDirectory)/\(cachedFileName)"
    }
}
