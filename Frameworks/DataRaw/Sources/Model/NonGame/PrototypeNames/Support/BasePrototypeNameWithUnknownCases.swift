import SwiftorioFoundation

public class BasePrototypeNameWithUnknownCases: PrototypeName, CaseIterable {
    public static var allCases: [BasePrototypeNameWithUnknownCases] { [] }
    public var stringValue: String
    public var intValue: Int? {
        nil
    }
    public var rawValue: String { stringValue }
    
    public required init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public required init?(intValue: Int) {
        return nil
    }
    
    public func hash(into hasher: inout Hasher) {
    }
    
    public static func ==(lhs: BasePrototypeNameWithUnknownCases, rhs: BasePrototypeNameWithUnknownCases) -> Bool {
        return lhs.stringValue == rhs.stringValue
    }
    
    required public init(from decoder: Decoder) throws {
        throw ErrorString("BasePrototypeNameWithUnknownCases doesn't support decoding")
    }
    
    public func encode(to encoder: Encoder) throws {
        throw ErrorString("BasePrototypeNameWithUnknownCases doesn't support encoding")
    }
}
