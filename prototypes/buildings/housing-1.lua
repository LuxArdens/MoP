local pipes = {
    north = {
        filename = "__MoP__/graphics/entity/botanical-nursery/top.png",
        priority = "low",
        width = 260,
        height = 254
    },
    south = {
        filename = "__MoP__/graphics/entity/botanical-nursery/bottom.png",
        priority = "extra-high",
        width = 260,
        height = 254
    },
    west = {
        filename = "__MoP__/graphics/entity/botanical-nursery/left.png",
        priority = "very-low",
        width = 260,
        height = 254
    },
    east = {
        filename = "__MoP__/graphics/entity/botanical-nursery/right.png",
        priority = "extra-high",
        width = 260,
        height = 254
    }
}

RECIPE {
    type = "recipe",
    name = "housing-1",
    energy_required = 1,
    enabled = true,
    ingredients = {
        {"raw-wood", 10},
    },
    results = {
        {"housing-1", 1}
    }
}

ITEM {
    type = "item",
    name = "housing-1",
    icon = "__MoP__/graphics/icons/botanical-nursery.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "mop-items",
    order = "f",
    place_result = "housing-1",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "housing-1",
    icon = "__MoP__/graphics/icons/botanical-nursery.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "housing-1"},
    fast_replaceable_group = "housing",
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification = {
        module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"housing"},
    crafting_speed = 1,
    energy_source = {
      type = "burner",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions = 0.00,
    },
    energy_usage = "0.000001kW",
    ingredient_count = 4,
    animation = {
        filename = "__MoP__/graphics/entity/botanical-nursery/botanical-nursery.png",
        width = 260,
        height = 254,
        line_length = 7,
        frame_count = 35,
        animation_speed = 0.4,
        run_mode = "forward-then-backward",
        shift = {0.1, 0.1}
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.2, 4.13}, {0.12, -4.03}, {4.115, 0.1}, {-3.88, 0.16}, pipes),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 4.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.2, 4.13}, {0.12, -4.03}, {4.115, 0.1}, {-3.88, 0.16}, pipes),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, -4.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.2, 4.13}, {0.12, -4.03}, {4.115, 0.1}, {-3.88, 0.16}, pipes),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {4.0, 0.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__MoP__/sounds/botanical-nursery.ogg", volume = 1.8},
        idle_sound = {filename = "__MoP__/sounds/botanical-nursery.ogg", volume = 0.95},
        apparent_volume = 2.5
    }
}
