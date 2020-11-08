open class BaseNestingDependencyCollectionRegisterer: DependencyCollectionRegisterer {
    public init() {
    }
    
    // To be overriden.
    open func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return []
    }
    
    // To be overriden.
    open func registerTopLevelDependencies(di: DependencyRegisterer) {
    }
    
    public final func register(dependencyRegisterer di: DependencyRegisterer) {
        nestedRegisterers().forEach { $0.register(dependencyRegisterer: di) }
        
        registerTopLevelDependencies(di: di)
    }
}
