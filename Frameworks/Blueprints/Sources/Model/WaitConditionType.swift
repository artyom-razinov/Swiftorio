public enum WaitConditionType: String, Codable {
    case time
    case inactivity
    case full
    case empty
    case item_count
    case circuit
    case robots_inactive
    case fluid_count
    case passenger_present
    case passenger_not_present
}
