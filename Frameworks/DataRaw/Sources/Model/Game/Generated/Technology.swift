public final class Technology: Codable {
    public final class Unit: Codable {
        public enum Count {
            case countFormula(String)
            case count(Integer)
        }
        
        public let count: Count
        public let ingredients: [String: Int]
        public let time: Integer

        enum CodingKeys: String, CodingKey {
            case count
            case ingredients
            case time
            case countFormula = "count_formula"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            do {
                self.count = .count(try container.decode(Integer.self, forKey: .count))
            } catch {
                do {
                    self.count = .count(try Integer(try container.decode(String.self, forKey: .count)).unwrapOrThrow())
                } catch {
                    self.count = .countFormula(try container.decode(String.self, forKey: .countFormula))
                }
            }
            
            var ingredients: [String: Int] = [:]
            var ingredientsAsArray = try container.nestedUnkeyedContainer(forKey: .ingredients)
            
            // FIXME: trashy
            while var ingredientAsArray = try? ingredientsAsArray.nestedUnkeyedContainer() {
                let name = try ingredientAsArray.decode(String.self)
                let count = try ingredientAsArray.decode(Int.self)
                
                ingredients[name] = count
            }
            
            self.ingredients = ingredients
            
            self.time = try container.decode(key: .time)
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            switch count {
            case .count(let count):
                try container.encode(count, forKey: .count)
            case .countFormula(let countFormula):
                try container.encode(countFormula, forKey: .countFormula)
            }
            
            try container.encode(ingredients, forKey: .ingredients)
            try container.encode(time, forKey: .time)
        }
    }
    
    public let unit: Unit
    public let order: String?
    public let upgrade: Bool?
    public let prerequisites: Prerequisites?
    public let iconSize: Integer?
    public let icon: FileName
    
    enum CodingKeys: String, CodingKey {
        case unit
        case order
        case upgrade
        case prerequisites
        case iconSize = "icon_size"
        case icon
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.unit = try container.decode(key: .unit)
        self.order = try container.decode(key: .order)
        self.upgrade = try container.decode(key: .upgrade, default: false)
        self.prerequisites = try container.decode(key: .prerequisites, default: nil /* FIXME */)
        self.iconSize = try container.decode(key: .iconSize, default: 32)
        self.icon = try container.decode(key: .icon)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(unit, forKey: .unit)
        try container.encode(order, forKey: .order)
        try container.encode(upgrade, forKey: .upgrade)
        try container.encode(prerequisites, forKey: .prerequisites)
        try container.encode(iconSize, forKey: .iconSize)
        try container.encode(icon, forKey: .icon)
    }
}
