import SwiftorioLocalization

public protocol TrainCargoCategoriesProvider {
    func trainCargoCategories(locale: Locale) throws -> [TrainCargoCategory]
}
