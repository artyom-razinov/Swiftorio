public final class Entity: Codable {
    // Index of the entity, 1-based.
    public let entity_number: Integer
    
    // Prototype name of the entity (e.g. "offshore-pump").
    public let name: String
    
    // #Position object, position of the entity within the blueprint.
    public let position: Position
    
    // Direction of the entity, uint (optional).
    public let direction: UInt?
    
    // Orientation of cargo wagon or locomotive, value 0 to 1 (optional).    Floating
    public let orientation: Floating?
    
    // Circuit connection, object with keys starting from 1, values are #Connection objects (optional).
    public let connections: Connection?
    
    // (no comment was in docs)
    public let control_behaviour: ControlBehaviour?
    
    // Item requests by this entity, this is what defines the item-request-proxy when the blueprint is placed, optional. #Item request object
    public let items: ItemRequest?
    
    // Name of the recipe prototype this assembling machine is set to, optional, string.
    public let recipe: String?
    
    // Used by Prototype/Container, optional. The index of the first inaccessible item slot due to limiting with the red "bar". 0-based Types/ItemStackIndex.
    public let bar: ItemStackIndex?
    
    // Cargo wagon inventory configuration, optional. #Inventory object
    public let inventory: Inventory?
    
    // Used by Prototype/InfinityContainer, optional. #Infinity settings object
    public let infinity_settings: InfinitySettings?
    
    // Type of the underground belt or loader, optional. Either "input" or "output".
    public let type: UndergroundBeltType?
    
    // Input priority of the splitter, optional. Either "right" or "left", "none" is omitted.
    public let input_priority: SplitterPriority?
    
    // Output priority of the splitter, optional. Either "right" or "left", "none" is omitted.
    public let output_priority: SplitterPriority?
    
    // Filter of the splitter, optional. Name of the item prototype the filter is set to, string.
    public let filter: String?
    
    // Filters of the filter inserter or loader, optional. Array of #Item filter objects.
    public let filters: [ItemFilter]?
    
    // Filter mode of the filter inserter, optional. Either "whitelist" or "blacklist".
    public let filter_mode: FilterMode?
    
    // The stack size the inserter is set to, optional. Types/uint8.
    public let override_stack_size: UInt8?
    
    // The drop position the inserter is set to, optional. #Position object.
    public let drop_position: Position?
    
    // The pickup position the inserter is set to, optional. #Position object.
    public let pickup_position: Position?
    
    // Used by Prototype/LogisticContainer, optional. #Logistic filter object.
    public let request_filters: LogisticFilter?
    
    // Boolean. Whether this requester chest can request from buffer chests.
    public let request_from_buffers: Bool?
    
    // Used by Programmable speaker, optional. #Speaker parameter object.
    public let parameters: SpeakerParameter?
    
    // Used by Programmable speaker, optional. #Speaker alert parameter object
    public let alert_parameters: SpeakerAlertParameter?
    
    // Used by the rocket silo, optional. Boolean, whether auto launch is enabled.
    public let auto_launch: Bool?
    
    // Used by Prototype/SimpleEntityWithForce or Prototype/SimpleEntityWithOwner, optional. Types/GraphicsVariation
    public let variation: GraphicsVariation?
    
    // Color of the Prototype/SimpleEntityWithForce, Prototype/SimpleEntityWithOwner, or train station, optional. #Color object.
    public let color: Color?
    
    // The name of the train station, optional.
    public let station: String?
    
    public init(
        entity_number: Integer,
        name: String,
        position: Position,
        direction: UInt?,
        orientation: Floating?,
        connections: Connection?,
        control_behaviour: ControlBehaviour?,
        items: ItemRequest?,
        recipe: String?,
        bar: ItemStackIndex?,
        inventory: Inventory?,
        infinity_settings: InfinitySettings?,
        type: UndergroundBeltType?,
        input_priority: SplitterPriority?,
        output_priority: SplitterPriority?,
        filter: String?,
        filters: [ItemFilter]?,
        filter_mode: FilterMode?,
        override_stack_size: UInt8?,
        drop_position: Position?,
        pickup_position: Position?,
        request_filters: LogisticFilter?,
        request_from_buffers: Bool?,
        parameters: SpeakerParameter?,
        alert_parameters: SpeakerAlertParameter?,
        auto_launch: Bool?,
        variation: GraphicsVariation?,
        color: Color?,
        station: String?)
    {
        self.entity_number = entity_number
        self.name = name
        self.position = position
        self.direction = direction
        self.orientation = orientation
        self.connections = connections
        self.control_behaviour = control_behaviour
        self.items = items
        self.recipe = recipe
        self.bar = bar
        self.inventory = inventory
        self.infinity_settings = infinity_settings
        self.type = type
        self.input_priority = input_priority
        self.output_priority = output_priority
        self.filter = filter
        self.filters = filters
        self.filter_mode = filter_mode
        self.override_stack_size = override_stack_size
        self.drop_position = drop_position
        self.pickup_position = pickup_position
        self.request_filters = request_filters
        self.request_from_buffers = request_from_buffers
        self.parameters = parameters
        self.alert_parameters = alert_parameters
        self.auto_launch = auto_launch
        self.variation = variation
        self.color = color
        self.station = station
    }
}
