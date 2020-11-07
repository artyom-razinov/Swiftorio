// https://github.com/jcranmer/factorio-tools/blob/master/schema.json

import SwiftorioFoundation
import Foundation

// Dumb class, semi-automatic. Prints code to console, requires manual editing.
public final class DataRawClassesGeneratorImpl: DataRawClassesGenerator {
    private let stringToCamelCaseTransformer: StringToCamelCaseTransformer
    private let indentation = "    "
    
    public init(stringToCamelCaseTransformer: StringToCamelCaseTransformer) {
        self.stringToCamelCaseTransformer = stringToCamelCaseTransformer
    }
    
    private struct Property {
        var name: String
        var key: String
        var isOptional: Bool
        var type: String
        var defaultValue: String?
    }
    
    private struct Declaration {
        var name: String
        var key: String
        var isAbstract: Bool
        var parentName: String?
        var properties: [Property]
    }
    
    public func generate() throws {
        var declarations: [Declaration] = []
        
        for (key, valueAsAny) in try schemaJson() {
            let value = try (valueAsAny as? [String: Any]).unwrapOrThrow()
            
            let declaration = try toDeclaration(key: key, value: value)
            
            declarations.append(declaration)
        }
        
        let temporaryDirectory = "/Users/razinov/src/swiftorio/Frameworks/DataRaw/Sources/Model/Generated"//NSTemporaryDirectory() + "/DataRawClassesGeneratorImpl"
        
        try? FileManager.default.removeItem(atPath: temporaryDirectory)
        
        try FileManager.default.createDirectory(
            atPath: temporaryDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        let root = Declaration(
            name: "DataRaw",
            key: "inapplicable",
            isAbstract: false,
            parentName: nil,
            properties: declarations.map { declaration in
                Property(
                    name: decapitalize(string: declaration.name),
                    key: declaration.key,
                    isOptional: false,
                    type: declaration.name,
                    defaultValue: nil
                )
            }
        )
        
        var declarationsByName: [String: Declaration] = [:]
        for declaration in declarations {
            declarationsByName[declaration.name] = declaration
        }
        
        declarations = declarations.flatMap { (e: Declaration) -> [Declaration] in
            var declaration = e
            
            if let parentName = declaration.parentName, let parent = declarationsByName[parentName], parent.isAbstract == false {
                let protocolDeclarationName = "\(parentName)Protocol"
                
                declaration.parentName = protocolDeclarationName
                var protocolDeclaration = parent
                protocolDeclaration.name = protocolDeclarationName
                protocolDeclaration.isAbstract = true
                
                return [protocolDeclaration, declaration]
            } else if e.isAbstract {
                let protocolDeclarationName = "\(declaration.name)Protocol"
                
                var protocolDeclaration = declaration
                protocolDeclaration.name = protocolDeclarationName
                protocolDeclaration.isAbstract = true
                
                declaration.parentName = protocolDeclarationName
                declaration.isAbstract = false
                declaration.properties = []
                
                return [protocolDeclaration, declaration]
            } else {
                return [declaration]
            }
        }
        
        declarationsByName.removeAll()
        for declaration in declarations {
            declarationsByName[declaration.name] = declaration
        }
        
        declarations.append(root)
        
        for declaration in declarations {
            let code = self.code(declaration: declaration, declarationsByName: declarationsByName)
            
            try NSString(string: code).write(
                toFile: temporaryDirectory + "/\(declaration.name).swift",
                atomically: false,
                encoding: String.Encoding.utf8.rawValue
            )
        }
        
        print("Generated code inside: \(temporaryDirectory)")
    }
    
    private func code(declaration: Declaration, declarationsByName: [String: Declaration]) -> String {
        var code = "public "
        var parents: [String] = []
        
        if declaration.isAbstract {
            code += "protocol"
        } else {
            code += "final class"
            parents.append("Codable")
        }
        
        if var parentName = declaration.parentName {
            if !parentName.contains("Protocol") {
                parentName = parentName + "Protocol" // very dirty hack
            }
            //if declarationsByName.values.contains(where: { e in e.name == declaration.parentName, e.isAbstract == true }) {
                parents.append(parentName)
            //}
        }
        
        let inheritanceClause = parents.isEmpty
            ? ""
            : ": " + parents.joined(separator: ", ")
        
        code += " \(declaration.name)\(inheritanceClause) {\n"
        
        let allProperties = self.allProperties(declaration: declaration, declarationsByName: declarationsByName)
        
        if !allProperties.isEmpty {
            if declaration.isAbstract {
                for property in allProperties {
                    let optionalitySign = property.isOptional ? "?" : ""
                    code += "\(indentation)var \(property.name): \(property.type)\(optionalitySign) { get }\n"
                }
            } else {
                for property in allProperties {
                    let optionalitySign = property.isOptional ? "?" : ""
                    code += "\(indentation)public let \(property.name): \(property.type)\(optionalitySign)\n"
                }
                
                code +=
                """
                \(indentation)
                \(indentation)enum CodingKeys: String, CodingKey {\n
                """
                
                for property in allProperties {
                    code += "\(indentation)\(indentation)case \(property.name)"
                    if property.name != property.key {
                        code += " = \"\(property.key)\""
                    }
                    code += "\n"
                }
                
                code += "\(indentation)}\n"
                
                let hasDefaultValues = allProperties.contains { $0.defaultValue != nil }
                
                if hasDefaultValues {
                    code +=
                    """
                    \(indentation)
                    \(indentation)public init(from decoder: Decoder) throws {
                    \(indentation)\(indentation)let container = try decoder.container(keyedBy: CodingKeys.self)\n
                    """
                    
                    for property in allProperties {
                        if let defaultValue = property.defaultValue {
                            code +=
                            """
                            \(indentation)\(indentation)self.\(property.name) = try container.decodeIfPresent(\(property.type).self, forKey: .\(property.name)) ?? \(defaultValue)\n
                            """
                        } else {
                            code += "\(indentation)\(indentation)self.\(property.name) = try container.decode(\(property.type).self, forKey: .\(property.name))\n"
                        }
                    }
                    
                    code +=
                    """
                    \(indentation)}
                    \(indentation)
                    \(indentation)public func encode(to encoder: Encoder) throws {
                    \(indentation)\(indentation)var container = encoder.container(keyedBy: CodingKeys.self)\n
                    """
                    
                    for property in allProperties {
                        code += "\(indentation)\(indentation)try container.encode(\(property.name), forKey: .\(property.name))\n"
                    }
                    
                    code +=
                    """
                    \(indentation)}\n
                    """
                }
            }
        }
        
        code += "}"
        
        return code
    }
    
    private func allProperties(
        declaration: Declaration,
        declarationsByName: [String: Declaration])
        -> [Property]
    {
        var allProperties: [Property] = []
        
        if let parentName = declaration.parentName, let parent = declarationsByName[parentName] {
            allProperties.append(
                contentsOf: self.allProperties(
                    declaration: parent,
                    declarationsByName: declarationsByName
                )
            )
        }
        
        allProperties.append(contentsOf: declaration.properties)
        
        return allProperties
    }
    
    private func toDeclaration(key: String, value: [String: Any]) throws -> Declaration {
        var properties: [Property] = []
        
        if let propertiesJson = value["properties"] as? [String: Any] {
            for (key, propertyJsonAsAny) in propertiesJson {
                let propertyJson = try (propertyJsonAsAny as? [String: Any]).unwrapOrThrow()
                
                let isOptional = (propertyJson["optional"] as? Bool) == true
                let typeAsAny = try propertyJson["type"].unwrapOrThrow()
                
                let type: String
                
                switch typeAsAny {
                case _ as [String: Any]:
                    type = toDeclarationName(key: key)
                case _ as [Any]:
                    type = toDeclarationName(key: key)
                default:
                    type = toDeclarationName(key: "\(typeAsAny)")
                }
                
                let defaultValue = try propertyJson["default"].flatMap { (any: Any) -> String? in
                    switch any {
                    case _ as [Any]:
                        return "nil /* FIXME */"
                    case _ as [String: Any]:
                        return "nil /* FIXME */"
                    case let value as Int:
                        if type == "Bool" {
                            switch value {
                            case 0:
                                return "false"
                            case 1:
                                return "true"
                            default:
                                throw ErrorString("Unsupported: \(value)")
                            }
                        } else {
                            return "\(value)"
                        }
                    default:
                        let value = try (any as? CustomDebugStringConvertible).unwrapOrThrow().debugDescription
                        
                        switch value {
                        case "<null>", "":
                            return nil
                        default:
                            return value
                        }
                    }
                }
                
                let name = stringToCamelCaseTransformer.transformToCamelCase(string: key)
                
                let property = Property(
                    name: name,
                    key: key,
                    isOptional: isOptional,
                    type: type,
                    defaultValue: defaultValue
                )
                
                properties.append(property)
            }
        }
        
        return Declaration(
            name: toDeclarationName(key: key),
            key: key,
            isAbstract: value["abstract"].flatMap { $0 as? Bool } == true,
            parentName: value["parent"].flatMap { $0 as? String }.map { toDeclarationName(key: $0) },
            properties: properties
        )
    }
    
    private func toDeclarationName(key: String) -> String {
        return capitalize(string: stringToCamelCaseTransformer.transformToCamelCase(string: key))
    }
    
    func capitalize(string: String) -> String {
        return string.prefix(1).capitalized + string.dropFirst()
    }
    
    func decapitalize(string: String) -> String {
        return string.prefix(1).lowercased() + string.dropFirst()
    }
    
    private func schemaJson() throws -> [String: Any] {
        return try json(data: schemaJsonData())
    }
    
    private func schemaJsonData() throws -> Data {
        let bundle = Bundle(for: Self.self)
        let path = try bundle.path(forResource: "schema.json", ofType: nil).unwrapOrThrow()
        return try NSData(contentsOfFile: path) as Data
    }
    
    private func json(data: Data) throws -> [String: Any] {
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        
        let dictionaryOrNil = jsonObject as? [String: Any]
        
        return try dictionaryOrNil.unwrapOrThrow(
            message: "Json object is not a dictionary: \(jsonObject)"
        )
    }
}
