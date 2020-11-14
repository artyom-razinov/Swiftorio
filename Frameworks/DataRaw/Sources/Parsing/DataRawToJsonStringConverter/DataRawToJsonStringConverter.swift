public protocol DataRawToJsonStringConverter {
    func toJsonString(dataRaw: String) throws -> String
}
