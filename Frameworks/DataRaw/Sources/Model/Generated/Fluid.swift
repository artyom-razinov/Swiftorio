public final class Fluid: Codable {
    public let icon: FileName
    public let maxTemperature: Float
    public let pressureToSpeedRatio: Float
    public let flowToEnergyRatio: Float
    public let subgroup: ItemSubgroup?
    public let order: String?
    public let defaultTemperature: Float
    
    enum CodingKeys: String, CodingKey {
        case icon
        case maxTemperature = "max_temperature"
        case pressureToSpeedRatio = "pressure_to_speed_ratio"
        case flowToEnergyRatio = "flow_to_energy_ratio"
        case subgroup
        case order
        case defaultTemperature = "default_temperature"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icon = try container.decode(FileName.self, forKey: .icon)
        self.maxTemperature = try container.decode(Float.self, forKey: .maxTemperature)
        self.pressureToSpeedRatio = try container.decode(Float.self, forKey: .pressureToSpeedRatio)
        self.flowToEnergyRatio = try container.decode(Float.self, forKey: .flowToEnergyRatio)
        self.subgroup = try container.decodeIfPresent(ItemSubgroup.self, forKey: .subgroup) /* FIXME: ?? fluid */
        self.order = try container.decode(String.self, forKey: .order)
        self.defaultTemperature = try container.decode(Float.self, forKey: .defaultTemperature)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(icon, forKey: .icon)
        try container.encode(maxTemperature, forKey: .maxTemperature)
        try container.encode(pressureToSpeedRatio, forKey: .pressureToSpeedRatio)
        try container.encode(flowToEnergyRatio, forKey: .flowToEnergyRatio)
        try container.encode(subgroup, forKey: .subgroup)
        try container.encode(order, forKey: .order)
        try container.encode(defaultTemperature, forKey: .defaultTemperature)
    }
}
