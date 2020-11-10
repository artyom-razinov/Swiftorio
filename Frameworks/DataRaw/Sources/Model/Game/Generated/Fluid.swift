public final class Fluid: Codable, ItemOrFluid {
    public let icon: FileName
    public let subgroup: ItemSubgroupName
    public let defaultTemperature: Float
    public let pressureToSpeedRatio: Float?
    public let flowToEnergyRatio: Float?
    public let order: String?
    public let maxTemperature: Float
    public let hidden: Bool
    
    enum CodingKeys: String, CodingKey {
        case icon
        case subgroup
        case defaultTemperature = "default_temperature"
        case pressureToSpeedRatio = "pressure_to_speed_ratio"
        case flowToEnergyRatio = "flow_to_energy_ratio"
        case order
        case maxTemperature = "max_temperature"
        case hidden
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icon = try container.decode(FileName.self, forKey: .icon)
        self.subgroup = try container.decode(key: .subgroup, default: .fluid)
        self.defaultTemperature = try container.decode(Float.self, forKey: .defaultTemperature)
        self.pressureToSpeedRatio = try container.decodeIfPresent(Float.self, forKey: .pressureToSpeedRatio)
        self.flowToEnergyRatio = try container.decodeIfPresent(Float.self, forKey: .flowToEnergyRatio)
        self.order = try container.decodeIfPresent(String.self, forKey: .order)
        self.maxTemperature = try container.decode(Float.self, forKey: .maxTemperature)
        self.hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden) ?? false
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(icon, forKey: .icon)
        try container.encode(subgroup, forKey: .subgroup)
        try container.encode(defaultTemperature, forKey: .defaultTemperature)
        try container.encode(pressureToSpeedRatio, forKey: .pressureToSpeedRatio)
        try container.encode(flowToEnergyRatio, forKey: .flowToEnergyRatio)
        try container.encode(order, forKey: .order)
        try container.encode(maxTemperature, forKey: .maxTemperature)
        
        if hidden {
            try container.encode(hidden, forKey: .hidden)
        }
    }
}
