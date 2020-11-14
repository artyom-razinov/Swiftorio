import Foundation

public protocol StringFromBundleLoader {
    func loadString(
        bundle: Bundle,
        resourceName: String)
        throws
        -> String
}
