import SwiftorioLocalization

public protocol TypedTrainCargoEntityProvider {
    func typedTrainCargoEntities(locale: Locale) throws -> [TypedTrainCargoEntity]
}
