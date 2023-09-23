RECIPE {
    type = "recipe",
    name = "farm-1",
    energy_required = 1,
    enabled = true,
    ingredients = {
        {"raw-wood", 10},
    },
    results = {
        {"farm-1", 1}
    }
}

ITEM {
    type = "item",
    name = "farm-1",
    icon = "__MoP__/graphics/icons/botanical-nursery.png",
    icon_size = 32,
    subgroup = "mop-items",
    order = "f",
    place_result = "farm-1",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "farm-1",
    icon = "__MoP__/graphics/icons/botanical-nursery.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "farm-1"},
    fast_replaceable_group = "farms",
    max_health = 100,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-13.3, -13.3}, {13.3, 13.3}},
    selection_box = {{-13.5, -13.5}, {13.5, 13.5}},
    module_specification = {
        module_slots = 0
    },
    allowed_effects = {"speed", "productivity"},
    crafting_categories = {"farms"},
    crafting_speed = 1,
    energy_source = {
      type = "burner",
      effectivity = 1,
	  fuel_category = "labor",
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
      emissions = 0.00,
    },
    energy_usage = "60kW",
    ingredient_count = 1,
    animation = {
        filename = "__MoP__/graphics/entity/botanical-nursery/botanical-nursery.png",
        width = 260,
        height = 254,
		scale = 4,
        line_length = 7,
        frame_count = 35,
        animation_speed = 0.4,
        run_mode = "forward-then-backward",
        shift = {0.1, 0.1}
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__MoP__/sounds/botanical-nursery.ogg", volume = 1.8},
        idle_sound = {filename = "__MoP__/sounds/botanical-nursery.ogg", volume = 0.95},
        apparent_volume = 2.5
    }
}
