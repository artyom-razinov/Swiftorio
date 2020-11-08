public struct ScheduleRecord: Codable {
    // The name of the stop for this schedule record.
    public let station: String
    // Array of #Wait Condition objects.
    public let wait_conditions: [WaitCondition]
}
