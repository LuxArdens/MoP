local resource_autoplace = require("resource-autoplace")

DATA {
    type = "autoplace-control",
    name = "pop-ore",
    richness = true,
    order = "m-pop",
    category = "resource"
}

DATA {
    type = "noise-layer",
    name = "pop-ore"
}

ENTITY {
    type = "resource",
    name = "pop-ore",
    category = "basic-solid",
    icon = "__MoP__/graphics/icons/pop-ore.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order = "a-b-a",
    map_color = {r = 0.0, g = 0.95, b = 0.7},
    highlight = true,
    minable = {
        mining_time = 1,
        results = {
            {type = "item", name = "human", amount = 1, probability = 0.1}
        },
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tree_removal_probability = 0.9,
    tree_removal_max_distance = 4 * 4,
    autoplace = resource_autoplace.resource_autoplace_settings {
        name = "pop-ore",
        order = "b",
        base_density = 0.1,
        base_spots_per_km2 = 1,
        has_starting_area_placement = true,
        random_spot_size_minimum = 1,
        random_spot_size_maximum = 1,
        regular_rq_factor_multiplier = 1,
        starting_rq_factor_multiplier = 1,
        candidate_spot_count = 1
    },
    stage_counts = {1, 2, 4, 6, 9, 15, 25, 40},
    stages = {
        sheet = {
            filename = "__MoP__/graphics/ores/pop-ore.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            frame_count = 8,
            variation_count = 8,
            hr_version = {
                filename = "__MoP__/graphics/ores/hr-pop-ore.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                frame_count = 8,
                variation_count = 8,
                scale = 0.5
            }
        }
    }
}
