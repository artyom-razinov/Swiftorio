import SwiftorioDi
import SwiftorioDataRaw

public func json(string: String) throws -> [String: Any] {
    let jsonObject = try JSONSerialization.jsonObject(
        with: string.data(using: .utf8).unwrapOrThrow()
    )
    
    let dictionaryOrNil = jsonObject as? [String: Any]
    
    return try dictionaryOrNil.unwrapOrThrow(
        message: "Json object is not a dictionary: \(jsonObject)"
    )
}

public func withDi(body: (DependencyResolver) throws -> ()) {
    do {
        let dependencyInjectionFactory = DependencyInjectionFactoryImpl()
        let di = dependencyInjectionFactory.dependencyInjection()
        let dependencyCollectionRegisterer = SwiftorioDataRawDependencyCollectionRegisterer()

        dependencyCollectionRegisterer.register(dependencyRegisterer: di)
        
        try body(di)
    } catch {
        print("\(error)")
        exit(1)
    }
}
