import SwiftorioDi
import SwiftorioDataRaw
import SwiftorioTrainStations
import SwiftorioGameBundle
import SwiftorioFoundation
import SwiftorioRichText
import SwiftorioBlueprints
import SwiftorioLocalization
import Foundation

public func json(string: String) throws -> [String: Any] {
    let jsonObject = try JSONSerialization.jsonObject(
        with: string.data(using: .utf8).unwrapOrThrow()
    )
    
    let dictionaryOrNil = jsonObject as? [String: Any]
    
    return try dictionaryOrNil.unwrapOrThrow(
        message: "Json object is not a dictionary: \(jsonObject)"
    )
}

public final class SwiftorioDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            SwiftorioTrainStationsDependencyCollectionRegisterer(),
            SwiftorioRichTextDependencyCollectionRegisterer(),
            SwiftorioLocalizationDependencyCollectionRegisterer(),
            SwiftorioGameBundleDependencyCollectionRegisterer(),
            SwiftorioFoundationDependencyCollectionRegisterer(),
            SwiftorioDataRawDependencyCollectionRegisterer(),
            SwiftorioBlueprintsDependencyCollectionRegisterer()
        ]
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
    }
}

public func withDi(body: (DependencyResolver) throws -> ()) {
    do {
        let dependencyInjectionFactory = DependencyInjectionFactoryImpl()
        let di = dependencyInjectionFactory.dependencyInjection()
        let dependencyCollectionRegisterer = SwiftorioDependencyCollectionRegisterer()

        dependencyCollectionRegisterer.register(dependencyRegisterer: di)
        
        try body(di)
    } catch {
        print("\(error)")
        exit(1)
    }
}
