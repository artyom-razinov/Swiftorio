import SwiftorioDataRaw

public protocol TrainCargoEntity {
    var id: String { get }
    var localizedName: String { get }
    var entityType: TrainCargoEntityType { get }
    var itemOrFluid: ItemOrFluid { get }
}
