open class Item: Codable, ItemOrFluid {
    public let icon: FileName?
    public let stackSize: Integer?
    public let icons: Icons?
    public let order: String?
    public let subgroup: ItemSubgroupName
    public let localisedName: LocalisedString?
    public let flags: [String]
    
    enum CodingKeys: String, CodingKey {
        case icon
        case stackSize = "stack_size"
        case icons
        case order
        case subgroup
        case localisedName = "localised_name"
        case flags
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.icon = try container.decode(key: .icon)
        self.stackSize = try container.decode(key: .stackSize, default: 1)
        self.icons = try container.decode(key: .icons, default: nil /* FIXME */)
        self.order = try container.decode(key: .order)
        self.subgroup = try container.decode(key: .subgroup, default: .other)
        self.localisedName = try container.decode(key: .localisedName)
        self.flags = try container.decode(key: .flags, default: [])
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(icon, forKey: .icon)
        try container.encode(stackSize, forKey: .stackSize)
        try container.encode(icons, forKey: .icons)
        try container.encode(order, forKey: .order)
        try container.encode(subgroup, forKey: .subgroup)
        
        if !flags.isEmpty {
            try container.encode(flags, forKey: .flags)
        }
    }
}
