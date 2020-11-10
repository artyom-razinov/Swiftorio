import zlib
import SwiftorioFoundation

public final class AlgorithmPerformerImpl: AlgorithmPerformer {
    public init() {
    }
    
    public func perform(
        algorithm: Algorithm,
        data: Data)
        throws
        -> Data
    {
        guard !data.isEmpty else {
            return data
        }
        
        let context = Context(
            inputData: data,
            algorithm: algorithm
        )
        
        return try context.run()
    }
}

private final class Context {
    private var stream = z_stream()
    private let algorithm: Algorithm
    private let inputData: Data
    private var outputData: Data
    
    init(inputData: Data, algorithm: Algorithm) {
        self.inputData = inputData
        self.outputData = Data(
            capacity: algorithm.initialOutputDataCapacity(
                inputData: inputData
            )
        )
        self.algorithm = algorithm
    }
    
    func run() throws -> Data {
        try initStream()
        
        try loopStream {
            try loopStreamOnce()
        }
        
        try endStream()
        
        outputData.count = Int(stream.total_out)
        
        return outputData
    }
    
    private func initStream() throws {
        let ret = try algorithm.initStream(stream: &stream)
        
        if ret != Z_OK {
            throw ErrorString("Failed to init stream, return value: \(ret)")
        }
    }

    private func loopStreamOnce() throws -> Int32 {
        if Int(stream.total_out) >= outputData.count {
            algorithm.extendData(inputData: inputData, outputData: &outputData)
        }
        
        let inputCount = UInt(inputData.count)
        let outputCount = UInt(outputData.count)
        
        return try withPointers { (input, output) in
            stream.next_in = UnsafeMutablePointer(mutating: input.advanced(by: Int(stream.total_in)))
            stream.avail_in = uInt(inputCount - stream.total_in)
            
            stream.next_out = output.advanced(by: Int(stream.total_out))
            stream.avail_out = uInt(outputCount - stream.total_out)
            
            let status = algorithm.performOperationOnStreamInsideLoop(stream: &stream)
            
            stream.next_out = nil
            stream.next_in = nil
            
            return status
        }
    }
    
    private func withPointers<T>(
        body: (_ inputDataPointer: UnsafePointer<Bytef>, _ outputDataPointer: UnsafeMutablePointer<Bytef>) throws -> T)
        throws
        -> T
    {
        return try inputData.withUnsafeBytes { (inputDataPointer: UnsafeRawBufferPointer) in
            guard let inputDataBytefPointer = inputDataPointer.bindMemory(to: Bytef.self).baseAddress else {
                throw ErrorString("Input data has no baseAddress")
            }
            
            return try outputData.withUnsafeMutableBytes { (outputDataPointer: UnsafeMutableRawBufferPointer) in
                guard let outputDataBytefPointer = outputDataPointer.bindMemory(to: Bytef.self).baseAddress else {
                    throw ErrorString("Output data has no baseAddress")
                }
                
                return try body(inputDataBytefPointer, outputDataBytefPointer)
            }
        }
    }
    
    private func loopStream(loop: () throws -> Int32) throws {
        var status = Z_OK
        
        repeat {
            status = try loop()
        } while algorithm.shouldContinueLoop(status: status, stream: &stream)
        
        if status != Z_STREAM_END {
            throw ErrorString("Failed to inflate, expected status Z_STREAM_END (\(Z_STREAM_END)), got \(status)")
        }
    }
    
    private func endStream() throws {
        let ret = try algorithm.endStream(stream: &stream)
        if ret != Z_OK {
            throw ErrorString("Failed to end stream, return value: \(ret)")
        }
    }
}

