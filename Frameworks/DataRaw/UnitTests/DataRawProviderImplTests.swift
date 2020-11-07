import XCTest
import SwiftorioDataRaw
import SwiftorioUnitTestsFoundation

final class DataRawProviderImplTests: TestCase {
    func test() {
        assertDoesntThrow {
            let provider = DataRawProviderImpl(
                dataRawJsonStringProvider: di.resolve()
            )
            
            let dataRaw = try provider.dataRaw()
            
            XCTAssertEqual(dataRaw.accumulator["accumulator"]?.maxHealth, 150)
        }
    }
}
