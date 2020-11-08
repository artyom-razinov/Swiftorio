public struct SpeakerAlertParameter: Codable {
    // Boolean, whether an alert is shown.
    public let show_alert: Bool
    
    // Boolean, whether an alert icon is shown on the map.
    public let show_on_map: Bool
    
    // The icon that is displayed with the alert, #SignalID object.
    public let icon_signal_id: SignalId
    
    // String, message of the alert.
    public let alert_message: String
}
