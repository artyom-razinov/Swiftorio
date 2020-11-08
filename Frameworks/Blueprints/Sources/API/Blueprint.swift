public final class Blueprint: Codable {
    // String, the name of the item that was saved ("blueprint" in vanilla).
    public let item: String
    
    // String, the name of the blueprint set by the user.
    public let label: String?
    
    // Is not present in docs
    public let description: String?
    
    // The color of the label of this blueprint. Optional. #Color object.
    public let label_color: Color?
    
    // The actual content of the blueprint, array of #Entity objects.
    public let entities: [Entity]
    
    // The tiles included in the blueprint, array of #Tile objects.
    public let tiles: [Tile]?
    
    // The icons of the blueprint set by the user, array of #Icon objects.
    public let icons: [Icon]?
    
    // The schedules for trains in this blueprint, array of #Schedule objects.
    public let schedules: [Schedule]?
    
    // The map version of the map the blueprint was created in.
    public let version: LongInteger
    
    public init(
        item: String,
        label: String?,
        description: String?,
        label_color: Color?,
        entities: [Entity],
        tiles: [Tile]?,
        icons: [Icon]?,
        schedules: [Schedule]?,
        version: LongInteger)
    {
        self.item = item
        self.label = label
        self.description = description
        self.label_color = label_color
        self.entities = entities
        self.tiles = tiles
        self.icons = icons
        self.schedules = schedules
        self.version = version
    }
}
