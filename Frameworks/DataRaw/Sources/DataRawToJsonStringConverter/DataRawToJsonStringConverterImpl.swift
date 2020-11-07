import Lua
import Foundation
import SwiftorioFoundation

public final class DataRawToJsonStringConverterImpl: DataRawToJsonStringConverter {
    private let stringFromBundleLoader: StringFromBundleLoader
    
    public init(stringFromBundleLoader: StringFromBundleLoader) {
        self.stringFromBundleLoader = stringFromBundleLoader
    }
    
    public func toJsonString(
        dataRaw: String)
        throws
        -> String
    {
        let vm = Lua.VirtualMachine()
        
        let jsonLibCode = try stringFromBundleLoader.loadString(
            bundle: Bundle(for: Self.self),
            resourceName: "json.lua"
        )
        
        let codeToEval =
        """
        \(jsonLibCode)
        
        return encode(\(dataRaw))
        """
        
        let evalResults = vm.eval(codeToEval)
        
        switch evalResults {
        case .error(let message):
            throw ErrorString(message)
        case .values(let values):
            if let value = values.first, values.count == 1 {
                if let json = value as? String {
                    return json
                } else {
                    throw ErrorString("Expected to get String, got \(type(of: value)): \(value)")
                }
            } else {
                throw ErrorString("Expected to get exactly one value, got \(values.count)")
            }
        }
    }
}
