import XCTest
import SwiftorioDataRaw
import SwiftorioUnitTestsFoundation

final class DataRawParserTests: TestCase {
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
            
            let actualJson = try JSONSerialization.jsonObject(
                with: actualJsonString.data(using: .utf8).unwrapOrThrow()
            ) as? [String: Any]
            
            XCTAssertEqual(actualJson?["x"] as? Int, 1)
            XCTAssertEqual(actualJson?["y"] as? Int, 2)
        }
    }
}
