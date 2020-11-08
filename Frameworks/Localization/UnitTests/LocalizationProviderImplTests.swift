import XCTest
import SwiftorioLocalization
import SwiftorioUnitTestsFoundation

final class LocalizationProviderImplTests: TestCase {
    func test() {
        assertDoesntThrow {
            let provider = di.resolve() as LocalizationProvider
            
            let localization = try provider.localization(locale: .en)
            
            XCTAssertEqual(
                try localization.localize(section: .fluid_name, id: "petroleum-gas"),
                "Petroleum gas"
            )
        }
    }
}
