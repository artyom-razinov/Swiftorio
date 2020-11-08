import SwiftorioDi
import SwiftorioFoundation

public final class SwiftorioDataRawDependencyCollectionRegisterer: DependencyCollectionRegisterer {
    public init() {
    }
    
    public func register(dependencyRegisterer di: DependencyRegisterer) {
        // TODO: Move to `SwiftorioFoundation`
        di.register(type: TemporaryDirectoryPathProvider.self) { _ in
            NsTemporaryDirectoryPathProvider()
        }
        
        di.register(type: DataRawProvider.self) { di in
            DataRawProviderImpl(
                dataRawJsonStringProvider: try di.resolve()
            )
        }
        di.register(type: DataRawJsonStringProvider.self) { di in
            CachingDataRawJsonStringProvider(
                dataRawJsonStringProvider: LoadingFromLuaDataRawJsonStringProvider(
                    stringFromBundleLoader: try di.resolve(),
                    dataRawToJsonStringConverter: try di.resolve()
                ),
                temporaryDirectoryPathProvider: try di.resolve()
            )
        }
        di.register(type: StringFromBundleLoader.self) { di in
            StringFromBundleLoaderImpl()
        }
        di.register(type: DataRawToJsonStringConverter.self) { di in
            DataRawToJsonStringConverterImpl(
                stringFromBundleLoader: try di.resolve()
            )
        }
    }
}
