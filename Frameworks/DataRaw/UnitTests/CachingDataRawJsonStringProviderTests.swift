import SwiftorioDataRaw
import SwiftorioFoundation
import SwiftorioUnitTestsFoundation
import Foundation
import XCTest

final class CachingDataRawJsonStringProviderTests: TestCase {
    private var temporaryFolderPaths: [String] = []
    
    class DataRawJsonStringProviderSpy: DataRawJsonStringProvider {
        var dataRawJsonStringWasCalled = false
        
        func dataRawJsonString() throws -> String {
            dataRawJsonStringWasCalled = true
            return "<doesn't matter for this test>"
        }
    }
    
    private let spy = DataRawJsonStringProviderSpy()
    
    func test___CachingDataRawJsonStringProvider___uses_cache() {
        assertDoesntThrow {
            let uniqueTemporaryFolder = try self.uniqueTemporaryFolder()
            
            let oneProvider = CachingDataRawJsonStringProvider(
                dataRawJsonStringProvider: spy,
                temporaryDirectoryPathProvider: TemporaryDirectoryPathProviderMock(
                    temporaryDirectoryPath: uniqueTemporaryFolder
                )
            )
            
            XCTAssertEqual(spy.dataRawJsonStringWasCalled, false)
            
            _ = try oneProvider.dataRawJsonString()
            
            XCTAssertEqual(spy.dataRawJsonStringWasCalled, true)
            
            spy.dataRawJsonStringWasCalled = false
            
            _ = try oneProvider.dataRawJsonString()
            
            XCTAssertEqual(spy.dataRawJsonStringWasCalled, false)
            
            let otherProvider = CachingDataRawJsonStringProvider(
                dataRawJsonStringProvider: spy,
                temporaryDirectoryPathProvider: TemporaryDirectoryPathProviderMock(
                    temporaryDirectoryPath: uniqueTemporaryFolder
                )
            )
            
            _ = try otherProvider.dataRawJsonString()
            
            XCTAssertEqual(spy.dataRawJsonStringWasCalled, false)
        }
    }
    
    override func tearDown() {
        super.tearDown()
        
        temporaryFolderPaths.forEach {
            try? FileManager.default.removeItem(atPath: $0)
        }
    }
    
    private func uniqueTemporaryFolder() throws -> String {
        let temporaryDirectoryPathProvider = di.resolve() as TemporaryDirectoryPathProvider
        
        let path = temporaryDirectoryPathProvider.temporaryDirectoryPath() + "/" + UUID().uuidString
        
        try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        
        temporaryFolderPaths.append(path)
        
        return path
    }
}
