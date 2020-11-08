public func +(lhs: String, rhs: RichTextToken) -> [RichTextToken] {
    return [RichTextToken.text(lhs), rhs]
}
public func +(lhs: RichTextToken, rhs: String) -> [RichTextToken] {
    return [lhs, RichTextToken.text(rhs)]
}
public func +(lhs: String, rhs: [RichTextToken]) -> [RichTextToken] {
    return [RichTextToken.text(lhs)] + rhs
}
public func +(lhs: [RichTextToken], rhs: String) -> [RichTextToken] {
    return lhs + [RichTextToken.text(rhs)]
}
public func +(lhs: Character, rhs: RichTextToken) -> [RichTextToken] {
    return [RichTextToken.text(String(lhs)), rhs]
}
public func +(lhs: RichTextToken, rhs: Character) -> [RichTextToken] {
    return [lhs, RichTextToken.text(String(rhs))]
}
public func +(lhs: Character, rhs: [RichTextToken]) -> [RichTextToken] {
    return [RichTextToken.text(String(lhs))] + rhs
}
public func +(lhs: [RichTextToken], rhs: Character) -> [RichTextToken] {
    return lhs + [RichTextToken.text(String(rhs))]
}
public func +(lhs: RichTextToken, rhs: [RichTextToken]) -> [RichTextToken] {
    return [lhs] + rhs
}
public func +(lhs: [RichTextToken], rhs: RichTextToken) -> [RichTextToken] {
    return lhs + [rhs]
}
