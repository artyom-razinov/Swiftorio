import Lua
import Foundation
import SwiftorioFoundation

public final class LoadingFromLuaDataRawJsonStringProvider: DataRawJsonStringProvider {
    private let stringFromBundleLoader: StringFromBundleLoader
    private let dataRawToJsonStringConverter: DataRawToJsonStringConverter
    
    public init(
        stringFromBundleLoader: StringFromBundleLoader,
        dataRawToJsonStringConverter: DataRawToJsonStringConverter)
    {
        self.stringFromBundleLoader = stringFromBundleLoader
        self.dataRawToJsonStringConverter = dataRawToJsonStringConverter
    }
    
    public func dataRawJsonString() throws -> String {
        let jsonLibCode = try stringFromBundleLoader.loadString(
            bundle: Bundle(for: Self.self),
            resourceName: "raw.lua"
        )
        
        return try dataRawToJsonStringConverter.toJsonString(dataRaw: jsonLibCode)
    }
}
