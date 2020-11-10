public final class DataRaw: Codable {
    public let accumulator: [String: Accumulator]
    public let achievement: [String: Achievement]
    public let activeDefenseEquipment: [String: ActiveDefenseEquipment]
    public let ambientSound: [String: AmbientSound]
    public let ammo: [String: Ammo]
    public let ammoCategory: [String: AmmoCategory]
    public let ammoTurret: [String: AmmoTurret]
    public let arithmeticCombinator: [String: ArithmeticCombinator]
    public let armor: [String: Armor]
    public let arrow: [String: Arrow]
    public let assemblingMachine: [String: AssemblingMachine]
    public let autoplaceControl: [String: AutoplaceControl]
    public let batteryEquipment: [String: BatteryEquipment]
    public let beacon: [String: Beacon]
    public let beltImmunityEquipment: [String: BeltImmunityEquipment]
    public let blueprint: [String: Blueprint]
    public let blueprintBook: [String: BlueprintBook]
    public let boiler: [String: Boiler]
    public let buildEntityAchievement: [String: BuildEntityAchievement]
    public let capsule: [String: Capsule]
    public let car: [String: Car]
    public let cargoWagon: [String: CargoWagon]
    public let combatRobot: [String: CombatRobot]
    public let constantCombinator: [String: ConstantCombinator]
    public let constructWithRobotsAchievement: [String: ConstructWithRobotsAchievement]
    public let constructionRobot: [String: ConstructionRobot]
    public let container: [String: Container]
    public let corpse: [String: Corpse]
    public let curvedRail: [String: CurvedRail]
    public let damageType: [String: DamageType]
    public let deciderCombinator: [String: DeciderCombinator]
    public let deconstructWithRobotsAchievement: [String: DeconstructWithRobotsAchievement]
    public let deconstructionItem: [String: DeconstructionItem]
    public let decorative: [String: Decorative]? // TODO: Remove?
    public let deliverByRobotsAchievement: [String: DeliverByRobotsAchievement]
    public let dontBuildEntityAchievement: [String: DontBuildEntityAchievement]
    public let dontCraftManuallyAchievement: [String: DontCraftManuallyAchievement]
    public let dontUseEntityInEnergyProductionAchievement: [String: DontUseEntityInEnergyProductionAchievement]
    public let electricPole: [String: ElectricPole]
    public let electricTurret: [String: ElectricTurret]
    public let energyShieldEquipment: [String: EnergyShieldEquipment]
    public let entity: [String: Entity]? // TODO: Remove?
    public let entityWithHealth: [String: EntityWithHealth]? // TODO: Remove?
    public let equipment: [String: Equipment]? // TODO: Remove?
    public let explosion: [String: Explosion]
    public let finishTheGameAchievement: [String: FinishTheGameAchievement]
    public let fish: [String: Fish]
    public let fluid: [String: Fluid]
    public let fluidTurret: [String: FluidTurret]
    public let fluidWagon: [String: FluidWagon]
    public let flyingText: [String: FlyingText]
    public let font: [String: Font]
    public let furnace: [String: Furnace]
    public let gate: [String: Gate]
    public let generator: [String: Generator]
    public let generatorEquipment: [String: GeneratorEquipment]
    public let ghost: [String: Ghost]? // TODO: Remove?
    public let groupAttackAchievement: [String: GroupAttackAchievement]
    public let guiStyle: [String: GuiStyle]
    public let gun: [String: Gun]
    public let inserter: [String: Inserter]
    public let item: [String: Item]
    public let itemEntity: [String: ItemEntity]
    public let itemGroup: [String: ItemGroup]
    public let itemSubgroup: [String: ItemSubgroup]
    public let itemWithEntityData: [String: ItemWithEntityData]
    public let itemWithInventory: [String: ItemWithInventory]
    public let itemWithLabel: [String: ItemWithLabel]
    public let killAchievement: [String: KillAchievement]
    public let lab: [String: Lab]
    public let lamp: [String: Lamp]
    public let landMine: [String: LandMine]
    public let loader: [String: Loader]
    public let locomotive: [String: Locomotive]
    public let logisticContainer: [String: LogisticContainer]
    public let logisticRobot: [String: LogisticRobot]
    public let mapSettings: [String: MapSettings]
    public let market: [String: Market]
    public let miningDrill: [String: MiningDrill]
    public let miningTool: [String: MiningTool]
    public let module: [String: Module]
    public let movementBonusEquipment: [String: MovementBonusEquipment]
    public let nightVisionEquipment: [String: NightVisionEquipment]
    public let noiseLayer: [String: NoiseLayer]
    public let offshorePump: [String: OffshorePump]
    public let particle: [String: Particle]
    public let pipe: [String: Pipe]
    public let pipeConnectable: [String: PipeConnectable]? // TODO: Remove?
    public let pipeToGround: [String: PipeToGround]
    public let player: [String: Player]? // TODO: Remove?
    public let playerDamagedAchievement: [String: PlayerDamagedAchievement]
    public let playerPort: [String: PlayerPort]
    public let powerSwitch: [String: PowerSwitch]
    public let produceAchievement: [String: ProduceAchievement]
    public let producePerHourAchievement: [String: ProducePerHourAchievement]
    public let projectile: [String: Projectile]
    public let pump: [String: Pump]
    public let radar: [String: Radar]
    public let railCategory: [String: RailCategory]? // TODO: Remove?
    public let railChainSignal: [String: RailChainSignal]
    public let railRemnants: [String: RailRemnants]
    public let railSignal: [String: RailSignal]
    public let recipe: [String: Recipe]
    public let recipeCategory: [String: RecipeCategory]
    public let repairTool: [String: RepairTool]
    public let researchAchievement: [String: ResearchAchievement]
    public let resource: [String: Resource]
    public let resourceCategory: [String: ResourceCategory]
    public let roboport: [String: Roboport]
    public let roboportEquipment: [String: RoboportEquipment]
    public let robot: [String: Robot]? // TODO: Remove?
    public let rocketDefense: [String: RocketDefense]? // TODO: Remove?
    public let rocketSilo: [String: RocketSilo]
    public let selectionTool: [String: SelectionTool]
    public let smartContainer: [String: SmartContainer]? // TODO: Remove?
    public let smoke: [String: Smoke]
    public let solarPanel: [String: SolarPanel]
    public let solarPanelEquipment: [String: SolarPanelEquipment]
    public let splitter: [String: Splitter]
    public let sticker: [String: Sticker]
    public let storageTank: [String: StorageTank]
    public let straightRail: [String: StraightRail]
    public let technology: [String: Technology]
    public let tile: [String: Tile]
    public let tool: [String: Tool]
    public let trainPathAchievement: [String: TrainPathAchievement]
    public let trainStop: [String: TrainStop]
    public let trainUnit: [String: TrainUnit]? // TODO: Remove?
    public let transportBelt: [String: TransportBelt]
    public let tree: [String: Tree]
    public let turret: [String: Turret]
    public let undergroundBelt: [String: UndergroundBelt]
    public let unit: [String: Unit]
    public let unitSpawner: [String: UnitSpawner]
    public let virtualSignal: [String: VirtualSignal]
    public let wall: [String: Wall]
    
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
