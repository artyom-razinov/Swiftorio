import PathKit

public protocol GameBundlePathProvider {
    func gameBundlePath() throws -> Path
}
