import SwiftorioDataRaw
import SwiftorioUnitTestsFoundation
import XCTest

class StringToCamelCaseTransformerImplTests: TestCase {
    private let transformer = StringToCamelCaseTransformerImpl()
    
    func disabled_test() {
        check(
            "1",
            "_1"
        )
        check(
            "default",
            "`default`"
        )
        check(
            "var",
            "`var`"
        )
    }
    
    func test() {
        check(
            "_a",
            "a"
        )
        check(
            "map-settings",
            "mapSettings"
        )
        check(
            "a-b",
            "aB"
        )
        check(
            "a-b-c",
            "aBC"
        )
        check(
            "a-b_c",
            "aBC"
        )
        check(
            "abC",
            "abC"
        )
        check(
            "AbC",
            "AbC"
        )
        check(
            "aBc",
            "aBc"
        )
    }
    
    func check(_ before: String, _ after: String) {
        XCTAssertEqual(
            transformer.transformToCamelCase(string: before),
            after
        )
    }
}
