import XCTest
import SwiftorioBlueprints

final class BlueprintFromBlueprintStringDecoderImplTests: TestCase {
    private var decoder: BlueprintFromBlueprintStringDecoder {
        di.resolve()
    }
    
    private var encoder: BlueprintToBlueprintStringEncoder {
        di.resolve()
    }
    
    func test() {
        // https://factorioprints.com/view/-Kl-a5-7hM9UdJQEYzjU
        let blueprintString = "0eNrllkFvgyAYhv9Kw1kXsK22HnfuaddlabD91pEpGMCmTeN/H2gbzUqnctmSnQwf8vDy+vHGC8ryCkrJuN5mQnyi9NJVFEpfe0M7x3aCt2XFDpzmtqbPJaAUMQ0FChCnhR3BqZSgVKgl5aoUUocZ5BrVAWJ8DyeUkjoYDVFlzrQG2Vse1W8BAq6ZZtAKagbnLa+KzLyZkiEpASqFMssFt/sbZGiWnM0jMrvsmYRdOxdZod/g0WQ4vrEdtPkdrTKHlAcpzPNnsdhovVonKl1W1uE7/uKxofdc/LRspRKX1KWHVDxeaTzZ186G3ieLHejE32TSSWf8gfLVBI9vFjubYe3ZWmTYAoI97TWtYG5bczfTXh4EKKdmmamR2YZymD3TnPIdyHAD73b6CFI1rGSOyTqOyDyJuyuMrcR/ky7ucIl/IVxG5iAejsGFR9P/kVwZxk8I2MTXY6cXK5+4HpklY489JvI84sQZVdHEcHlhh4/hdCEuatj84/TRuUVnV7QyU9SoOsL2llEPtqm/ACpbH24="
    
        assertDoesntThrow {
            let blueprintOrBook = try decoder.decodeFromBlueprintString(string: blueprintString)
            
            checkBook(blueprintOrBook: blueprintOrBook)
            
            let encodedAndDecodedBook = try decoder.decodeFromBlueprintString(
                string: try encoder.encodeToBlueprintString(blueprint: blueprintOrBook)
            )
            
            checkBook(blueprintOrBook: encodedAndDecodedBook)
        }
    }
    
    func checkBook(blueprintOrBook: BlueprintOrBook) {
        switch blueprintOrBook {
        case .blueprint:
            XCTFail("Expected to decode book, got blueprint")
        case let .book(book):
            XCTAssertEqual(
                book.label,
                "1 lane balancers"
            )
        }
    }
}
