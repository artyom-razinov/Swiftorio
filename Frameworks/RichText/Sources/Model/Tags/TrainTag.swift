public final class TrainTag: Tag {
    public let number: Int
    
    public init(
        number: Int)
    {
        self.number = number
    }
    
    // MARK: - Tag
    
    public var tagName: String {
        return "train"
    }
    
    public var tagParameters: [String] {
        return [String(describing: number)]
    }
}
