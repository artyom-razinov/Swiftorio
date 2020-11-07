import SwiftorioBlueprints
import SwiftorioDataRaw
import SwiftorioDi

let dependencyInjectionFactory = DependencyInjectionFactoryImpl()
let dependencyInjection = dependencyInjectionFactory.dependencyInjection()
let dependencyCollectionRegisterer = SwiftorioDataRawDependencyCollectionRegisterer()

dependencyCollectionRegisterer.register(dependencyRegisterer: dependencyInjection)

do {
    let generator = DataRawClassesGeneratorImpl(stringToCamelCaseTransformer: StringToCamelCaseTransformerImpl())
    
    try generator.generate()
} catch {
    print("Error: \(error)")
    exit(1)
}
