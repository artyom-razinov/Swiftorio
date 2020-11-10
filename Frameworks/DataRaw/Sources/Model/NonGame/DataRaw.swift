public final class DataRaw: Codable {
    public let accumulator: PrototypeDictionary<AccumulatorPrototypeName, AccumulatorPrototype>
    public let achievement: PrototypeDictionary<AchievementPrototypeName, AchievementPrototype>
    public let activeDefenseEquipment: PrototypeDictionary<ActiveDefenseEquipmentPrototypeName, ActiveDefenseEquipmentPrototype>
    public let ambientSound: PrototypeDictionary<AmbientSoundPrototypeName, AmbientSoundPrototype>
    public let ammo: PrototypeDictionary<AmmoPrototypeName, AmmoPrototype>
    public let ammoCategory: PrototypeDictionary<AmmoCategoryPrototypeName, AmmoCategoryPrototype>
    public let ammoTurret: PrototypeDictionary<AmmoTurretPrototypeName, AmmoTurretPrototype>
    public let arithmeticCombinator: PrototypeDictionary<ArithmeticCombinatorPrototypeName, ArithmeticCombinatorPrototype>
    public let armor: PrototypeDictionary<ArmorPrototypeName, ArmorPrototype>
    public let arrow: PrototypeDictionary<ArrowPrototypeName, ArrowPrototype>
    public let assemblingMachine: PrototypeDictionary<AssemblingMachinePrototypeName, AssemblingMachinePrototype>
    public let autoplaceControl: PrototypeDictionary<AutoplaceControlPrototypeName, AutoplaceControlPrototype>
    public let batteryEquipment: PrototypeDictionary<BatteryEquipmentPrototypeName, BatteryEquipmentPrototype>
    public let beacon: PrototypeDictionary<BeaconPrototypeName, BeaconPrototype>
    public let beltImmunityEquipment: PrototypeDictionary<BeltImmunityEquipmentPrototypeName, BeltImmunityEquipmentPrototype>
    public let blueprint: PrototypeDictionary<BlueprintPrototypeName, BlueprintPrototype>
    public let blueprintBook: PrototypeDictionary<BlueprintBookPrototypeName, BlueprintBookPrototype>
    public let boiler: PrototypeDictionary<BoilerPrototypeName, BoilerPrototype>
    public let buildEntityAchievement: PrototypeDictionary<BuildEntityAchievementPrototypeName, BuildEntityAchievementPrototype>
    public let capsule: PrototypeDictionary<CapsulePrototypeName, CapsulePrototype>
    public let car: PrototypeDictionary<CarPrototypeName, CarPrototype>
    public let cargoWagon: PrototypeDictionary<CargoWagonPrototypeName, CargoWagonPrototype>
    public let combatRobot: PrototypeDictionary<CombatRobotPrototypeName, CombatRobotPrototype>
    public let constantCombinator: PrototypeDictionary<ConstantCombinatorPrototypeName, ConstantCombinatorPrototype>
    public let constructWithRobotsAchievement: PrototypeDictionary<ConstructWithRobotsAchievementPrototypeName, ConstructWithRobotsAchievementPrototype>
    public let constructionRobot: PrototypeDictionary<ConstructionRobotPrototypeName, ConstructionRobotPrototype>
    public let container: PrototypeDictionary<ContainerPrototypeName, ContainerPrototype>
    public let corpse: PrototypeDictionary<CorpsePrototypeName, CorpsePrototype>
    public let curvedRail: PrototypeDictionary<CurvedRailPrototypeName, CurvedRailPrototype>
    public let damageType: PrototypeDictionary<DamageTypePrototypeName, DamageTypePrototype>
    public let deciderCombinator: PrototypeDictionary<DeciderCombinatorPrototypeName, DeciderCombinatorPrototype>
    public let deconstructWithRobotsAchievement: PrototypeDictionary<DeconstructWithRobotsAchievementPrototypeName, DeconstructWithRobotsAchievementPrototype>
    public let deconstructionItem: PrototypeDictionary<DeconstructionItemPrototypeName, DeconstructionItemPrototype>
    public let decorative: PrototypeDictionary<DecorativePrototypeName, DecorativePrototype>? // TODO: Remove?
    public let deliverByRobotsAchievement: PrototypeDictionary<DeliverByRobotsAchievementPrototypeName, DeliverByRobotsAchievementPrototype>
    public let dontBuildEntityAchievement: PrototypeDictionary<DontBuildEntityAchievementPrototypeName, DontBuildEntityAchievementPrototype>
    public let dontCraftManuallyAchievement: PrototypeDictionary<DontCraftManuallyAchievementPrototypeName, DontCraftManuallyAchievementPrototype>
    public let dontUseEntityInEnergyProductionAchievement: PrototypeDictionary<DontUseEntityInEnergyProductionAchievementPrototypeName, DontUseEntityInEnergyProductionAchievementPrototype>
    public let electricPole: PrototypeDictionary<ElectricPolePrototypeName, ElectricPolePrototype>
    public let electricTurret: PrototypeDictionary<ElectricTurretPrototypeName, ElectricTurretPrototype>
    public let energyShieldEquipment: PrototypeDictionary<EnergyShieldEquipmentPrototypeName, EnergyShieldEquipmentPrototype>
    public let entity: PrototypeDictionary<EntityPrototypeName, EntityPrototype>? // TODO: Remove?
    public let entityWithHealth: PrototypeDictionary<EntityWithHealthPrototypeName, EntityWithHealthPrototype>? // TODO: Remove?
    public let equipment: PrototypeDictionary<EquipmentPrototypeName, EquipmentPrototype>? // TODO: Remove?
    public let explosion: PrototypeDictionary<ExplosionPrototypeName, ExplosionPrototype>
    public let finishTheGameAchievement: PrototypeDictionary<FinishTheGameAchievementPrototypeName, FinishTheGameAchievementPrototype>
    public let fish: PrototypeDictionary<FishPrototypeName, FishPrototype>
    public let fluid: PrototypeDictionary<FluidPrototypeName, FluidPrototype>
    public let fluidTurret: PrototypeDictionary<FluidTurretPrototypeName, FluidTurretPrototype>
    public let fluidWagon: PrototypeDictionary<FluidWagonPrototypeName, FluidWagonPrototype>
    public let flyingText: PrototypeDictionary<FlyingTextPrototypeName, FlyingTextPrototype>
    public let font: PrototypeDictionary<FontPrototypeName, FontPrototype>
    public let furnace: PrototypeDictionary<FurnacePrototypeName, FurnacePrototype>
    public let gate: PrototypeDictionary<GatePrototypeName, GatePrototype>
    public let generator: PrototypeDictionary<GeneratorPrototypeName, GeneratorPrototype>
    public let generatorEquipment: PrototypeDictionary<GeneratorEquipmentPrototypeName, GeneratorEquipmentPrototype>
    public let ghost: PrototypeDictionary<GhostPrototypeName, GhostPrototype>? // TODO: Remove?
    public let groupAttackAchievement: PrototypeDictionary<GroupAttackAchievementPrototypeName, GroupAttackAchievementPrototype>
    public let guiStyle: PrototypeDictionary<GuiStylePrototypeName, GuiStylePrototype>
    public let gun: PrototypeDictionary<GunPrototypeName, GunPrototype>
    public let inserter: PrototypeDictionary<InserterPrototypeName, InserterPrototype>
    public let item: PrototypeDictionary<ItemPrototypeName, ItemPrototype>
    public let itemEntity: PrototypeDictionary<ItemEntityPrototypeName, ItemEntityPrototype>
    public let itemGroup: PrototypeDictionary<ItemGroupPrototypeName, ItemGroupPrototype>
    public let itemSubgroup: PrototypeDictionary<ItemSubgroupPrototypeName, ItemSubgroupPrototype>
    public let itemWithEntityData: PrototypeDictionary<ItemWithEntityDataPrototypeName, ItemWithEntityDataPrototype>
    public let itemWithInventory: PrototypeDictionary<ItemWithInventoryPrototypeName, ItemWithInventoryPrototype>
    public let itemWithLabel: PrototypeDictionary<ItemWithLabelPrototypeName, ItemWithLabelPrototype>
    public let killAchievement: PrototypeDictionary<KillAchievementPrototypeName, KillAchievementPrototype>
    public let lab: PrototypeDictionary<LabPrototypeName, LabPrototype>
    public let lamp: PrototypeDictionary<LampPrototypeName, LampPrototype>
    public let landMine: PrototypeDictionary<LandMinePrototypeName, LandMinePrototype>
    public let loader: PrototypeDictionary<LoaderPrototypeName, LoaderPrototype>
    public let locomotive: PrototypeDictionary<LocomotivePrototypeName, LocomotivePrototype>
    public let logisticContainer: PrototypeDictionary<LogisticContainerPrototypeName, LogisticContainerPrototype>
    public let logisticRobot: PrototypeDictionary<LogisticRobotPrototypeName, LogisticRobotPrototype>
    public let mapSettings: PrototypeDictionary<MapSettingsPrototypeName, MapSettingsPrototype>
    public let market: PrototypeDictionary<MarketPrototypeName, MarketPrototype>
    public let miningDrill: PrototypeDictionary<MiningDrillPrototypeName, MiningDrillPrototype>
    public let miningTool: PrototypeDictionary<MiningToolPrototypeName, MiningToolPrototype>
    public let module: PrototypeDictionary<ModulePrototypeName, ModulePrototype>
    public let movementBonusEquipment: PrototypeDictionary<MovementBonusEquipmentPrototypeName, MovementBonusEquipmentPrototype>
    public let nightVisionEquipment: PrototypeDictionary<NightVisionEquipmentPrototypeName, NightVisionEquipmentPrototype>
    public let noiseLayer: PrototypeDictionary<NoiseLayerPrototypeName, NoiseLayerPrototype>
    public let offshorePump: PrototypeDictionary<OffshorePumpPrototypeName, OffshorePumpPrototype>
    public let particle: PrototypeDictionary<ParticlePrototypeName, ParticlePrototype>
    public let pipe: PrototypeDictionary<PipePrototypeName, PipePrototype>
    public let pipeConnectable: PrototypeDictionary<PipeConnectablePrototypeName, PipeConnectablePrototype>? // TODO: Remove?
    public let pipeToGround: PrototypeDictionary<PipeToGroundPrototypeName, PipeToGroundPrototype>
    public let player: PrototypeDictionary<PlayerPrototypeName, PlayerPrototype>? // TODO: Remove?
    public let playerDamagedAchievement: PrototypeDictionary<PlayerDamagedAchievementPrototypeName, PlayerDamagedAchievementPrototype>
    public let playerPort: PrototypeDictionary<PlayerPortPrototypeName, PlayerPortPrototype>
    public let powerSwitch: PrototypeDictionary<PowerSwitchPrototypeName, PowerSwitchPrototype>
    public let produceAchievement: PrototypeDictionary<ProduceAchievementPrototypeName, ProduceAchievementPrototype>
    public let producePerHourAchievement: PrototypeDictionary<ProducePerHourAchievementPrototypeName, ProducePerHourAchievementPrototype>
    public let projectile: PrototypeDictionary<ProjectilePrototypeName, ProjectilePrototype>
    public let pump: PrototypeDictionary<PumpPrototypeName, PumpPrototype>
    public let radar: PrototypeDictionary<RadarPrototypeName, RadarPrototype>
    public let railCategory: PrototypeDictionary<RailCategoryPrototypeName, RailCategoryPrototype>? // TODO: Remove?
    public let railChainSignal: PrototypeDictionary<RailChainSignalPrototypeName, RailChainSignalPrototype>
    public let railRemnants: PrototypeDictionary<RailRemnantsPrototypeName, RailRemnantsPrototype>
    public let railSignal: PrototypeDictionary<RailSignalPrototypeName, RailSignalPrototype>
    public let recipe: PrototypeDictionary<RecipePrototypeName, RecipePrototype>
    public let recipeCategory: PrototypeDictionary<RecipeCategoryPrototypeName, RecipeCategoryPrototype>
    public let repairTool: PrototypeDictionary<RepairToolPrototypeName, RepairToolPrototype>
    public let researchAchievement: PrototypeDictionary<ResearchAchievementPrototypeName, ResearchAchievementPrototype>
    public let resource: PrototypeDictionary<ResourceEntityPrototypeName, ResourceEntityPrototype>
    public let resourceCategory: PrototypeDictionary<ResourceCategoryPrototypeName, ResourceCategoryPrototype>
    public let roboport: PrototypeDictionary<RoboportPrototypeName, RoboportPrototype>
    public let roboportEquipment: PrototypeDictionary<RoboportEquipmentPrototypeName, RoboportEquipmentPrototype>
    public let robot: PrototypeDictionary<RobotPrototypeName, RobotPrototype>? // TODO: Remove?
    public let rocketDefense: PrototypeDictionary<RocketDefensePrototypeName, RocketDefensePrototype>? // TODO: Remove?
    public let rocketSilo: PrototypeDictionary<RocketSiloPrototypeName, RocketSiloPrototype>
    public let selectionTool: PrototypeDictionary<SelectionToolPrototypeName, SelectionToolPrototype>
    public let smartContainer: PrototypeDictionary<SmartContainerPrototypeName, SmartContainerPrototype>? // TODO: Remove?
    public let smoke: PrototypeDictionary<SmokePrototypeName, SmokePrototype>
    public let solarPanel: PrototypeDictionary<SolarPanelPrototypeName, SolarPanelPrototype>
    public let solarPanelEquipment: PrototypeDictionary<SolarPanelEquipmentPrototypeName, SolarPanelEquipmentPrototype>
    public let splitter: PrototypeDictionary<SplitterPrototypeName, SplitterPrototype>
    public let sticker: PrototypeDictionary<StickerPrototypeName, StickerPrototype>
    public let storageTank: PrototypeDictionary<StorageTankPrototypeName, StorageTankPrototype>
    public let straightRail: PrototypeDictionary<StraightRailPrototypeName, StraightRailPrototype>
    public let technology: PrototypeDictionary<TechnologyPrototypeName, TechnologyPrototype>
    public let tile: PrototypeDictionary<TilePrototypeName, TilePrototype>
    public let tool: PrototypeDictionary<ToolPrototypeName, ToolPrototype>
    public let trainPathAchievement: PrototypeDictionary<TrainPathAchievementPrototypeName, TrainPathAchievementPrototype>
    public let trainStop: PrototypeDictionary<TrainStopPrototypeName, TrainStopPrototype>
    public let trainUnit: PrototypeDictionary<TrainUnitPrototypeName, TrainUnitPrototype>? // TODO: Remove?
    public let transportBelt: PrototypeDictionary<TransportBeltPrototypeName, TransportBeltPrototype>
    public let tree: PrototypeDictionary<TreePrototypeName, TreePrototype>
    public let turret: PrototypeDictionary<TurretPrototypeName, TurretPrototype>
    public let undergroundBelt: PrototypeDictionary<UndergroundBeltPrototypeName, UndergroundBeltPrototype>
    public let unit: PrototypeDictionary<UnitPrototypeName, UnitPrototype>
    public let unitSpawner: PrototypeDictionary<UnitSpawnerPrototypeName, UnitSpawnerPrototype>
    public let virtualSignal: PrototypeDictionary<VirtualSignalPrototypeName, VirtualSignalPrototype>
    public let wall: PrototypeDictionary<WallPrototypeName, WallPrototype>
    
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
