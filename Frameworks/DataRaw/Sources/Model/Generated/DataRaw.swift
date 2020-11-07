public final class DataRaw: Codable {
    public let researchAchievement: [String: ResearchAchievement]
    public let itemSubgroup: [String: ItemSubgroup]
    public let car: [String: Car]
    public let tree: [String: Tree]
    public let pipeToGround: [String: PipeToGround]
    public let flyingText: [String: FlyingText]
    public let fluid: [String: Fluid]
    public let mapSettings: [String: MapSettings]
    public let railChainSignal: [String: RailChainSignal]
    public let locomotive: [String: Locomotive]
    public let itemGroup: [String: ItemGroup]
    public let roboportEquipment: [String: RoboportEquipment]
    public let batteryEquipment: [String: BatteryEquipment]
    public let fish: [String: Fish]
    public let itemWithLabel: [String: ItemWithLabel]
    public let offshorePump: [String: OffshorePump]
    public let rocketSilo: [String: RocketSilo]
    public let buildEntityAchievement: [String: BuildEntityAchievement]
    public let railSignal: [String: RailSignal]
    public let assemblingMachine: [String: AssemblingMachine]
    public let equipment: [String: Equipment]? // TODO: Remove?
    public let electricTurret: [String: ElectricTurret]
    public let railRemnants: [String: RailRemnants]
    public let playerPort: [String: PlayerPort]
    public let loader: [String: Loader]
    public let lab: [String: Lab]
    public let item: [String: Item]
    public let constantCombinator: [String: ConstantCombinator]
    public let repairTool: [String: RepairTool]
    public let undergroundBelt: [String: UndergroundBelt]
    public let recipeCategory: [String: RecipeCategory]
    public let dontCraftManuallyAchievement: [String: DontCraftManuallyAchievement]
    public let solarPanelEquipment: [String: SolarPanelEquipment]
    public let ambientSound: [String: AmbientSound]
    public let font: [String: Font]
    public let itemEntity: [String: ItemEntity]
    public let guiStyle: [String: GuiStyle]
    public let lamp: [String: Lamp]
    public let module: [String: Module]
    public let resource: [String: Resource]
    public let playerDamagedAchievement: [String: PlayerDamagedAchievement]
    public let entity: [String: Entity]? // TODO: Remove?
    public let boiler: [String: Boiler]
    public let wall: [String: Wall]
    public let trainUnit: [String: TrainUnit]? // TODO: Remove?
    public let explosion: [String: Explosion]
    public let armor: [String: Armor]
    public let sticker: [String: Sticker]
    public let powerSwitch: [String: PowerSwitch]
    public let gun: [String: Gun]
    public let nightVisionEquipment: [String: NightVisionEquipment]
    public let deconstructionItem: [String: DeconstructionItem]
    public let particle: [String: Particle]
    public let smoke: [String: Smoke]
    public let selectionTool: [String: SelectionTool]
    public let fluidWagon: [String: FluidWagon]
    public let inserter: [String: Inserter]
    public let radar: [String: Radar]
    public let constructionRobot: [String: ConstructionRobot]
    public let producePerHourAchievement: [String: ProducePerHourAchievement]
    public let ammoTurret: [String: AmmoTurret]
    public let robot: [String: Robot]? // TODO: Remove?
    public let gate: [String: Gate]
    public let transportBelt: [String: TransportBelt]
    public let pipe: [String: Pipe]
    public let dontUseEntityInEnergyProductionAchievement: [String: DontUseEntityInEnergyProductionAchievement]
    public let trainPathAchievement: [String: TrainPathAchievement]
    public let unitSpawner: [String: UnitSpawner]
    public let generatorEquipment: [String: GeneratorEquipment]
    public let cargoWagon: [String: CargoWagon]
    public let groupAttackAchievement: [String: GroupAttackAchievement]
    public let damageType: [String: DamageType]
    public let technology: [String: Technology]
    public let tool: [String: Tool]
    public let ghost: [String: Ghost]? // TODO: Remove?
    public let arrow: [String: Arrow]
    public let ammo: [String: Ammo]
    public let energyShieldEquipment: [String: EnergyShieldEquipment]
    public let pipeConnectable: [String: PipeConnectable]? // TODO: Remove?
    public let produceAchievement: [String: ProduceAchievement]
    public let turret: [String: Turret]
    public let beltImmunityEquipment: [String: BeltImmunityEquipment]
    public let combatRobot: [String: CombatRobot]
    public let beacon: [String: Beacon]
    public let decorative: [String: Decorative]? // TODO: Remove?
    public let miningDrill: [String: MiningDrill]
    public let entityWithHealth: [String: EntityWithHealth]? // TODO: Remove?
    public let straightRail: [String: StraightRail]
    public let killAchievement: [String: KillAchievement]
    public let electricPole: [String: ElectricPole]
    public let activeDefenseEquipment: [String: ActiveDefenseEquipment]
    public let unit: [String: Unit]
    public let capsule: [String: Capsule]
    public let tile: [String: Tile]
    public let curvedRail: [String: CurvedRail]
    public let storageTank: [String: StorageTank]
    public let resourceCategory: [String: ResourceCategory]
    public let accumulator: [String: Accumulator]
    public let smartContainer: [String: SmartContainer]? // TODO: Remove?
    public let blueprintBook: [String: BlueprintBook]
    public let deciderCombinator: [String: DeciderCombinator]
    public let splitter: [String: Splitter]
    public let rocketDefense: [String: RocketDefense]? // TODO: Remove?
    public let recipe: [String: Recipe]
    public let noiseLayer: [String: NoiseLayer]
    public let corpse: [String: Corpse]
    public let solarPanel: [String: SolarPanel]
    public let ammoCategory: [String: AmmoCategory]
    public let dontBuildEntityAchievement: [String: DontBuildEntityAchievement]
    public let player: [String: Player]? // TODO: Remove?
    public let roboport: [String: Roboport]
    public let container: [String: Container]
    public let generator: [String: Generator]
    public let logisticContainer: [String: LogisticContainer]
    public let arithmeticCombinator: [String: ArithmeticCombinator]
    public let autoplaceControl: [String: AutoplaceControl]
    public let itemWithEntityData: [String: ItemWithEntityData]
    public let railCategory: [String: RailCategory]? // TODO: Remove?
    public let fluidTurret: [String: FluidTurret]
    public let landMine: [String: LandMine]
    public let logisticRobot: [String: LogisticRobot]
    public let trainStop: [String: TrainStop]
    public let achievement: [String: Achievement]
    public let constructWithRobotsAchievement: [String: ConstructWithRobotsAchievement]
    public let market: [String: Market]
    public let deconstructWithRobotsAchievement: [String: DeconstructWithRobotsAchievement]
    public let pump: [String: Pump]
    public let finishTheGameAchievement: [String: FinishTheGameAchievement]
    public let projectile: [String: Projectile]
    public let furnace: [String: Furnace]
    public let virtualSignal: [String: VirtualSignal]
    public let deliverByRobotsAchievement: [String: DeliverByRobotsAchievement]
    public let miningTool: [String: MiningTool]
    public let itemWithInventory: [String: ItemWithInventory]
    public let movementBonusEquipment: [String: MovementBonusEquipment]
    public let blueprint: [String: Blueprint]
    
    enum CodingKeys: String, CodingKey {
        case researchAchievement = "research-achievement"
        case itemSubgroup = "item-subgroup"
        case car
        case tree
        case pipeToGround = "pipe-to-ground"
        case flyingText = "flying-text"
        case fluid
        case mapSettings = "map-settings"
        case railChainSignal = "rail-chain-signal"
        case locomotive
        case itemGroup = "item-group"
        case roboportEquipment = "roboport-equipment"
        case batteryEquipment = "battery-equipment"
        case fish
        case itemWithLabel = "item-with-label"
        case offshorePump = "offshore-pump"
        case rocketSilo = "rocket-silo"
        case buildEntityAchievement = "build-entity-achievement"
        case railSignal = "rail-signal"
        case assemblingMachine = "assembling-machine"
        case equipment
        case electricTurret = "electric-turret"
        case railRemnants = "rail-remnants"
        case playerPort = "player-port"
        case loader
        case lab
        case item
        case constantCombinator = "constant-combinator"
        case repairTool = "repair-tool"
        case undergroundBelt = "underground-belt"
        case recipeCategory = "recipe-category"
        case dontCraftManuallyAchievement = "dont-craft-manually-achievement"
        case solarPanelEquipment = "solar-panel-equipment"
        case ambientSound = "ambient-sound"
        case font
        case itemEntity = "item-entity"
        case guiStyle = "gui-style"
        case lamp
        case module
        case resource
        case playerDamagedAchievement = "player-damaged-achievement"
        case entity
        case boiler
        case wall
        case trainUnit = "train-unit"
        case explosion
        case armor
        case sticker
        case powerSwitch = "power-switch"
        case gun
        case nightVisionEquipment = "night-vision-equipment"
        case deconstructionItem = "deconstruction-item"
        case particle
        case smoke
        case selectionTool = "selection-tool"
        case fluidWagon = "fluid-wagon"
        case inserter
        case radar
        case constructionRobot = "construction-robot"
        case producePerHourAchievement = "produce-per-hour-achievement"
        case ammoTurret = "ammo-turret"
        case robot
        case gate
        case transportBelt = "transport-belt"
        case pipe
        case dontUseEntityInEnergyProductionAchievement = "dont-use-entity-in-energy-production-achievement"
        case trainPathAchievement = "train-path-achievement"
        case unitSpawner = "unit-spawner"
        case generatorEquipment = "generator-equipment"
        case cargoWagon = "cargo-wagon"
        case groupAttackAchievement = "group-attack-achievement"
        case damageType = "damage-type"
        case technology
        case tool
        case ghost
        case arrow
        case ammo
        case energyShieldEquipment = "energy-shield-equipment"
        case pipeConnectable = "pipe-connectable"
        case produceAchievement = "produce-achievement"
        case turret
        case beltImmunityEquipment = "belt-immunity-equipment"
        case combatRobot = "combat-robot"
        case beacon
        case decorative
        case miningDrill = "mining-drill"
        case entityWithHealth = "entity-with-health"
        case straightRail = "straight-rail"
        case killAchievement = "kill-achievement"
        case electricPole = "electric-pole"
        case activeDefenseEquipment = "active-defense-equipment"
        case unit
        case capsule
        case tile
        case curvedRail = "curved-rail"
        case storageTank = "storage-tank"
        case resourceCategory = "resource-category"
        case accumulator
        case smartContainer = "smart-container"
        case blueprintBook = "blueprint-book"
        case deciderCombinator = "decider-combinator"
        case splitter
        case rocketDefense = "rocket-defense"
        case recipe
        case noiseLayer = "noise-layer"
        case corpse
        case solarPanel = "solar-panel"
        case ammoCategory = "ammo-category"
        case dontBuildEntityAchievement = "dont-build-entity-achievement"
        case player
        case roboport
        case container
        case generator
        case logisticContainer = "logistic-container"
        case arithmeticCombinator = "arithmetic-combinator"
        case autoplaceControl = "autoplace-control"
        case itemWithEntityData = "item-with-entity-data"
        case railCategory = "rail-category"
        case fluidTurret = "fluid-turret"
        case landMine = "land-mine"
        case logisticRobot = "logistic-robot"
        case trainStop = "train-stop"
        case achievement
        case constructWithRobotsAchievement = "construct-with-robots-achievement"
        case market
        case deconstructWithRobotsAchievement = "deconstruct-with-robots-achievement"
        case pump
        case finishTheGameAchievement = "finish-the-game-achievement"
        case projectile
        case furnace
        case virtualSignal = "virtual-signal"
        case deliverByRobotsAchievement = "deliver-by-robots-achievement"
        case miningTool = "mining-tool"
        case itemWithInventory = "item-with-inventory"
        case movementBonusEquipment = "movement-bonus-equipment"
        case blueprint
    }
}
