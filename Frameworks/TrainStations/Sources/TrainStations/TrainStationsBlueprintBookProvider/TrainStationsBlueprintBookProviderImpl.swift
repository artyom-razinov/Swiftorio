import SwiftorioBlueprints
import SwiftorioDataRaw
import SwiftorioLocalization

public final class TrainStationsBlueprintBookProviderImpl: TrainStationsBlueprintBookProvider {
    private let version = 281474976710656
    private let dataRawProvider: DataRawProvider
    private let localizer: Localizer
    
    public init(
        dataRawProvider: DataRawProvider,
        localizer: Localizer)
    {
        self.dataRawProvider = dataRawProvider
        self.localizer = localizer
    }
    
    public func trainStationsBlueprintBook() throws -> SwiftorioBlueprints.BlueprintBook {
        return book(
            label: "Train network",
            description: "Train stops and trains for all resources (requester/provider) with rich text names",
            blueprints: indexed(try categoryBooks())
        )
    }
    
    private func indexed(_ books: [SwiftorioBlueprints.BlueprintBook]) -> [BlueprintBookItem] {
        return books.enumerated().map { (index, book) in
            BlueprintBookItem.blueprint_book(
                IndexedBlueprintBook(
                    blueprint_book: book,
                    index: index
                )
            )
        }
    }
    
    private func indexed(_ blueprints: [SwiftorioBlueprints.Blueprint]) -> [BlueprintBookItem] {
        return blueprints.enumerated().map { (index, blueprint) in
            BlueprintBookItem.blueprint(
                IndexedBlueprint(
                    blueprint: blueprint,
                    index: index
                )
            )
        }
    }
    
    private func indexed(_ signals: [SwiftorioBlueprints.SignalId]) -> [SwiftorioBlueprints.Icon] {
        return signals.enumerated().map { (index, signal) in
            SwiftorioBlueprints.Icon(
                index: index + 1,
                signal: signal
            )
        }
    }
    
    private func categoryBooks() throws -> [SwiftorioBlueprints.BlueprintBook] {
        let entities = try typedTrainCargoEntities()
        
        var entitiesByCategory: [TrainCargoEntityCategory: [TypedTrainCargoEntity]] = [:]
        entities.forEach { entity in
            entitiesByCategory[entity.category, default: []].append(entity)
        }
        
        return entitiesByCategory.map { (category, typedTrainCargoEntities) in
            categoryBook(
                category: category,
                typedTrainCargoEntities: typedTrainCargoEntities
            )
        }
    }
    
    private func categoryBook(
        category: TrainCargoEntityCategory,
        typedTrainCargoEntities: [TypedTrainCargoEntity])
        -> SwiftorioBlueprints.BlueprintBook
    {
        return book(
            label: category.rawValue, // FIXME
            blueprints: indexed(typedTrainCargoEntities.map(entityBook))
        )
    }
    
    private func entityBook(typedTrainCargoEntity: TypedTrainCargoEntity) -> SwiftorioBlueprints.BlueprintBook {
        return book(
            label: typedTrainCargoEntity.localizedName,
            description: "Train stops and trains for \(typedTrainCargoEntity.localizedName)",
            blueprints: indexed([
                providerTrainStopBlueprint(typedTrainCargoEntity: typedTrainCargoEntity),
                requesterTrainStopBlueprint(typedTrainCargoEntity: typedTrainCargoEntity),
                trainBlueprint(typedTrainCargoEntity: typedTrainCargoEntity)
            ])
        )
    }
    
    func providerTrainStopBlueprint(typedTrainCargoEntity: TypedTrainCargoEntity) -> SwiftorioBlueprints.Blueprint {
        return trainStopBlueprint(
            typedTrainCargoEntity: typedTrainCargoEntity,
            stationColor: Color(r: 1, g: 0, b: 0, a: 1),
            chestId: "logistic-chest-passive-provider"
        )
    }
    
    func requesterTrainStopBlueprint(typedTrainCargoEntity: TypedTrainCargoEntity) -> SwiftorioBlueprints.Blueprint {
        return trainStopBlueprint(
            typedTrainCargoEntity: typedTrainCargoEntity,
            stationColor: Color(r: 0, g: 0, b: 1, a: 1),
            chestId: "logistic-chest-requester"
        )
    }
    
    func trainStopBlueprint(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        stationColor: Color,
        chestId: String)
        -> SwiftorioBlueprints.Blueprint
    {
        let stationName = "FIXME"
        
        return blueprint(
            label: "FIXME",
            entities: [
                entity(
                    entity_number: 1,
                    name: "train-stop",
                    position: Position(
                        x: 0,
                        y: 0
                    ),
                    direction: 4,
                    color: stationColor,
                    station: stationName
                )
            ],
            icons: trainStopIcons(
                trainCargoEntityType: typedTrainCargoEntity.entityType,
                cargoId: typedTrainCargoEntity.id,
                chestId: chestId
            )
        )
    }
    
    private func entity(
        entity_number: Integer,
        name: String,
        position: Position,
        direction: UInt? = nil,
        orientation: Floating? = nil,
        connections: Connection? = nil,
        control_behaviour: ControlBehaviour? = nil,
        items: ItemRequest? = nil,
        recipe: String? = nil,
        bar: ItemStackIndex? = nil,
        inventory: Inventory? = nil,
        infinity_settings: InfinitySettings? = nil,
        type: UndergroundBeltType? = nil,
        input_priority: SplitterPriority? = nil,
        output_priority: SplitterPriority? = nil,
        filter: String? = nil,
        filters: [ItemFilter]? = nil,
        filter_mode: FilterMode? = nil,
        override_stack_size: UInt8? = nil,
        drop_position: Position? = nil,
        pickup_position: Position? = nil,
        request_filters: LogisticFilter? = nil,
        request_from_buffers: Bool? = nil,
        parameters: SpeakerParameter? = nil,
        alert_parameters: SpeakerAlertParameter? = nil,
        auto_launch: Bool? = nil,
        variation: GraphicsVariation? = nil,
        color: Color? = nil,
        station: String? = nil)
        -> SwiftorioBlueprints.Entity
    {
        return SwiftorioBlueprints.Entity(
            entity_number: entity_number,
            name: name,
            position: position,
            direction: direction,
            orientation: orientation,
            connections: connections,
            control_behaviour: control_behaviour,
            items: items,
            recipe: recipe,
            bar: bar,
            inventory: inventory,
            infinity_settings: infinity_settings,
            type: type,
            input_priority: input_priority,
            output_priority: output_priority,
            filter: filter,
            filters: filters,
            filter_mode: filter_mode,
            override_stack_size: override_stack_size,
            drop_position: drop_position,
            pickup_position: pickup_position,
            request_filters: request_filters,
            request_from_buffers: request_from_buffers,
            parameters: parameters,
            alert_parameters: alert_parameters,
            auto_launch: auto_launch,
            variation: variation,
            color: color,
            station: station
        )
    }
    
    private func signalIdType(trainCargoEntityType: TrainCargoEntityType) -> SignalIdType {
        switch trainCargoEntityType {
        case .fluid:
            return .fluid
        case .item:
            return .item
        }
    }
    
    func trainStopIcons(
        trainCargoEntityType: TrainCargoEntityType,
        cargoId: String,
        chestId: String)
        -> [SwiftorioBlueprints.Icon]
    {
        let cargoSignalId = SignalId(
            name: cargoId,
            type: signalIdType(trainCargoEntityType: trainCargoEntityType)
        )
        
        return indexed([
            SignalId(
                name: "train-stop",
                type: .item
            ),
            cargoSignalId,
            SignalId(
                name: chestId,
                type: .item
            ),
            cargoSignalId
        ])
    }
    
    func trainBlueprint(typedTrainCargoEntity: TypedTrainCargoEntity) -> SwiftorioBlueprints.Blueprint {
        return blueprint(label: "FIXME", entities: [])
    }
    
    private func blueprint(
        label: String,
        description: String? = nil,
        entities: [SwiftorioBlueprints.Entity],
        icons: [SwiftorioBlueprints.Icon]? = nil,
        schedules: [SwiftorioBlueprints.Schedule]? = nil)
        -> SwiftorioBlueprints.Blueprint
    {
        return SwiftorioBlueprints.Blueprint(
            item: "blueprint",
            label: label,
            description: nil, // FIXME
            label_color: nil,
            entities: entities,
            tiles: nil,
            icons: icons,
            schedules: schedules,
            version: version
        )
    }
    
    private func typedTrainCargoEntities() throws -> [TypedTrainCargoEntity] {
        let dataRaw = try dataRawProvider.dataRaw()
        
        let allItemsDictionaries: [[String: ItemProtocol]] = [
            dataRaw.ammo,
            dataRaw.capsule,
            dataRaw.gun,
            dataRaw.item,
            dataRaw.module,
            dataRaw.tool
        ]
        
        let allItems = allItemsDictionaries.flatMap {
            ValueWithId.valuesWithId(dictionary: $0)
        }
        
        let fluids: [ValueWithId<Fluid>] = ValueWithId.valuesWithId(dictionary: dataRaw.fluid)
        
        var trainCargoEntities: [TypedTrainCargoEntity] = []
        
        trainCargoEntities.append(
            contentsOf: try allItems.map { itemWithId in
                TypedTrainCargoEntity.item(
                    ItemTrainCargoEntity(
                        id: itemWithId.id,
                        localizedName: try localizer.localize(
                            locale: .en,
                            section: .item_name,
                            id: itemWithId.id
                        ),
                        category: .other
                    )
                )
            }
        )
        
        trainCargoEntities.append(
            contentsOf: try fluids.map { itemWithId in
                TypedTrainCargoEntity.fluid(
                    FluidTrainCargoEntity(
                        id: itemWithId.id,
                        localizedName: try localizer.localize(
                            locale: .en,
                            section: .fluid_name,
                            id: itemWithId.id
                        )
                    )
                )
            }
        )
        
        return trainCargoEntities
    }
    
    private func book(label: String, description: String? = nil, blueprints: [BlueprintBookItem]) -> SwiftorioBlueprints.BlueprintBook {
        return SwiftorioBlueprints.BlueprintBook(
            item: "blueprint-book",
            label: label,
            description: description,
            label_color: nil,
            blueprints: blueprints,
            active_index: 0,
            version: version
        )
    }
}
