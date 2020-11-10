public final class DataRaw: Codable {
    public let accumulator: [String: AccumulatorPrototype]
    public let achievement: [String: AchievementPrototype]
    public let activeDefenseEquipment: [String: ActiveDefenseEquipmentPrototype]
    public let ambientSound: [String: AmbientSoundPrototype]
    public let ammo: [String: AmmoPrototype]
    public let ammoCategory: [String: AmmoCategoryPrototype]
    public let ammoTurret: [String: AmmoTurretPrototype]
    public let arithmeticCombinator: [String: ArithmeticCombinatorPrototype]
    public let armor: [String: ArmorPrototype]
    public let arrow: [String: ArrowPrototype]
    public let assemblingMachine: [String: AssemblingMachinePrototype]
    public let autoplaceControl: [String: AutoplaceControlPrototype]
    public let batteryEquipment: [String: BatteryEquipmentPrototype]
    public let beacon: [String: BeaconPrototype]
    public let beltImmunityEquipment: [String: BeltImmunityEquipmentPrototype]
    public let blueprint: [String: BlueprintPrototype]
    public let blueprintBook: [String: BlueprintBookPrototype]
    public let boiler: [String: BoilerPrototype]
    public let buildEntityAchievement: [String: BuildEntityAchievementPrototype]
    public let capsule: [String: CapsulePrototype]
    public let car: [String: CarPrototype]
    public let cargoWagon: [String: CargoWagonPrototype]
    public let combatRobot: [String: CombatRobotPrototype]
    public let constantCombinator: [String: ConstantCombinatorPrototype]
    public let constructWithRobotsAchievement: [String: ConstructWithRobotsAchievementPrototype]
    public let constructionRobot: [String: ConstructionRobotPrototype]
    public let container: [String: ContainerPrototype]
    public let corpse: [String: CorpsePrototype]
    public let curvedRail: [String: CurvedRailPrototype]
    public let damageType: [String: DamageTypePrototype]
    public let deciderCombinator: [String: DeciderCombinatorPrototype]
    public let deconstructWithRobotsAchievement: [String: DeconstructWithRobotsAchievementPrototype]
    public let deconstructionItem: [String: DeconstructionItemPrototype]
    public let decorative: [String: DecorativePrototype]? // TODO: Remove?
    public let deliverByRobotsAchievement: [String: DeliverByRobotsAchievementPrototype]
    public let dontBuildEntityAchievement: [String: DontBuildEntityAchievementPrototype]
    public let dontCraftManuallyAchievement: [String: DontCraftManuallyAchievementPrototype]
    public let dontUseEntityInEnergyProductionAchievement: [String: DontUseEntityInEnergyProductionAchievementPrototype]
    public let electricPole: [String: ElectricPolePrototype]
    public let electricTurret: [String: ElectricTurretPrototype]
    public let energyShieldEquipment: [String: EnergyShieldEquipmentPrototype]
    public let entity: [String: EntityPrototype]? // TODO: Remove?
    public let entityWithHealth: [String: EntityWithHealthPrototype]? // TODO: Remove?
    public let equipment: [String: EquipmentPrototype]? // TODO: Remove?
    public let explosion: [String: ExplosionPrototype]
    public let finishTheGameAchievement: [String: FinishTheGameAchievementPrototype]
    public let fish: [String: FishPrototype]
    public let fluid: [String: FluidPrototype]
    public let fluidTurret: [String: FluidTurretPrototype]
    public let fluidWagon: [String: FluidWagonPrototype]
    public let flyingText: [String: FlyingTextPrototype]
    public let font: [String: FontPrototype]
    public let furnace: [String: FurnacePrototype]
    public let gate: [String: GatePrototype]
    public let generator: [String: GeneratorPrototype]
    public let generatorEquipment: [String: GeneratorEquipmentPrototype]
    public let ghost: [String: GhostPrototype]? // TODO: Remove?
    public let groupAttackAchievement: [String: GroupAttackAchievementPrototype]
    public let guiStyle: [String: GuiStylePrototype]
    public let gun: [String: GunPrototype]
    public let inserter: [String: InserterPrototype]
    public let item: [String: ItemPrototype]
    public let itemEntity: [String: ItemEntityPrototype]
    public let itemGroup: [String: ItemGroupPrototype]
    public let itemSubgroup: [String: ItemSubgroupPrototype]
    public let itemWithEntityData: [String: ItemWithEntityDataPrototype]
    public let itemWithInventory: [String: ItemWithInventoryPrototype]
    public let itemWithLabel: [String: ItemWithLabelPrototype]
    public let killAchievement: [String: KillAchievementPrototype]
    public let lab: [String: LabPrototype]
    public let lamp: [String: LampPrototype]
    public let landMine: [String: LandMinePrototype]
    public let loader: [String: LoaderPrototype]
    public let locomotive: [String: LocomotivePrototype]
    public let logisticContainer: [String: LogisticContainerPrototype]
    public let logisticRobot: [String: LogisticRobotPrototype]
    public let mapSettings: [String: MapSettingsPrototype]
    public let market: [String: MarketPrototype]
    public let miningDrill: [String: MiningDrillPrototype]
    public let miningTool: [String: MiningToolPrototype]
    public let module: [String: ModulePrototype]
    public let movementBonusEquipment: [String: MovementBonusEquipmentPrototype]
    public let nightVisionEquipment: [String: NightVisionEquipmentPrototype]
    public let noiseLayer: [String: NoiseLayerPrototype]
    public let offshorePump: [String: OffshorePumpPrototype]
    public let particle: [String: ParticlePrototype]
    public let pipe: [String: PipePrototype]
    public let pipeConnectable: [String: PipeConnectablePrototype]? // TODO: Remove?
    public let pipeToGround: [String: PipeToGroundPrototype]
    public let player: [String: PlayerPrototype]? // TODO: Remove?
    public let playerDamagedAchievement: [String: PlayerDamagedAchievementPrototype]
    public let playerPort: [String: PlayerPortPrototype]
    public let powerSwitch: [String: PowerSwitchPrototype]
    public let produceAchievement: [String: ProduceAchievementPrototype]
    public let producePerHourAchievement: [String: ProducePerHourAchievementPrototype]
    public let projectile: [String: ProjectilePrototype]
    public let pump: [String: PumpPrototype]
    public let radar: [String: RadarPrototype]
    public let railCategory: [String: RailCategoryPrototype]? // TODO: Remove?
    public let railChainSignal: [String: RailChainSignalPrototype]
    public let railRemnants: [String: RailRemnantsPrototype]
    public let railSignal: [String: RailSignalPrototype]
    public let recipe: [String: RecipePrototype]
    public let recipeCategory: [String: RecipeCategoryPrototype]
    public let repairTool: [String: RepairToolPrototype]
    public let researchAchievement: [String: ResearchAchievementPrototype]
    public let resource: [String: ResourceEntityPrototype]
    public let resourceCategory: [String: ResourceCategoryPrototype]
    public let roboport: [String: RoboportPrototype]
    public let roboportEquipment: [String: RoboportEquipmentPrototype]
    public let robot: [String: RobotPrototype]? // TODO: Remove?
    public let rocketDefense: [String: RocketDefensePrototype]? // TODO: Remove?
    public let rocketSilo: [String: RocketSiloPrototype]
    public let selectionTool: [String: SelectionToolPrototype]
    public let smartContainer: [String: SmartContainerPrototype]? // TODO: Remove?
    public let smoke: [String: SmokePrototype]
    public let solarPanel: [String: SolarPanelPrototype]
    public let solarPanelEquipment: [String: SolarPanelEquipmentPrototype]
    public let splitter: [String: SplitterPrototype]
    public let sticker: [String: StickerPrototype]
    public let storageTank: [String: StorageTankPrototype]
    public let straightRail: [String: StraightRailPrototype]
    public let technology: [String: TechnologyPrototype]
    public let tile: [String: TilePrototype]
    public let tool: [String: ToolPrototype]
    public let trainPathAchievement: [String: TrainPathAchievementPrototype]
    public let trainStop: [String: TrainStopPrototype]
    public let trainUnit: [String: TrainUnitPrototype]? // TODO: Remove?
    public let transportBelt: [String: TransportBeltPrototype]
    public let tree: [String: TreePrototype]
    public let turret: [String: TurretPrototype]
    public let undergroundBelt: [String: UndergroundBeltPrototype]
    public let unit: [String: UnitPrototype]
    public let unitSpawner: [String: UnitSpawnerPrototype]
    public let virtualSignal: [String: VirtualSignalPrototype]
    public let wall: [String: WallPrototype]
    
    enum CodingKeys: String, CodingKey {
        case accumulator
        case achievement
        case activeDefenseEquipment = "active-defense-equipment"
        case ambientSound = "ambient-sound"
        case ammo
        case ammoCategory = "ammo-category"
        case ammoTurret = "ammo-turret"
        case arithmeticCombinator = "arithmetic-combinator"
        case armor
        case arrow
        case assemblingMachine = "assembling-machine"
        case autoplaceControl = "autoplace-control"
        case batteryEquipment = "battery-equipment"
        case beacon
        case beltImmunityEquipment = "belt-immunity-equipment"
        case blueprint
        case blueprintBook = "blueprint-book"
        case boiler
        case buildEntityAchievement = "build-entity-achievement"
        case capsule
        case car
        case cargoWagon = "cargo-wagon"
        case combatRobot = "combat-robot"
        case constantCombinator = "constant-combinator"
        case constructWithRobotsAchievement = "construct-with-robots-achievement"
        case constructionRobot = "construction-robot"
        case container
        case corpse
        case curvedRail = "curved-rail"
        case damageType = "damage-type"
        case deciderCombinator = "decider-combinator"
        case deconstructWithRobotsAchievement = "deconstruct-with-robots-achievement"
        case deconstructionItem = "deconstruction-item"
        case decorative
        case deliverByRobotsAchievement = "deliver-by-robots-achievement"
        case dontBuildEntityAchievement = "dont-build-entity-achievement"
        case dontCraftManuallyAchievement = "dont-craft-manually-achievement"
        case dontUseEntityInEnergyProductionAchievement = "dont-use-entity-in-energy-production-achievement"
        case electricPole = "electric-pole"
        case electricTurret = "electric-turret"
        case energyShieldEquipment = "energy-shield-equipment"
        case entity
        case entityWithHealth = "entity-with-health"
        case equipment
        case explosion
        case finishTheGameAchievement = "finish-the-game-achievement"
        case fish
        case fluid
        case fluidTurret = "fluid-turret"
        case fluidWagon = "fluid-wagon"
        case flyingText = "flying-text"
        case font
        case furnace
        case gate
        case generator
        case generatorEquipment = "generator-equipment"
        case ghost
        case groupAttackAchievement = "group-attack-achievement"
        case guiStyle = "gui-style"
        case gun
        case inserter
        case item
        case itemEntity = "item-entity"
        case itemGroup = "item-group"
        case itemSubgroup = "item-subgroup"
        case itemWithEntityData = "item-with-entity-data"
        case itemWithInventory = "item-with-inventory"
        case itemWithLabel = "item-with-label"
        case killAchievement = "kill-achievement"
        case lab
        case lamp
        case landMine = "land-mine"
        case loader
        case locomotive
        case logisticContainer = "logistic-container"
        case logisticRobot = "logistic-robot"
        case mapSettings = "map-settings"
        case market
        case miningDrill = "mining-drill"
        case miningTool = "mining-tool"
        case module
        case movementBonusEquipment = "movement-bonus-equipment"
        case nightVisionEquipment = "night-vision-equipment"
        case noiseLayer = "noise-layer"
        case offshorePump = "offshore-pump"
        case particle
        case pipe
        case pipeConnectable = "pipe-connectable"
        case pipeToGround = "pipe-to-ground"
        case player
        case playerDamagedAchievement = "player-damaged-achievement"
        case playerPort = "player-port"
        case powerSwitch = "power-switch"
        case produceAchievement = "produce-achievement"
        case producePerHourAchievement = "produce-per-hour-achievement"
        case projectile
        case pump
        case radar
        case railCategory = "rail-category"
        case railChainSignal = "rail-chain-signal"
        case railRemnants = "rail-remnants"
        case railSignal = "rail-signal"
        case recipe
        case recipeCategory = "recipe-category"
        case repairTool = "repair-tool"
        case resource
        case resourceCategory = "resource-category"
        case roboport
        case roboportEquipment = "roboport-equipment"
        case robot
        case rocketDefense = "rocket-defense"
        case rocketSilo = "rocket-silo"
        case selectionTool = "selection-tool"
        case smartContainer = "smart-container"
        case smoke
        case solarPanel = "solar-panel"
        case solarPanelEquipment = "solar-panel-equipment"
        case splitter
        case sticker
        case storageTank = "storage-tank"
        case straightRail = "straight-rail"
        case technology
        case tile
        case tool
        case trainPathAchievement = "train-path-achievement"
        case trainStop = "train-stop"
        case trainUnit = "train-unit"
        case transportBelt = "transport-belt"
        case tree
        case turret
        case undergroundBelt = "underground-belt"
        case unit
        case unitSpawner = "unit-spawner"
        case virtualSignal = "virtual-signal"
        case wall
        case researchAchievement = "research-achievement"
    }
}
