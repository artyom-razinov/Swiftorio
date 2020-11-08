public struct RichText {
    var tokens: [RichTextToken]
}

public enum RichTextToken {
    case tag(Tag)
    case modifiedText(TextModifier, [RichTextToken])
    case text(String)
}
