public final class DataRaw: Codable {
    public let landMine: LandMine
    public let electricPole: ElectricPole
    public let unitSpawner: UnitSpawner
    public let movementBonusEquipment: MovementBonusEquipment
    public let font: Font
    public let energyShieldEquipment: EnergyShieldEquipment
    public let armor: Armor
    public let nightVisionEquipment: NightVisionEquipment
    public let lab: Lab
    public let player: Player
    public let batteryEquipment: BatteryEquipment
    public let dontBuildEntityAchievement: DontBuildEntityAchievement
    public let gun: Gun
    public let railSignal: RailSignal
    public let ammoCategory: AmmoCategory
    public let transportBelt: TransportBelt
    public let railRemnants: RailRemnants
    public let smartContainer: SmartContainer
    public let solarPanelEquipment: SolarPanelEquipment
    public let researchAchievement: ResearchAchievement
    public let achievement: Achievement
    public let virtualSignal: VirtualSignal
    public let turret: Turret
    public let selectionTool: SelectionTool
    public let pump: Pump
    public let assemblingMachine: AssemblingMachine
    public let particle: Particle
    public let robot: Robot
    public let buildEntityAchievement: BuildEntityAchievement
    public let activeDefenseEquipment: ActiveDefenseEquipment
    public let arrow: Arrow
    public let lamp: Lamp
    public let furnace: Furnace
    public let corpse: Corpse
    public let deliverByRobotsAchievement: DeliverByRobotsAchievement
    public let arithmeticCombinator: ArithmeticCombinator
    public let offshorePump: OffshorePump
    public let ambientSound: AmbientSound
    public let curvedRail: CurvedRail
    public let trainUnit: TrainUnit
    public let capsule: Capsule
    public let ammoTurret: AmmoTurret
    public let playerDamagedAchievement: PlayerDamagedAchievement
    public let fluidWagon: FluidWagon
    public let groupAttackAchievement: GroupAttackAchievement
    public let entityWithHealth: EntityWithHealth
    public let constructionRobot: ConstructionRobot
    public let pipeToGround: PipeToGround
    public let wall: Wall
    public let projectile: Projectile
    public let technology: Technology
    public let gate: Gate
    public let deciderCombinator: DeciderCombinator
    public let electricTurret: ElectricTurret
    public let guiStyle: GuiStyle
    public let noiseLayer: NoiseLayer
    public let splitter: Splitter
    public let powerSwitch: PowerSwitch
    public let tool: Tool
    public let dontCraftManuallyAchievement: DontCraftManuallyAchievement
    public let generatorEquipment: GeneratorEquipment
    public let miningTool: MiningTool
    public let producePerHourAchievement: ProducePerHourAchievement
    public let inserter: Inserter
    public let damageType: DamageType
    public let produceAchievement: ProduceAchievement
    public let logisticContainer: LogisticContainer
    public let finishTheGameAchievement: FinishTheGameAchievement
    public let rocketDefense: RocketDefense
    public let railCategory: RailCategory
    public let rocketSilo: RocketSilo
    public let itemSubgroup: ItemSubgroup
    public let cargoWagon: CargoWagon
    public let tree: Tree
    public let blueprint: Blueprint
    public let deconstructWithRobotsAchievement: DeconstructWithRobotsAchievement
    public let beltImmunityEquipment: BeltImmunityEquipment
    public let radar: Radar
    public let ghost: Ghost
    public let locomotive: Locomotive
    public let itemWithLabel: ItemWithLabel
    public let item: Item
    public let dontUseEntityInEnergyProductionAchievement: DontUseEntityInEnergyProductionAchievement
    public let logisticRobot: LogisticRobot
    public let trainStop: TrainStop
    public let itemWithInventory: ItemWithInventory
    public let car: Car
    public let generator: Generator
    public let straightRail: StraightRail
    public let tile: Tile
    public let sticker: Sticker
    public let fluid: Fluid
    public let unit: Unit
    public let miningDrill: MiningDrill
    public let equipment: Equipment
    public let fluidTurret: FluidTurret
    public let trainPathAchievement: TrainPathAchievement
    public let resource: Resource
    public let itemGroup: ItemGroup
    public let repairTool: RepairTool
    public let fish: Fish
    public let roboportEquipment: RoboportEquipment
    public let storageTank: StorageTank
    public let container: Container
    public let market: Market
    public let beacon: Beacon
    public let pipe: Pipe
    public let recipeCategory: RecipeCategory
    public let itemEntity: ItemEntity
    public let resourceCategory: ResourceCategory
    public let accumulator: Accumulator
    public let smoke: Smoke
    public let constantCombinator: ConstantCombinator
    public let undergroundBelt: UndergroundBelt
    public let playerPort: PlayerPort
    public let pipeConnectable: PipeConnectable
    public let railChainSignal: RailChainSignal
    public let boiler: Boiler
    public let solarPanel: SolarPanel
    public let loader: Loader
    public let decorative: Decorative
    public let ammo: Ammo
    public let recipe: Recipe
    public let constructWithRobotsAchievement: ConstructWithRobotsAchievement
    public let entity: Entity
    public let blueprintBook: BlueprintBook
    public let roboport: Roboport
    public let module: Module
    public let flyingText: FlyingText
    public let combatRobot: CombatRobot
    public let killAchievement: KillAchievement
    public let mapSettings: MapSettings
    public let itemWithEntityData: ItemWithEntityData
    public let autoplaceControl: AutoplaceControl
    public let deconstructionItem: DeconstructionItem
    public let explosion: Explosion
    
    enum CodingKeys: String, CodingKey {
        case landMine = "land-mine"
        case electricPole = "electric-pole"
        case unitSpawner = "unit-spawner"
        case movementBonusEquipment = "movement-bonus-equipment"
        case font
        case energyShieldEquipment = "energy-shield-equipment"
        case armor
        case nightVisionEquipment = "night-vision-equipment"
        case lab
        case player
        case batteryEquipment = "battery-equipment"
        case dontBuildEntityAchievement = "dont-build-entity-achievement"
        case gun
        case railSignal = "rail-signal"
        case ammoCategory = "ammo-category"
        case transportBelt = "transport-belt"
        case railRemnants = "rail-remnants"
        case smartContainer = "smart-container"
        case solarPanelEquipment = "solar-panel-equipment"
        case researchAchievement = "research-achievement"
        case achievement
        case virtualSignal = "virtual-signal"
        case turret
        case selectionTool = "selection-tool"
        case pump
        case assemblingMachine = "assembling-machine"
        case particle
        case robot
        case buildEntityAchievement = "build-entity-achievement"
        case activeDefenseEquipment = "active-defense-equipment"
        case arrow
        case lamp
        case furnace
        case corpse
        case deliverByRobotsAchievement = "deliver-by-robots-achievement"
        case arithmeticCombinator = "arithmetic-combinator"
        case offshorePump = "offshore-pump"
        case ambientSound = "ambient-sound"
        case curvedRail = "curved-rail"
        case trainUnit = "train-unit"
        case capsule
        case ammoTurret = "ammo-turret"
        case playerDamagedAchievement = "player-damaged-achievement"
        case fluidWagon = "fluid-wagon"
        case groupAttackAchievement = "group-attack-achievement"
        case entityWithHealth = "entity-with-health"
        case constructionRobot = "construction-robot"
        case pipeToGround = "pipe-to-ground"
        case wall
        case projectile
        case technology
        case gate
        case deciderCombinator = "decider-combinator"
        case electricTurret = "electric-turret"
        case guiStyle = "gui-style"
        case noiseLayer = "noise-layer"
        case splitter
        case powerSwitch = "power-switch"
        case tool
        case dontCraftManuallyAchievement = "dont-craft-manually-achievement"
        case generatorEquipment = "generator-equipment"
        case miningTool = "mining-tool"
        case producePerHourAchievement = "produce-per-hour-achievement"
        case inserter
        case damageType = "damage-type"
        case produceAchievement = "produce-achievement"
        case logisticContainer = "logistic-container"
        case finishTheGameAchievement = "finish-the-game-achievement"
        case rocketDefense = "rocket-defense"
        case railCategory = "rail-category"
        case rocketSilo = "rocket-silo"
        case itemSubgroup = "item-subgroup"
        case cargoWagon = "cargo-wagon"
        case tree
        case blueprint
        case deconstructWithRobotsAchievement = "deconstruct-with-robots-achievement"
        case beltImmunityEquipment = "belt-immunity-equipment"
        case radar
        case ghost
        case locomotive
        case itemWithLabel = "item-with-label"
        case item
        case dontUseEntityInEnergyProductionAchievement = "dont-use-entity-in-energy-production-achievement"
        case logisticRobot = "logistic-robot"
        case trainStop = "train-stop"
        case itemWithInventory = "item-with-inventory"
        case car
        case generator
        case straightRail = "straight-rail"
        case tile
        case sticker
        case fluid
        case unit
        case miningDrill = "mining-drill"
        case equipment
        case fluidTurret = "fluid-turret"
        case trainPathAchievement = "train-path-achievement"
        case resource
        case itemGroup = "item-group"
        case repairTool = "repair-tool"
        case fish
        case roboportEquipment = "roboport-equipment"
        case storageTank = "storage-tank"
        case container
        case market
        case beacon
        case pipe
        case recipeCategory = "recipe-category"
        case itemEntity = "item-entity"
        case resourceCategory = "resource-category"
        case accumulator
        case smoke
        case constantCombinator = "constant-combinator"
        case undergroundBelt = "underground-belt"
        case playerPort = "player-port"
        case pipeConnectable = "pipe-connectable"
        case railChainSignal = "rail-chain-signal"
        case boiler
        case solarPanel = "solar-panel"
        case loader
        case decorative
        case ammo
        case recipe
        case constructWithRobotsAchievement = "construct-with-robots-achievement"
        case entity
        case blueprintBook = "blueprint-book"
        case roboport
        case module
        case flyingText = "flying-text"
        case combatRobot = "combat-robot"
        case killAchievement = "kill-achievement"
        case mapSettings = "map-settings"
        case itemWithEntityData = "item-with-entity-data"
        case autoplaceControl = "autoplace-control"
        case deconstructionItem = "deconstruction-item"
        case explosion
    }
}