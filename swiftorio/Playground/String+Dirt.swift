import Foundation

extension String {
    func write(file: String) throws {
        try (self as NSString).write(
            toFile: file,
            atomically: true,
            encoding: String.Encoding.utf8.rawValue
        )
    }
    
    var deletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }
}
