// https://wiki.factorio.com/Types/Order
// When the game compares two prototypes (of the same type) if the order strings aren't
// equal they're lexicographically compared to determine if a given prototype is shown
// before or after another. If the order strings are equal then the game falls back to
// comparing the prototype names to determine order.
public protocol OrderComparator {
    func isOrderedBefore(
        lhsOrder: Order?,
        lhsName: String,
        rhsOrder: Order?,
        rhsName: String)
        -> Bool
}

extension OrderComparator {
    public func isOrderedBefore(
        lhs: PrototypeBase,
        rhs: PrototypeBase)
        -> Bool
    {
        return isOrderedBefore(
            lhsOrder: lhs.order,
            lhsName: lhs.name,
            rhsOrder: rhs.order,
            rhsName: rhs.name
        )
    }
}
