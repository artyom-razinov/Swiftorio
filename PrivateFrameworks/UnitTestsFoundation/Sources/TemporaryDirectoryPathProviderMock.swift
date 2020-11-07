import SwiftorioFoundation

public final class TemporaryDirectoryPathProviderMock: TemporaryDirectoryPathProvider {
    private let temporaryDirectoryPathStub: String
    
    public init(temporaryDirectoryPath: String) {
        self.temporaryDirectoryPathStub = temporaryDirectoryPath
    }
    
    public func temporaryDirectoryPath() -> String {
        return temporaryDirectoryPathStub
    }
}
