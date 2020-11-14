public final class StringToCamelCaseTransformerImpl: StringToCamelCaseTransformer {
    public init() {
    }
    
    public func transformToCamelCase(string: String) -> String {
        let sourceCharacters = Array(string)
        var transformedCharacters: [Character] = []
        var shouldUppercaseNextCharacter = false
        
        for (index, character) in sourceCharacters.enumerated() {
            switch character {
            case "-", "_":
                if index != 0 {
                    shouldUppercaseNextCharacter = true
                }
            default:
                let transformedCharactersToAppend: [Character] = shouldUppercaseNextCharacter
                    ? Array(character.uppercased())
                    : [character]
                
                transformedCharacters.append(contentsOf: transformedCharactersToAppend)
                
                shouldUppercaseNextCharacter = false
            }
        }
        
        return String(transformedCharacters)
    }
}
