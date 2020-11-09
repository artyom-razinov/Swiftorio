import XCTest
import SwiftorioZlib
import SwiftorioDi
import SwiftorioUnitTestsFoundation

class TestCase: BaseTestCase {
    let di = TestCaseDi.make(
        dependencyCollectionRegisterer: SwiftorioZlibDependencyCollectionRegisterer(),
        dependencyInjectionFactory: DependencyInjectionFactoryImpl()
    )
}
