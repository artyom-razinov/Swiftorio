import SwiftorioBlueprints
import SwiftorioTrainStations
import SwiftorioDataRaw
import SwiftorioDi

withDi { di in
    let provider = try di.resolve() as TrainStationsBlueprintBookProvider
    
    let book = try provider.trainStationsBlueprintBook()
    
    let encoder = try di.resolve() as BlueprintToBlueprintStringEncoder
    
    print(try encoder.encodeToBlueprintString(blueprint: book))
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
