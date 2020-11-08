import SwiftorioDataRaw

// Finds top level keys where items are locate. Output:
/*
 recipe: 188
 technology: 139
 item: 125
 module: 38
 utility-constants: 21
 tutorial: 13
 ammo: 13
 capsule: 11
 projectile: 10
 gun: 9
 fluid: 8
 resource: 7
 inserter: 7
 map-gen-presets: 7
 tile: 7
 noise-layer: 6
 autoplace-control: 6
 character: 6
 assembling-machine: 6
 ammo-category: 6
 item-with-entity-data: 6
 fluid-turret: 5
 logistic-container: 5
 armor: 5
 character-corpse: 5
 electric-pole: 4
 boiler: 4
 dont-build-entity-achievement: 4
 splitter: 4
 underground-belt: 4
 lab: 4
 tool: 4
 dont-use-entity-in-energy-production-achievement: 3
 car: 3
 custom-input: 3
 container: 3
 shortcut: 3
 transport-belt: 3
 produce-per-hour-achievement: 3
 furnace: 3
 mining-drill: 3
 simple-entity: 3
 generator: 3
 pipe-to-ground: 2
 rail-chain-signal: 2
 pump: 2
 offshore-pump: 2
 rocket-silo: 2
 item-subgroup: 2
 copy-paste-tool: 1
 beacon: 1
 blueprint: 1
 decider-combinator: 1
 rail-signal: 1
 wall: 1
 selection-tool: 1
 artillery-turret: 1
 reactor: 1
 curved-rail: 1
 train-stop: 1
 tile-effect: 1
 deconstruction-item: 1
 cliff: 1
 build-entity-achievement: 1
 fluid-wagon: 1
 land-mine: 1
 blueprint-book: 1
 utility-sprites: 1
 construction-robot: 1
 produce-achievement: 1
 fire: 1
 locomotive: 1
 artillery-wagon: 1
 heat-pipe: 1
 roboport: 1
 active-defense-equipment: 1
 infinity-pipe: 1
 accumulator: 1
 straight-rail: 1
 power-switch: 1
 ammo-turret: 1
 gate: 1
 rail-planner: 1
 fish: 1
 constant-combinator: 1
 solar-panel: 1
 electric-turret: 1
 arithmetic-combinator: 1
 programmable-speaker: 1
 repair-tool: 1
 lamp: 1
 player-damaged-achievement: 1
 cargo-wagon: 1
 pipe: 1
 logistic-robot: 1
 tree: 1
 storage-tank: 1
 radar: 1

 */
final class FindTopLevel {
    private let dataRawJsonStringProvider: DataRawJsonStringProvider
    
    init(dataRawJsonStringProvider: DataRawJsonStringProvider) {
        self.dataRawJsonStringProvider = dataRawJsonStringProvider
    }
    
    func find() throws {
        let string = try dataRawJsonStringProvider.dataRawJsonString()
        
        let jsonObject = try JSONSerialization.jsonObject(
            with: string.data(using: .utf8).unwrapOrThrow()
        )
        
        let dictionary = try (jsonObject as? [String: Any]).unwrapOrThrow()
        
        func containsItem(value: Any, item: String) -> Bool {
            switch value {
            case let array as [Any]:
                return array.contains { containsItem(value: $0, item: item) }
            case let dictionary as [String: Any]:
                return dictionary.contains { (key, value) -> Bool in
                    key == item || containsItem(value: value, item: item)
                }
            case let string as String:
                return item == string
            default:
                return false
            }
        }
        
        var topLevelContainers: [String: Int] = [:]
        
        for (index, item) in items.enumerated() {
            print("\(index)/\(items.count)")
            
            for (key, value) in dictionary {
                if containsItem(value: value, item: item) {
                    topLevelContainers[key, default: 0] += 1
                }
            }
        }
        
        let report = topLevelContainers
            .sorted { lhs, rhs in lhs.value > rhs.value }
            .map { "\($0.key): \($0.value)" }
            .joined(separator: "\n")
    
        print(report)
    }
    
    let items = [
        "accumulator",
        "advanced-circuit",
        "arithmetic-combinator",
        "artillery-shell",
        "artillery-targeting-remote",
        "artillery-turret",
        "artillery-wagon",
        "assembling-machine-1",
        "assembling-machine-2",
        "assembling-machine-3",
        "atomic-bomb",
        "battery",
        "battery-mk1",
        "battery-mk2",
        "beacon",
        "big-electric-pole",
        "blueprint",
        "blueprint-book",
        "boiler",
        "burner-inserter",
        "burner-mining-drill",
        "cannon-shell",
        "car",
        "cargo-wagon",
        "centrifuge",
        "chemical-plant",
        "cliff-explosives",
        "cluster-grenade",
        "coal",
        "combat-shotgun",
        "concrete",
        "constant-combinator",
        "construction-robot",
        "copper-cable",
        "copper-ore",
        "copper-plate",
        "crude-oil",
        "crude-oil-barrel",
        "decider-combinator",
        "deconstruction-planner",
        "defender-capsule",
        "destroyer-capsule",
        "discharge-defense",
        "discharge-defense-remote",
        "distractor-capsule",
        "effectivity-module",
        "effectivity-module-2",
        "effectivity-module-3",
        "electric-engine-unit",
        "electric-furnace",
        "electric-mining-drill",
        "electronic-circuit",
        "empty-barrel",
        "energy-shield",
        "energy-shield-mk2",
        "engine-unit",
        "exoskeleton",
        "explosive-cannon-shell",
        "explosive-rocket",
        "explosive-uranium-cannon-shell",
        "explosives",
        "express-splitter",
        "express-transport-belt",
        "express-underground-belt",
        "fast-inserter",
        "fast-splitter",
        "fast-transport-belt",
        "fast-underground-belt",
        "filter-inserter",
        "firearm-magazine",
        "flamethrower",
        "flamethrower-ammo",
        "flamethrower-turret",
        "fluid-wagon",
        "flying-robot-frame",
        "gate",
        "green-wire",
        "grenade",
        "gun-turret",
        "hazard-concrete",
        "heat-exchanger",
        "heat-pipe",
        "heavy-armor",
        "heavy-oil",
        "heavy-oil-barrel",
        "high-tech-science-pack",
        "inserter",
        "iron-axe",
        "iron-chest",
        "iron-gear-wheel",
        "iron-ore",
        "iron-plate",
        "iron-stick",
        "kovarex-enrichment-process",
        "lab",
        "lamp",
        "land-mine",
        "landfill",
        "laser-turret",
        "light-armor",
        "light-oil",
        "light-oil-barrel",
        "locomotive",
        "logistic-chest-active-provider",
        "logistic-chest-buffer",
        "logistic-chest-passive-provider",
        "logistic-chest-requester",
        "logistic-chest-storage",
        "logistic-robot",
        "long-handed-inserter",
        "low-density-structure",
        "lubricant",
        "lubricant-barrel",
        "medium-electric-pole",
        "military-science-pack",
        "modular-armor",
        "nightvision",
        "nuclear-fuel",
        "nuclear-fuel-reprocessing",
        "nuclear-reactor",
        "offshore-pump",
        "oil-refinery",
        "personal-laser-defense",
        "personal-roboport",
        "personal-roboport-mk2",
        "petroleum-gas",
        "petroleum-gas-barrel",
        "piercing-rounds-magazine",
        "piercing-shotgun-shells",
        "pipe",
        "pipe-to-ground",
        "pistol",
        "plastic-bar",
        "poison-capsule",
        "portable-fusion-reactor",
        "portable-solar-panel",
        "power-armor",
        "power-armor-mk2",
        "power-switch",
        "processing-unit",
        "production-science-pack",
        "productivity-module",
        "productivity-module-2",
        "productivity-module-3",
        "programmable-speaker",
        "pump",
        "pumpjack",
        "radar",
        "rail",
        "rail-chain-signal",
        "rail-signal",
        "raw-fish",
        "raw-wood",
        "red-wire",
        "refined-concrete",
        "refined-hazard-concrete",
        "repair-pack",
        "roboport",
        "rocket",
        "rocket-control-unit",
        "rocket-fuel",
        "rocket-launcher",
        "rocket-part",
        "rocket-silo",
        "satellite",
        "science-pack-1",
        "science-pack-2",
        "science-pack-3",
        "shotgun",
        "shotgun-shells",
        "slowdown-capsule",
        "small-electric-pole",
        "solar-panel",
        "solid-fuel",
        "space-science-pack",
        "speed-module",
        "speed-module-2",
        "speed-module-3",
        "splitter",
        "stack-filter-inserter",
        "stack-inserter",
        "steam",
        "steam-engine",
        "steam-turbine",
        "steel-axe",
        "steel-chest",
        "steel-furnace",
        "steel-plate",
        "stone",
        "stone-brick",
        "stone-furnace",
        "stone-wall",
        "storage-tank",
        "submachine-gun",
        "substation",
        "sulfur",
        "sulfuric-acid",
        "sulfuric-acid-barrel",
        "tank",
        "train-stop",
        "transport-belt",
        "underground-belt",
        "uranium-235",
        "uranium-238",
        "uranium-cannon-shell",
        "uranium-fuel-cell",
        "uranium-ore",
        "uranium-processing",
        "uranium-rounds-magazine",
        "used-up-uranium-fuel-cell",
        "water",
        "water-barrel",
        "wood",
        "wooden-chest",
    ]
}
