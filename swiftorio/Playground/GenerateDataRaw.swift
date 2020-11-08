import SwiftorioDataRaw

func generateDataRaw() {
    do {
        let generator = DataRawClassesGeneratorImpl(
            stringToCamelCaseTransformer: StringToCamelCaseTransformerImpl()
        )
        
        try generator.generate()
    } catch {
        print("Error: \(error)")
        exit(1)
    }
}
