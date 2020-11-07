import SwiftorioDi

public final class TestCaseDependencyCollectionRegisterer: DependencyCollectionRegisterer {
    private func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            
        ]
    }
    
    public func register(dependencyRegisterer di: DependencyRegisterer) {
        nestedRegisterers().forEach { $0.register(dependencyRegisterer: di) }
    }
}
