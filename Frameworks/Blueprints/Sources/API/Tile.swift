public struct Tile: Codable {
    // Prototype name of the tile (e.g. "concrete")
    public let name: String
    
    // #Position object, position of the entity within the blueprint.
    public let position: Position
}
