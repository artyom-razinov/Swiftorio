import SwiftorioDi
import SwiftorioFoundation

public final class SwiftorioDataRawDependencyCollectionRegisterer: BaseNestingDependencyCollectionRegisterer {
    public override func nestedRegisterers() -> [DependencyCollectionRegisterer] {
        return [
            SwiftorioFoundationDependencyCollectionRegisterer()
        ]
    }
    
    public override func registerTopLevelDependencies(di: DependencyRegisterer) {
        di.register(type: OrderComparator.self) { _ in
            OrderComparatorImpl()
        }
        di.register(type: DataRawProvider.self) { di in
            DataRawProviderImpl(
                dataRawJsonStringProvider: try di.resolve()
            )
        }
        di.register(type: LoadingFromLuaDataRawJsonStringProvider.self) { di in
            LoadingFromLuaDataRawJsonStringProvider(
                stringFromBundleLoader: try di.resolve(),
                dataRawToJsonStringConverter: try di.resolve()
            )
        }
        di.register(type: StringToCamelCaseTransformer.self) { di in
            StringToCamelCaseTransformerImpl()
        }
        di.registerMultiple(type: CachingDataRawJsonStringProvider.self) { di in
            CachingDataRawJsonStringProvider(
                dataRawJsonStringProvider: try di.resolve() as LoadingFromLuaDataRawJsonStringProvider,
                temporaryDirectoryPathProvider: try di.resolve()
            )
        }.reregister { $0 as DataRawJsonStringProvider }
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
