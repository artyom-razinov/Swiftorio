import SwiftorioDataRaw

func generateEnums() {
    withDi { di in
        let provider = try di.resolve() as DataRawProvider
        
        // Just trigger it
        _ = try provider.dataRaw()
    }
    
    let generatedCode = InGameEnumValueRegistry.instance.generateEnums()
    
    // If `InGameEnum` is used, print code, then enum will be replaced,
    // next time code will not be generated, so this code can
    // be used always.
    if !generatedCode.isEmpty {
        print(generatedCode)
        exit(0)
    }
}
