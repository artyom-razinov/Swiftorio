public struct ConnectionData: Codable {
    // ID of the entity this connection is connected with.    Integer
    public let entity_id: Integer
    
    // The circuit connector id of the entity this connection is connected to, see defines.circuit_connector_id.
    // defines.circuit_connector_id: https://lua-api.factorio.com/latest/defines.html#defines.circuit_connector_id
    public let circuit_id: Integer
}
