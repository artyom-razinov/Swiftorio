import SwiftorioBlueprints
import SwiftorioDataRaw
import SwiftorioLocalization
import SwiftorioRichText

public final class TrainStationsBlueprintBookProviderImpl: TrainStationsBlueprintBookProvider {
    private let version = 281474976710656
    private let typedTrainCargoEntityProvider: TypedTrainCargoEntityProvider
    private let richTextBuilder: RichTextBuilder
    
    public init(
        typedTrainCargoEntityProvider: TypedTrainCargoEntityProvider,
        richTextBuilder: RichTextBuilder)
    {
        self.typedTrainCargoEntityProvider = typedTrainCargoEntityProvider
        self.richTextBuilder = richTextBuilder
    }
    
    public func trainStationsBlueprintBook() throws -> SwiftorioBlueprints.BlueprintBook {
        return book(
            label: "Train network",
            description: "Train stops and trains for all resources (requester/provider) with rich text names",
            blueprints: indexed(try categoryBooks())
        )
    }
    
    private func indexed(_ books: [SwiftorioBlueprints.BlueprintBook]) -> [IndexedBlueprintOrBook] {
        return books.enumerated().map { (index, book) in
            IndexedBlueprintOrBook.book(
                IndexedBlueprintBook(
                    blueprint_book: book,
                    index: index
                )
            )
        }
    }
    
    private func indexed(_ blueprints: [SwiftorioBlueprints.Blueprint]) -> [IndexedBlueprintOrBook] {
        return blueprints.enumerated().map { (index, blueprint) in
            IndexedBlueprintOrBook.blueprint(
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
        let entities = try typedTrainCargoEntityProvider.typedTrainCargoEntities()
        
        let categories: [TrainCargoCategory] = [
            RawMaterialsTrainCargoCategory(),
            FluidTrainCargoCategory()
        ]
        
        return categories.map { category in
            let typedTrainCargoEntities = entities
                .filter { category.match(typedTrainCargoEntity: $0) }
                .sorted { lhs, rhs in isOrderedBefore(lhs: lhs, rhs: rhs) }
            
            return categoryBook(
                category: category,
                typedTrainCargoEntities: typedTrainCargoEntities
            )
        }
    }
    
    private func isOrderedBefore(
        lhs: TypedTrainCargoEntity,
        rhs: TypedTrainCargoEntity)
        -> Bool
    {
        switch (lhs.itemOrFluid.order, rhs.itemOrFluid.order) {
        case let (.some(lhs), .some(rhs)):
            return lhs < rhs
        case let (.none, .some):
            return true
        case let (.some, .none):
            return false
        case (.none, .none):
            return lhs.id < rhs.id
        }
    }
    
    private func categoryBook(
        category: TrainCargoCategory,
        typedTrainCargoEntities: [TypedTrainCargoEntity])
        -> SwiftorioBlueprints.BlueprintBook
    {
        return book(
            label: category.name,
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
            stationType: "provider",
            textColor: .red,
            stationColor: Color(r: 1, g: 0, b: 0, a: 1),
            chestId: "logistic-chest-passive-provider"
        )
    }
    
    func requesterTrainStopBlueprint(typedTrainCargoEntity: TypedTrainCargoEntity) -> SwiftorioBlueprints.Blueprint {
        return trainStopBlueprint(
            typedTrainCargoEntity: typedTrainCargoEntity,
            stationType: "requester",
            textColor: .blue,
            stationColor: Color(r: 0, g: 0, b: 1, a: 1),
            chestId: "logistic-chest-requester"
        )
    }
    
    func imgTagClass(trainCargoEntityType: TrainCargoEntityType) -> ImgTagClass {
        switch trainCargoEntityType {
        case .fluid:
            return .fluid
        case .item:
            return .item
        }
    }
    
    func cargoImage(typedTrainCargoEntity: TypedTrainCargoEntity) -> ImgTag {
        return ImgTag(
            class: imgTagClass(trainCargoEntityType: typedTrainCargoEntity.entityType),
            name: typedTrainCargoEntity.id
        )
    }
    
    func chestImage(chestId: String) -> ImgTag {
        return ImgTag(
            class: .item,
            name: chestId
        )
    }
    
    func trainStopBlueprint(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        stationType: String,
        textColor: ColorTextModifierColorAlias,
        stationColor: Color,
        chestId: String)
        -> SwiftorioBlueprints.Blueprint
    {
        let cargoImage = self.cargoImage(typedTrainCargoEntity: typedTrainCargoEntity)
        
        let stationName = richTextBuilder.buildString {
            $0.image(cargoImage)
                + $0.image(chestImage(chestId: chestId))
                + " "
                + $0.color(textColor) {
                    $0.text("\(typedTrainCargoEntity.localizedName) \(stationType)")
                }
        }
        
        return blueprint(
            label: stationName,
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
    
    private func book(label: String, description: String? = nil, blueprints: [IndexedBlueprintOrBook]) -> SwiftorioBlueprints.BlueprintBook {
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
