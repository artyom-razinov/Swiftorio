//public typealias DataRaw = Int // FIXME
public protocol DataRawProvider {
    func dataRaw() throws -> DataRaw
}
