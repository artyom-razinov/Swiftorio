public final class RichTextBuilderSugar {
    public init() {
    }
    
    public func color(
        _ color: ColorTextModifierColor,
        _ body: (RichTextBuilderSugar) -> [RichTextToken])
        -> [RichTextToken]
    {
        return [
            RichTextToken.modifiedText(
                ColorTextModifier(
                    color: color
                ),
                body(self)
            )
        ]
    }
    
    public func color(
        _ alias: ColorTextModifierColorAlias,
        _ body: (RichTextBuilderSugar) -> [RichTextToken])
        -> [RichTextToken]
    {
        return self.color(
            ColorTextModifierColor.alias(alias),
            body
        )
    }
    
    public func image(
        class: ImgTagClass,
        name: String)
        -> [RichTextToken]
    {
        return [
            RichTextToken.tag(
                ImgTag(class: `class`, name: name)
            )
        ]
    }
    
    public func image(
        _ imgTag: ImgTag)
        -> [RichTextToken]
    {
        return [
            RichTextToken.tag(imgTag)
        ]
    }
    
    public func text(
        _ string: String)
        -> [RichTextToken]
    {
        return [
            RichTextToken.text(string)
        ]
    }
}
