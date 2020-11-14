import zlib
import Foundation

public protocol Algorithm {
    func initialOutputDataCapacity(inputData: Data) -> Int
    
    func initStream(stream: inout z_stream_s) throws -> Int32
    
    func extendData(inputData: Data, outputData: inout Data)
    func performOperationOnStreamInsideLoop(stream: inout z_stream_s) -> Int32
    func shouldContinueLoop(status: Int32, stream: inout z_stream_s) -> Bool
    
    func endStream(stream: inout z_stream_s) throws -> Int32
}
