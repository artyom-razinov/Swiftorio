import XCTest
import SwiftorioDi
import SwiftorioDataRaw
import SwiftorioUnitTestsFoundation

class TestCase: BaseTestCase {
    let di = TestCaseDi.make(
        dependencyCollectionRegisterer: SwiftorioDataRawDependencyCollectionRegisterer(),
        dependencyInjectionFactory: DependencyInjectionFactoryImpl()
    )
}
