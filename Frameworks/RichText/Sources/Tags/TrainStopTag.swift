public final class TrainStopTag: Tag {
    public let number: Int
    
    public init(
        number: Int)
    {
        self.number = number
    }
    
    // MARK: - Tag
    
    public var tagName: String {
        return "train-stop"
    }
    
    public var tagParameters: [String] {
        return [String(describing: number)]
    }
}
