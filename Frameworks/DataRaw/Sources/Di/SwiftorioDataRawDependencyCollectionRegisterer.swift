import SwiftorioDi

public final class SwiftorioDataRawDependencyCollectionRegisterer: DependencyCollectionRegisterer {
    public init() {
    }
    
    public func register(dependencyRegisterer di: DependencyRegisterer) {
        di.register(type: DataRawJsonStringProvider.self) { di in
            CachingDataRawJsonStringProvider(
                dataRawJsonStringProvider: LoadingFromLuaDataRawJsonStringProvider(
                    stringFromBundleLoader: try di.resolve(),
                    dataRawToJsonStringConverter: try di.resolve()
                )
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
