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
                .sorted { lhs, rhs in isOrderedBefore(lhs: lhs, rhs: rhs) }
            
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
    
    private func isOrderedBefore(
        lhs: TypedTrainCargoEntity,
        rhs: TypedTrainCargoEntity)
        -> Bool
    {
        return orderComparator.isOrderedBefore(
            lhsOrder: lhs.itemOrFluidPrototype.order,
            lhsName: lhs.id,
            rhsOrder: rhs.itemOrFluidPrototype.order,
            rhsName: rhs.id
        )
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
                providerTrainStopBlueprint(
                    typedTrainCargoEntity: typedTrainCargoEntity,
                    localizedCargoName: localizedCargoName,
                    cargoSignalId: cargoSignalId
                ),
                requesterTrainStopBlueprint(
                    typedTrainCargoEntity: typedTrainCargoEntity,
                    localizedCargoName: localizedCargoName,
                    cargoSignalId: cargoSignalId
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
    
    func providerTrainStopBlueprint(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        localizedCargoName: String,
        cargoSignalId: SignalId)
        -> SwiftorioBlueprints.Blueprint
    {
        return trainStopBlueprint(
            typedTrainCargoEntity: typedTrainCargoEntity,
            localizedCargoName: localizedCargoName,
            stationType: "provider",
            textColor: .red,
            stationColor: Color(r: 1, g: 0, b: 0, a: 1),
            chestId: .logisticChestPassiveProvider,
            cargoSignalId: cargoSignalId
        )
    }
    
    func requesterTrainStopBlueprint(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        localizedCargoName: String,
        cargoSignalId: SignalId)
        -> SwiftorioBlueprints.Blueprint
    {
        return trainStopBlueprint(
            typedTrainCargoEntity: typedTrainCargoEntity,
            localizedCargoName: localizedCargoName,
            stationType: "requester",
            textColor: .blue,
            stationColor: Color(r: 0, g: 0, b: 1, a: 1),
            chestId: .logisticChestRequester,
            cargoSignalId: cargoSignalId
        )
    }
    
    func imgTagClass(
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
    
    func cargoImage(
        typedTrainCargoEntity: TypedTrainCargoEntity)
        -> ImgTag
    {
        return ImgTag(
            class: imgTagClass(trainCargoEntityType: typedTrainCargoEntity.entityType),
            name: typedTrainCargoEntity.id
        )
    }
    
    func chestImage(chestId: AnyItemPrototypeName) -> ImgTag {
        return ImgTag(
            class: .item,
            name: chestId.rawValue
        )
    }
    
    func trainStopBlueprint(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        localizedCargoName: String,
        stationType: String,
        textColor: ColorTextModifierColorAlias,
        stationColor: Color,
        chestId: AnyItemPrototypeName,
        cargoSignalId: SignalId)
        -> SwiftorioBlueprints.Blueprint
    {
        let cargoImage = self.cargoImage(typedTrainCargoEntity: typedTrainCargoEntity)
        
        let stationName = richTextBuilder.buildString {
            $0.image(cargoImage)
                + $0.image(chestImage(chestId: chestId))
                + " "
                + $0.color(textColor) {
                    $0.text("\(localizedCargoName) \(stationType)")
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
            icons: icons([chestId])
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
    
    func trainBlueprint(
        typedTrainCargoEntity: TypedTrainCargoEntity,
        localizedCargoName: String,
        cargoSignalId: SignalId)
        -> SwiftorioBlueprints.Blueprint
    {
        return blueprint(
            label: "FIXME",
            entities: [],
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
            ])
        )
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
}
