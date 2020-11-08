public final class RichText {
    public let tokens: [RichTextToken]
    
    public init(tokens: [RichTextToken]) {
        self.tokens = tokens
    }
}

public enum RichTextToken {
    case tag(Tag)
    case modifiedText(TextModifier, [RichTextToken])
    case text(String)
}
