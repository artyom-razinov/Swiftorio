// Embeds a blueprint. Players can get a blueprint item by clicking the icon.
// blueprint_string is the blueprint string of a blueprint, deconstruction planner or upgrade planners
public final class SpecialItemTag: Tag {
    public let blueprintString: String
    
    public init(
        blueprintString: String)
    {
        self.blueprintString = blueprintString
    }
    
    // MARK: - Tag
    
    public var tagName: String {
        return "special-item"
    }
    
    public var tagParameters: [String] {
        return [blueprintString]
    }
}
