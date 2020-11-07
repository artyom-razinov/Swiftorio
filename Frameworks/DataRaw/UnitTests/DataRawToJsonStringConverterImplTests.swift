import XCTest
import SwiftorioDataRaw
import SwiftorioUnitTestsFoundation

final class DataRawToJsonStringConverterImplTests: TestCase {
    func test() {
        assertDoesntThrow {
            let converter = DataRawToJsonStringConverterImpl(
                stringFromBundleLoader: di.resolve()
            )
            
            let actualJsonString = try converter.toJsonString(
                dataRaw:
                """
                {
                  x = 1,
                  y = 2
                }
                """
            )
            
            let actualJson = try json(string: actualJsonString)
            
            XCTAssertEqual(actualJson["x"] as? Int, 1)
            XCTAssertEqual(actualJson["y"] as? Int, 2)
        }
    }
}
