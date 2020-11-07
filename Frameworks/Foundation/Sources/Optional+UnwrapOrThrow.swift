extension Optional {
    public func unwrapOrThrow(
        error: (_ file: StaticString, _ line: UInt) -> Error,
        file: StaticString = #file,
        line: UInt = #line)
        throws
        -> Wrapped
    {
        return try unwrapOrThrow(error: error(file, line))
    }
    
    public func unwrapOrThrow(
        message: (_ file: StaticString, _ line: UInt) -> String,
        file: StaticString = #file,
        line: UInt = #line)
        throws
        -> Wrapped
    {
        return try unwrapOrThrow(
            error: { ErrorString(Self.unwrapOrThrowDefaultMessage(file: $0, line: $1)) },
            file: file,
            line: line
        )
    }
    
    public func unwrapOrThrow(
        message: @autoclosure () -> String)
        throws
        -> Wrapped
    {
        return try unwrapOrThrow(
            error: { ErrorString(message()) }()
        )
    }
    
    public func unwrapOrThrow(
        error: @autoclosure () -> Error)
        throws
        -> Wrapped
    {
        if let unwrapped = self {
            return unwrapped
        } else {
            throw error()
        }
    }
    
    public func unwrapOrThrow(
        file: StaticString = #file,
        line: UInt = #line)
        throws
        -> Wrapped
    {
        return try unwrapOrThrow(
            error: Self.unwrapOrThrowDefaultFunction,
            file: file,
            line: line
        )
    }
    
    private static func unwrapOrThrowDefaultFunction(
        file: StaticString,
        line: UInt)
        -> Error
    {
        return ErrorString(
            unwrapOrThrowDefaultMessage(
                file: file,
                line: line
            )
        )
    }
    
    private static func unwrapOrThrowDefaultMessage(
        file: StaticString,
        line: UInt)
        -> String
    {
        return "Found nil when unwrapping optional at \(file):\(line)"
    }
}
