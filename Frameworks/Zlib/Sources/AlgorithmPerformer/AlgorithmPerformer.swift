public protocol AlgorithmPerformer {
    func perform(
        algorithm: Algorithm,
        data: Data)
        throws
        -> Data
}
