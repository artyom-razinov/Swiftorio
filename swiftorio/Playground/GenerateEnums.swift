import SwiftorioDataRaw

public final class InGameEnumsGenerator {
    private let dataRawProvider: DataRawProvider
    private let stringToCamelCaseTransformer: StringToCamelCaseTransformer
    
    public init(
        dataRawProvider: DataRawProvider,
        stringToCamelCaseTransformer: StringToCamelCaseTransformer)
    {
        self.dataRawProvider = dataRawProvider
        self.stringToCamelCaseTransformer = stringToCamelCaseTransformer
    }
    
    public func generateEnums() throws {
        // Just trigger it
        _ = try dataRawProvider.dataRaw()
        
        let enumCodeByEnumName = generateEnums(
            possibleValuesByTypeName: InGameEnumValueRegistry.instance.possibleValuesByTypeName
        )
        
        // If `InGameEnum` is used, print code, then enum will be replaced,
        // next time code will not be generated, so this code can
        // be used always.
        if !enumCodeByEnumName.isEmpty {
            try render(enumCodeByEnumName: enumCodeByEnumName)
            exit(0)
        }
    }
    
    private func render(enumCodeByEnumName: [String: String]) throws {
        let repoRoot = "\(#file)".deletingLastPathComponent.deletingLastPathComponent.deletingLastPathComponent
        
        for (enumName, enumCode) in enumCodeByEnumName {
            if enumName.hasSuffix("PrototypeName") {
                try enumCode.write(file: "\(repoRoot)/Frameworks/DataRaw/Sources/Model/NonGame/PrototypeNames/\(enumName).swift")
            } else {
                print(enumCode)
            }
        }
    }
    
    private func generateEnums(possibleValuesByTypeName: [String: Set<String>]) -> [String: String] {
        var enums = [String: String]()
        
        for (typeName, possibleValues) in possibleValuesByTypeName {
            enums[typeName] = generateEnum(typeName: typeName, possibleValues: possibleValues)
        }
        
        return enums
    }

    private func generateEnum(typeName: String, possibleValues: Set<String>) -> String {
        let cases: [String] = possibleValues.sorted().map { value in
            let caseName = stringToCamelCaseTransformer.transformToCamelCase(string: value)
            
            var code = "    case \(caseName)"
            if caseName != value {
                code += " = \"\(value)\""
            }
            
            return code
        }
        
        let code =
        """
        public enum \(typeName): String, PrototypeName {
        \(cases.joined(separator: "\n"))
        }
        """
        
        return code
    }
}

func generateEnums() {
    withDi { di in
        let generator = InGameEnumsGenerator(
            dataRawProvider: try di.resolve(),
            stringToCamelCaseTransformer: try di.resolve()
        )
        try generator.generateEnums()
    }
}


