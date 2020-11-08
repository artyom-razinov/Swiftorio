public final class FontTextModifier: TextModifier {
    public let fontName: String
    public let textModifierClosureType: TextModifierClosureType
    
    public init(
        fontName: String,
        textModifierClosureType: TextModifierClosureType = .slash)
    {
        self.fontName = fontName
        self.textModifierClosureType = textModifierClosureType
    }
    
    // MARK: - TextModifier
    
    public var textModifierName: String { "font" }
    public var textModifierParameters: [String] { [fontName] }
}
