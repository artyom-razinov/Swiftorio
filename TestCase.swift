import XCTest
import SwiftorioDi
import SwiftorioDataRaw
import SwiftorioUnitTestsFoundation

class TestCase: SwiftorioUnitTestsFoundation.TestCase {
    let di = TestCaseDi.make(
        dependencyCollectionRegisterer: SwiftorioDataRawDependencyCollectionRegisterer(),
        dependencyInjectionFactory: DependencyInjectionFactoryImpl()
    )
}
