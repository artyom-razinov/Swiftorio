import SwiftorioDataRaw
import SwiftorioLocalization

public protocol TrainCargoEntity {
    var id: String { get }
    var entityType: TrainCargoEntityType { get }
    var itemOrFluidPrototype: ItemOrFluidPrototype { get }
    var isHidden: Bool { get }
    
    func localizedName(locale: Locale) throws -> String
}
