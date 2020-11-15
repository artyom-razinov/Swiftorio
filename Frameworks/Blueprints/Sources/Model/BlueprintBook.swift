public final class BlueprintBook: Codable {
    // String, the name of the item that was saved ("blueprint-book" in vanilla)
    public let item: String
    
    // String, the name of the blueprint set by the user.
    public let label: String
    
    // NOTE: Was not in wiki.
    public let description: String?
    
    // The color of the label of this blueprint. Optional. #Color object.
    public let label_color: Color?
    
    // The actual content of the blueprint book, array of objects containing an "index" key and 0-based value and a "blueprint" key with a #Blueprint object as the value.
    public let blueprints: [IndexedBlueprintOrBook]
    
    // NOTE: Was not in wiki.
    public let icons: [Icon]?
    
    // Index of the currently selected blueprint, 0-based.
    public let active_index: Integer
    
    // The map version of the map the blueprint was created in, see Version string format.
    public let version: LongInteger
    
    public init(
        item: String,
        label: String,
        description: String?,
        label_color: Color?,
        blueprints: [IndexedBlueprintOrBook],
        icons: [Icon]?,
        active_index: Integer,
        version: LongInteger)
    {
        self.item = item
        self.label = label
        self.description = description
        self.label_color = label_color
        self.blueprints = blueprints
        self.icons = icons
        self.active_index = active_index
        self.version = version
    }
}
