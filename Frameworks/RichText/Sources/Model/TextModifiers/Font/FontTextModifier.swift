public final class FontTextModifier: TextModifier {
    public let fontName: String
    public let tagClosureType: TagClosureType
    
    public init(
        fontName: String,
        tagClosureType: TagClosureType = .slash)
    {
        self.fontName = fontName
        self.tagClosureType = tagClosureType
    }
    
    // MARK: - TextModifier
    
    public var textModifierName: String { "font" }
    public var textModifierParameters: [String] { [fontName] }
}
