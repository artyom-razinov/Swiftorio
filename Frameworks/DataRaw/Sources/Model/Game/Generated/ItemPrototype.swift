open class ItemPrototype: PrototypeBase, ItemOrFluidPrototype {
    public let icon: FileName?
    public let stackSize: Integer?
    public let icons: Icons?
    public let subgroup: ItemSubgroupName
    public let flags: [String]
    
    enum CodingKeys: String, CodingKey {
        case icon
        case stackSize = "stack_size"
        case icons
        case order
        case subgroup
        case flags
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.icon = try container.decode(key: .icon)
        self.stackSize = try container.decode(key: .stackSize, default: 1)
        self.icons = try container.decode(key: .icons, default: nil /* FIXME */)
        self.subgroup = try container.decode(key: .subgroup, default: .other)
        self.flags = try container.decode(key: .flags, default: [])
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(icon, forKey: .icon)
        try container.encode(stackSize, forKey: .stackSize)
        try container.encode(icons, forKey: .icons)
        try container.encode(subgroup, forKey: .subgroup)
        
        if !flags.isEmpty {
            try container.encode(flags, forKey: .flags)
        }
    }
}
