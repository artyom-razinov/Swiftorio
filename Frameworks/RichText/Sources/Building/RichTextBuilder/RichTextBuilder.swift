public protocol RichTextBuilder {
    func buildString(
        richText: RichText)
        -> String
}

extension RichTextBuilder {
    public func buildRichText(
        body: (RichTextBuilderSugar) -> [RichTextToken])
        -> RichText
    {
        return RichText(tokens: body(RichTextBuilderSugar()))
    }
    
    public func buildString(
        body: (RichTextBuilderSugar) -> [RichTextToken])
        -> String
    {
        return buildString(
            richText: buildRichText(
                body: body
            )
        )
    }
}
