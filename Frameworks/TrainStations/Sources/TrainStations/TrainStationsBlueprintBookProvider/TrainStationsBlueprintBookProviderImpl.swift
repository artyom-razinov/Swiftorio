import SwiftorioBlueprints
import SwiftorioDataRaw
import SwiftorioLocalization
import SwiftorioRichText

public final class TrainStationsBlueprintBookProviderImpl: TrainStationsBlueprintBookProvider {
    private let version = 281474976710656
    private let typedTrainCargoEntityProvider: TypedTrainCargoEntityProvider
    private let richTextBuilder: RichTextBuilder
    private let orderComparator: OrderComparator
    private let trainCargoCategoriesProvider: TrainCargoCategoriesProvider
    
    public init(
        typedTrainCargoEntityProvider: TypedTrainCargoEntityProvider,
        richTextBuilder: RichTextBuilder,
        orderComparator: OrderComparator,
        trainCargoCategoriesProvider: TrainCargoCategoriesProvider)
    {
        self.typedTrainCargoEntityProvider = typedTrainCargoEntityProvider
        self.richTextBuilder = richTextBuilder
        self.orderComparator = orderComparator
        self.trainCargoCategoriesProvider = trainCargoCategoriesProvider
    }
    
    public func trainStationsBlueprintBook() throws -> SwiftorioBlueprints.BlueprintBook {
        return book(
            label: "Train network",
            description: "Train stops and trains for all resources (requester/provider) with rich text names",
            blueprints: indexed(try categoryBooks(locale: .en)),
            icons: icons([.trainStop])
        )
    }
    
    private func icons(_ names: [AnyItemPrototypeName]) -> [SwiftorioBlueprints.Icon] {
        return indexed(names.map {
            SignalId(
                name: $0.rawValue,
                type: .item
            )
        })
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
    
    private func categoryBooks(locale: Locale) throws -> [BlueprintBook] {
        let entities = try typedTrainCargoEntityProvider.typedTrainCargoEntities(locale: locale)
        
        let categories = try trainCargoCategoriesProvider.trainCargoCategories(locale: locale)
        var countOfPrototypesAssignedToCategoryById = [String: Int]()
        var entitiesById = [String: TypedTrainCargoEntity]()
        
        entities.forEach {
            entitiesById[$0.id] = $0
            countOfPrototypesAssignedToCategoryById[$0.id] = 0
        }
        
        let categoryBooks: [BlueprintBook] = try categories.map { category in
            let typedTrainCargoEntities = entities
                .filter { category.match(typedTrainCargoEntity: $0) }
                .sorted { lhs, rhs in lhs.order < rhs.order }
            
            typedTrainCargoEntities.forEach {
                countOfPrototypesAssignedToCategoryById[$0.id, default: 0] += 1
            }
            
            return try categoryBook(
                category: category,
                typedTrainCargoEntities: typedTrainCargoEntities,
                locale: locale
            )
        }
        
        let errors: [String] = countOfPrototypesAssignedToCategoryById
            .filter { key, value in
                switch entitiesById[key] {
                case .fluid(let fluid):
                    if fluid.fluidPrototype.hidden {
                        return false
                    }
                case .item(let item):
                if item.itemPrototype.flags.contains("hidden") {
                    return false
                }
                default:
                    break
                }
                
                return value == 0
            }
            .sorted { $0.1 < $1.1 }
            .map { key, value in
                let subgroup = entitiesById[key]?.itemOrFluidPrototype.subgroup
                
                return "\(key): \(value)" + (subgroup.map { " \($0)" } ?? "")
            }
                
        
        if !errors.isEmpty {
            print("Errors:\n\(errors.joined(separator: "\n"))")
            preconditionFailure()
        }
        
        return categoryBooks
    }
    
    private func categoryBook(
        category: TrainCargoCategory,
        typedTrainCargoEntities: [TypedTrainCargoEntity],
        locale: Locale)
        throws
        -> SwiftorioBlueprints.BlueprintBook
    {
        return book(
            label: category.name,
            blueprints: indexed(try typedTrainCargoEntities.map { typedTrainCargoEntity in
                try entityBook(
                    typedTrainCargoEntity: typedTrainCargoEntity,
                    locale: locale
                )
            }),
            icons: indexed([SignalId(
                name: category.icon,
                type: signalIdType(
                    trainCargoEntityType: category.trainCargoEntityType
                )
            )])
        )
    }
    
    private func entityBook(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        locale: Locale)
        throws
        -> SwiftorioBlueprints.BlueprintBook
    {
        let localizedCargoName = try typedTrainCargoEntity.localizedName(locale: locale)
        
        let cargoSignalId = SignalId(
            name: typedTrainCargoEntity.id,
            type: signalIdType(trainCargoEntityType: typedTrainCargoEntity.entityType)
        )
        
        return book(
            label: localizedCargoName,
            description: "Train stops and trains for \(localizedCargoName)",
            blueprints: indexed([
                trainStopBlueprint(
                    typedTrainCargoEntity: typedTrainCargoEntity,
                    localizedCargoName: localizedCargoName,
                    cargoSignalId: cargoSignalId,
                    isProvider: true
                ),
                trainStopBlueprint(
                    typedTrainCargoEntity: typedTrainCargoEntity,
                    localizedCargoName: localizedCargoName,
                    cargoSignalId: cargoSignalId,
                    isProvider: false
                ),
                trainBlueprint(
                    typedTrainCargoEntity: typedTrainCargoEntity,
                    localizedCargoName: localizedCargoName,
                    cargoSignalId: cargoSignalId
                )
            ]),
            icons: indexed([cargoSignalId])
        )
    }
    
    private func imgTagClass(
        trainCargoEntityType: TrainCargoEntityType)
        -> ImgTagClass
    {
        switch trainCargoEntityType {
        case .fluid:
            return .fluid
        case .item:
            return .item
        }
    }
    
    private func cargoImage(
        typedTrainCargoEntity: TypedTrainCargoEntity)
        -> ImgTag
    {
        return ImgTag(
            class: imgTagClass(trainCargoEntityType: typedTrainCargoEntity.entityType),
            name: typedTrainCargoEntity.id
        )
    }
    
    private func chestImage(chestId: AnyItemPrototypeName) -> ImgTag {
        return ImgTag(
            class: .item,
            name: chestId.rawValue
        )
    }
    
    private func stationName(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        localizedCargoName: String,
        isProvider: Bool)
        -> String
    {
        let stationType = isProvider ? "provider" : "requester"
        
        let cargoImage = self.cargoImage(typedTrainCargoEntity: typedTrainCargoEntity)
        
        let chestId = self.chestId(isProvider: isProvider)
        
        let textColor: ColorTextModifierColorAlias = isProvider
            ? .red
            : .blue
        
        return richTextBuilder.buildString {
            $0.image(cargoImage)
                + $0.image(chestImage(chestId: chestId))
                + " "
                + $0.color(textColor) {
                    $0.text("\(localizedCargoName) \(stationType)")
                }
        }
    }
    
    private func chestId(isProvider: Bool) -> AnyItemPrototypeName {
        return isProvider
            ? .logisticChestPassiveProvider
            : .logisticChestRequester
    }
    
    private func trainStopBlueprint(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        localizedCargoName: String,
        cargoSignalId: SignalId,
        isProvider: Bool)
        -> Blueprint
    {
        let stationColor = isProvider
            ? Color(r: 1, g: 0, b: 0, a: 1)
            : Color(r: 0, g: 0, b: 1, a: 1)
        
        let cargoSignalId: SignalId
        
        let stationName = self.stationName(
            typedTrainCargoEntity: typedTrainCargoEntity,
            localizedCargoName: localizedCargoName,
            isProvider: isProvider
        )
        
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
            icons: icons([
                chestId(isProvider: isProvider)
            ])
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
    
    private func blueprint(
        label: String,
        description: String? = nil,
        entities: [Entity],
        icons: [SwiftorioBlueprints.Icon],
        schedules: [Schedule]? = nil)
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
    
    private func book(
        label: String,
        description: String? = nil,
        blueprints: [IndexedBlueprintOrBook],
        icons: [SwiftorioBlueprints.Icon])
        -> SwiftorioBlueprints.BlueprintBook
    {
        return SwiftorioBlueprints.BlueprintBook(
            item: "blueprint-book",
            label: label,
            description: description,
            label_color: nil,
            blueprints: blueprints,
            icons: icons,
            active_index: 0,
            version: version
        )
    }
    
    // MARK: - Trains
    
    private func trainBlueprint(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        localizedCargoName: String,
        cargoSignalId: SignalId)
        -> SwiftorioBlueprints.Blueprint
    {
        let locomotiveColor = Color(
            r: 0.9200000166893005,
            g: 0.07000000029802322,
            b: 0,
            a: 0.5
        )
        
        func locomotive(entity_number: Int, y: Floating) -> Entity {
            return entity(
                entity_number: entity_number,
                name: "locomotive",
                position: Position(
                    x: 3215,
                    y: y
                ),
                orientation: 0,
                items: [
                    "nuclear-fuel": 3
                ],
                color: locomotiveColor
            )
        }
        
        func rail(entity_number: Int, y: Floating) -> Entity {
            return entity(
                entity_number: entity_number,
                name: "straight-rail",
                position: Position(
                    x: 3215,
                    y: y
                )
            )
        }
        
        func cargoWagon(entity_number: Int, y: Floating) -> Entity {
            let wagon: AnyItemPrototypeName
            
            switch typedTrainCargoEntity {
            case .fluid:
                wagon = .fluidWagon
            case .item:
                wagon = .cargoWagon
            }
            
            return entity(
                entity_number: entity_number,
                name: wagon.rawValue,
                position: Position(
                    x: 3215,
                    y: y
                ),
                orientation: 0
            )
        }
        
        func schedule(locomotive: Int) -> Schedule {
            return Schedule(
                schedule: [
                    ScheduleRecord(
                        station: stationName(
                            typedTrainCargoEntity: typedTrainCargoEntity,
                            localizedCargoName: localizedCargoName,
                            isProvider: true
                        ),
                        wait_conditions: [
                            WaitCondition(
                                type: .full,
                                compare_type: .or,
                                ticks: nil,
                                condition: nil
                            )
                        ]
                    ),
                    ScheduleRecord(
                        station: stationName(
                            typedTrainCargoEntity: typedTrainCargoEntity,
                            localizedCargoName: localizedCargoName,
                            isProvider: false
                        ),
                        wait_conditions: [
                            WaitCondition(
                                type: .empty,
                                compare_type: .or,
                                ticks: nil,
                                condition: nil
                            )
                        ]
                    )
                ],
                locomotives: [
                    locomotive
                ]
            )
        }
        
        return blueprint(
            label: "FIXME",
            entities: [
                locomotive(entity_number: 1, y: -270),
                rail(entity_number: 2, y: -271),
                rail(entity_number: 3, y: -269),
                rail(entity_number: 4, y: -267),
                locomotive(entity_number: 5, y: -263),
                rail(entity_number: 6, y: -265),
                rail(entity_number: 7, y: -263),
                rail(entity_number: 8, y: -261),
                cargoWagon(entity_number: 9, y: -256),
                rail(entity_number: 10, y: -259),
                rail(entity_number: 11, y: -257),
                rail(entity_number: 12, y: -255),
                rail(entity_number: 13, y: -253),
                cargoWagon(entity_number: 14, y: -249),
                rail(entity_number: 15, y: -251),
                rail(entity_number: 16, y: -249),
                rail(entity_number: 17, y: -247),
                cargoWagon(entity_number: 18, y: -242),
                rail(entity_number: 19, y: -245),
                rail(entity_number: 20, y: -243),
                rail(entity_number: 21, y: -241),
                rail(entity_number: 22, y: -239),
                cargoWagon(entity_number: 23, y: -235),
                rail(entity_number: 24, y: -237),
                rail(entity_number: 25, y: -235),
                rail(entity_number: 26, y: -233),
            ],
            icons: indexed([
                SignalId(
                    name: AnyItemPrototypeName.locomotive.rawValue,
                    type: .item
                ),
                SignalId(
                    name: AnyItemPrototypeName.cargoWagon.rawValue,
                    type: .item
                ),
                cargoSignalId,
                cargoSignalId
            ]),
            schedules: [
                schedule(locomotive: 1),
                schedule(locomotive: 5),
            ]
        )
    }
}
