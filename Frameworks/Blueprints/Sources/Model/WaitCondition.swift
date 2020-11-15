public final class WaitCondition: Codable {
    // One of "time", "inactivity", "full", "empty", "item_count", "circuit", "robots_inactive", "fluid_count", "passenger_present", "passenger_not_present".
    public let type: WaitConditionType
    
    // Either "and", or "or". Tells how this condition is to be compared with the preceding conditions in the corresponding wait_conditions array.
    public let compare_type: WaitConditionCompareType
    
    // Number of ticks to wait or of inactivity. Only present when type is "time" or "inactivity". Optional.
    public let ticks: UInt?
    
    // CircuitCondition Object, only present when type is "item_count", "circuit" or "fluid_count".
    public let condition: CircuitCondition?
    
    public init(
        type: WaitConditionType,
        compare_type: WaitConditionCompareType,
        ticks: UInt?,
        condition: CircuitCondition?)
    {
        self.type = type
        self.compare_type = compare_type
        self.ticks = ticks
        self.condition = condition
    }
}
