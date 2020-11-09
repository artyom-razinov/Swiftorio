import zlib
import SwiftorioFoundation

public final class DeflateAlgorithm: Algorithm {
    private let chunk = 16384 // all examples use this value
    private let level: DeflateCompressionLevel
    public init(level: DeflateCompressionLevel) {
        self.level = level
    }
    
    public func initialOutputDataCapacity(inputData: Data) -> Int {
        return chunk
    }
    
    public func initStream(stream: inout z_stream_s) throws -> Int32 {
        return deflateInit_(&stream, level.rawValue, ZLIB_VERSION, Int32(MemoryLayout<z_stream>.size))
    }
    
    public func extendData(inputData: Data, outputData: inout Data) {
        outputData.count += chunk
    }
    
    public func performOperationOnStreamInsideLoop(stream: inout z_stream_s) -> Int32 {
        return zlib.deflate(&stream, Z_FINISH)
    }
    
    public func shouldContinueLoop(status: Int32, stream: inout z_stream_s) -> Bool {
        return stream.avail_out == 0
    }
    
    public func endStream(stream: inout z_stream_s) throws -> Int32 {
        return deflateEnd(&stream)
    }
}
