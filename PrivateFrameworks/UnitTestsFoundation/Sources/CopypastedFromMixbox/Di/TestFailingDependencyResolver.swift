import SwiftorioDi

public protocol TestFailingDependencyResolver {
    func resolve<T>() -> T
}
