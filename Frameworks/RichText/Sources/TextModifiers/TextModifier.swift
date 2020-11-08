public protocol TextModifier {
    var textModifierName: String { get }
    var textModifierParameters: [String] { get }
    var textModifierClosureType: TextModifierClosureType { get }
}
