import XCTest
import SwiftorioDi
import SwiftorioFoundation

open class BaseTestCase: XCTestCase {
    public func json(string: String) throws -> [String: Any] {
        let jsonObject = try JSONSerialization.jsonObject(
            with: string.data(using: .utf8).unwrapOrThrow()
        )
        
        let dictionaryOrNil = jsonObject as? [String: Any]
        
        return try dictionaryOrNil.unwrapOrThrow(
            message: "Json object is not a dictionary: \(jsonObject)"
        )
    }
}
