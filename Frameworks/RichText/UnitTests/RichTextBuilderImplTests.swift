import XCTest
import SwiftorioRichText

final class RichTextBuilderImplTests: TestCase {
    var builder: RichTextBuilder {
        di.resolve()
    }
    
    func test___can_build_plain_text() {
        XCTAssertEqual(
            builder.buildString {
                $0.text("text")
            },
            "text"
        )
    }
    
    func test___can_build_colors() {
        XCTAssertEqual(
            builder.buildString {
                $0.color(.blue) {
                    $0.text("text")
                }
            },
            "[color=blue]text[/color]"
        )
    }
    
    func test___can_build_tags() {
        XCTAssertEqual(
            builder.buildString {
                $0.image(ImgTag(class: .item, name: "iron-ore"))
            },
            "[img=item/iron-ore]"
        )
    }
    
    func test___supports_complex_structure() {
        XCTAssertEqual(
            builder.buildString {
                $0.image(class: .item, name: "iron-ore")
                    + " "
                    + $0.color(.red) {
                        $0.text("Iron ore")
                    }
            },
            "[img=item/iron-ore] [color=red]Iron ore[/color]"
        )
    }
}
