import XCTest
import SwiftorioDi
import SwiftorioBlueprints
import SwiftorioUnitTestsFoundation

class TestCase: BaseTestCase {
    let di = TestCaseDi.make(
        dependencyCollectionRegisterer: SwiftorioBlueprintsDependencyCollectionRegisterer(),
        dependencyInjectionFactory: DependencyInjectionFactoryImpl()
    )
}
