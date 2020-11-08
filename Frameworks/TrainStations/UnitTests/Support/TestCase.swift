import XCTest
import SwiftorioDi
import SwiftorioLocalization
import SwiftorioUnitTestsFoundation

class TestCase: BaseTestCase {
    let di = TestCaseDi.make(
        dependencyCollectionRegisterer: SwiftorioLocalizationDependencyCollectionRegisterer(),
        dependencyInjectionFactory: DependencyInjectionFactoryImpl()
    )
}
