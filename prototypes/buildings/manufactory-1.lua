RECIPE {
    type = "recipe",
    name = "manufactory-1",
    energy_required = 1,
    enabled = true,
    ingredients = {
        {"raw-wood", 10},
    },
    results = {
        {"manufactory-1", 1}
    }
}

ITEM {
    type = "item",
    name = "manufactory-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    --flags = {"goes-to-quickbar"},
    subgroup = "mop-items",
    order = "f",
    place_result = "manufactory-1",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "manufactory-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "manufactory-1"},
    fast_replaceable_group = "manufactory",
    max_health = 1200,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    --fast_replaceable_group = "manufactory",
    --next_upgrade = "manufactory-2",
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"speed", "productivity"},
    crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", "mop"},
    crafting_speed = 1,
    energy_source = {
      type = "burner",
      effectivity = 1,
	  fuel_category = "labor",
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
      emissions = 0.00,
    },
    energy_usage = "60kW", -- 1KW representing 10 people, on a x60 timescale = 60 KW
    ingredient_count = 2,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 108,
          height = 114,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 95,
          height = 83,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5
          }
        }
      }
    },
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
