import XCTest
import SwiftorioDi
import SwiftorioRichText
import SwiftorioUnitTestsFoundation

class TestCase: BaseTestCase {
    let di = TestCaseDi.make(
        dependencyCollectionRegisterer: SwiftorioRichTextDependencyCollectionRegisterer(),
        dependencyInjectionFactory: DependencyInjectionFactoryImpl()
    )
}
