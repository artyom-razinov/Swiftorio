import SwiftorioBlueprints
import SwiftorioTrainStations
import SwiftorioDataRaw
import SwiftorioDi

withDi { di in
    let provider = try di.resolve() as TrainStationsBlueprintBookProvider
    
    let book = try provider.trainStationsBlueprintBook()
    
    if false {
        let encoder = try di.resolve() as BlueprintToBlueprintStringEncoder
        
        print(try encoder.encodeToBlueprintString(blueprint: book))
    } else {
        let encoder = try di.resolve() as BlueprintToJsonStringEncoder
        
        print(try encoder.encodeToJsonString(blueprint: book))
    }
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
