import XCTest
import SwiftorioDataRaw
import SwiftorioUnitTestsFoundation

final class LoadingFromLuaDataRawJsonStringProviderTests: TestCase {
    func test() {
        assertDoesntThrow {
            let provider = LoadingFromLuaDataRawJsonStringProvider(
                stringFromBundleLoader: di.resolve(),
                dataRawToJsonStringConverter: di.resolve()
            )
            
            let actualJsonString = try provider.dataRawJsonString()
            
            let actualJson = try json(string: actualJsonString)
            
            XCTAssertNotNil(actualJson["accumulator"])
        }
    }
}
