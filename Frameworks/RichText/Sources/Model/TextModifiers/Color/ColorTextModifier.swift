public struct ColorTextModifier: TextModifier {
    public let color: ColorTextModifierColor
    public let tagClosureType: TagClosureType
    
    public init(
        color: ColorTextModifierColor,
        tagClosureType: TagClosureType = .slash)
    {
        self.color = color
        self.tagClosureType = tagClosureType
    }
    
    // MARK: - TextModifier
    
    public var textModifierName: String { "color" }
    
    public var textModifierParameters: [String] {
        switch color {
        case let .alias(value):
            return [value.rawValue]
        case let .floatRgb(r, g, b):
            return [r, g, b].map { String(describing: $0) }
        case let .intRgb(r, g, b):
            return [r, g, b].map { String(describing: $0) }
        case let .hexRgb(r, g, b):
            return [String(format:"#%02x%02x%02x", r, g, b)]
        case let .hexArgb(a, r, g, b):
            return [String(format:"#%02x%02x%02x%02x", a, r, g, b)]
        }
    }
}
