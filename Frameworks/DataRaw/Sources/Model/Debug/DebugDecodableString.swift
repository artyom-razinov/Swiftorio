import SwiftorioFoundation

public final class InGameEnumValueRegistry {
    public static let instance = InGameEnumValueRegistry(
        stringToCamelCaseTransformer: StringToCamelCaseTransformerImpl()
    )
    
    private var possibleValuesByTypeName = Dictionary<String, Set<String>>()
    private let stringToCamelCaseTransformer: StringToCamelCaseTransformer
    
    private init(stringToCamelCaseTransformer: StringToCamelCaseTransformer) {
        self.stringToCamelCaseTransformer = stringToCamelCaseTransformer
    }
    
    public func register(value: String, type: Any.Type) {
        let typeName = "\(type)"
        possibleValuesByTypeName[typeName, default: []].insert(value)
    }
    
    public func generateEnums() -> String {
        return possibleValuesByTypeName
            .map { generateEnum(typeName: $0, possibleValues: $1) }
            .joined(separator: "\n\n")
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
        public enum \(typeName): String, Codable {
        \(cases.joined(separator: "\n"))
        }
        """
        
        return code
    }
}

public class InGameEnum: Codable {
    public init() {}
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        InGameEnumValueRegistry.instance.register(
            value: try container.decode(String.self),
            type: type(of: self)
        )
    }
    
    public func encode(to encoder: Encoder) throws {
        throw ErrorString("DebugDecodableString is only for decoding")
    }
}
