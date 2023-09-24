RECIPE {
    type = "recipe",
    name = "manual-inserter",
    energy_required = 0.01,
    enabled = true,
    ingredients = {
        {"labor-1", 1}
    },
    results = {
        {"manual-inserter", 100}
    }
}
RECIPE {
    type = "recipe",
    name = "decommission-manual-inserter",
    energy_required = 0.01,
    enabled = true,
    ingredients = {
        {"manual-inserter", 100}
    },
    results = {
        {"labor-1", 1}
    }
}
ITEM {
    type = "item",
    name = "manual-inserter",
    icon = "__MoP__/graphics/icons/manual-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    --flags = {"goes-to-quickbar"},
    subgroup = "mop-items",
    order = "f",
    place_result = "manual-inserter",
    stack_size = 1000
}

ENTITY {
    type = "inserter",
    name = "manual-inserter",
    icon = "__MoP__/graphics/icons/manual-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "manual-inserter"},
    max_health = 100,
    corpse = "burner-inserter-remnants",
    dying_explosion = "burner-inserter-explosion",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    energy_per_movement = "1KJ",
    energy_per_rotation = "1KJ",
    energy_source = { type = "void" },
    extension_speed = 0.0214,
    rotation_speed = 0.01,
    fast_replaceable_group = "inserter",
    hand_base_picture =
    {
      filename = "__MoP__/graphics/entity/manual-inserter/manual-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version =
      {
        filename = "__MoP__/graphics/entity/manual-inserter/hr-manual-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__MoP__/graphics/entity/manual-inserter/manual-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__MoP__/graphics/entity/manual-inserter/hr-manual-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__MoP__/graphics/entity/manual-inserter/manual-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__MoP__/graphics/entity/manual-inserter/hr-manual-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__MoP__/graphics/entity/manual-inserter/manual-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version =
      {
        filename = "__MoP__/graphics/entity/manual-inserter/hr-manual-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__MoP__/graphics/entity/manual-inserter/manual-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__MoP__/graphics/entity/manual-inserter/hr-manual-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__MoP__/graphics/entity/manual-inserter/manual-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__MoP__/graphics/entity/manual-inserter/hr-manual-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    platform_picture =
    {
      sheet =
      {
        filename = "__MoP__/graphics/entity/manual-inserter/manual-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version =
        {
          filename = "__MoP__/graphics/entity/manual-inserter/hr-manual-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
}
