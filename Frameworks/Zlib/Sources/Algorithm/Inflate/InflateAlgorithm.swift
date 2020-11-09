import zlib

public final class InflateAlgorithm: Algorithm {
    public init() {
    }
    
    public func initialOutputDataCapacity(inputData: Data) -> Int {
        return inputData.count * 2
    }
    
    public func initStream(stream: inout z_stream_s) throws -> Int32 {
        return inflateInit_(&stream, ZLIB_VERSION, Int32(MemoryLayout<z_stream>.size))
    }
    
    public func performOperationOnStreamInsideLoop(stream: inout z_stream_s) -> Int32 {
        return zlib.inflate(&stream, Z_SYNC_FLUSH)
    }
    
    public func shouldContinueLoop(status: Int32, stream: inout z_stream_s) -> Bool {
        return status == Z_OK
    }
    
    public func extendData(inputData: Data, outputData: inout Data) {
        outputData.count += inputData.count / 2
    }
    
    public func endStream(stream: inout z_stream_s) throws -> Int32 {
        return inflateEnd(&stream)
    }
}
