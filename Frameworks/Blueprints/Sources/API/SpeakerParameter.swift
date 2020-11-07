public struct SpeakerParameter: Codable {
    // Types/double. Volume of the speaker.
    public let playback_volume: Floating
    
    // Boolean, whether global playback is enabled.
    public let playback_globally: Bool
    
    // Boolean, whether polyphony is allowed.
    public let allow_polyphony: Bool
}
