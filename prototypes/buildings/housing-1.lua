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
    icon = "__MoP__/graphics/icons/housing-1.png",
    icon_size = 32,
    --flags = {"goes-to-quickbar"},
    subgroup = "mop-items",
    order = "f",
    place_result = "housing-1",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "housing-1",
    icon = "__MoP__/graphics/icons/housing-1.png",
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
    allowed_effects = {"speed", "productivity"},
    crafting_categories = {"housing"},
    crafting_speed = 1,
    energy_source = { type = "void", },
    energy_usage = "1kW",
    ingredient_count = 1,
    animation = {
        filename = "__MoP__/graphics/entity/housing-1/housing-1.png",
        width = 260,
        height = 254,
        line_length = 7,
        frame_count = 35,
        animation_speed = 0.4,
        run_mode = "forward-then-backward",
        shift = {0.1, 0.1}
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.5
        }
      },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
}
