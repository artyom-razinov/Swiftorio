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
        self.icon = try container.decodeIfPresent(FileName.self, forKey: .icon)
        self.stackSize = try container.decodeIfPresent(Integer.self, forKey: .stackSize) ?? 1
        self.icons = try container.decodeIfPresent(Icons.self, forKey: .icons) ?? nil /* FIXME */
        self.order = try container.decodeIfPresent(String.self, forKey: .order)
        self.subgroup = try container.decodeIfPresent(String.self, forKey: .subgroup) ?? "other"
        self.localisedName = try container.decodeIfPresent(LocalisedString.self, forKey: .localisedName)
        self.flags = try container.decodeIfPresent([String].self, forKey: .flags) ?? []
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