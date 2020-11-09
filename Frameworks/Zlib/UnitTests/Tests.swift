import XCTest
import SwiftorioZlib
import SwiftorioUnitTestsFoundation

final class Tests: TestCase {
    func test() {
        assertDoesntThrow {
            let string = "🻓🳵🈔🫊🋢🂴🕶🦐🯵🉞🬐🁘🢫🐿😃🶈🷏🔟🤴🲇🔈🩁🙤🙸🲬🏺🧽🣒🞨🝽🬍📓🆑🡘🺩🈘🹞👤🢤🤂🩡🍹🄮🮳🰓🬒🡢🦦🱿🢟🌟🺦🷽🷹🮚🂏💉🝶🸡🀶🔓🟙🺔🪯🎑🃼🁱🜨🝬🢮🚫🛫🠗🏟🉒🬉🊃🲯🆖🹃🟱😼🮚🨡🮨📋🀣🷺🆌🆐🭈🰽🋰🫔😯🲚🞴🀶🅧🈟🢔🗯💭🪬🛤🟭🻶🻿🯾🖙🋒👕🗗🰖🠖🟍💄🵌🐝🫙🻁🤅🸌🉹🶭🈍🤰🕗🹓🯋🪬🌕🛞🨔🇺🅮🊥😈💇🣶🪌🪤🮚🔽🭌🭣📚🅟🇨🝖💦🭏🵏🯝🍐🴐🨾🏪🖗🬓🕙🳖🔎🎙🎞🙅🹫🆊🄸🛯🡰🕎🖪🯔🀩🙩🌫📀🧮🛃🏈🸵🜽🞙💏🗶🔶🃘🩝🀞🙇🴃🻩🰃🉥🞛👊🍆🅾🋍🵻🌌🮀🱔🂰📅🪏📝🆷🚵🖊🍰🎥🀢🃾🄠🏙🟗👤📙😩🻔🶅🂀🟡🹾🻇🠜🭣🚧🻭🕫🦡🇦🫧🲓🳣🹚🝌🔮🯛🩤😰🜵💔🝝📋🣊🏈🍄🡳🺩🖙🙀🠠🂖🥛🥬🡐🕿🺂🗵📅👕🂲🐢😗😅🅃🰢🳧🵹🧥🎓🛽🙧🚓🳎🩙🴈🣍🟂🌖🶸🂡💶🵯🗗👃🨲🣠🢰🆡🃀🃺🫔🥭🫖🴉🰴"
            
            let dataBefore = try string.data(using: .utf8).unwrapOrThrow()
            
            let algorithmPerformer: AlgorithmPerformer = di.resolve()
            
            for level in -1...9 {
                let compressed = try algorithmPerformer.perform(
                    algorithm: DeflateAlgorithm(level: try DeflateCompressionLevel(level)),
                    data: dataBefore
                )
                
                let dataAfter = try algorithmPerformer.perform(
                    algorithm: InflateAlgorithm(),
                    data: compressed
                )
                
                XCTAssertEqual(dataBefore, dataAfter)
            }
        }
    }
}
