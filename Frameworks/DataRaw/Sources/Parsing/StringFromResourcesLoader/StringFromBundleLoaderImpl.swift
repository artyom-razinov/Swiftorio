import SwiftorioFoundation
import Foundation

public final class StringFromBundleLoaderImpl: StringFromBundleLoader {
    public func loadString(
        bundle: Bundle,
        resourceName: String)
        throws
        -> String
    {
        let resourcePath = try bundle
            .path(
                forResource: resourceName,
                ofType: nil
            )
            .unwrapOrThrow(message: "Failed to get path for resource \"\(resourceName)\"")
        
        return try NSString(
            contentsOfFile: resourcePath,
            encoding: String.Encoding.utf8.rawValue
        ) as String
    }
}
