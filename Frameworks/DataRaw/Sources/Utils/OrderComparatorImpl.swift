public final class OrderComparatorImpl: OrderComparator {
    public init() {
    }
    
    public func isOrderedBefore(
        lhsOrder: Order?,
        lhsName: String,
        rhsOrder: Order?,
        rhsName: String)
        -> Bool
    {
        // I am not sure about mixed some/none cases.
        switch (lhsOrder, rhsOrder) {
        case let (.some(lhsOrder), .some(rhsOrder)):
            return lhsOrder < rhsOrder
        case (.none, .some):
            return true
        case (.some, .none):
            return false
        case (.none, .none):
            return lhsName < rhsName
        }
    }
}
