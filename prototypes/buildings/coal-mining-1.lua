RECIPE {
    type = "recipe",
    name = "coal-mining-1",
    energy_required = 1,
    enabled = true,
    ingredients = {
        {"raw-wood", 10}
    },
    results = {
        {"coal-mining-1", 1}
    }
}
RECIPE {
    type = "recipe",
    name = "mop-coal-mining-1",
    category = "mining-mop",
    energy_required = 6,
    enabled = true,
    ingredients = {
    },
    results = {
        {"coal", 1} -- 10 mensen x 6 minuten werk is 1 uur werk = 60 sec in-game, levert 10 coal op; normaliseren naar 6 energy per coal
    }
}

ITEM {
    type = "item",
    name = "coal-mining-1",
    icon = "__MoP__/graphics/icons/coal-mining-1.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "mop-items",
    order = "f",
    place_result = "coal-mining-1",
    stack_size = 2000
}

ENTITY {
    type = "assembling-machine",
    name = "coal-mining-1",
    icon = "__MoP__/graphics/icons/coal-mining-1.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    adjacent_tile_collision_test = { "coal" },
    minable = {mining_time = 0.1, result = "coal-mining-1"},
    fast_replaceable_group = "coal-mining",
    max_health = 1200,
    resource_categories = {"mop-coal"},
    corpse = "stone-furnace-remnants",
    dying_explosion = "stone-furnace-explosion",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    --fast_replaceable_group = "coal-mining",
    --next_upgrade = "coal-mining-2",
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"speed", "productivity"},
    crafting_categories = {"mining-mop"},
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
          filename = "__MoP__/graphics/entity/coal-mining-1/coal-mining-1.png",
          priority = "extra-high",
          width = 81,
          height = 64,
          frame_count = 1,
          shift = util.by_pixel(14.5, 2),
          hr_version =
          {
            filename = "__MoP__/graphics/entity/coal-mining-1/hr-coal-mining-1.png",
            priority = "extra-high",
            width = 151,
            height = 146,
            frame_count = 1,
            shift = util.by_pixel(-0.25, 6),
            scale = 0.5
          }
        },
        {
          filename = "__MoP__/graphics/entity/coal-mining-1/coal-mining-1-shadow.png",
          priority = "extra-high",
          width = 81,
          height = 64,
          frame_count = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(14.5, 2),
          hr_version =
          {
            filename = "__MoP__/graphics/entity/coal-mining-1/hr-coal-mining-1-shadow.png",
            priority = "extra-high",
            width = 164,
            height = 74,
            frame_count = 1,
            draw_as_shadow = true,
            force_hr_shadow = true,
            shift = util.by_pixel(14.5, 13),
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
          filename = "__base__/sound/furnace.ogg",
          volume = 0.6
        }
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      audible_distance_modifier = 0.4
    },
}
