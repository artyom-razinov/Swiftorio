import SwiftorioBlueprints
import SwiftorioDataRaw
import SwiftorioDi

withDi { di in
    try FindTopLevel(dataRawJsonStringProvider: try di.resolve()).find()
}

//
//do {
//    let dataRawProvider = try di.resolve() as DataRawProvider
//
//    let dataRaw = try dataRawProvider.dataRaw()
//
//    for (name, item) in dataRaw.ammo {
//        print(name)
//    }
//} catch {
//    print("\(error)")
//    exit(1)
//}
