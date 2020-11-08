import SwiftorioFoundation

// https://en.wikipedia.org/wiki/INI_file
public final class IniParserImpl: IniParser {
    public init() {
    }
    
    public func parseIni(string: String) throws -> Ini {
        let scanner = Scanner(string: string)
        scanner.charactersToBeSkipped = .whitespacesAndNewlines
        
        var sections: [IniSection] = []
        
        while !scanner.isAtEnd {
            if let section = try scanSection(scanner: scanner) {
                sections.append(section)
            } else if !scanComment(scanner: scanner) {
                break
            }
        }
        
        return Ini(sections: sections)
    }
    
    private func scanSection(scanner: Scanner) throws -> IniSection? {
        guard let _ = scanner.scanString("[") else {
            return nil
        }
        
        guard let name = scanner.scanUpToString("]") else {
            throw invalidSyntaxError()
        }
        
        _ = scanner.scanString("]")
        
        var pairs = [String: String]()
        
        while !scanner.isAtEnd {
            if let pair = try scanPair(scanner: scanner) {
                pairs[pair.key] = pair.value
            } else if !scanComment(scanner: scanner) {
                break
            }
        }
        
        return IniSection(name: name, pairs: pairs)
    }
    
    private func scanPair(scanner: Scanner) throws -> (key: String, value: String)? {
        if var key = scanner.scanCharacters(from: .alphanumerics) {
            key += scanner.scanUpToString("=") ?? ""
            
            guard let _ = scanner.scanString("=") else {
                throw invalidSyntaxError()
            }
            
            guard let value = scanner.scanUpToCharacters(from: .newlines) else {
                throw invalidSyntaxError()
            }
            
            return (key: key, value: value)
        } else {
            return nil
        }
    }
    
    private func scanComment(scanner: Scanner) -> Bool {
        guard let _ = scanner.scanString(";") else {
            return false
        }
        
        _ = scanner.scanUpToCharacters(from: .newlines)
        
        return true
    }
    
    private func invalidSyntaxError() -> ErrorString {
        return ErrorString("Can not parse INI, syntax is invalid")
    }
}
