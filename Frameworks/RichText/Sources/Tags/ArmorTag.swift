public final class ArmorTag: Tag {
    public let player: String
    
    public init(
        player: String)
    {
        self.player = player
    }
    
    // MARK: - Tag
    
    public var tagName: String {
        return "armor"
    }
    
    public var tagParameters: [String] {
        return [player]
    }
}
