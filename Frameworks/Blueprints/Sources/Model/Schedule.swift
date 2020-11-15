public final class Schedule: Codable {
    // Array of #Schedule Record objects.
    public let schedule: [ScheduleRecord]
    
    // Array of entity numbers of locomotives using this schedule.
    public let locomotives: [Int]
    
    public init(
        schedule: [ScheduleRecord],
        locomotives: [Int])
    {
        self.schedule = schedule
        self.locomotives = locomotives
    }
}
