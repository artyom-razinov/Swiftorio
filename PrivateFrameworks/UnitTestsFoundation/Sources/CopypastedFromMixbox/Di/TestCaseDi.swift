import SwiftorioDi
import SwiftorioFoundation

// Utility designed to be used in declaration of base TestCase class.
//
// Example:
//
// class MyProjectTestCase: XCTestCase {
//     let di = TestCaseDi.make(
//         dependencyCollectionRegisterer: MyProjectDependencies(),
//         dependencyInjectionFactory: DependencyInjectionFactoryImpl()
//     )
// }
//
// The benefits of using this utility:
//
// 1. Very small boilerplate of adding dependencies (see the example above).
// 2. Very small boilerplate of resolving dependencies: `di.resolve() as MyDependency`
// 3. Allows you to declare dependencies in a separate class (and you can put it in a separate file)
//
public final class TestCaseDi {
    // Creates DI container, registers dependencies, registers `DependencyInjectionFactory` in container.
    public static func make(
        dependencyCollectionRegisterer: DependencyCollectionRegisterer,
        dependencyInjectionFactory: DependencyInjectionFactory)
        -> TestFailingDependencyResolver
    {
        let dependencyInjection = dependencyInjectionFactory.dependencyInjection()
        
        dependencyInjection.register(type: DependencyInjectionFactory.self) { _ in
            dependencyInjectionFactory
        }
        
        dependencyCollectionRegisterer.register(dependencyRegisterer: dependencyInjection)
        
        return TestFailingDependencyResolverImpl(
            dependencyResolver: dependencyInjection
        )
    }
}
