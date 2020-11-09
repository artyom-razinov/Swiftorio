import zlib
import SwiftorioFoundation

public final class DeflateCompressionLevel {
    public static let _0 = DeflateCompressionLevel(safeRawValue: 0)
    public static let _1 = DeflateCompressionLevel(safeRawValue: 1)
    public static let _2 = DeflateCompressionLevel(safeRawValue: 2)
    public static let _3 = DeflateCompressionLevel(safeRawValue: 3)
    public static let _4 = DeflateCompressionLevel(safeRawValue: 4)
    public static let _5 = DeflateCompressionLevel(safeRawValue: 5)
    public static let _6 = DeflateCompressionLevel(safeRawValue: 6)
    public static let _7 = DeflateCompressionLevel(safeRawValue: 7)
    public static let _8 = DeflateCompressionLevel(safeRawValue: 8)
    public static let _9 = DeflateCompressionLevel(safeRawValue: 9)
    public static let noCompression = DeflateCompressionLevel(safeRawValue: Z_NO_COMPRESSION)
    public static let bestSpeed = DeflateCompressionLevel(safeRawValue: Z_BEST_SPEED)
    public static let bestCompression = DeflateCompressionLevel(safeRawValue: Z_BEST_COMPRESSION)
    public static let defaultCompression = DeflateCompressionLevel(safeRawValue: Z_DEFAULT_COMPRESSION)
    
    public let rawValue: Int32
    
    public convenience init(_ rawValue: Int32) throws {
        guard rawValue >= -1 && rawValue <= 9 else {
            throw ErrorString("Compression level should be between -1 (default compression) and 9 (best compression), given: \(rawValue)")
        }
        
        self.init(safeRawValue: rawValue)
    }
    
    // TODO: Remove copypasta
    public convenience init(_ rawValue: Int) throws {
        guard rawValue >= -1 && rawValue <= 9 else {
            throw ErrorString("Compression level should be between -1 (default compression) and 9 (best compression), given: \(rawValue)")
        }
        
        self.init(safeRawValue: Int32(rawValue))
    }
    
    private init(safeRawValue: Int32) {
        self.rawValue = safeRawValue
    }
}
