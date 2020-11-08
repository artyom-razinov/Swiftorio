// Embeds a map location and marks the location on the map of other players.
// x is the x point coordinate
// y is the y point coordinate
// surface is the current surface. Is only added if the player Ctrl+alt clicks on a surface that is not the default surface. When the player is on another surface than surface, clicking the tag does nothing. Mods must handle this case with on_player_clicked_gps_tag
public final class GpsTag {
    public let x: Int
    public let y: Int
    public let surface: String? // I have no idea what its format is
    
    public init(
        x: Int,
        y: Int,
        surface: String? = nil)
    {
        self.x = x
        self.y = y
        self.surface = surface
    }
    
    // MARK: - Tag
    
    public var tagName: String {
        return "gps"
    }
    
    public var tagParameters: [String] {
        return [String(describing: x), String(describing: y)] + (surface.map { [$0] } ?? [])
    }
}
