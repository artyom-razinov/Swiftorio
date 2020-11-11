public struct ValueWithId<T> {
    public let id: String
    public let value: T
    
    public static func valuesWithId(dictionary: [String: T]) -> [ValueWithId<T>] {
        return dictionary.map { key, value in
            ValueWithId(id: key, value: value)
        }
    }
}
