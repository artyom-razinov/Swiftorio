// Embeds only a small inline game graphic. The period format must be used in game save names. This tag uses sprite paths:
// class is any of: item, entity, technology, recipe, item-group, fluid, tile, virtual-signal, achievement, equipment or utility.
public final class ImgTag: Tag {
    public let `class`: ImgTagClass
    public let name: String
    public let separator: ImgTagSeparator
    
    public init(
        `class`: ImgTagClass,
        name: String,
        separator: ImgTagSeparator = .slash)
    {
        self.class = `class`
        self.name = name
        self.separator = separator
    }
    
    // MARK: - Tag
    
    public var tagName: String {
        return "img"
    }
    
    public var tagParameters: [String] {
        return ["\(`class`)\(separator.rawValue)\(name)"]
    }
}
