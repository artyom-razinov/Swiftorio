public final class RichTextBuilderImpl: RichTextBuilder {
    public init() {
    }
    
    public func buildString(
        richText: RichText)
        -> String
    {
        return string(
            tokens: richText.tokens
        )
    }
        
    private func string(token: RichTextToken) -> String {
        switch token {
        case let .modifiedText(textModifier, tokens):
            return string(
                textModifier: textModifier,
                content: string(
                    tokens: tokens
                )
            )
        case let .tag(tag):
            return string(
                tag: tag
            )
        case let .text(string):
            return string
        }
    }
    
    private func string(tag: Tag) -> String {
        return tagOpening(
            name: tag.tagName,
            parameters: tag.tagParameters
        )
    }
    
    private func string(textModifier: TextModifier, content: String) -> String {
        let opening = tagOpening(
            name: textModifier.textModifierName,
            parameters: textModifier.textModifierParameters
        )
        
        let closure = tagClosure(
            name: textModifier.textModifierName,
            tagClosureType: textModifier.tagClosureType
        )
        
        return "\(opening)\(content)\(closure)"
    }
    
    private func tagOpening(name: String, parameters: [String]) -> String {
        let parametersClause: String
        
        if parameters.isEmpty {
            parametersClause = ""
        } else {
            let parametersJoined = parameters.joined(separator: ",")
            parametersClause = "=\(parametersJoined)"
        }
        
        return "[\(name)\(parametersClause)]"
    }
    
    private func tagClosure(name: String, tagClosureType: TagClosureType) -> String {
        return "[\(tagClosureType.rawValue)\(name)]"
    }
    
    private func string(tokens: [RichTextToken]) -> String {
        return tokens.map(string).joined()
    }
}
