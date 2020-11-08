import SwiftorioDataRaw

public enum TypedTrainCargoEntity {
    case fluid(FluidTrainCargoEntity)
    case item(ItemTrainCargoEntity)
}
